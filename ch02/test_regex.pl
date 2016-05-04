#!/usr/bin/env perl
use strict;
open FILE, '<testfile.txt';
open OUTPUT, '>test_regex_no2.txt';
select OUTPUT;

while (<FILE>) {
    if ( $_ !~ /^(1 ?)?\(\d{3}\) ?\d{3}-\d{4}$/ ) {
        print "$_";
    }
}
close $_ for qw(FILE OUTPUT);
