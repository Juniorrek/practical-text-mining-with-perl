use experimental 'switch';
open WORDS, 'CROSSWD.TXT' or die;

while (<WORDS>) {
    chomp;
    ++$dict{$_};
}

foreach $word (sort keys %dict) {
    if ( $word =~ /(^\w+)ly$/ and
         substr($word, -3) ne 'ily' and
         not substr($word, -4) ~~ [qw'ably ibly ally'] ) {
        print "$word " unless exists $dict{$1};
    }
}
