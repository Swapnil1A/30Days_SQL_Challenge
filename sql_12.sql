select * from purchases
select * from employee_service

--Retrieve the users who have spent more then 10000 in the last month..
select user_id,product_id,extract(month from date_of_purchase) as month_1,sum(amount_spent) as total_spent
from purchases
where extract(month from date_of_purchase)='02'
group by 1,2,3
having sum(amount_spent)>'10000'

--Retrieve the avg_duration of work in each department by the users
select
round(avg(case
when end_date is null then abs(extract(month from current_date)-extract(month from start_date))
else abs(extract(month from start_date)-extract(month from end_date)) end),1) as Service_duration_months,
department from employee_service
group by 2