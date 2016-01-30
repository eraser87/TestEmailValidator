#
#===============================================================================
#
#         FILE: 01_email_validate_email.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladimir V. Predekha, 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 30.01.2016 23:17:49
#     REVISION: ---
#===============================================================================

use Modern::Perl;
use utf8;
binmode(STDOUT,':utf8');
use lib 'lib';
use TestEmail;

use Test::More tests => 1;                      # last test to print

subtest 'validate_email' => sub {
    my $email = 'example@example.com';
    my $expected = 'example.com';
    my $returned = TestEmail::validate_email($email);
    is ($returned, $expected, 'Valid: "example@example.com"');
    
    $email = 'example@пример.рф';
    $expected = 'пример.рф';
    $returned = TestEmail::validate_email($email);
    is ($returned, $expected, 'Valid: "example@пример.рф"');

    $email = 'example@ex@ample.com';
    $expected = 'INVALID';
    $returned = TestEmail::validate_email($email);
    is ($returned, $expected, 'Invalid: "example@ex@ample.com"');

    $email = '.example@example.com';
    $expected = 'INVALID';
    $returned = TestEmail::validate_email($email);
    is ($returned, $expected, 'Invalid: ".example@example.com"');

    $email = 'example@.example.com';
    $expected = 'INVALID';
    $returned = TestEmail::validate_email($email);
    is ($returned, $expected, 'Invalid: "example@.example.com"');

    $email = 'абв@example.com';
    $expected = 'INVALID';    
    $returned = TestEmail::validate_email($email);
    is ($returned, $expected, 'Invalid: "абв@example.com"');
}
