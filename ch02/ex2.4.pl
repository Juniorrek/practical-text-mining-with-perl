#!/usr/bin/env perl
use feature 'say';
use feature 'switch';
no warnings 'experimental::smartmatch';
# problem 2.4

sub testre {
    local $" = ', ';
    my( $re, $match, $nomatch, $description ) = @_;
    my $fails;
    for my $yep (@$match) {
        unless ( $yep =~ $re ) {
            warn "FAIL: $yep";
            ++$fails;
        }
    }
    for my $nope (@$nomatch) {
        if ( $nope =~ $re ) {
            warn "FAIL: $nope";
            ++$fails;
        }
    }
    say "PASS: $description" unless $fails;
}

testre( @$_ ) for 
[
    qr/\b[Rr]at(?:[_s]|\b)/,
    [qw% Rat rat Rat's rat's Rats rats rat_heaven %],
    [qw% vituperation Rationalize %],
    'rat'
], [
    qr/\b[Oo]lde?(?:r|st)?(?:_|\b)/,
    [qw% old older oldest Old Older Oldest old_man %],
    [qw% fold folder oldies Oldies %],
    'old'
], [
    qr/\b[Jj]ump(?:s|ed|ing)?(?:_|\b)/,
    [qw% jump Jump jumps Jumps jumped Jumped jumping Jumping jumping_jacks %],
    [qw% jumper outjump jumpable %],
    'jump'
], [
    qr/\b[Ss](?:at|it(?:s|ting)?)\b/,
    [qw% sit Sit sits Sits sat Sat sitting Sitting %],
    [qw% monstrosity exposit situational Sitters siting satsuma aerosats %],
    'sit'
];
