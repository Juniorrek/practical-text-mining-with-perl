#!/usr/bin/env perl
# problem 2.9c

while (<>) {
    $count += tr/AEIOUaeiou// }

$_ = reverse $count;
$count = reverse s/(\d{3})(?=\d)/\1,/gr;

print "vowels: $count\n";
