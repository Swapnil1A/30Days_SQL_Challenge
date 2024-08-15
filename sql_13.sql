select  * from fb_posts

--Retrieve the top 3 highest post i.e Highest Engagement
with cte as(
select post_id,user_id,sum(likes+comments) as total_engagement,
row_number() over(partition by user_id order by sum(likes+comments) desc) as rn,
dense_rank() over(partition by user_id order by sum(likes+comments)desc) as ranks
from fb_posts
group by 1,2
	)
select post_id,user_id,total_engagement,ranks from cte
where rn<=3

--Retrieve the users who has posted more then 2 times in the past week
select user_id,count(post_id) as count_posts,
sum(likes) as count_likes from fb_posts 
where post_date >= current_date-7 and post_date < current_date
group by 1
having count(post_id)>2