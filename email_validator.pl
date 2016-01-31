#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: email_validator.pl
#
#        USAGE: ./email_validator.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladimir V. Predekha (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 31.01.2016 00:44:10
#     REVISION: ---
#===============================================================================

use Modern::Perl;
use utf8;
binmode(STDOUT,':utf8');
use lib 'lib';
use TestValidator;


# Получаем имя файла
my $filename = $ARGV[0];

print TestValidator::handle_emails($filename);
