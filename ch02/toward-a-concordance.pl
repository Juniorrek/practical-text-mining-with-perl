use v5.22;

=head different line input modes
$/ = undef; # slurp mode
$/ = "";    # paragraph mode
$/ = "\n";  # line-by-line mode
$/ = " ";   # almost word-by-word mode (i.e. space separated)
=cut

open FILE, 'the-tell-tale-heart.txt' or die 'File not found';

$/ = ""; # paragraph mode for first while loop
my $target = qr/\b(the)\b/;
my $radius = 20;
my $width = 2 * $radius; # width of exract w/out target

# first while loop
while (<FILE>) {
    s/\r//g;
    chomp;
    s/\n/ /g; # replace newlines by spaces
    s/--/ -- /g; # add spaces around dashes

    # second while loop
    while ( $_ =~ /$target/g ) { # $target is already case-insensitive
        my $match = $1;
        my $pos = pos($_);
        my $start = $pos - $radius - length($match);

        my ($extract, $len);
        if ($start < 0) {
            $extract = substr($_, 0, $width + $start + length($match));
            $extract = (' ' x -$start) . $extract;
            $len = length($extract);
        } else {
            $extract = substr($_, $start, $width + length($match));
        }

        # print the next concordance line
        print "$extract\n";
    }
}
