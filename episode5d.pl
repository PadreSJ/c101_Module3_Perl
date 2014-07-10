#!/usr/bin/perl

# set the content type for the page
print "Content-type: text/html\n\n";

# set HTML headers
print "<head><title>$ENV{'SERVER_NAME'}'s Environment</title></head>\n";
print "<body>\n<font face=\"Arial\">\n";
print "<h2>$ENV{'SERVER_NAME'}'s Environment</h2>\n";

# set an array with my favorite environment variables
@variables = ("SERVER_NAME", "SERVER_PORT", "DOCUMENT_ROOT", "HTTP_USER_AGENT", "SCRIPT_NAME", "REQUEST_METHOD", "QUERY_STRING");

# print the above environment variables
foreach (@variables) {
	print "<strong>$_:</strong> <tt>$ENV{$_}</tt><br />";
}

print "</font>\n</body></html>";
