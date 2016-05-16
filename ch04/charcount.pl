#!/usr/bin/env perl

$/ = ""; # paragraph mode

while (<>) {
    @chars = split //;
    for my $c (@chars) {
        $c = lc $c;
        $freq{$c}++ if $c =~ /[a-z]/;
    }
}

# rank 'em
@rank = sort { $freq{$b} <=> $freq{$a} } 'a' .. 'z';

$rank{$rank[$_]} = $_ + 1 for 0 .. $#rank;

print "$rank{$_},$freq{$_}\n" for 'a' .. 'z';
