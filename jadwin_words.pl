#!/usr/bin/env perl

use strict;
use warnings;

# Get input or file redirect
# Infinite loop to read multiple lines
my @wordarr;
for (;;) {
    my $inp = <STDIN>;
    last if not defined $inp;  # break
    chomp $inp;  # cleanup line
    my @temp = split(" ", $inp);  # split chars into array
    for (my $i = 0; $i < scalar @temp; $i++) {
        $temp[$i] =~ s/[^a-zA-Z0-9]//g;  # strip non alpha-numeric characters
        push @wordarr, $temp[$i];  # push values into array
    }
}

# Compare words to arguments
my @argcount;
my %dictionary;
for (my $i = 0; $i < scalar @ARGV; $i++) {
    my $count = 0;  # word counter
    for (my $x = 0; $x < scalar @wordarr; $x++) {
        if (lc($ARGV[$i]) eq lc($wordarr[$x])) {  # equality check
            $count++;
        }
    }
    push @argcount, $count;  # store count
    if ($argcount[$i]) {
        $dictionary{$ARGV[$i]} = $argcount[$i];
    }
    else {
        $dictionary{$ARGV[$i]} = 0;
    }
    
}

foreach my $key (sort { $dictionary{$b} <=> $dictionary{$a} } keys %dictionary && sort(keys %dictionary)) {
    print $key . " = " . $dictionary{$key} . "\n";
}
