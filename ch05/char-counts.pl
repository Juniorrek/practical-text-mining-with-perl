#!/usr/bin/env perl

open IN, '<four-stories.txt';

while (<IN>) {
    s/\r//g;
    chomp;
    if ( m%<TITLE>(.*)</TITLE>% ) {
        print "$1\n";
    } else {
        $_ = lc;
        if ( not /^\s*$/ ) {
            @characters = split //;
            foreach $char (@characters) {
                ++$freq{$char};
            }
        }
    }
}

# print out character counts in decreasing order
foreach $char (sort { $freq{$b} <=> $freq{$a} } keys %freq) {
    print "$char, $freq{$char}\n";
}
