use List::Util qw(sum);

sub sample_mean {
    my $n = @_; # num elements
    (1 / $n) * sum(@_);
}

sub sample_variance {
    my $n = @_; # num elements
    my $mean = sample_mean @_;
    ( 1 / ($n - 1)) * sum map { ($_ - $mean) ** 2 } @_;
}

=head2
=item Iterative variance without depending on a precalculated mean
=item i.e. one pass over a data set instead of two
=cut
sub sample_variance2 {
    my ($n, $sum, $sum2) = (scalar(@_), 0, 0);
    my $variance = 0;
    for (@_) {
        $sum += $_;
        $sum2 += $_ ** 2;
    }
    ( $sum2 - ( ($sum ** 2) / $n ) ) / ($n - 1);
}

sub std_dev {
    sqrt( sample_variance(@_) );
}

=head2
$x: value in the dataset
$mean: dataset mean
$s: standard deviation
=cut
sub z_score {
    my( $x, $mean, $s ) = @_;
    ($x - $mean) / $s;
}

=head2 Sample Correlation Coefficient
=item assumes @x == @y
=cut
sub corr_coeff {
    my @x = @{ shift() };
    my @y = @{ shift() };
    my( $mean_x, $mean_y, $std_x, $std_y ) = @_;
    my $n = @x;

    ( 1 / ($n - 1) )
  * sum map {
          ( $x[$_] - $mean_x )
        / $std_x
        * ( $y[$_] - $mean_y )
        / $std_y
    } 0 .. $#x;
}
