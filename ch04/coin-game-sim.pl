use feature 'say';
use constant GAMES => 1_000_000;

sub get_simulation {
    my( $history, $winner );
    my $check_winner = sub {
        if (length($history) >= 3) {
            $winner = 'A' if substr($history, -3) eq 'THH';
            $winner = 'B' if substr($history, -3) eq 'HHH';
        }
        return $winner;
    };

    my $run = sub {
        while (true) {
            $history .= (rand > .5) ? 'H' : 'T';
            last if &$check_winner;
        }
    };

    my $who_wins = sub { $winner };

    ($run, $who_wins);
}

for (1..GAMES) {
    (*runsim, *who_wins) = &get_simulation;
    &runsim;
    $results{who_wins()}++;
}

say "A wins: ", $results{A} / GAMES;
say "B wins: ", $results{B} / GAMES;
