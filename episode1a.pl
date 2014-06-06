#!/usr/bin/perl

# Define our shows...
@shows = ("All About Android",
	  "Android App Arena",
	  "Before You Buy",
	  "Coding 101",
	  "FLOSS Weekly",
	  "The Giz Wiz",
	  "Ham Nation");

# Define our network name
$network = "TWiT";

# Pick a number...any number!
$selected = 3;

print "Subscribe to $shows[$selected], a fine $network show!\n";

exit;
