#!/usr/bin/env perl
# import Perl training wheels
use strict;
use warnings;

# Ask for cc num
print "\nEnter a credit card number (16 digits): ";

# stdin
my $num = <>;

print "\n";

# split into array of chars
my @chars = split("", $num);

# count num of digits
my $counter = 0;
my $digcounter = 0;
my $row = "";
my @list;

foreach my $i (@chars) {
    if ($i =~ /(\d+)/) {
       $row = $row . $i;
       $counter++;
       $digcounter++;
    }
    if ($counter eq 4) {
        push @list, $row;
        $counter = 0;
        $row = "";
    }
}

if ($digcounter ne 16) {
    print 'Not a valid credit card number';
    exit 0;
}

foreach my $i (@list) {
    print $i."\n";
}
