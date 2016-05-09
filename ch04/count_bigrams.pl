open FILE, "<", "$ARGV[0]" or die "$ARGV[0] not found";
$/ = ""; # paragraph mode

$count = 0; # bigram tally
while (<FILE>) {
    chomp;
    s/[^a-zA-Z]/ /g; # sub spaces for non letters
    s/ +/ /g; # sub one space for many
    $_ = lc; # lowercase
    
    @words = split /\s/;
    
    foreach $word (@words) {
        @letters = split //, $word;
        for $i (0 .. ($#letters-1)) {
            $bigram = join '', @letters[$i..($i+1)];
            ++$freq{$bigram};
            ++$count;
        }
    }
}

# results
foreach $bigram ( sort byReverseValues keys %freq ) {
    print "$bigram: $freq{$bigram}\n";
}

print "\nTotal number of bigrams: $count\n";

sub byReverseValues { $freq{$b} <=> $freq{$a} || $a cmp $b }
