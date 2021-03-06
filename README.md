# NAME

TestEmailValidator

# SYNOPSIS

TestEmailValidator - валидатор email адресов.
Тестовое задание для REG.RU.

Использование: perl email_validator.pl filename

# DESCRIPTION

Не используйте для реальных задач!
Является тестовым заданием для REG.RU.

Прогон тестов: prove -v t/*  
Отчет о покрытии тестами: coverage.html  

Так как валидация email адреса в универсальном виде является нетривиальной задачей, а также учитывая тестовый характер программы, для наглядности приняты следующие допущения и умолчания:
  
1. Проверяется только отсутсвие недопустимых символов, существование адреса или домена, а также возможность доступа пользователя к ящику не проверяется.  
2. В email адресе допустим только один символ "@".  
3. Не проверяется наличие недопустимых последовательностей ".." и подобных, недопустимых завершающих символов в частях адреса.  
4. В локальной части допустимы только цифры, заглавные и строчные латинские буквы, а также символы ".", "_", "-", "+", кроме первого символа.  
5. В имени домена(для доменов с не ASCII символами, после преобразования в punycode) допустимы только цифры, строчные латинские буквы, а также символы "." и "-".  
6. Проверяется только общая длина доменного имени, максимальная - 255 символов, минимальная - 3 символа, длина каждой части не проверяется.  
7. В случае невалидных данных, для наглядности, функции возвращают строку "INVALID". Т.е. фактически валидный адрес "INVALID@example.com" будет считаться невалидным.  
8. Если во входящих данных есть один и тот же домен с символами unicode и преобразованный в punycode (например "пример.рф" и "xn--e1afmkfd.xn--p1ai"), он будет считаться разными доменами и будет посчитан отдельно.  

# LICENSE

Copyright (C) Vladimir V. Predekha.  

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.  

# AUTHOR

Vladimir V. Predekha. <>  
