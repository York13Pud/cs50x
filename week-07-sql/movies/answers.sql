-- 1.
SELECT 
    title 
FROM
    movies
WHERE 
    year = 2008;

-- 2. 
SELECT 
    birth
FROM
    people
WHERE 
    name ="Emma Stone";

-- 3.
SELECT 
    title
FROM
    movies
WHERE 
    year >= 2018
ORDER BY
    title ASC;

-- 4. 
SELECT
    COUNT(*) AS count
FROM
    ratings
WHERE
    rating = 10.0;

-- 5.
SELECT 
    title, year
FROM
    movies
WHERE 
    title LIKE "Harry Potter%"
ORDER BY 
    year ASC;

-- 6.
SELECT
    AVG(ratings.rating) AS average
FROM
    ratings
INNER JOIN
    movies ON ratings.movie_id = movies.id
WHERE
    movies.year = 2012;

-- 7. 
SELECT
    movies.title, ratings.rating
FROM
    ratings
INNER JOIN
    movies ON ratings.movie_id = movies.id
WHERE
    movies.year = 2010
ORDER BY
    ratings.rating DESC, movies.title;

-- 8.
SELECT
    people.name
FROM
    people
INNER JOIN
    movies ON stars.movie_id = movies.id
INNER JOIN
    stars ON stars.person_id = people.id
WHERE
    movies.title = "Toy Story";

-- 9.
SELECT
    DISTINCT people.name
FROM
    people
INNER JOIN
    movies ON stars.movie_id = movies.id
INNER JOIN
    stars ON stars.person_id = people.id
WHERE
    movies.year = 2004
ORDER BY 
    people.birth, people.name;

-- 10. list the names of all people who have directed a 
-- movie that received a rating of at least 9.0. 
SELECT 
    people.name 
FROM 
    people
INNER JOIN 
    directors ON people.id = directors.person_id
INNER JOIN 
    movies ON directors.movie_id = movies.id
INNER JOIN 
    ratings on movies.id = ratings.movie_id
WHERE
    ratings.rating >= 9
ORDER BY 
    people.name ASC;

-- 11. list the titles of the five highest rated movies (in order) that 
-- Chadwick Boseman starred in, starting with the highest rated. 
SELECT
    movies.title
FROM
    people
INNER JOIN
    movies ON stars.movie_id = movies.id
INNER JOIN
    ratings ON movies.id = ratings.movie_id
INNER JOIN
    stars ON people.id = stars.person_id
WHERE
    people.name = "Chadwick Boseman"
ORDER BY
    ratings.rating DESC
LIMIT 5;

-- 12. list the titles of all movies in which both 
-- Bradley Cooper and Jennifer Lawrence starred.
SELECT
    movies.title
FROM
    people
INNER JOIN
    movies ON stars.movie_id = movies.id
INNER JOIN
    stars ON people.id = stars.person_id
WHERE
    people.name = "Bradley Cooper" AND 
    movies.title IN(SELECT
                        movies.title
                    FROM
                        people
                    INNER JOIN
                        movies ON stars.movie_id = movies.id
                    INNER JOIN
                        stars ON people.id = stars.person_id
                    WHERE
                        people.name = "Jennifer Lawrence");

-- 13. list the names of all people who starred in a 
-- movie in which Kevin Bacon also starred. 
SELECT
    DISTINCT people.name
FROM
    people
INNER JOIN
    movies ON stars.movie_id = movies.id
INNER JOIN
    stars ON people.id = stars.person_id
WHERE
    movies.title IN(SELECT 
                        distinct(movies.title) 
                    FROM 
                        people
                    INNER JOIN 
                        stars ON people.id = stars.person_id
                    INNER JOIN 
                        movies ON stars.movie_id = movies.id
                    WHERE 
                        people.name = "Kevin Bacon" AND people.birth = 1958) 
                AND 
                    people.name != "Kevin Bacon";
