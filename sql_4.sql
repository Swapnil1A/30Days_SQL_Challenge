select * from customers_2
select * from orders
select * from sales

--Retrieve the average amount for male and female separately
select c.gender,round(avg(o.total_amount),2) as average from customers_2 c
join orders o on c.customer_id=o.customer_id
group by 1

--Retrieve the total_sales revenue generated for each month in the year 2023
select sum(price_per_unit*quantity) as total_sum,extract(year from order_date) as year_1,
extract(month from order_date) as month_1  from sales
where extract(year from order_date)='2023'
group by 2,3

