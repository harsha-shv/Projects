--where and count
select count(*) from movies_genres where genre='Short'

--group by
select count(genre),genre from directors_genres  group by genre

--distinct
select count(distinct (genre)) from movies_genres

--order by
select count(genre) as count_genre,genre 
from movies_genres  group by genre order by count_genre desc

--join
select d.director_id,movie_id,concat(first_name,', ',last_name) as name
from movies_directors md 
join directors d on md.director_id=d.director_id

--having
SELECT year, AVG(rank) AS avg_rank FROM movies GROUP BY year
HAVING AVG(rank) > 8;

--subquery
select director_id,m.movie_id,m.name as movie_name,a.name ,year,rank from movies m join 
(select d.director_id,movie_id,concat(first_name,', ',last_name) as name
from movies_directors md 
join directors d on md.director_id=d.director_id) a on m.movie_id=a.movie_id 
where rank is not null

-- top 10 highest ranked movies
SELECT * FROM movies where rank is not null ORDER BY rank DESC LIMIT 10;

--top 5 geners in a particular year
SELECT genre, COUNT(*) AS movie_count
FROM movies_genres mg join movies m on mg.movie_id=m.movie_id where year ='1998'
GROUP BY mg.genre
ORDER BY movie_count DESC
LIMIT 5;

--  list of movies with a rank greater than the average rank 
SELECT * FROM movies
WHERE rank > (SELECT AVG(rank) FROM movies where rank is not null);

