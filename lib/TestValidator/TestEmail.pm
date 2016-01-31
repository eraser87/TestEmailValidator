#
#===============================================================================
#
#         FILE: TestEmail.pm
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
package TestEmail;
use Modern::Perl;
use utf8;
use Net::IDN::Encode qw(domain_to_ascii);

=head1 NAME
TestEmail

=head1 SYNOPSIS
use TestEmail;
$domain = TestEmail::validate_email($email_addres);

=head1 DESCRIPTION
Проверяет email адрес и возвращает доменное имя или "INVALID".
Для наглядности, в случае невалидных аргументов, все функции возвращают "INVALID".
=cut

# Проверяем валидность адреса и возвращаем доменное имя или "INVALID" в зависимости от результата
sub validate_email {
    # Принимаем адрес
    my ($addres) = @_;
    # Делим адрес
    my ($localpart, $domain) = _split_addres($addres);
    # Проверяем локальную часть
    $localpart = _validate_localpart($localpart) if $localpart ne "INVALID";
    # Проверяем доменное имя
    $domain = _validate_domain($domain) if $domain ne "INVALID";
    # Если части адреса валидны возвращаем доменное имя, иначе "INVALID"
    if ($localpart ne 'INVALID' && $domain ne "INVALID") {
        return $domain;
    }
        else {
            return "INVALID";
        }
}


# Делим email адрес(<localpart>@<domain>) на на локальную часть <localpart> и имя домена <domain>
sub _split_addres {
    # Принимаем адрес
    my ($addres) = @_;
    # Делим по символу "@"
    my @parts = split('@',$addres);
    # Если получилось 2 части, пишем в переменные  
    my ($local_part, $domain) = @parts if @parts == 2;
    # Если в переменных что-то записано - возвращаем их, если нет - возвращаем "INVALID"
    return ($local_part || "INVALID", $domain || "INVALID");
}


# Проверяем валидность локальной части <localpart>
sub _validate_localpart {
    # Принимаем локальную часть <localpart>
    my ($localpart) = @_;
    # Проверяем локальную часть регулярным выражением, возвращаем если проверка успешна,
    # иначе возвращаем "INVALID".
    # Допустимы в качестве начального символа цифры, заглавные и строчные латинские буквы,
    # в качестве следующих также символы: "_", "-", "+", ".".
    if ($localpart =~ m/^[A-Za-z0-9][-A-Za-z0-9\._+]{0,63}$/) {
        return $localpart;
    }
    else {
        return "INVALID";
    }
}


# Проверяем валидность доменного имени <domain>
sub _validate_domain {
    my ($domain) = @_;
    # Сохраняем исходное доменное имя в переменную для последующего возврата
    my $original_domain = $domain;
    # Преобразуем в punicode если доменное имя содержит не ASCII символы
    $domain = _encode_domain($domain) if $domain =~ m/[^[:ascii:]]/;
    if ($domain =~ m/^[a-z0-9][-a-z0-9\.]{2,254}$/) {
        return $original_domain;
    }
    else {
        return "INVALID";
    }
}


# Преобразуем доменное имя с не ASCII символами в punycode
sub _encode_domain {
   # Принимаем доменное имя
   my ($domain) = @_;
   # Преобразуем доменное в Punycode при помощи Net::IDN::Encode
   my $encoded_domain = domain_to_ascii($domain);
   return $encoded_domain;
}

1;
