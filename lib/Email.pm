#
#===============================================================================
#
#         FILE: Email.pm
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: V. Predekha (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 26.01.2016 13:16:18
#     REVISION: ---
#===============================================================================
package Email {
use Modern::Perl;

#Валидация структуры email адреса(<localpart>@<domain>)
sub _validate_structure {
    my $addres = $_[0];
    $addres ~= m/^[^@]*@[^@]*$/;
}

1;
