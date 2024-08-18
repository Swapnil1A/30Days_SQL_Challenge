select * from restaurant_orders

--Retrieve the city_name with highest orders in the month of sept.
select city,count(order_id) as total_orders_received from restaurant_orders
where city in ('Delhi','Bangalore','Mumbai','Hyderabad') and extract(month from order_date)='09'
group by 1
order by 2 desc