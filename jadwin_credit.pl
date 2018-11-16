#!/usr/bin/env perl

use strict;
use warnings;
use Term::ANSIColor;


# Ask for cc num
print "\nEnter a credit card number (16 digits): ";

# stdin
my $num = <>;

print "\n";

# split into array of chars
my @chars = split("", $num);

# counter to create rows
my $counter = 0;
# counter for total # of digs
my $digcounter = 0;
# string to push each row to list
my $row = "";
# row list
my @list;
# boolean to check if contains illegal chars
my $bool = 0;

# loop through @chars
foreach my $i (@chars) {
    # if char == digit
    if ($i =~ /(\d+)/) {
       # concat num to row
       $row = $row . $i;
       # increment
       $counter++;
       $digcounter++;
    }
    # catch illegal characters
    elsif ($i =~ /([[:alpha:]])/ || $i !~ /[\s]/ && $i !~ /(\d+)/ || $i !~ /[\-]/ && $i !~ /(\d+)/) {
        print "illegal \n";
        $bool = 1;    
    }
    # Create new line
    if ($counter eq 4) {
        push @list, $row;
        $counter = 0;
        $row = "";
    }
}

# Error checking for illegal character
if ($bool ne 0) {
    # Error check incrementer
    my $inc = 0;
    # Print error
    my $showError = "";
    # Loop through chars
    foreach my $i (@chars) {
        # if $i is not a num, space, or -, highlight the character red
        if ($i =~ /([[:alpha:]])/ || $i !~ /[\s]/ && $i !~ /(\d+)/ || $i !~ /[\-]/ && $i !~ /(\d+)/) {
            $showError = $showError.colored($chars[$inc], 'red');
        }
        # else concat char to str
        else {
            $showError = $showError.$chars[$inc];
        }
        # increment
        $inc++;
    }
    # print highlighted illegal characters and exit
    print "Contains illegal characters: ".$showError;
    exit 0;
}

# check if length of number = 16
if ($digcounter ne 16) {
    print 'Not a valid credit card number';
    exit 0;
}

# if pass error checking, print formatted credit card num
foreach my $i (@list) {
    print $i."\n";
}
