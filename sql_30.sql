
select * from Listens
select * from Songs

--Spotify Data Analyst Interview Questions
--find the top 10 most popular songs by total number of listens.You have two tables: Songs (containing song_id, song_name and artist_name) and Listens (containing listen_id, user_id, song_id, and listen_date).

SELECT
    song_name,
    times_of_listens,
    DENSE_RANK() OVER (ORDER BY times_of_listens DESC) AS rank
FROM
    (SELECT
        s.song_name,
        COUNT(l.listen_id) AS times_of_listens
    FROM
        Songs s
    JOIN
        Listens l ON s.song_id = l.song_id
    GROUP BY
        s.song_name) AS sub
ORDER BY
    times_of_listens DESC
LIMIT 10;