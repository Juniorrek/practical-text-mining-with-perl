use Time::HiRes qw(time);
use feature 'say';
open WORDS, "<", 'CROSSWD.TXT' or die 'no CROSSWD.TXT';

my
($n_q_first_re, $n_u_second_re, $n_q_then_u_re) =
(qr/q.../     , qr/.u../      , qr/qu../   );

$start = time;
while (<WORDS>) {
    chomp;
    ++$n;
    ++$n_q_first if /$n_q_first_re/;
    ++$n_u_second if /$n_u_second_re/;
    ++$n_q_then_u if /$n_q_then_u_re/;
}

say "# 4 letter words = $n";
say "# 4 letter words with q first = $n_q_first";
say "# 4 letter words with u second = $n_u_second";
say "# 4 letter words starting with qu = $n_q_then_u";
printf "P(Q):   %f\n", $n_q_first / $n;
printf "P(U):   %f\n", $n_u_second / $n;
printf "P(U|Q): %f\n", $n_u_second / $n_q_then_u;
$total_time = time - $start;

printf "total running time: %f\n", $total_time;
