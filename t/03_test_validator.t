#
#===============================================================================
#
#         FILE: 03_test_validator.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladimir V. Predekha (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 31.01.2016 13:08:57
#     REVISION: ---
#===============================================================================

use Modern::Perl;
use utf8;
binmode(STDOUT,':utf8');
use lib 'lib';
use TestValidator;

use Test::More tests => 1;                      # last test to print

subtest 'handle_emails' => sub {
    my $filename = 'testfile.txt';
    my @expected = ("mail.ru  2\n",
                    "example.com  1\n",
                    "localhost  1\n",
                    "rambler.ru  1\n",
                    "vk.com  1\n",
                    "xn--c1ad6a.xn--p1ai  1\n",
                    "пример.рф  1\n",
                    "INVALID  5\n",);
    my @returned = TestValidator::handle_emails($filename);
    is_deeply(\@returned, \@expected, 'Handled OK');
};

done_testing;
