use List::Util qw(sum);

@vector = (19, 9, 7, 13, 22, 0, 1, 2);
$length = vector_length(@vector);
print "length of vector = $length\n";

sub vector_length {
  sqrt sum map { $_ ** 2 } @_
}
