# USAGE > perl flip_running_probability.pl value
# This program simulates flipping a coin $ARGV[0] times.

for my $n ( 1 .. $ARGV[0] ) {
    $record .= rand > .5 ? (++$count, "H") : "T";
    $proportion = $count / $n;
    printf "%.2f\n", $proportion;
}

print "$record\n";
