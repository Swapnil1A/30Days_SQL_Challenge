select * from product_spend

--Retrieve the top two highest grossing product within each category in the year 2022
with cte as(
select category,product,extract(year from transaction_date) as year_1,
sum(spend) as total_spend,
row_number() over(partition by category order by sum(spend) desc) as rn 
from product_spend
where extract(year from transaction_date)='2022'
group by 1,2,3
)
select * from cte
where rn<=2