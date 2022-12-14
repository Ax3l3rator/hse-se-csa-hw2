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

## На 8:
<hr/>

- Все требования выполнены в [папке](./8/)
  
| Файл       | Время          
| :-:        |:-:
| in.txt     | 0.0037s
| in2.txt     | 0.0302s
| in3.txt |0.2846s

## На 9:
<hr/>

Оптимизация | Время in3.txt | Время in2.txt | Время in.txt | Время без ввода/вывода(in3)
-|-|-|-|-
-O0| 0.617s| 0.061s | 0.023s | 0.284s
-Ofast| 0.388s| 0.060s | 0.014s | 0.163s
-Os| 0.460s| 0.055s | 0.019s | 0.189s
Мой код| 0.671s| 1.020s|0.991s|0.311s

|Оптимизация | Размер в строках | Размер исполняемого|
|------------|--------|-|
|-O0|  333 | 16.8КБ
|-Ofast| 407 | 16.8КБ
|-Os| 274 | 16.8КБ
|Мой код| 292|  16.6КБ