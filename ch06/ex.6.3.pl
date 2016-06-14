use v5.18;
use Getopt::Long;

GetOptions(
    'file:s' => \my $file,
    'target:s' => \my $target,
    'radius:i' => \my $radius,
);

$target or die "no target word provided";
$radius //= 20;
my $width = 2*$radius;

open my $fh, '<', $file or die "File not found";

$/ = '';

our @lines;
while (<$fh>) {
    state $count = 0;
    chomp;
    s/\n/ /g; # new lines
    s/\b--\b/ -- /g; # pad --
    s/\P{Ascii}|\r//g;

    while ( /$target/gi ) {
        my $match = $1;
        my $pos = pos;
        my $start = $pos - $radius - length($match);

        # extracts padded with spaces if needed
        my $extract = do {
            if ($start < 0) {
                my $e = substr $_, 0, $width+$start+length($match);
                (' ' x -$start) . $e;
            } else {
                my $e = substr $_, $start, $width+length($match);
                my $deficit = $width+length($match) - length($e);
                if ($deficit > 0) {
                    $e .= (' ' x $deficit);
                }
                $e
            }
        };
        $lines[$count] = $extract;
        ++$count;
    }
}

@lines = sort byMatch @lines;

foreach my $line_number (1 .. $#lines) {
    my $x = $lines[$line_number];
    printf "%5d", $line_number;
    print " $x\n";
}

sub removePunctuation {
    local $_ = shift;
    $_ = lc;
    s/[^-a-z ]//g;
    s/--+/ /g;
    s/-//g;
    s/\s+/ /g;
    $_;
}

sub byMatch {
    my $middle_a = substr($a, $radius, $length($a) - 2*$radius);
    my $middle_b = substr($b, $radius, $length($b) - 2*$radius);
    $middle_a = removePunctuation($middle_a);
    $middle_b = removePunctuation($middle_b);
    $middle_a cmp $middle_b;
}
