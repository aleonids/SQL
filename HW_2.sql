/*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/

select employees.employee_name, employees_salary.monthly_salary  
from
employees inner join employees_salary
on employees_salary.employee_id = employees.id;

/* 2. Вывести всех работников, у которых ЗП меньше 2000.*/

select employees.employee_name, employees_salary.monthly_salary 
from
employees inner join employees_salary
on employees_salary.employee_id = employees.id;
where monthly_salary < 2000;
   
/* 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/
select employees_salary.monthly_salary 
from 
employees_salary left join employees 
on employees_salary.employee_id = employees.id
where employees.employee_name is null

/* 4. Вывести все зарплатные позиции меньше 2000, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/
select employees_salary.monthly_salary 
from 
employees_salary left join employees 
on employees_salary.employee_id = employees.id
where employees.employee_name is null and employees_salary.monthly_salary < 2000

/* 5. Найти всех работников кому не начислена ЗП.*/

select employees.employee_name, employees_salary.monthly_salary 
from employees left join employees_salary
on employees_salary.employee_id = employees.id 
where employees_salary is null;

/* 6. Вывести всех работников с названиями их должности.*/

select employees.employee_name, roles.role_name 
from
employees left join roles
on roles.id = employees.id;

/* 7. Вывести имена и должность только Java разработчиков.*/

select employees.employee_name, roles.role_name 
from
employees inner join roles_employees
on roles_employees.employee_id = employees.id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%Java%' and roles.role_name not like '%JavaScript%';

/* 8. Вывести имена и должность только Python разработчиков.*/
select employee_name, role_name
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id 
where roles.role_name like '%Python%';

/* 9. Вывести имена и должность всех QA инженеров.*/
select employee_name, role_name
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%QA%'

/* 10. Вывести имена и должность ручных QA инженеров.*/

select employee_name, role_name
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%Manual QA%'

/* 11. Вывести имена и должность автоматизаторов QA*/

select employee_name, role_name
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%Automation QA%'

/* 12. Вывести имена и зарплаты Junior специалистов*/

select employee_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id
inner join roles_employees
on roles_employees.employee_id = employees_salary.employee_id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%Junior%';

/* 13. Вывести имена и зарплаты Middle специалистов*/
select employee_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Middle%';

/* 14. Вывести имена и зарплаты Senior специалистов*/
select employee_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Senior%';

/* 15. Вывести зарплаты Java разработчиков*/

select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Java%'
and role_name not like '%JavaScript%';

/* 16. Вывести зарплаты Python разработчиков*/
select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Python%';

/* 17. Вывести имена и зарплаты Junior Python разработчиков*/

select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Python%';

/* 18. Вывести имена и зарплаты Middle JS разработчиков*/

select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Middle JavaScript%';

/* 19. Вывести имена и зарплаты Senior Java разработчиков*/

select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Senior Java%'
and role_name not like '%Senior JavaScript%';

/* 20. Вывести зарплаты Junior QA инженеров*/

select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Junior Manual QA%';

/* 21. Вывести среднюю зарплату всех Junior специалистов*/

select avg(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Junior%';

/* 22. Вывести сумму зарплат JS разработчиков*/
select sum(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%JavaScript%';

/* 23. Вывести минимальную ЗП QA инженеров*/
select min(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%QA%';

/* 24. Вывести максимальную ЗП QA инженеров*/
select max(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%QA%';

/* 25. Вывести количество QA инженеров*/
select count(role_name)  
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id 
inner join roles
on roles.id = roles_employees.role_id 
where role_name like '%QA%';

/* 26. Вывести количество Middle специалистов.*/
select count(role_name)  
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id 
inner join roles
on roles.id = roles_employees.role_id 
where role_name like '%Middle%';

/* 27. Вывести количество разработчиков*/

select count(role_name)  
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id 
inner join roles
on roles.id = roles_employees.role_id 
where role_name like '%developer%';

/* 28. Вывести фонд (сумму) зарплаты разработчиков.*/

select sum(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id 
where role_name like '%developer%';

/* 29. Вывести имена, должности и ЗП всех специалистов по возрастанию*/
select employee_name, role_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id
order by monthly_salary;

/* 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов, у которых ЗП от 1700 до 2300*/

select employee_name, role_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id
where monthly_salary between 1700 and 2300;

/* 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов, у которых ЗП меньше 2300*/
select employee_name, role_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id
where monthly_salary < 2300;

/* 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов, у которых ЗП равна 1100, 1500, 2000*/
select employee_name, role_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id
where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
order by monthly_salary;





	

