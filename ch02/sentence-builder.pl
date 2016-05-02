#!/usr/bin/env perl
use v5.22;

my $target = qr/([\.?!][\s\',]*[a-z])/;
my $radius = $ARGV[0];
my $filename = $ARGV[1];
my $width = 2 * $radius; # width of exract w/out target

open FILE, $filename or die 'File not found';

$/ = ""; # paragraph mode for first while loop

# first while loop
while (<FILE>) {
    s/\r//g;
    chomp;
    s/\n/ /g; # replace newlines by spaces
    s/--/ -- /g; # add spaces around dashes

    # second while loop
    while ( $_ =~ /$target/g ) { # $target is already case-insensitive
        my $match = $1;
        my $pos = pos($_);
        my $start = $pos - $radius - length($match);

        my ($extract, $len);
        if ($start < 0) {
            $extract = substr($_, 0, $width + $start + length($match));
            $extract = (' ' x -$start) . $extract;
            $len = length($extract);
        } else {
            $extract = substr($_, $start, $width + length($match));
        }

        # print the next concordance line
        print "$extract\n";
    }
}
