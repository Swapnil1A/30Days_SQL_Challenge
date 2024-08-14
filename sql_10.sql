select * from Transactions_2

--Retrieve the each month,country,total_mt,total_trans,and count of approval data
select to_char(trans_date,'YYYY-MM') as month_1,country,sum(amount) as total_amount,
count(trans_date) as total_trans,
sum(case when state='approved' then 1 else 0 end) as approved_count  
from transactions_2
group by month_1,2
order by 3 desc