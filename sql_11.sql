select * from reviews

--AMAZON BUSINESS ANALYST
--retrieve the avf_ratings of each products which is order by month and product_id
select extract(month from submit_date) as month_1,product_id,round(avg(stars),2) as avg_ratings from reviews
group by 1,2
order by 1,2