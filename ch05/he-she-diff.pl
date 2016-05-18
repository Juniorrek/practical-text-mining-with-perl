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

@pronouns = qw(he she him her his hers himself herself);

foreach $title (sort keys %freq) {
    foreach $word ( @pronouns ) {
        $freq = 0 + $freq{$title}{$word};
        print "$title, $word, $freq\n";
    }
}
