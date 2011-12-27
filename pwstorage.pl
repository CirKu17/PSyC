#!/usr/bin/env perl

use strict;
use warnings;
use Template;

my $pwstorage_txt = $ARGV[0] ;

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

open PWSTORAGE_DB, "+>pwstorage_db.xml" or die $! ;

    print PWSTORAGE_DB "<pwstorage>\n\n";
    print PWSTORAGE_DB @pwstorage_xml_content ;
    print PWSTORAGE_DB "\n</pwstorage>";
   
close (PWSTORAGE_DB) ;

print "\t[*] Done\n";
print "Encrypting...\n";

exit (0);







