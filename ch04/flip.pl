# USAGE > perl flip.pl value
# This program simulates flipping a coin $ARGV[0] times.

for my $n ( 1 .. $ARGV[0] ) {
    my $side = rand > .5 ? do { ++$count; "H" } : "T";
    print $side;
}

$proportion = $count / $ARGV[0]; # Empirical probability
print "\nProbability fo heads = $proportion\n";
