#!/usr/bin/env perl
use feature 'say';
use feature 'switch';
no warnings 'experimental::smartmatch';
# problem 2.4

sub testre {
    local $" = ', ';
    my( $re, $match, $nomatch ) = @_;
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
}

# a) match 'rat' with possessive and plural forms
$ratre = qr/\b[Rr]at(?:[_s]|\b)/;
@rat_match = qw(Rat rat Rat's rat's Rats rats rat_heaven );
@rat_nomatch = qw( vituperation Rationalize );
testre( $ratre, \(@rat_match, @rat_nomatch) );

# b) match 'old' with comparative and superlative forms
$oldre = qr/\b[Oo]lde?(?:r|st)?(?:_|\b)/;
@old_match = qw( old older oldest Old Older Oldest old_man );
@old_nomatch = qw( fold folder oldies Oldies );
testre( $oldre, \(@old_match, @old_nomatch) );

# c) match verb 'jump' in all tenses
$jumpre = qr/\b[Jj]ump(?:s|ed|ing)?(?:_|\b)/;
@jump_match = qw( jump Jump jumps Jumps jumped Jumped jumping Jumping jumping_jacks );
@jump_nomatch = qw( jumper outjump jumpable );
testre( $jumpre, \(@jump_match, @jump_nomatch) );
