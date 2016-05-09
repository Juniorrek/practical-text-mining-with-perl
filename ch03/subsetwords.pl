#!/usr/bin/env perl
# USAGE > perl subsetwords.pl string

open WORDS, '<', 'CROSSWD.TXT' or die "couldn't open CROSSWD.TXT";

while (<WORDS>) {
    s/\r//g;
    chomp;
    $key = join '', sort split //;
    if ( exists $dictionary{$key} ) {
        $dictionary{$key} .= ",$_"
    } else {
        $dictionary{$key} = $_
    }
}

$index = join '', sort split //, $ARGV[0];

foreach $key (sort keys %dictionary) {
    $regex = join '.*', sort split //, $key;
    $regex = '.*'.$regex.'.*';
    if ( $index =~ /$regex/ ) {
        print "$dictionary{$key}\n";
    }
}
