#
#===============================================================================
#
#         FILE: 01_class_email.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: V. Predekha (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 26.01.2016 10:54:34
#     REVISION: ---
#===============================================================================

use Modern::Perl;
use lib './lib';
use Test::More 'no_plan';
use Email;

#my $valid_email1 = Email->new;
#Проверяем методы класса
subtest 'can new' => sub {
    plan tests => 1;
    can_ok('Email', qw('new'));
};


done_testing;
