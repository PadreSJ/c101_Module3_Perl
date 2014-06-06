#!/usr/bin/perl

print "What is your favorite animal?\n";
$animal = <STDIN>;

if ($animal eq "bunny\n") {
    print "You said $animal";
    print "Yes, bunnies are the best!\n"
} else {
    print "You said $animal";
    print "Okay, whatever.\n";
}

exit;
