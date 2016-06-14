sub onLeft {
    my( $x, $radius, $ordinal ) = @_;
    my $left = substr $x, 0, $radius;
    $left = removePunctuation $left;
    my @word = split /\s+/, $left;
    return $word[-$ordinal];
}

sub onRight {
    my( $x, $radius, $ordinal ) = @_;
    my $right = substr $x, 0, $radius;
    $right = removePunctuation $right;
    my @word = split /\s+/, $right;
    return $word[$ordinal - 1];
}
