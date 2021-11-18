/*Задание
Отобрать различные (уникальные) элементы столбца amount таблицы book.

Результат (попробуйте решать задания без известного результата, если не получится - раскройте его)
Query result:
+--------+
| amount |
+--------+
| 3      |
| 5      |
| 10     |
| 15     |
+--------+
Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+

==========================================================================================================*/
select amount 
from book
group by amount
/*==========================================================================================================

Задание
Посчитать, количество различных книг и количество экземпляров книг каждого автора , хранящихся на складе.  Столбцы назвать Автор, Различных_книг и Количество_экземпляров соответственно.

Результат
+------------------+----------------+------------------------+
| Автор            | Различных_книг | Количество_экземпляров |
+------------------+----------------+------------------------+
| Булгаков М.А.    | 2              | 8                      |
| Достоевский Ф.М. | 3              | 23                     |
| Есенин С.А.      | 1              | 15                     |
+------------------+----------------+------------------------+
Пояснение
Название столбцов может состоять из нескольких слов, тогда их нужно заключать в кавычки. Но если слова написать через подчеркивание, тогда получится , что название состоит из одного слова, и кавычки можно не ставить. 

Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
==========================================================================================================*/
select author as Автор, count(author) as Различных_книг, sum(amount) as Количество_экземпляров 
from book
GROUP BY author;
/*==========================================================================================================
Задание
Вывести фамилию автора, минимальную, максимальную и среднюю цену книг каждого автора . Вычисляемые столбцы назвать Минимальная_цена, Максимальная_цена и Средняя_цена соответственно.

Результат
+------------------+------------------+-------------------+--------------+
| author           | Минимальная_цена | Максимальная_цена | Средняя_цена |
+------------------+------------------+-------------------+--------------+
| Булгаков М.А.    | 540.50           | 670.99            | 605.745000   |
| Достоевский Ф.М. | 460.00           | 799.01            | 579.836667   |
| Есенин С.А.      | 650.00           | 650.00            | 650.000000   |
+------------------+------------------+-------------------+--------------+
Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
==========================================================================================================*/
select author, min(price) as Минимальная_цена, max(price) as Максимальная_цена, avg(price) as Средняя_цена
from book 
group by author
/*==========================================================================================================
Задание
Для каждого автора вычислить суммарную стоимость книг S (имя столбца Стоимость), а также вычислить налог на добавленную стоимость  для полученных сумм (имя столбца НДС ) , который включен в стоимость и составляет k = 18%,  а также стоимость книг  (Стоимость_без_НДС) без него. Значения округлить до двух знаков после запятой. В запросе для расчета НДС(tax)  и Стоимости без НДС(S_without_tax) использовать следующие формулы:



Результат
+------------------+-----------+---------+-------------------+
| author           | Стоимость | НДС     | Стоимость_без_НДС |
+------------------+-----------+---------+-------------------+
| Булгаков М.А.    | 4715.47   | 719.31  | 3996.16           |
| Достоевский Ф.М. | 11802.03  | 1800.31 | 10001.72          |
| Есенин С.А.      | 9750.00   | 1487.29 | 8262.71           |
+------------------+-----------+---------+-------------------+
Пояснение
Имена столбцов, присвоенные им с помощью AS, нельзя использовать в выражениях, используйте названия столбцов исходной таблицы.

Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+



==========================================================================================================*/
select author, sum(price*amount) as Стоимость, round((sum(price*amount)*18/100)/(1+18/100), 2) as НДС, round(sum(price*amount)/(1+18/100), 2) as Стоимость_без_НДС 
from book
group by author;
/*==========================================================================================================
Задание
Вывести  цену самой дешевой книги, цену самой дорогой и среднюю цену книг на складе. Названия столбцов Минимальная_цена, Максимальная_цена, Средняя_цена соответственно. Среднюю цену округлить до двух знаков после запятой.

Результат
+------------------+-------------------+--------------+
| Минимальная_цена | Максимальная_цена | Средняя_цена |
+------------------+-------------------+--------------+
| 460.00           | 799.01            | 600.17       |
+------------------+-------------------+--------------+
Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+

==========================================================================================================*/
select min(price) as Минимальная_цена, max(price) as Максимальная_цена, round(avg(price), 2) as Средняя_цена
from book;
/*==========================================================================================================

Задание
Вычислить среднюю цену и суммарную стоимость тех книг, количество экземпляров которых принадлежит интервалу от 5 до 14, включительно. Столбцы назвать Средняя_цена и Стоимость, значения округлить до 2-х знаков после запятой.

Результат
+--------------+-----------+
| Средняя_цена | Стоимость |
+--------------+-----------+
| 493.67       | 12107.50  |
+--------------+-----------+
Пояснение
Если в запросе с групповыми функциями отсутствует GROUP BY, то для отбора записей используется ключевое слово WHERE.

Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+

==========================================================================================================*/
select round(avg(price), 2) as Средняя_цена, sum(price*amount) as Стоимость 
from book
where amount between 5 and 14 
/*==========================================================================================================

Задание
Посчитать стоимость всех экземпляров каждого автора без учета книг «Идиот» и «Белая гвардия». В результат включить только тех авторов, у которых суммарная стоимость книг более 5000 руб. Вычисляемый столбец назвать Стоимость. Результат отсортировать по убыванию стоимости.

Результат
+------------------+-----------+
| author           | Стоимость |
+------------------+-----------+
| Есенин С.А.      | 9750.00   |
| Достоевский Ф.М. | 7202.03   |
+------------------+-----------+
Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+

==========================================================================================================*/
select author, sum(price*amount) as Стоимость
from book
where title <> 'Идиот' and title <> 'Белая гвардия' 
group by author  
having (Стоимость  > 5000) 
order by author desc;
/*==========================================================================================================

Задание
Вывести информацию (автора, название и цену) о  книгах, цены которых меньше или равны средней цене книг на складе. Информацию вывести в отсортированном по убыванию цены виде. Среднее вычислить как среднее по цене книги.

Результат
+------------------+---------------+--------+
| author           | title         | price  |
+------------------+---------------+--------+
| Булгаков М.А.    | Белая гвардия | 540.50 |
| Достоевский Ф.М. | Игрок         | 480.50 |
| Достоевский Ф.М. | Идиот         | 460.00 |
+------------------+---------------+--------+
Структура и наполнение таблицы book
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
==========================================================================================================*/
select author, title, price
from book
where price <= (
    select avg(price)
    from book
    
)
order by price desc;











==========================================================================================================