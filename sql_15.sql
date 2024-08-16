select * from sales

-- Retrieve the region with lowest sales order of the previous month..
select region,extract(month from saledate) as month_1,sum(amount) as total_sales from sales
group by 1,2
order by total_sales asc




--returns the todays date
select current_date

--1.returns the previous month with respective to current date
select extract(month from current_date-INTERVAL'1 month')

--In order to return th previous month the where condition is as given as follows :
where extract(month from saledate)=extract(month from current_date-INTERVAL'1 month')
