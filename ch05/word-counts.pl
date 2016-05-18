#!/usr/bin/env perl

open IN, '<four-stories.txt';

while (<IN>) {
    chomp;
    if ( m%<TITLE>(.*)</TITLE>% ) {
        $title = $1; print "TITLE = $title\n";
    } else {
        print "NULL TITLE\n" if $title eq '';
        $_ = lc;
        s/--/ /g;
        s/ - / /g;
        s/[,.";!()?:_\[\]]//g;
        s/\s+/ /g;
        s/^\s+//g;
        @words = split / /;
        foreach $word (@words) {
            if ( $word =~ /^'?(.*?)'?$/ ) { # non-greedy, please
                $word = $1; # remove initial & final apostrophes
                ++$freq{$title}{$word};
            }
        }
    }
}

foreach $title (sort keys %freq) {
    foreach $word ( sort { $freq{$title}{$b} <=> $freq{$title}{$a} } keys %{$freq{$title}} ) {
        print "$title, $word, $freq{$title}{$word}\n";
    }
}
