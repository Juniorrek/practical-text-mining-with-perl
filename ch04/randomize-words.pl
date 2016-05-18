#!/usr/bin/perl

$filename = shift;
open FILE, '<', $filename or die 'file not found';

while (<FILE>) {
    chomp;
    s/--/ -- /g;
    @word = split /\s+/;
    foreach $x (@word) {
        if ( $x =~ /(([a-zA-Z']+-)*[a-zA-Z']+)/ ) {
            $permutation{rand()} = $x;
        }
    }
}

for ( sort keys %permutation ) {
    $printme = "$permutation{$_} ";
    $buffer += length $printme;
    if ( $buffer > 76 ) {
        print "\n";
        $buffer = 0;
    }
    print $printme;
}

print "\n";
