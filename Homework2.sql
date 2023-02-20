-- 1. Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000
use hr;
SELECT department_name 
FROM employees e
INNER JOIN departments d
ON d.manager_id = e.manager_id
WHERE e.salary > 10000;

-- 2 Вывести имя, фамилию, название департамента и название должности сотрудника

SELECT  e.first_name,
		e.last_name,
        d.department_name,
        j.job_title
	FROM employees e
INNER JOIN departments d
ON d.department_id = e.department_id
INNER JOIN jobs j
ON j.job_id = e.job_id;

-- 3 Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco
SELECT  e.first_name,
		e.last_name,
        e.salary
	FROM employees e
INNER JOIN departments d 
ON d.department_id = e.department_id
INNER JOIN locations l
ON l.location_id = d.location_id
WHERE city in ('Oxford', 'San Francisco');

-- 4 Вывести имя, фамилию и город сотрудника
SELECT  e.first_name,
		e.last_name,
        l.city
	FROM employees e
INNER JOIN departments d
ON d.department_id = e.department_id
INNER JOIN locations l 
ON l.location_id = d.location_id;

-- 5 Вывести города и соответствующие городам страны
SELECT l.city,
	   c.country_name
	FROM locations l
INNER JOIN countries c
ON c.country_id = l.country_id;

