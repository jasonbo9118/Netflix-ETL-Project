select * from movies;
select * from ratings;

CREATE TEMP TABLE watch_info AS
SELECT
  w.history_id,
  u.user_id,
  u.plan_type,
  m.movie_id,
  m.title,
  m.genre,
  m.release_year,
  w.watched_at
FROM WatchHistory w
JOIN Users u ON w.user_id = u.user_id
JOIN Movies m ON w.movie_id = m.movie_id;

select *
from watch_info;

CREATE TEMP TABLE movie_view_summary AS
SELECT
  wi.movie_id,
  m.title,
  COUNT(*) AS total_views,
  COUNT(DISTINCT wi.user_id) AS unique_viewers,
  ROUND(AVG(EXTRACT(HOUR FROM wi.watched_at)), 2) AS avg_watch_hour
FROM watch_info wi
JOIN movies m ON wi.movie_id = m.movie_id
GROUP BY wi.movie_id, m.title;

select *
from movie_view_summary;

CREATE TEMP TABLE genre_summary AS
SELECT
  genre,
  COUNT(DISTINCT movie_id) AS total_movies,
  COUNT(*) AS total_views,
  AVG(release_year) AS avg_release_year
FROM watch_info
GROUP BY genre;

select *
from genre_summary;

CREATE TEMP TABLE rating_summary AS
SELECT
  r.movie_id,
  m.title,
  COUNT(*) AS total_ratings,
  AVG(r.rating) AS avg_rating,
  COUNT(CASE WHEN rating = 5 THEN 1 END) AS five_star_ratings
FROM Ratings r
JOIN Movies m ON r.movie_id = m.movie_id
GROUP BY r.movie_id, m.title;

select *
from rating_summary;

----create table for the tableau lag
CREATE TABLE movie_analysis AS
SELECT
  m.movie_id,
  m.title,
  m.genre,
  m.release_year,

  -- Ratings
  COALESCE(r.total_ratings, 0) AS total_ratings,
  COALESCE(r.avg_rating, 0.0) AS avg_rating,
  COALESCE(r.five_star_ratings, 0) AS five_star_ratings,

  -- Views
  COALESCE(v.total_views, 0) AS total_views,
  COALESCE(v.unique_viewers, 0) AS unique_viewers,
  COALESCE(v.avg_watch_hour, 0.0) AS avg_watch_hour,

  -- Genre Stats
  COALESCE(g.total_movies, 0) AS genre_movie_count,
  COALESCE(g.total_views, 0) AS genre_total_views,
  COALESCE(g.avg_release_year, 0) AS genre_avg_release_year

FROM Movies m
LEFT JOIN rating_summary r ON m.movie_id = r.movie_id
LEFT JOIN movie_view_summary v ON m.movie_id = v.movie_id
LEFT JOIN genre_summary g ON m.genre = g.genre;

select *
from movie_analysis

