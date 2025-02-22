-- Step 1: Identify the top 10 countries with the highest number of unique customers
WITH customers_top10_countries AS (
	SELECT
		country.country, -- Country name
		COUNT(DISTINCT customer.customer_id) AS number_of_customers -- Unique customer count per country
	FROM customer
	
	LEFT JOIN address ON customer.address_id = address.address_id
	LEFT JOIN city ON address.city_id = city.city_id
	LEFT JOIN country ON city.country_id = country.country_id
		
	GROUP BY country.country
	ORDER BY number_of_customers DESC
	LIMIT 10 -- Only retain the top 10 countries
)

-- Step 2: Identify the top 10 cities within those top 10 countries
SELECT
	city.city, -- City name
	COUNT(DISTINCT customer.customer_id) AS number_of_customers -- Unique customer count per city
FROM customer

LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN country ON city.country_id = country.country_id

WHERE country.country IN (
    SELECT country 
    FROM customers_top10_countries -- Filter only top 10 countries
)
	
GROUP BY city.city
ORDER BY number_of_customers DESC
LIMIT 10 -- Only retain the top 10 cities