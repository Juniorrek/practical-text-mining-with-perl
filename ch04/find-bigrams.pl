$_ = "Well!!! No surprise, this.";

s/[^a-zA-Z]/ /g; # sub spaces for non letters
s/ +/ /g; # sub one space for many
$_ = lc; # lowercase

@words = split /\s/;

foreach $word (@words) {
    @letters = split //, $word;
    for $i (0 .. ($#letters-1)) {
        $bigram = join '', @letters[$i..($i+1)];
        print "$bigram ";
    }
}
print "\n";
