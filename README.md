# <center><strong> Отчет ДЗ№2 </strong></center>
## <center> Алексей Коледаев | БПИ-213 </center>

## На 4:
<hr/>

- **[C-решение](./index.c)**
- Комментарии к скомпилированной без оптимизирующих и отладочных опций с помощью комманды `gcc -O0 -masm=intel -c index.c -S -o index.s` ассемблерной __[программе](./index.s)__ 
- Декомпилируем в "**[красивый](./beautiful_index.s)**" файл без лишних макросов с помощью `gcc -O0 -masm=intel -fno-asynchronous-unwind-tables -fcf-protection=none -c /index.c -S -o ./beutiful_index.s`
- В папке **[tests](./tests/)** представлены тесты с вводом в файлах **[in.txt](./tests/in.txt)(100 строк по $10^4$ символов)**, **[in2.txt](./tests/in2.txt)(1000 строк по $10^4$ символов)**, **[in3.txt](./tests/in3.txt)(100 строк по $10^6$ символов)** и выводы в файлах с соответсвующим префиксом

## На 5:
<hr/>

- В программе используются функции с передачей данных через параметры 
- В программе используются локальные переменнные
- В ассемблерной программе есть дополнительные комментарии,описывающие передачу фактических параметров и перенос возвращаемого результата.
- В ассемблерной программе есть комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).
- Программа изначально разрабатывалась с использованием функций с передачей данных через параметры

## На 6:
<hr/>

- Есть **[рефактор-версия](./beautiful_index_refactored.s)** кода на ассемблере
- Добавлены требуемые комментарии
- Проведены тесты проверки корректности
- Размер оригинального ассемблерного кода составил 130 строк, тогда как рефакторная версия составляет 135 строк, однако при прочтении теперь код становится сильно читабельнее за счет, а так же убраны "бессмысленные" перепресваивания одних и тех же регистров

## На 7:
<hr/>

- Добавлены два файла с описанием **[функции](./part1.s)** и **[мейна](./part2.s)**
- Добавлено считывание и проверка аргументов командной строки
- Добавлено тестовое **[покрытие](./tests/)**