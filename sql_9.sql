select * from Department
select *from Employee

--Retrieve the top 3 salaries of each department
with cte as(
select e.name,d.name as Dept_name,e.salary,row_number() over(partition by e.departmentid order by salary desc) as rn 
from Employee e
join Department d on e.departmentid=d.id
group by 1,2,3,e.departmentid
	)
select * from cte
where rn<=3