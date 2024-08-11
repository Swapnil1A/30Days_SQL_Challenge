--retrieve the data of 3rd transaction of every user
select * from transactions
with cte as(
select user_id,spend,transaction_date,row_number() over(order by spend) as rn from transactions
group by 1,2,3
)select * from cte
where rn=3

--retrieve the top 5 products whose revenue has decreased as per the pyq revenue(both 2022 and 2023) and
--cal decreased and %decreased revenue
select * from product_revenue
	
with cte as (
select p.product_name,p.year,sum(p.revenue) as total_revenue,
lead(sum(p.revenue)) over(partition by product_name) as next_year_2023
from product_revenue p
group by 1,2
order by 2,3
)
select *,(total_revenue-next_year_2023) as diff_decreased,
round(((total_revenue-next_year_2023)/total_revenue)*100,2) as per_decreased from cte
where next_year_2023<total_revenue
limit 5


