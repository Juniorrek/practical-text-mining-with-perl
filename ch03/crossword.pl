#!/usr/bin/env perl

open WORDS, '<:crlf', 'CROSSWD.TXT' or die 'could not open CROSSWD.TXT';
$regex = qr/$ARGV[0]/;

while (<WORDS>) {
    print if /$regex/
}
