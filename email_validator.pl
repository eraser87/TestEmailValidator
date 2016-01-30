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
use TestEmail;
use Counter;

# Получаем имя файла
my $filename = $ARGV[0];
# Создаем хэндлер для файла или выдаем ошибку в случае неудачи
open(my $file_handler, "<:utf8", $filename) or die "Could not open file '$filename' $!";
# Создаем массив доменов
my @domains;
# Построчно читаем файл
while (my $email_addres = <$file_handler>) {
    # Отсекаем символ переноса строки \n
    chomp $email_addres;
    # Записываем домены в массив
    @domains = (@domains, TestEmail::validate_email($email_addres));
}
# Передаем массив доменов счетчику и записываем в хэш
my %domain = Counter::count_domains(@domains);
# Сортируем сначала по значению, потом по ключу и выводим доменные имена и их кол-во, кроме невалидных
for my $key (sort {$domain{$b} <=> $domain{$a} || $a cmp $b} keys %domain) {
  print "$key  $domain{$key}\n" if $key ne "INVALID";
}
# Выводим кол-во невалидных адресов
print "INVALID  $domain{'INVALID'}\n";
# Закрываем хэндлер
close $file_handler;
