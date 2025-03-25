-- Total Number of Movies and TV Shows
SELECT type, COUNT(*) AS total_count  
FROM netflix_titles  
GROUP BY type;

-- Top 5 Countries Producing the Most Content
SELECT country, COUNT(*) AS content_count  
FROM netflix_titles  
WHERE country IS NOT NULL  
GROUP BY country  
ORDER BY content_count DESC  
LIMIT 5;

-- Trend of Content Additions Over the Years
SELECT YEAR(date_added) AS year, COUNT(*) AS total_added  
FROM netflix_titles  
WHERE date_added IS NOT NULL  
GROUP BY YEAR(date_added)  
ORDER BY year ASC;

-- Most Common Ratings on Netflix
SELECT rating, COUNT(*) AS rating_count  
FROM netflix_titles  
WHERE rating IS NOT NULL  
GROUP BY rating  
ORDER BY rating_count DESC;

-- Top 5 Most Popular Genres
SELECT listed_in AS genre, COUNT(*) AS total_count  
FROM netflix_titles  
GROUP BY listed_in  
ORDER BY total_count DESC  
LIMIT 5;

-- Average Duration of Movies on Netflix
SELECT AVG(duration) AS avg_movie_duration  
FROM netflix_titles  
WHERE type = 'Movie';

-- Directors with the Most Content on Netflix
SELECT director, COUNT(*) AS total_content  
FROM netflix_titles  
WHERE director != 'Unknown'  
GROUP BY director  
ORDER BY total_content DESC  
LIMIT 5;

-- TV Shows with More Than 5 Seasons
SELECT title, duration  
FROM netflix_titles  
WHERE type = 'TV Show' AND duration > 5;

-- Year with the Highest Number of Content Additions
SELECT YEAR(date_added) AS year, COUNT(*) AS total_count  
FROM netflix_titles  
WHERE date_added IS NOT NULL  
GROUP BY YEAR(date_added)  
ORDER BY total_count DESC  
LIMIT 1;

-- Movies Added in the Last 5 Years
SELECT title, date_added  
FROM netflix_titles  
WHERE type = 'Movie' AND date_added >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
