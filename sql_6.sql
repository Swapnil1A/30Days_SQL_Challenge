select * from viewership

--Retrieve the viewer count for laptop and mobile user. Consider tablet & phone in the mobile category.
select 
sum (case when device_type='laptop' then viewership_count end) as laptop_views,
sum(case when device_type in('tablet','phone') then viewership_count end) as mobile_views
from viewership