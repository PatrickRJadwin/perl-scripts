#!/usr/bin/env perl

use strict;
use warnings;
use Term::ANSIColor;


print "\nEnter a credit card number (16 digits): ";

my $num = <>;

print "\n";

my @chars = split("", $num);

my $counter = 0;
my $digcounter = 0;
my $row = "";
my @list;
my $bool = 0;

foreach my $i (@chars) {
    if ($i =~ /(\d+)/) {
       $row = $row . $i;
       $counter++;
       $digcounter++;
    }
    if ($i !~ /(\d+)/ && $i !~ /[\s]/ && $i !~ /[\-]/) {
        $bool = 1;    
    }
    if ($counter eq 4) {
        push @list, $row;
        $counter = 0;
        $row = "";
    }
}

if ($bool ne 0) {
    my $inc = 0;
    my $showError = "";
    foreach my $i (@chars) {
        if ($i !~ /(\d+)/ && $i !~ /[\s]/ && $i !~ /[\-]/) {
            $showError = $showError.colored($chars[$inc], 'red');
        }
        else {
            $showError = $showError.$chars[$inc];
        }
        $inc++;
    }
    print "Contains illegal characters: ".$showError."\n";
    exit 0;
}

if ($digcounter ne 16) {
    print "INVALID: Must enter 16 digits\n\n";
    exit 0;
}

foreach my $i (@list) {
    print $i."\n";
}
