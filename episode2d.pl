#!/usr/bin/perl

print "What is your favorite movie quote?\n";
$quote = <STDIN>;

$quote =~ s/^(\S+)\s+(\S+)/$2 $1/;
$quote =~ s/\n//;

print "Are you sure it's not \"$quote\"?\n";

exit;
