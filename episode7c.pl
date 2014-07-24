#!/usr/bin/perl

use CGI;

$input = new CGI;

# set the content type for the page
print "Content-type: text/html\n\n";

# set the HTML header
print <<EOF;
<HTML>
<HEAD>
<TITLE>Coding 101 Episode 27</TITLE>
</HEAD>
<BODY>
<H1>Coding 101</H1>
<P>This is Example C result...</P>
EOF

if ($ENV{'REQUEST_METHOD'} ne "POST") {
    print "Location: /ep27c.html\n\n";
    exit;
}

$animal = $input->param('animal');
$name = $input->param('name');

if (($animal =~ /bunny/i) || ($animal =~ /rabbit/i)) {
    # If they said anything with "bunny" or "rabbit"...
    print "You said $animal and named it $name!<br />\n";
    print "Yes, bunnies are the best!<br />\n";
    &eating;
    if ($input->param('cute') eq "Y") {
	    print "Of course $name is cute.\n";
    } else {
	    print "What do you mean $name isn't cute?\n";
    }
} else {
    # If they didn't say bunny and are lame...
    print "You said $animal...<br />\n";
    print "Okay, whatever.  I hope $name brings you joy anyway.<br />\n";
    &eating;
    if ($input->param('cute') eq "Y") {
	    print "At least $name is cute.\n";
    }
}

# end the HTML
print <<EOF;
<P><A HREF="/ep27c.html">Submit again</A></P>
</BODY>
</HTML>
EOF

exit;

sub eating {
    if ($input->param('food')) {
	print "It eats:<br />\n";
	@foods = $input->param('food');
	foreach $food (@foods) {
	    print "$food<br>\n";
	}
    }
}
