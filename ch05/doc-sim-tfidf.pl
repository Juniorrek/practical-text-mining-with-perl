open IN, 'poe-4-stories.txt' or die;
$nstory = -1;

# step 1: compute the term frequencies
while (<IN>) {
    chomp;
    if ( m%<TITLE>(.*)</TITLE>% ) {
        $title = $1; # current title
        ++$nstory;
        print "Title fo story $nstory = $title\n";
    } else {
        print "NULL TITLE\n" if $title eq '';
        $_ = lc;
        s/--/ /g; # remove double-dashes
        s/ - / /g; # remove single dashes
        s/[,.";!()?:_\[\]]//g; # strip punctuation
        s/\s+/ /g;
        s/^\s+//g;
        @words = split / /;

        foreach $word (@words) {
            if ($word =~ /^'?(.*?)'?$/) {
                $word = $1;
                ++$tf[$nstory]{$word};
                ++$granddict{$word};
            }
        }
    }
}

foreach $word (sort keys %granddict) {
    $sum = 0;
    for $i ( 0 .. $#tf ) {
        ++$sum if $tf[$i]{$word} > 0;
        $df{$word} = $sum;
    }
}
