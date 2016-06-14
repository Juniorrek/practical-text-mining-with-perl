# recompute the word frequencies of "Frankenstein" & "The Call of the Wild"
use v5.18;

sub compute_word_counts {
    my $fh = shift;
    my %freq;

    while (<$fh>) {
        chomp;
        $_ = lc;
        s/--+/ /g;
        s/''//g;
        s/(\W)'(\w)/$1$2/g; # remove apostrophes at start of word
        s/(\w)'(\W)/$1$2/g; # remove apostrophes at end of word
        s|[.,/=*:?_)(>\$"\@<!+&~%\#\[\];`\|\\}{]||g;
        my @word = split /\s+/;
        foreach my $x (@word) {
            ++$freq{$x} 
        }
    }

    \%freq;
}

sub byDescendingValues {
    my $freq = shift;
    sub { $freq->{$b} <=> $freq->{$a} || $a cmp $b };
}

open FRANK, '<', 'frankenstein.txt';
my $frank_counts = compute_word_counts(\*FRANK);
close FRANK;

open CALL, '<', 'call-of-the-wild.txt';
my $call_counts = compute_word_counts(\*CALL);
close CALL;

open RESULT, '>', 'results.csv';
say RESULT 'frankenstein word,frankenstein count,call of the wild word,call of the wild count';

my $frank_descending = byDescendingValues($frank_counts);
my $call_descending = byDescendingValues($call_counts);
my @frank_words = sort $frank_descending keys %$frank_counts;
my @call_words = sort $call_descending keys %$call_counts;

while ( exists($frank_words[0]) or exists($call_words[0]) ) {
    my($frank, $call) = (shift(@frank_words) || '', shift(@call_words) || '');
    my($frank_count, $call_count) = ($frank && $frank_counts->{$frank}, $call && $call_counts->{$call});
    say RESULT "$frank,$frank_count,$call,$call_count";
}
