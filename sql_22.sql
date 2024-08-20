

select * from employees

--TCS DA
--retrieve the emp_id, emp_name, and manager_name from the given employee table. It's important to note that managers are also employees in the table.

--approach 1
SELECT 
	e1.emp_id,
	e1.emp_name,
	e1.manager_id,
	e2.emp_name as manager_name
FROM employees as e1
CROSS JOIN
employees as e2
WHERE e1.manager_id = e2.emp_id


-- approach 2
SELECT
	e1.emp_id,
	e1.emp_name,
	e1.manager_id,
	e2.emp_name as manager_name
FROM employees as e1
LEFT JOIN
employees as e2
ON e1.manager_id = e2.emp_id
WHERE e1.manager_id IS NOT NULL


