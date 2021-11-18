/*Подключится к 
Host: 159.69.151.133
Port: 5056
User: user_22_x
Pass: 123
Table: qa_users

Создать текстовый файл, в котором на против каждой команды напишите sql запрос который выполнит команду.

Текстовый файл выгружайте на гит и скидывайте ссылки на проверку.

Вывести все поля и все строки.*/
select * from qa_users;
/*Вывести всех студентов в таблице*/
select * from qa_users;
/*Вывести только Id пользователей*/
select user_id from qa_users;
/*Вывести только имя пользователей*/
select username from qa_users;
/*Вывести только email пользователей*/
select email from qa_users;
/*Вывести имя и email пользователей*/
select username, email from qa_users;
/*Вывести id, имя, email и дату создания пользователей*/
select user_id, username, email, created_on from qa_users;
/*8. Вывести пользователей, где password 12333*/
select username
from qa_users
where password = '12333';

/*Вывести пользователей, которые были созданы 2021-03-26 00:00:00*/
select username
from qa_users
where created_on = '2021-03-26 00:00:00';
/*Вывести пользователей, где в имени есть слово Анна*/
select username
from qa_users
where username like '%Anna%';
/*Вывести пользователей, где в имени в конце есть 8*/
select username
from qa_users
where username like '%8';
/*Вывести пользователей, где в имени есть буква а*/
select username
from qa_users
where username like '%a%';

/*Вывести пользователей, которые были созданы 2021-07-12 00:00:00*/
select username
from qa_users
where created_on = '2021-07-12 00:00:00';

/*Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313*/
select username
from qa_users
where created_on = '2021-07-12 00:00:00' and
password = '1m313';

/*Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey*/
select username
from qa_users
where created_on = '2021-07-12 00:00:00' and username like '%Andrey%';

/*Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8*/
select username
from qa_users
where created_on = '2021-07-12 00:00:00' and username like '%8%';
 /*Вывести пользователя у которых id равен 10*/
select username
from qa_users
where user_id = 10; 
/*Вывести пользователя у которых id равен 53*/
 select username
from qa_users
where user_id = 53;
/*Вывести пользователя у которых id больше 40*/
select username
from qa_users
where user_id > 40;
 /*Вывести пользователя у которых id меньше 30*/
select username
from qa_users
where user_id < 30;
 /*Вывести пользователя у которых id меньше 27 или больше 88*/
select user_id, username
from qa_users
where user_id < 27 or user_id > 88;

/*Вывести пользователя у которых id меньше либо равно 37*/
select user_id, username
from qa_users
where user_id <= 37;

/*Вывести пользователя у которых id больше либо равно 37*/
select user_id, username
from qa_users
where user_id >= 37;
/*Вывести пользователя у которых id больше 80 но меньше 90*/
select user_id, username
from qa_users
where user_id > 80 and user_id < 90;
/*Вывести пользователя у которых id между 80 и 90*/
select user_id, username
from qa_users
where user_id between 80 and 90;
/*Вывести пользователей, где password равен 12333, 1m313, 123313*/
select username, password
from qa_users
where password = '12333' or password = '1m313' or password = '123313';
/*Вывести пользователей, где created_on равен 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00*/
 select username, created_on 
from qa_users
where created_on  = '2020-10-03 00:00:00' or created_on  = '2021-05-19 00:00:00' or created_on  = '2021-03-26 00:00:00';

/*Вывести минимальный id*/ 
 select min(user_id)
from qa_users;

/*Вывести максимальный.*/
 select max(user_id)
from qa_users;
/*Вывести количество пользователей*/
 select count(username)
from qa_users;

/*Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку возрастания даты добавления пользователя.*/
select user_id, username, created_on 
from qa_users
order by created_on; 

/*Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку убывания даты добавления пользователя.*/

select user_id, username, created_on 
from qa_users
order by created_on desc;
