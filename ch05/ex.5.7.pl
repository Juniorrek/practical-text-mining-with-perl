use v5.18;
no strict;
use List::Util qw(sum);

# a) In output 5.4 verify the first row of the product of M^T * M
$a = sum map * ** 2, 19,9,7,13,22,0,1,2;
$b = sum 19*27, 9*5, 7*10, 13*11, 55*22, 0, 4, 0;
$c = sum 19*24, 0, 7*28, 0, 22*35, 0, 3, 0;
$d = sum 33*19, 0, 7**2, 3*13, 32*22, 0, 1, 0;
print "a) $a, $b, $c, $d\n";

# b) In output 5.6 verify that the first column shown is the first column of M multiplied by the [1,1] entry of output 5.5
$e1_1 = 0.02950122;
@M_col1 = (19.0, 9.0, 7.0, 13.0, 22.0, 0.0, 1.0, 2.0);
@expectedN_col1 = (0.56052319, 0.26551099, 0.20650854, 0.38351587, 0.64902685, 0.0, 0.02950122, 0.05900244);
@actualN_col1 = map $_ * $e1_1, @M_col1;

say "b)";
{local $" = ', ';
say "expected N column 1: @expectedN_col1";
say "  actual N column 1: @actualN_col1" }

# c) Verify the second column of the cosines in output 5.7
{
@col1 = (0.56052319, 0.26551099, 0.20650854, 0.38351587, 0.64902685, 0.00000000, 0.02950122, 0.05900244);
@col2 = (0.42605622, 0.07889930, 0.15779860, 0.17357846, 0.86789230, 0.00000000, 0.06311944, 0.00000000);
@col3 = (0.47122276, 0.00000000, 0.54975988, 0.00000000, 0.68719985, 0.00000000, 0.05890284, 0.00000000);
@col4 = (0.67193194, 0.00000000, 0.34614676, 0.06108472, 0.65157037, 0.00000000, 0.02036157, 0.00000000);
$a = sum map $col2[$_] * $col1[$_], 0 .. $#col2;
$b = sum map $col2[$_] * $col2[$_], 0 .. $#col2;
$c = sum map $col2[$_] * $col3[$_], 0 .. $#col2;
$d = sum map $col2[$_] * $col4[$_], 0 .. $#col2;
$fmt = join(', ', ('%.7f') x 4)."\n";
printf "expected: $fmt", 0.9240674, 1, 0.8876521, 0.9182834;
printf "  actual: $fmt", $a, $b, $c, $d;
}
