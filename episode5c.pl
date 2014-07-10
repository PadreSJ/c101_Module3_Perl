#!/usr/bin/perl

# set content type for the page
print "Content-type: text/html\n\n";

# start text
print "<html><body>\n";
print "Here are numbers from 1-10...<br />\n";

# for loop to print numbers 1 through 10
for ($count = 1; $count <= 10; $count++) {
   print "$count<br />\n";
}

# ending text
print "Is that not the most thrilling thing you've ever seen?\n";
print "</body></html>";
