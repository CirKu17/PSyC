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

&fix_encoding;

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

open PWSTORAGE_DB, "+<pwstorage_db.xml" or die $! ;

    my @lines = <PWSTORAGE_DB> ;
    splice @lines, 3, 0, @pwstorage_xml_content ;
   
close (PWSTORAGE_DB) ;


open PWSTORAGE_DB, ">pwstorage_db.xml" or die $! ;

    print PWSTORAGE_DB @lines ;
   
close (PWSTORAGE_DB) ;

print "\t[*] Done\n";

print "Encrypting...\n";

exit (0);

sub fix_encoding {

my %ESCAPES = (
    '&' => '&amp;',
    '<' => '&lt;',
    '>' => '&gt;',
    '"' => '&quot;',
);

$passphrase =~ s/([&<>"])/$ESCAPES{$1}/ge;
$target =~ s/([&<>"])/$ESCAPES{$1}/ge;

}





