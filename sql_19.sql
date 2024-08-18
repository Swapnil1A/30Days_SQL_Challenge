select * from student_names


--Retrieve the student which are unique
select name,count(name) as count_student
from student_names
group by 1
having count(name)=1