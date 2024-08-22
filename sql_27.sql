
select * from orders_3

--Flipkart Data Analyst Questions..
--Retrieve the user_id who bought only both Burger and Cold Drink

select user_id,count(distinct item_ordered)
from orders_3
group by 1
having count(distinct item_ordered)=2 --here want only 2 products..
and
sum(case when item_ordered in ('Burger','Cold Drink')
then 1
else 0
end)=2 --It is make=2 as we want both products..
