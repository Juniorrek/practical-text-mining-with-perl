use List::Util qw(sum);

# a) In output 5.4 verify the first row of the product of M^T * M
$a = sum map $_ ** 2, 19,9,7,13,22,0,1,2;
$b = sum 19*27, 9*5, 7*10, 13*11, 55*22, 0, 4, 0;
$c = sum 19*24, 0, 7*28, 0, 22*35, 0, 3, 0;
$d = sum 33*19, 0, 7**2, 3*13, 32*22, 0, 1, 0;
print "a) $a, $b, $c, $d\n"

# b) In output 5.6 verify that the first column shown is the first column of M multiplied by the [1,1] entry of output 5.5

