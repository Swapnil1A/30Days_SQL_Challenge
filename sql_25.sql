
select * from orders

--Flipkart BA
--Retrieve the running total revenue for each combination of date and product_ID.
SELECT 
	o1.date,
	o1.product_id,
	o1.product_name,
	o1.revenue,
	SUM(o2.revenue) as running_total
FROM orders as o1
JOIN
orders as o2
ON
	o1.product_id = o2.product_id
	AND
	o1.date >= o2.date
GROUP BY 
	o1.date,
	o1.product_id,
	o1.product_name,
	o1.revenue
ORDER BY 
	o1.product_id, o1.date