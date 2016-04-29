#!/usr/bin/env perl
use feature 'say';
use WWW::Mechanize;
use Mojo::DOM;

my $url = 'https://www.poemuseum.org/works-telltale.php';
my $mech = WWW::Mechanize->new;
$mech->get($url);

open STDOUT, '>', 'the-tell-tale-heart.txt';
say( $_->all_text, "\n" ) for Mojo::DOM->new($mech->content)->find('p')->each;
