/*1. Âûâåñòè âñåõ ðàáîòíèêîâ ÷üè çàðïëàòû åñòü â áàçå, âìåñòå ñ çàðïëàòàìè.*/

select employees.employee_name, employees_salary.monthly_salary  
from
employees inner join employees_salary
on employees_salary.employee_id = employees.id;

/* 2. Âûâåñòè âñåõ ðàáîòíèêîâ, ó êîòîðûõ ÇÏ ìåíüøå 2000.*/

select employees.employee_name, employees_salary.monthly_salary 
from
employees inner join employees_salary
on employees_salary.employee_id = employees.id;
where monthly_salary < 2000;
   
/* 3. Âûâåñòè âñå çàðïëàòíûå ïîçèöèè, íî ðàáîòíèê ïî íèì íå íàçíà÷åí. (ÇÏ åñòü, íî íå ïîíÿòíî êòî å¸ ïîëó÷àåò.)*/
select employees_salary.monthly_salary 
from 
employees_salary left join employees 
on employees_salary.employee_id = employees.id
where employees.employee_name is null

/* 4. Âûâåñòè âñå çàðïëàòíûå ïîçèöèè ìåíüøå 2000, íî ðàáîòíèê ïî íèì íå íàçíà÷åí. (ÇÏ åñòü, íî íå ïîíÿòíî êòî å¸ ïîëó÷àåò.)*/
select employees_salary.monthly_salary 
from 
employees_salary left join employees 
on employees_salary.employee_id = employees.id
where employees.employee_name is null and employees_salary.monthly_salary < 2000

/* 5. Íàéòè âñåõ ðàáîòíèêîâ êîìó íå íà÷èñëåíà ÇÏ.*/

select employees.employee_name, employees_salary.monthly_salary 
from employees left join employees_salary
on employees_salary.employee_id = employees.id 
where employees_salary is null;

/* 6. Âûâåñòè âñåõ ðàáîòíèêîâ ñ íàçâàíèÿìè èõ äîëæíîñòè.*/

select employees.employee_name, roles.role_name 
from
employees left join roles
on roles.id = employees.id;

/* 7. Âûâåñòè èìåíà è äîëæíîñòü òîëüêî Java ðàçðàáîò÷èêîâ.*/

select employees.employee_name, roles.role_name 
from
employees inner join roles_employees
on roles_employees.employee_id = employees.id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%Java%' and roles.role_name not like '%JavaScript%';

/* 8. Âûâåñòè èìåíà è äîëæíîñòü òîëüêî Python ðàçðàáîò÷èêîâ.*/
select employee_name, role_name
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id 
where roles.role_name like '%Python%';

/* 9. Âûâåñòè èìåíà è äîëæíîñòü âñåõ QA èíæåíåðîâ.*/
select employee_name, role_name
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%QA%'

/* 10. Âûâåñòè èìåíà è äîëæíîñòü ðó÷íûõ QA èíæåíåðîâ.*/

select employee_name, role_name
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%Manual QA%'

/* 11. Âûâåñòè èìåíà è äîëæíîñòü àâòîìàòèçàòîðîâ QA*/

select employee_name, role_name
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%Automation QA%'

/* 12. Âûâåñòè èìåíà è çàðïëàòû Junior ñïåöèàëèñòîâ*/

select employee_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id
inner join roles_employees
on roles_employees.employee_id = employees_salary.employee_id
inner join roles
on roles_employees.role_id = roles.id
where roles.role_name like '%Junior%';

/* 13. Âûâåñòè èìåíà è çàðïëàòû Middle ñïåöèàëèñòîâ*/
select employee_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Middle%';

/* 14. Âûâåñòè èìåíà è çàðïëàòû Senior ñïåöèàëèñòîâ*/
select employee_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Senior%';

/* 15. Âûâåñòè çàðïëàòû Java ðàçðàáîò÷èêîâ*/

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

/* 16. Âûâåñòè çàðïëàòû Python ðàçðàáîò÷èêîâ*/
select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Python%';

/* 17. Âûâåñòè èìåíà è çàðïëàòû Junior Python ðàçðàáîò÷èêîâ*/

select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Python%';

/* 18. Âûâåñòè èìåíà è çàðïëàòû Middle JS ðàçðàáîò÷èêîâ*/

select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Middle JavaScript%';

/* 19. Âûâåñòè èìåíà è çàðïëàòû Senior Java ðàçðàáîò÷èêîâ*/

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

/* 20. Âûâåñòè çàðïëàòû Junior QA èíæåíåðîâ*/

select monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Junior Manual QA%';

/* 21. Âûâåñòè ñðåäíþþ çàðïëàòó âñåõ Junior ñïåöèàëèñòîâ*/

select avg(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%Junior%';

/* 22. Âûâåñòè ñóììó çàðïëàò JS ðàçðàáîò÷èêîâ*/
select sum(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%JavaScript%';

/* 23. Âûâåñòè ìèíèìàëüíóþ ÇÏ QA èíæåíåðîâ*/
select min(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%QA%';

/* 24. Âûâåñòè ìàêñèìàëüíóþ ÇÏ QA èíæåíåðîâ*/
select max(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id 
inner join roles
on roles_employees.role_id = roles.id
where role_name like '%QA%';

/* 25. Âûâåñòè êîëè÷åñòâî QA èíæåíåðîâ*/
select count(role_name)  
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id 
inner join roles
on roles.id = roles_employees.role_id 
where role_name like '%QA%';

/* 26. Âûâåñòè êîëè÷åñòâî Middle ñïåöèàëèñòîâ.*/
select count(role_name)  
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id 
inner join roles
on roles.id = roles_employees.role_id 
where role_name like '%Middle%';

/* 27. Âûâåñòè êîëè÷åñòâî ðàçðàáîò÷èêîâ*/

select count(role_name)  
from
employees inner join roles_employees
on employees.id = roles_employees.employee_id 
inner join roles
on roles.id = roles_employees.role_id 
where role_name like '%developer%';

/* 28. Âûâåñòè ôîíä (ñóììó) çàðïëàòû ðàçðàáîò÷èêîâ.*/

select sum(monthly_salary) 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id 
where role_name like '%developer%';

/* 29. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ*/
select employee_name, role_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id
order by monthly_salary;

/* 30. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ, ó êîòîðûõ ÇÏ îò 1700 äî 2300*/

select employee_name, role_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id
where monthly_salary between 1700 and 2300;

/* 31. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ, ó êîòîðûõ ÇÏ ìåíüøå 2300*/
select employee_name, role_name, monthly_salary 
from
employees inner join employees_salary
on employees.id = employees_salary.employee_id 
inner join roles_employees
on employees_salary.employee_id = roles_employees.employee_id
inner join roles
on roles.id = roles_employees.role_id
where monthly_salary < 2300;

/* 32. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ, ó êîòîðûõ ÇÏ ðàâíà 1100, 1500, 2000*/
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





	

