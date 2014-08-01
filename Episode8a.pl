#!/usr/bin/perl

################################################
# Coding 101 Weather Station                   #
################################################
# Code for Coding 101 episode 28               #
# Presented July 31, 2014 by Patrick Delahanty #
# Watch the episode at http://twit.tv/code/28  #
################################################

# use the Perl CGI module
use CGI;

# let Perl know where I installed the Weather::Underground module
use lib '/Users/patrickd/perl5/lib/perl5';

# use the wunderground.com Perl module
use Weather::Underground;

# set our page title (used in multiple places)
$PageTitle = "Coding 101 Weather Station";

# print the top of the HTML page
&htmlheader;

# If you submitted the form (via POST), display the weather
if ($ENV{'REQUEST_METHOD'} eq "POST") {
    # take the form submission and put it in the $zip variable
    $input = new CGI;
    $zip = $input->param('zip');

    # using Weather::Underground, send the zip code...
    $weather = Weather::Underground->new(
	    place => "$zip",
	    debug => 0,
        ) || die "Error, could not create new weather object: $@\n";

    # get the weather back
    $arrayref = $weather->get_weather() || die "Error, calling get_weather() failed: $@\n";

    # This prints out ALL the keys and values.  Helpful for debugging and development.
    # Commented out for now...
    #foreach (@$arrayref) {
    #    while (($key, $value) = each %{$_}) {
    #        print "$key = $value<br />\n";
    #    }
    #}

    # set some variables using values we got;
    $place = $arrayref->[0]->{place};
    $temp = $arrayref->[0]->{temperature_fahrenheit};
    $conditions = $arrayref->[0]->{conditions};

    # set the background and text color based on the conditions
    if ($zip eq "10101") {
        $background = "sharknado";
        $place = "New York City";
        $conditions = "Sharknado";
        $textcolor = "#FFFFFF";
    } elsif (($conditions =~ /Fog/i) || ($conditions =~ /Mist/i)) {
        $background = "fog";
        $textcolor = "#000000";
    } elsif (($conditions =~ /Partly/i) || ($conditions =~ /Scattered/i)) {
        $background = "guardians";
        $textcolor = "#000000";
    } elsif (($conditions =~ /Cloud/i) || ($conditions =~ /Overcast/i)) {
        $background = "cloudy";
        $textcolor = "#000000";
    } elsif (($conditions =~ /Rain/i) || ($conditions =~ /Thunderstorm/i) ||
             ($conditions =~ /Shower/i)) {
        $background = "rain";
        $textcolor = "#FFFFFF";
    } else {
        # set some default values in case nothing was matched.  We'll assume it's sunny.
        $background = "sunny";
        $textcolor = "#000000";
    }

    # print the top of the page (with the custom background)
    &topofpage;

    # Print the weather for the location sent
    print "<P>The current weather at $place is $temp&deg;F and $conditions.</P>\n";
} else {
    # If it's not a POST, there was no form data submitted...

    # Set default background
    $background = "sunny";

    # print the top of the page (with the default "sunny" background)
    &topofpage;
}

# print the search box
&searchbox;

# print the end of the HTML
&htmlfooter;

exit;

########################## CODE ENDS ABOVE ### SUBROUTINES BELOW #####

sub htmlheader {
    # set the content type for the page
    print "Content-type: text/html\n\n";

    # set the HTML page header
    print "<HTML><HEAD>\n";
	print "<TITLE>$PageTitle</TITLE>\n";
}

sub topofpage {
    print <<EOF;
<STYLE>
body {
    background: url("/images/weather/$background.jpg");
    background-size: cover;
    font-family: Arial;
    color: $textcolor;
}
</STYLE>
</HEAD>
<BODY>
<div align="center">
<H1>$PageTitle</H1>
EOF
}

sub searchbox {
   print <<EOF;
<FORM ACTION="/cgi-bin/c101/ep28.pl" METHOD="POST">
<STRONG>Enter Postal Code:</STRONG><br />
<INPUT TYPE="TEXT" NAME="zip" SIZE="10" MAXLENGTH="50" VALUE="$zip">
<INPUT TYPE="SUBMIT" VALUE="Go">
</FORM>
EOF
}

sub htmlfooter {
    # end the HTML
    print <<EOF;
</div>
</BODY>
</HTML>
EOF
}
