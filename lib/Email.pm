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

# Делим email адрес(<localpart>@<domain>) на <localpart> и <> domain
sub _split_structure {
    my ($addres) = @_;
    my @parts = split /@/,$addres;  
    my ($local_part, $domain) = @parts if @parts == 2;
    return ($local_part || "INVALID", $domain || "INVALID");
}

1;
}
