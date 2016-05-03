#!/usr/bin/env perl
use feature 'say';

open FILE, '<christmas-carol.txt' or die('File not found');

$/ = ""; # paragraph mode
$quotes = qr/["']{0,2}/;
$regex = qr/
            (
                \)? \s* $quotes [[:alpha:]]
                [^.?!]*?
                $quotes [.?!] $quotes \s*
            )
         /x;

while (<FILE>) {
    s/\r//g;
    chomp;
    s/\n/ /g;           # replace newlines by space
    s/--/ -- /g;        # buffer dashes with space
    s/(Mrs?)\./\1/g;    # remove title periods

    $buffer = '';
    while ( /$regex/g ) {
        $p = $_;
        $match = $1;
        if ( $match =~ /\(.*?$/ or $' =~ /^\)/ ) {
            $buffer .= $match;
        } elsif ( $' =~ /^"?[A-Z]/ ) {   # check for capital letter
            say $buffer, $match;    # print sentence
            $buffer = '';
        } else {
            $buffer .= $match;
            if ($' =~ /^\w*$/ ) { # check for end of paragraph
                say $buffer;      # print sentence
            }
        }
    }
    say '';
}
