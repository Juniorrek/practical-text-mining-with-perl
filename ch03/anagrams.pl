#!/usr/bin/perl
open WORDS, '<:crlf', 'CROSSWD.TXT' or die;

while (<WORDS>) {
    chomp;
    $key = join '', sort split //;
    push @{ $dictionary->{$key} }, $_;
}

for $key (sort keys %$dictionary) {
    use feature 'state';
    state $count;
    if ( length $key == 3 ) {
        print join( ', ', $key, @{$dictionary->{$key}} ), "\n";
    }
}
