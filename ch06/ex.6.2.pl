# recompute the word frequencies of "Frankenstein" & "The Call of the Wild"
use v5.18;

MAIN: {
    use Getopt::Long;
    GetOptions('file:s' => \my $file);
    if ($file) {
        wc_file($file);
    } else {
        &frank_and_call;
    }
}

sub compute_word_counts {
    my $fh = shift;
    my $title_ref = shift;
    my %freq;

    while (<$fh>) {
        if ( m%<TITLE>(.*)</TITLE>% ) {
            $$title_ref = $1 if ref $title_ref;
            next;
        }
        chomp;
        $_ = lc;
        s/--+/ /g;
        s/''//g;
        s/(\W)'(\w)/$1$2/g; # remove apostrophes at start of word
        s/(\w)'(\W)/$1$2/g; # remove apostrophes at end of word
        s|[.,/=*:?_)(>\$"\@<!+&~%\#\[\];`\|\\}{“]||g;
        s|\P{ASCII}||g; # strip anything non-ASCII
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

sub frank_and_call {
    open FRANK, '<', 'frankenstein.txt';
    my $frank_counts = compute_word_counts(\*FRANK);
    close FRANK;
    
    open CALL, '<', 'call-of-the-wild.txt';
    my $call_counts = compute_word_counts(\*CALL);
    close CALL;
    
    open RESULT, '>', 'results.csv';
    say RESULT 'frankenstein word,frankenstein count,call of the wild word,call of the wild count';

    my( $frank_sort, $call_sort ) = map byDescendingValues($_), $frank_counts, $call_counts;
    
    my @frank_words = sort $frank_sort keys %$frank_counts;
    my @call_words = sort $call_sort keys %$call_counts;

    while ( exists($frank_words[0]) or exists($call_words[0]) ) {
        my($frank, $call) = (shift(@frank_words) || '', shift(@call_words) || '');
        my($frank_count, $call_count) = ($frank && $frank_counts->{$frank}, $call && $call_counts->{$call});
        say RESULT "$frank,$frank_count,$call,$call_count";
    }
}

sub wc_file {
    my $file = shift;
    open IN, '<', $file or die "Couldn't open file '$file': $!";
    my $counts = compute_word_counts(\*IN, \my $title);
    my $sort = byDescendingValues($counts);
    my @words = sort $sort keys %$counts;

    open RESULT, '>', 'results.csv';
    say RESULT "\L$title word,$title count";
    say RESULT "$_, $counts->{$_}" for @words;
}
