#!/usr/bin/env perl
use feature 'say';

# first attempt
# $test = "Testing. one, two, three.  Hello!  What?";

# while ( $test =~ /([A-Z].*?[\.\?!])\s*[A-Z]/g ) { # upper case only?
# while ( $test =~ /([A-Z].*?[.?!])\s*[A-Z]/g ) { # still not quite there. 1) Search starts at 'e' in "Hello! " rather than backing up first and 2) expects last bit to be [A-Z], even at the end of the string
# while ( $test =~ /([A-Z].*?[.?!])\s*[A-Z]/g ) { # we'd rather avoid managing the position if Perl can do it for us
#     $loc = pos($test) -= 1;
#     say $1;
# }
# say substr($test, $loc);

$test = "Testing. one, two, three.  Hello!  What?";
$buffer = '';

while ( $test =~ /(\s*[^.?!]+[.?!])/g ) {
    $match = $1;
    # Note use of the Perl variable $'
    if ( $' =~ /^\s*[A-Z]|^\s*$/ ) {
        print "$buffer$match\n";
        $buffer = '';
    } else {
        $buffer .= $match;
    }
}
