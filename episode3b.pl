#!/usr/bin/perl

print "What is your favorite movie quote?\n";
$quote = <STDIN>;

$quote =~ s/\s/\n/g;

print "---\n$quote\n";

exit;
