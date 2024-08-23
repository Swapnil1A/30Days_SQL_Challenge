
select * from sales

--Walmart DA
--retrieve the product id, year, quantity and price for the first year of every product sold.
SELECT 
	product_id,
	first_year,
	quantity,
	price

FROM (
	SELECT 
		product_id,
		year as first_year,
		quantity,
		price,
		RANK() OVER(PARTITION BY product_id ORDER BY year) as rn
	FROM sales
) subquery
WHERE rn = 1
