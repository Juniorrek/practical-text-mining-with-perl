$line = "He once lived in Coalton, West Virginia.";
$target = "lived";

$position = index($line, $target, 0);
print "line: '$line'\n";
print qq|The word "$target" is at position $position.\n|;


# not case sensitive
$line = 'She was, she is, and she will be.';
print "\n$line\n";
$target = 'she';

$position = index($line, $target, 0);
while ($position > -1) {
    print "$position ";
    $position = index($line, $target, $position+1);
}
print "\n";

# better
$line = 'She was, she is, and she will be.';
$target = 'she';

$position = index(lc($line), $target, 0);
while ($position > -1) {
    print "$position ";
    $position = index($line, $target, $position+1);
}
print "\n";

# universally case sensitivity, even better
$line = 'Cat, cat, cat, catastrophe.';
$test = qr/(cat)/i;

while ($line =~ /$test/g) {
    $pos = pos($line);
    print "$1 $pos ";
}
print "\n";

