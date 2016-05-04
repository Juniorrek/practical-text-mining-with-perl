#!/usr/bin/env perl
# problem 2.3
use feature 'say';

$test = "The wedge product is written as dx^dy.";
say q|dx^dy ?|;
if ( $test =~ /(d.\^d.)/ ) { print "match = $1\n"; }
say q|d ?|;
if ( $test =~ /([dxyz^]+)/ ) { print "match = $1\n"; }
say q|x^ ?|;
if ( $test =~ /([xyz^]+)/ ) { print "match = $1\n"; }
say q|The wedge product is written as dx ?|;
if ( $test =~ /([^^]+)/ ) { print "match = $1\n"; }
say q|The wedge product is written as d ?|;
if ( $test =~ /([^xyz]+)/ ) { print "match = $1\n"; }
say q|The wedge product is written as dx^ ?|;
if ( $test =~ /(^.*\^)/ ) { print "match = $1\n"; }
