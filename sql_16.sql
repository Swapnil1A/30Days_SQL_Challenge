select * from tiktok
--IMP : For calculating the median the series must be in the asc. order..

--Find the median within the series of numbers = it will basically sum the middle 2 records & divide it by 2
--WHEN THE NO. OF. RECORDS IS EVEN = 8
with cte as(
  select views,
  row_number() over(order by views asc) as rn_asc,
  row_number() over(order by views desc)
  as rn_desc
  from tiktok
  where views<1000
)
select  avg(views) as median from cte
where abs(rn_asc-rn_desc)<=1 -- 0 or 1

--WHEN THE NO. OF. RECORDS IS ODD = 7
-- Here the median will be decided by the middle term only
with cte as(
  select views,
  row_number() over(order by views asc) as rn_asc,
  row_number() over(order by views desc)
  as rn_desc
  from tiktok
  where views<900
)
select  avg(views) as median from cte
where abs(rn_asc-rn_desc)<=1 -- 0 or 1
