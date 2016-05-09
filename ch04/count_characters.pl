# USAGE > perl count_characters.pl filename.txt
# This program is case insensitive.
# This program counts all characters, not just letters.

open FILE, "<:crlf", "$ARGV[0]" or die "$ARGV[0] not found";
$/ = ""; # paragraph mode

while (<FILE>) {
    chomp;
    s/\n/ /g; # newline vs space
    $_ = lc; # case insensitive
    @chars = split //;

    foreach $char (@chars) {
        ++$freq{$char};
    }
}

$count = 0; # total number of letters stored
foreach $char ( sort byReverseValues keys %freq ) {
    if ( 'a' le $char and $char le 'z' ) {
        $count += $freq{$char};
    }
    print "$char: $freq{$char}\n";
}

print "\nTotal number of letters: $count\n";

foreach $letter ( 'a' .. 'z' ) {
    print "$letter: $freq{$letter}\n";
}

sub byReverseValues { $freq{$b} <=> $freq{$a} || $a cmp $b }
