select * from salaries

--here we have determine the highest salary of the particular department
with cte as(
select emp_name,department,salary,
row_number() over(partition by department order by salary desc) as rn
from salaries)
select * from cte
where rn=1

--Retrieve the difference between highest salary of both the department(Engineering and Marketing)
select 
abs(max(case when department='Marketing' then salary end)-
max(case when department='Engineering' then salary end)) as salary_diff
from salaries
