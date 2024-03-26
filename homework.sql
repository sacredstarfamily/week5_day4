SELECT *
FROM film f ;

CREATE OR REPLACE PROCEDURE insert_film(
    p_title VARCHAR,
    p_description VARCHAR,
    p_release_year INTEGER,
    p_language_id INTEGER,
    p_rental_duration INTEGER,
    p_rental_rate NUMERIC(4,2),
    p_length INTEGER,
    p_replace_cost NUMERIC(5,2),
    p_rating mpaa_rating
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
    VALUES (p_title, p_description, p_release_year, p_language_id, p_rental_duration, p_rental_rate, p_length, p_replace_cost, p_rating);
END;
$$;

CALL  insert_film('blah', 'bllah', 2010,1,1,1,1,1, 'R');
SELECT *
FROM film
WHERE title = 'blah';
CREATE OR REPLACE FUNCTION get_film_count(p_category_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    film_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO film_count
    FROM film_category
    WHERE category_id = p_category_id;
    
    RETURN film_count;
END;
$$;

CALL insert_film('blah', 'blah', 1, 1, 1, 1, 1, 'blah');