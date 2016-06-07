sub onLeft {
    my $left = substr($_[0], 0, $_[1]);
    $left = removePunctuation($left);
    my @word = split /\s+/, $left;
    return $word[-$_[2]];
}

# here's the money-maker
sub byLeftWords {
    my $left_a = onLeft($a, $radius, $ordinal);
    my $left_b = onLeft($b, $radius, $ordinal);
    lc($left_a) cmp lc($left_b);
}

# apply to call of the wild
# assumes byDescendingValues sub defined
$line_number = 0;
foreach $x (sort byLeftWords @lines) {
    ++$line_number;
    printf "%5d", $line_number;
    print " $x\n";
    ++$dict{onLeft($x, $radius, $ordinal)};
}

print "\n\n";
foreach $x (sort byDescendingValues keys %dict) {
    print "$x, $dict{$x}\n";
}
