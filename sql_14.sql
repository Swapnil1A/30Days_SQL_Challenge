select * from job_listings

--Retrieve the count of companies who have posted the same title & description twice a times


select count(*) as total_company_count from(
select company_id,title,description,count(*) as total_count from job_listings
group by 1,2,3
having count(*)>1
) a