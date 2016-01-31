#
#===============================================================================
#
#         FILE: 02_counter.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladimir V. Predekha, 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 31.01.2016 00:09:43
#     REVISION: ---
#===============================================================================

use Modern::Perl;
use utf8;
binmode(STDOUT,':utf8');
use lib 'lib/TestValidator';
use Counter;

use Test::More tests => 1;                      # last test to print


subtest 'domain_counter' => sub {
    my @domains = qw(reg.ru vk.com example.com vk.com reg.ru vk.com reg.ru);
    my %expected = ('reg.ru' => 3,
                    'vk.com' => 3,
                    'example.com' => 1,
                   );
    my %returned = Counter::count_domains(@domains);
    is_deeply (\%returned, \%expected, 'Count OK');
}

