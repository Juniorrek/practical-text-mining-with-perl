use feature 'say';

while (<>) {
    if ( /<TITLE>(.*)<\/TITLE>/ ) {
        $title = $1;
    } else {
        next unless $title;
        $_ = lc;
        s/[^a-z]//g;
        $summary{$title}{count_e} += tr/e/e/;
        $summary{$title}{count} += length;
    }
}

for my $title (keys %summary) {
    ( $count_e, $count ) = @{$summary{$title}}{qw<count_e count>};
    $summary{$title}{proportion_e} = $count_e / $count;
}

say for sort { $a <=> $b } map { $_->{proportion_e} } values %summary;
# $fmt = <<SUMMARY;
# %s:
#     count     : %d
#     count e   : %d
#     proportion: %.4f
# SUMMARY
# 
# for my $title (sort {
#     $summary{$a}{proportion_e} <=> $summary{$b}{proportion_e}
# } keys %summary) {
#     printf $fmt, $title, @{$summary{$title}}{qw<count count_e proportion_e>};
# }
