#
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
use lib 'lib';
use Email;
use Test::More tests => 2;                      # last test to print

my $email_addres = 'dsdasd@sass';
my @parts = qw(dsdasd sass);
my @returned = Email::_split_structure($email_addres);
is_deeply(\@returned, \@parts, 'Valid: dsdasd@sass');

$email_addres = 'ds@asd@sass';
@parts = qw(INVALID INVALID);
@returned = Email::_split_structure($email_addres);
is_deeply(\@returned, \@parts, 'Invalid: ds@asd@sass');

done_testing;
