-- 1. Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary
use hr;

SELECT department_id, max(salary)
FROM employees 
GROUP BY department_id;

-- 2 Найти сотрудников, у которых наибольшая зарплата в их департаменте

SELECT employees.department_id,
		first_name,
		last_name,
        salary
FROM employees
INNER JOIN (
		SELECT department_id, 
				max(salary) as max_salary
		FROM employees 
		GROUP BY department_id) salarys
ON employees.department_id = salarys.department_id and employees.salary = salarys.max_salary;

-- 3 Найти департамент с наибольшим кол-вом сотрудников 
SELECT department_id, 
		count(employee_id) as empl_qty
FROM employees 
GROUP BY department_id
ORDER BY empl_qty DESC
LIMIT 1;

-- 4 Найти департаменты, в которых больше 10 сотрудников
SELECT department_id, 
		count(employee_id) as empl_qty
FROM employees
GROUP BY department_id
HAVING empl_qty > 10;
        
-- 5 Выведите название отделов с кол-вом сотрудников больше среднего

-- --
SELECT department_name
FROM departments
INNER JOIN 
	(SELECT department_id
	FROM employees
	GROUP BY department_id
	HAVING count(employee_id) > (SELECT 
			avg(e.empl_qty) as average_empl
	FROM employees 
				JOIN (SELECT department_id, 
							count(employee_id) as empl_qty
			FROM employees
			GROUP BY department_id) e)) c
ON departments.department_id = c.department_id;


-- Checking how many departments where is less than or equal to employees
SELECT department_id, 
		count(employee_id) as empl_qty
FROM employees
GROUP BY department_id
HAVING empl_qty <= 10;

-- Average number of employees
SELECT 
		avg(e.empl_qty) as average_empl
FROM departments 
INNER JOIN (SELECT department_id,
				count(employee_id) as empl_qty 
                FROM employees
                GROUP BY department_id) e;




