select * from employee

--Retrieve the salary greater than the avg_salary..
select emp_id,salary from employee
where salary>(select round(avg(salary),2) from employee )
group by 1,2
