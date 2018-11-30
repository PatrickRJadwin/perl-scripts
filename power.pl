#!/usr/bin/env perl

use strict;
use warnings;

sub pow {
    my ( $x, $n ) = @_;
    my $a = $x;
    for ( my $i = 1; $i < $n; $i++ ) {
        $a *= $x;
    }
    return $a;
}

sub getpow {
    print "x = ";
    my $x = <>;
    print "n = ";
    my $n = <>;
    print "\n";
    my @arr;
    push @arr, $x;
    push @arr, $n;
    return @arr;
}

my @arr = getpow();

print pow($arr[0], $arr[1]);
print "\n";
