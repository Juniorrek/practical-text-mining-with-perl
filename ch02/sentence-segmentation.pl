#!/usr/bin/env perl
use feature 'say';

# first attempt
$test = "Testing. one, two, three.  Hello!  What?";
while ( $test =~ /([A-Z].*?[\.\?!])\s*[A-Z]/g ) {
    say $1;
}
