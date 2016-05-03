#!/usr/bin/env perl
use feature 'say';

open FILE, '<christmas-carol.txt' or die('File not found');

$/ = ""; # paragraph mode
$regex = qr/
            (
                ["']{0,2} [a-zA-Z] [^.?!]*
                ["']{0,2} [.?!] ["']{0,2} \s*
            )
         /x;

while (<FILE>) {
    s/\r//g;
    s/\u{feff}//g;
    chomp;
    s/\n/ /g;       # replace newlines by space
    s/--/ -- /g;    # buffer dashes with space
    s/(Mrs?\.)/\1/g;# remove title periods

    $buffer = '';
    while ( /$regex/g ) {
        $match = $1;
        if ( $' =~ /^"?[A-Z]/ ) {   # check for capital letter
            say $buffer, $match; # print sentence
            $buffer = '';
        } else {
            $buffer .= $match;
            if ($' =~ /^\w*$/ ) { # check for end of paragraph
                say $buffer;    # print sentence
            }
        }
    }
    say;
}
