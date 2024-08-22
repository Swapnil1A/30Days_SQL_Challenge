select * from orders_2
select * from returns


--Amazon DA
--Retrieve the top 5 ustomer with the highest percentage of returned items out of their total orders.
WITH orders_cte
AS
(
SELECT
	customer_id,
	SUM(total_items_ordered) as total_items_ordered
FROM orders_2
GROUP BY customer_id
),
return_cte
As
(
SELECT
	o.customer_id,
	SUM(r.returned_items) as total_items_returned
FROM returns as r
JOIN
orders_2 as o
ON r.order_id = o.order_id
GROUP BY 
o.customer_id
)

SELECT
	oc.customer_id,
	oc.total_items_ordered,
	rc.total_items_returned,
	ROUND(CASE
		WHEN oc.total_items_ordered > 0 THEN (rc.total_items_returned::float/oc.total_items_ordered::float)*100
	ELSE 0 END::numeric ,2) as return_percentage
	
FROM orders_cte as oc
JOIN
return_cte rc
ON oc.customer_id = rc.customer_id
ORDER BY return_percentage DESC 
LIMIT 5;