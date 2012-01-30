#!/usr/bin/env perl

use strict;
use warnings;
use Template;

print "
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Adding a new item to password db
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
";

print "target: " ;
chomp( my $target = <STDIN> );
print "passphrase: ";
chomp(my $passphrase = <STDIN> );


my $tt = Template->new() ;
my $input = 'pwstorage.tt';
my $output = 'pwstorage.xml';

my $vars = {
    passphrase => $passphrase ,
    target     => $target     ,
};

$tt->process($input, $vars, $output ) || die $tt->error( ) ;

open PWSTORAGE_ITEM, "pwstorage.xml" or die $! ;

    my @pwstorage_xml_content;
    
    while (my $line = <PWSTORAGE_ITEM>) {
        push(@pwstorage_xml_content, $line);
    }
    
close (PWSTORAGE_ITEM) ;

unlink ('pwstorage.xml') or die $!;

chdir ("/tmp") or die "$!";

opendir (DIR, ".") or die "$!";

    open PWSTORAGE_DB, "+<pwstorage_db.xml" or die $! ;

	my @lines = <PWSTORAGE_DB> ;
	splice @lines, 3, 0, @pwstorage_xml_content ;
      
    close (PWSTORAGE_DB) ;

    open PWSTORAGE_DB, ">pwstorage_db.xml" or die $! ;

	print PWSTORAGE_DB @lines ;
      
    close (PWSTORAGE_DB) ;

close DIR;

print "[*] Done\n";

exit (0);







