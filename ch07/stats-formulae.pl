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
=item assumes $#x == $#y
=cut
sub corr_coeff {
    my @x = @{ shift() };
    my @y = @{ shift() };
    my( $mean_x, $mean_y, $std_x, $std_y ) = @_;
    my $n = @x;

    ( 1 / ($n - 1) )
  * sum map {
          ( $x[$_] - $mean_x ) / $std_x
        * ( $y[$_] - $mean_y ) / $std_y
    } 0 .. $#x;
}

=head2 equivalence between correlation and cosine
=item assumes $#x == $#y
=cut
sub cos_via_correlation {
    my @x = @{ shift() };
    my @y = @{ shift() };
    my( $sum_xy, $sumx2, $sumy2 );
    
    for (0 .. $#x) {
        $sum_xy += $x[$_] * $y[$_];
        $sumx2 += $x[$_] ** 2;
        $sumy2 += $y[$_] ** 2;
    }
    ($sum_xy) / (sqrt( $sum_x) * sqrt( $sum_y ))
}

=head2 
=item assumes $#x == $#y
=cut
sub covariance {
    my($x,$y) = @_;
    my $n = @$x;
    my($mean_x, $mean_y) = map { sum(@$_) / $n } $x, $y;
    ( 1 / (n - 1) ) * sum( map { ($x->[$_] - $mean_x) * ($y->[$_] - $mean_y) } 1 .. $#{$x} );
}

=head2 equivalence: covariance == correlation
=cut
sub correlation_via_covariance {
    my( $x, $y ) = @_;
    covariance($x, $y) / ( std_dev(@$x) * std_dev(@$y) )
}
