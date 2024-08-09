--retieve the Product_name with the highest price in each country
select * from products
select * from suppliers

with cte as(
select p.product_name,s.country,p.price,
row_number() over(partition by s.country order by p.price desc) as rn from products p
join suppliers s on p.supplier_id=s.supplier_id
group by 1,2,3
)
select * from cte
where rn<=1
