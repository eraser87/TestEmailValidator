#
#===============================================================================
#
#         FILE: TestValidator.pm
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladimir V. Predekha (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 31.01.2016 12:49:28
#     REVISION: ---
#===============================================================================
package TestValidator;
use Modern::Perl;
use utf8;
use lib 'lib/TestValidator';
use TestEmail;
use Counter;

=head1 NAME
TestValidator

=head1 SYNOPSIS
use TestValidator;
print TestValidator::handle_emails($filename);

=head1 DESCRIPTION
Получает имя файла с email адресами, возвращает массив с отформатированным подсчетом доменных имен
=cut


sub handle_emails {
# Получаем имя файла
my ($filename) = @_;

# Создаем хэндлер для файла или выдаем ошибку в случае неудачи
open(my $file_handler, "<:utf8", "$filename") or die "Could not open file '$filename' $!";

# Создаем массив доменов
my @domains;

# Построчно читаем файл
while (my $email_addres = <$file_handler>) {
    # Отсекаем символ переноса строки \n
    chomp $email_addres;
    # Записываем домены в массив
    @domains = (@domains, TestEmail::validate_email($email_addres));
}

# Закрываем хэндлер файла
close $file_handler;

# Передаем массив доменов счетчику и записываем в хэш
my %domain = Counter::count_domains(@domains);

#Создаем массив для вывода
my @output;

# Сортируем сначала по кол-ву, потом по имени домена и записываем в массив доменные имена и их кол-во, кроме невалидных
for my $key (sort {$domain{$b} <=> $domain{$a} || $a cmp $b} keys %domain) {
  @output = (@output, "$key  $domain{$key}\n") if $key ne "INVALID";
}

# Записываем в массив кол-во невалидных адресов
@output = (@output, "INVALID  $domain{'INVALID'}\n");

# Возвращаем массив
return @output;
}

1;

