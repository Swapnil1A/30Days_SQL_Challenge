select * from zomato_orders

--retrieve the city_name with the order_count > 3 in the month of november
select city,count(order_id) as count_customers from zomato_orders
where extract(month from order_date)='11'
group by 1
having count(order_id)>3
