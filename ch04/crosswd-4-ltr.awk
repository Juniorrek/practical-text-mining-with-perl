1 { ++n }
/^q...$/ { ++n_q_first }
/^.u..$/ { ++n_u_second }
/^qu..$/ { ++n_q_then_u }

END {
    print "# 4 letter words =", n
    print "# 4 letter words with q first =", n_q_first
    print "# 4 letter words with u second =", n_u_second
    print "# 4 letter words starting with qu =", n_q_then_u
    printf "P(Q):   %f\n", n_q_first / n;
    printf "P(U):   %f\n", n_u_second / n;
    printf "P(U|Q): %f\n", n_u_second / n_q_then_u;
}
