#!/usr/bin/env perl
use v5.18;

open IN, '<:crlf', 'mesmeric.txt' or die "can't open stories file";

$nstory = -1; # counter for number of stories

while (<IN>) { # read da file
    chomp;
    if ( m%<TITLE> *(.*) *</TITLE>% ) {
        $name[++$nstory] = $a; # save da name
        print "$1 detected.\n";
    } else {
        $_ = ls;
        tr/\x{2014}/-/;
        s/ --? / /g;            # remove single & double hyphens
        s/ +/ /g;               # collapse spaces
        s/[.,:;?"!_()\[\]]//g;  # strip punctuation
        s/[^[:ascii:]]//g;      # strip non-ascii chars
    }
}
