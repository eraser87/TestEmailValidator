
#===============================================================================
#
#         FILE: 00_email_privat_functions.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: V. Predekha (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 28.01.2016 13:56:25
#     REVISION: ---
#===============================================================================

use Modern::Perl;
use utf8;
binmode(STDOUT,':utf8');
use lib 'lib';
use TestEmail;
use Test::More tests => 4;                      # last test to print


subtest 'TestEmail::_split_addres' => sub {
    my $email_addres = 'example@example.com';
    my @parts = qw(example example.com);
    my @returned = TestEmail::_split_addres($email_addres);
    is_deeply (\@returned, \@parts, 'Valid: "example@example.com"');

    $email_addres = 'ex@ample@example.com';
    @parts = qw(INVALID INVALID);
    @returned = TestEmail::_split_addres($email_addres);
    is_deeply (\@returned, \@parts, 'Invalid: "ex@ample@example.com"');
    
    $email_addres = 'example';
    @parts = qw(INVALID INVALID);
    @returned = TestEmail::_split_addres($email_addres);
    is_deeply (\@returned, \@parts, 'Invalid: "example"');
};


subtest 'TestEmail::_validate_localpart' => sub {
    my $localpart = 'example';
    my $expected = 'example';
    my $returned = TestEmail::_validate_localpart($localpart);
    is ($returned, $expected, 'Valid: "example"');

    $localpart = '_example';
    $expected = 'INVALID';
    $returned = TestEmail::_validate_localpart($localpart);
    is ($returned, $expected, 'Invalid: "_example"');

    $localpart = 'ex ample';
    $expected = 'INVALID';
    $returned = TestEmail::_validate_localpart($localpart);
    is ($returned, $expected, 'Invalid: "ex ample"');

    $localpart = 'e';
    $expected = 'e';
    $returned = TestEmail::_validate_localpart($localpart);
    is ($returned, $expected, 'Valid: "e"');
};


subtest 'TestEmail::_encode_domain' => sub {
    my $domain = 'пример.рф';
    my $expected = 'xn--e1afmkfd.xn--p1ai';
    my $returned = TestEmail::_encode_domain($domain);
    is ($returned, $expected, '"пример.рф"->"xn--e1afmkfd.xn--p1ai"');
    
    $domain = 'example.рф';
    $expected = 'example.xn--p1ai';
    $returned = TestEmail::_encode_domain($domain);
    is ($returned, $expected, '"example.рф"->"example.xn--p1ai"');
};


subtest 'TestEmail::_validate_domain' => sub {
    my $domain = 'example.com';
    my $expected = 'example.com';
    my $returned = TestEmail::_validate_domain($domain);
    is ($returned, $expected, 'Valid: "example.com"');

    $domain = '%example.com';
    $expected = 'INVALID';
    $returned = TestEmail::_validate_domain($domain);
    is ($returned, $expected, 'Invalid: "%example.com"');

    $domain = 'localhost';
    $expected = 'localhost';
    $returned = TestEmail::_validate_domain($domain);
    is ($returned, $expected, 'Valid: "localhost"');

    $domain = 'xn--e1afmkfd.xn--p1ai';
    $expected = 'xn--e1afmkfd.xn--p1ai';
    $returned = TestEmail::_validate_domain($domain);
    is ($returned, $expected, 'Valid: "xn--e1afmkfd.xn--p1ai"');

    $domain = 'пример.рф';
    $expected = 'пример.рф';
    $returned = TestEmail::_validate_domain($domain);
    is ($returned, $expected, 'Valid: "пример.рф"');
};

done_testing;
