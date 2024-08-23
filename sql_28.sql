
select * from orders_4
select * from returns_4

--Amazon DS Interview Questions

with orders_cte as(
    select seller_id,sum(sale_amount) as total_sales 
    from orders_4
    group by 1
),
return_cte as(
    select seller_id,sum(return_quantity) as total_return_qty
    from returns_4
    group by seller_id
)
select orders_cte.seller_id as seller_id,
orders_cte.total_sales as total_sale_amt,
COALESCE(return_cte.total_return_qty,0) as total_return_qty
from orders_cte
left join
return_cte
on orders_cte.seller_id=return_cte.seller_id
order by total_sale_amt desc,total_return_qty asc
limit 3
