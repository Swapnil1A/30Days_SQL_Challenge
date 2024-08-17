select * from order_details

--How many delayed orders were delivered by each del_partner..
select count(*) as Total_delayed_orders,del_partner
from order_details
where predicted_time<delivery_time
group by 2;