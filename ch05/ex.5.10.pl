use feature 'say';
use List::Util qw(sum);
use Math::Trig;

# original word counts
@s1 = (0,0,1,1,1,1,1,1,0);
@s2 = (1,1,0,1,1,1,0,1,1);

# normalized with log(f + 1)
@l1 = map log($_ + 1), @s1;
@l2 = map log($_ + 1), @s2;

$dot = sum map { $s1[$_] * $s2[$_] } 0..$#s1;
$mag1 = sqrt sum map $_ ** 2, @s1;
$mag2 = sqrt sum map $_ ** 2, @s2;
say( acos( $dot / ($mag1 * $mag2) ) )


