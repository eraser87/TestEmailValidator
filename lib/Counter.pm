#
#===============================================================================
#
#         FILE: Counter.pm
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladimir V. Predekha, 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 30.01.2016 23:49:04
#     REVISION: ---
#===============================================================================
package Counter;
use Modern::Perl;
use utf8;

sub count_domains {
    # Принимаем массив доменов
    my @domains = @_;
    # Создаем хэш для хранения имен доменов и числа вхождений в массив
    my %count_domain;
    # Создаем переменную для имен доменов
    my $domain;
    # Считаем домены.
    foreach $domain (@domains) {
        $count_domain{$domain}++;
    }

    #$count_domain->{$domain}++ foreach $domain (@domains);
    return %count_domain;
}

1;

