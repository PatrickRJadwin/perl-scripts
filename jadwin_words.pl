#!/usr/bin/env perl

use strict;
use warnings;

my @arrWords;
for (;;) {
    my $input = <STDIN>;
    last if not defined $input;
    chomp $input;
    push @arrWords, $input;
}

my $wordsLength = scalar @arrWords;

my @words;
my @temp;

for (my $i = 0; $i < $wordsLength; $i++) {
    @temp = split(" ", $arrWords[$i]);
    my $tempnum = scalar @temp;
    for (my $x = 0; $x < $tempnum; $x++) {
        push @words, $temp[$x];
    }
}

my $length = scalar @ARGV;

my @wordCount;
my $count = 0;

for (my $i = 0; $i < $length; $i++) {
    for (my $x = 0; $x < $wordsLength; $x++) {
        if (lc($ARGV[$i]) eq lc($words[$x])) {
            $count++;
        }        
    }
    push @wordCount, $count;
    $count = 0;
}

my $arrLngth = scalar @wordCount;

for (my $i = 0; $i < $arrLngth; $i++) {
    print $wordCount[$i] . "\n";
}
