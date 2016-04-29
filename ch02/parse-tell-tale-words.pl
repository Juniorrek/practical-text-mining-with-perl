#!/usr/bin/perl

open FILE, 'the-tell-tale-heart.txt' or die 'file not found';

while (<FILE>) {
    chomp;
    s/--/ -- /g;
    @word = split /\s+/;
    foreach $x (@word) {
        if ( $x =~ /(([a-zA-Z']+-)*[a-zA-Z']+)/ ) {
            print "$1 ";
        }
    }
}

print "\n";
