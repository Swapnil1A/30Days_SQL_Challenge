select * from tweets

--Retrieve the no. of user and count of tweets in the year 2022
select user_id,count(user_id) as num_user,count(tweet_id) as num_post from tweets
where extract(year from tweet_date)='2022'
group by 1