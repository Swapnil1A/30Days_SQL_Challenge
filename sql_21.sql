select * from hotel_revenue

--Retrieve the top 2 performing month by revenue in each year and each Hotel..
with cte as(
select hotel_id,month_1,year_1,revenue,row_number() over(partition by hotel_id order by revenue desc) as rn from hotel_revenue
group by 1,2,3,4
order by revenue desc
)
select * from cte 
where rn<=2

