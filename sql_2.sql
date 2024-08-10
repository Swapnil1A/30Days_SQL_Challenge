--retrieve the total_transaction amount for each customer in the current_year
select * from customers
select * from transaction

select c.customer_id,c.customer_name,sum(t.amount) as total,
extract(year from t.transaction_date) as year_1 from customers c
join transaction t on c.customer_id=t.customer_id
where extract(year from t.transaction_date) = extract(year from current_date)
group by 1,2,4
order by 2 desc