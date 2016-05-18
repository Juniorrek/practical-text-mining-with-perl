#!/usr/bin/env perl

sub play_game {
    my $game_earnings = 0;
    my $ahead = 0;
    my $behind = 0;
    for (1..20) {
        rand >= 0.5 ? ++$game_earnings : --$game_earnings;
        ++$ahead if $game_earnings >= 0;
        ++$behind if $game_earnings < 0;
    }
    ($ahead / 20, $behind / 20);
}

for (1..10_000) {
    print( join(q{, }, &play_game), "\n" );
}
