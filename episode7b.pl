#!/usr/bin/perl

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
<P>This is Example B result...</P>
EOF

read(STDIN,$input,$ENV{'CONTENT_LENGTH'});

print "<P><I>STDIN says: $input</I></P>\n";

if (length ($input) > 0){
    @things = split(/&/, $input);
    foreach $thing (@things){
        ($name, $value) = split(/=/, $thing);
        $in{$name} = $value; 
    }
}

if ($in{'animal'}) {
    $animal = $in{'animal'};
} else {
    $animal = "nothing";
}

if ($in{'name'}) {
    $name = $in{'name'};
} else {
    $name = "unknown";
}

if (($animal =~ /bunny/i) || ($animal =~ /rabbit/i)) {
    # If they said anything with "bunny" or "rabbit"...
    print "You said $animal and named it $name!<br />\n";
    print "Yes, bunnies are the best!\n";
} else {
    # If they didn't and are lame...
    print "You said $animal...<br />\n";
    print "Okay, whatever.  I hope $name brings you joy anyway.\n";
}

# end the HTML
print <<EOF;
<P><A HREF="/ep27b.html">Submit again</A></P>
</BODY>
</HTML>
EOF

exit;
