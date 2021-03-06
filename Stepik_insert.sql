/*Задание
Добавить из таблицы supply в таблицу book, все книги, кроме книг, написанных Булгаковым М.А. и Достоевским Ф.М.

Результат
Affected rows: 2
Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
| 6       | Лирика                | Пастернак Б.Л.   | 518.99 | 2      |
| 7       | Черный человек        | Есенин С.А.      | 570.20 | 6      |
+---------+-----------------------+------------------+--------+--------+
Пояснение
Задание нужно выполнить без вложенных запросов.

Структура и наполнение таблиц book и supply
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
+-----------+----------------+------------------+--------+--------+
| supply_id | title          | author           | price  | amount |
+-----------+----------------+------------------+--------+--------+
| 1         | Лирика         | Пастернак Б.Л.   | 518.99 | 2      |
| 2         | Черный человек | Есенин С.А.      | 570.20 | 6      |
| 3         | Белая гвардия  | Булгаков М.А.    | 540.50 | 7      |
| 4         | Идиот          | Достоевский Ф.М. | 360.80 | 3      |
+-----------+----------------+------------------+--------+--------+

==========================================================================================================*/
insert into book(title, author, price, amount)
select title, author, price, amount
from supply
where author <> 'Булгаков М.А.' and author <> 'Достоевский Ф.М.'
/*==========================================================================================================

Задание
Занести из таблицы supply в таблицу book только те книги, авторов которых нет в  book.

Результат
Affected rows: 1

Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
| 6       | Лирика                | Пастернак Б.Л.   | 518.99 | 2      |
+---------+-----------------------+------------------+--------+--------+
Структура и наполнение таблиц book и supply
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
+-----------+----------------+------------------+--------+--------+
| supply_id | title          | author           | price  | amount |
+-----------+----------------+------------------+--------+--------+
| 1         | Лирика         | Пастернак Б.Л.   | 518.99 | 2      |
| 2         | Черный человек | Есенин С.А.      | 570.20 | 6      |
| 3         | Белая гвардия  | Булгаков М.А.    | 540.50 | 7      |
| 4         | Идиот          | Достоевский Ф.М. | 360.80 | 3      |
+-----------+----------------+------------------+--------+--------+

==========================================================================================================*/
insert into book(title, author, price, amount)
select title, author, price, amount
from supply
where author not in (
    select author
    from book
    );
/*==========================================================================================================

Задание
Уменьшить на 10% цену тех книг в таблице book, количество которых принадлежит интервалу от 5 до 10, включая границы.

Результат
Affected rows: 2
Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 486.45 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 414.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+

==========================================================================================================*/
update book
set price = price * 0.9
where amount between 5 and 10;
/*==========================================================================================================
Задание
В таблице book необходимо скорректировать значение для покупателя в столбце buy таким образом, чтобы оно не превышало количество экземпляров книг, указанных в столбце amount. А цену тех книг, которые покупатель не заказывал, снизить на 10%.

Результат
Affected rows: 3
Query result:
+---------+-----------------------+------------------+--------+--------+-----+
| book_id | title                 | author           | price  | amount | buy |
+---------+-----------------------+------------------+--------+--------+-----+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 603.89 | 3      | 0   |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      | 3   |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     | 8   |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 719.11 | 2      | 0   |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     | 15  |
+---------+-----------------------+------------------+--------+--------+-----+
Пояснение
Запрос на обновление количества книг должен корректировать значения в столбце buy  таблицы book следующим образом:

если покупатель заказал количество книг больше, чем есть на складе, то заменить значение buy на имеющееся на складе количество amount;
если покупатель хочет купить количество книг меньшее или равное количеству книг на складе, то значение buy изменять не надо.
Для реализации этого запроса можно  использовать функцию if().  Синтаксис раздела SET при использовании функции if() следующий:

SET столбец = IF(условие, выражение_1, выражение_2)
Выполняется этот оператор так:

сначала вычисляется условие;
если условие ИСТИНА, то вычисляется выражение_1, в противном случае (если условие ЛОЖНО) вычисляется выражение_2;
в столбец заносится результат выполнения функции (либо значение выражения_1, либо значение выражения_2 в зависимости от условия).
Например, для увеличения на 10% только цен книг Булгакова используется запрос:

UPDATE book 
SET price = IF(author = "Булгаков М.А.", price * 1.1, price);
Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+-----+
| book_id | title                 | author           | price  | amount | buy |
+---------+-----------------------+------------------+--------+--------+-----+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      | 0   |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      | 3   |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     | 8   |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      | 0   |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     | 18  |
+---------+-----------------------+------------------+--------+--------+-----+
==========================================================================================================*/
update book
set buy = if(amount < buy, amount, buy), price = if(buy = 0, price * 0.9, price);
/*==========================================================================================================
Задание
Для тех книг в таблице book , которые есть в таблице supply, не только увеличить их количество в таблице book ( увеличить их количество на значение столбца amountтаблицы supply), но и пересчитать их цену (для каждой книги найти сумму цен из таблиц book и supply и разделить на 2).

Результат
Affected rows: 2
Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 12     |
| 3       | Идиот                 | Достоевский Ф.М. | 410.40 | 13     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
Пояснение
Структура и наполнение таблиц book и supply
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
+-----------+----------------+------------------+--------+--------+
| supply_id | title          | author           | price  | amount |
+-----------+----------------+------------------+--------+--------+
| 1         | Лирика         | Пастернак Б.Л.   | 518.99 | 2      |
| 2         | Черный человек | Есенин С.А.      | 570.20 | 6      |
| 3         | Белая гвардия  | Булгаков М.А.    | 540.50 | 7      |
| 4         | Идиот          | Достоевский Ф.М. | 360.80 | 3      |
+-----------+----------------+------------------+--------+--------+

==========================================================================================================*/
update book, supply
set book.amount = book.amount + supply.amount, book.price = (book.price + supply.price) / 2
where book.title = supply.title and book.author = supply.author;

