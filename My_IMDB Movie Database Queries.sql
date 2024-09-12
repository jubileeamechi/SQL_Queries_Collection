-- Amechi Jubilee Ebelechukwu
-- MySQL Practice:
-- To select the database I want to work with 
Use imdb;

-- To Generate a view that showcases the top_performing movies based on their median ratings(8 or above)
--  including their total votes and median ratings.
create view Top_Ratings as select movie_id, total_votes, median_rating from ratings where median_rating >= 8;  

-- To find the average rating of movies released in the last 5 years
select title, date_published, avg_rating from movie join ratings on movie.id = ratings.movie_id  
where date_published >= '2019-01-01';

-- To find which genre has the highest rating--
select genre, median_rating from genre join ratings on genre.movie_id = ratings.movie_id
 order by median_rating desc limit 1;

--  To find the most common genre in the dataset
select genre, count(*) as genre_count from genre group by genre order by genre_count desc limit 1; 

