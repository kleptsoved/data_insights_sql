-- ================================================
-- SECTION: FILM STATISTICS ANALYSIS
-- This query calculates various statistics related
-- to rental duration, price, length, and replacements
-- ================================================
SELECT 
     -- Rental duration statistics (in days)
    MIN(rental_duration) as min_rental_duration,	-- Shortest rental period
    MAX(rental_duration) as max_rental_duration,	-- Longest rental period
    AVG(rental_duration) as avg_rental_duration,	-- Average rental duration
    
     -- Rental rate statistics
    MIN(rental_rate) as min_rental_rate,	-- Lowest rental price
    MAX(rental_rate) as max_rental_rate,	-- Highest rental price
    AVG(rental_rate) as avg_rental_rate,	-- Average rental price
    
    -- Film length statistics (in minutes)
    MIN(length) as min_length,				-- Shortest film
    MAX(length) as max_length,				-- Longest film
    AVG(length) as avg_length,				-- Average film LENGTH
    
    -- Replacement cost statistics
    MIN(replacement_cost) as min_replacement_cost,	-- Cheapest replacement cost
    MAX(replacement_cost) as max_replacement_cost,	-- Most expensive replacement cost
    AVG(replacement_cost) as avg_replacement_cost,	-- Average replacement cost
    
	-- Release year statistics
    MIN(release_year) as min_release_year,	-- Oldest film release year
    MAX(release_year) as max_release_year,	-- Most recent film release year
    AVG(release_year) as avg_release_year,	-- Average film release YEAR
    
	-- Last update timestamps
    MIN(last_update) as min_last_update,	-- Earliest update in the database
    MAX(last_update) as max_last_update,	-- Most recent update in the database
    
	-- Mode (most common value) for categorical column
    MODE() WITHIN GROUP (ORDER BY title) as mode_title,							-- Most frequently occurring film title
    MODE() WITHIN GROUP (ORDER BY description) as mode_description,				-- Most common film description
	MODE() WITHIN GROUP (ORDER BY rating) as mode_rating,						-- Most common movie rating (e.g., PG, R)
	MODE() WITHIN GROUP (ORDER BY special_features) as mode_special_features,	-- Most frequent special feature
	MODE() WITHIN GROUP (ORDER BY fulltext) as mode_fulltext					-- Most frequent fulltext search entry
FROM film;