use v5.18;

sub byValues {
    my $value = $combined{$b} <=> $combined{$a};
    ($value == 0) ? $b cmp $a : $value
}

open OUT, '>', 'Poe68.csv' or die;
my @sorted_words = sort byValues keys %combined;
$" = ',';
print OUT "@sorted_words[0..4]\n";

for my $i (0 .. $#dict) {
    state $count = 0;
    for my $word (@sorted_words) {
        if ($count < 4) {
            print OUT $dict[$i]{$word}+0, ",";
            ++$count;
        } else {
            print OUT $dict[$i]{$word}+0, "\n";
            last;
        }
    }
}

close OUT;
