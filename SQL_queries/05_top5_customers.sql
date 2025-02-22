-- Step 1: Identify the top 10 countries by customer count
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
	LIMIT 10
),

-- Step 2: Identify the top 10 cities within those top 10 countries
customers_top10_cities AS (
	SELECT
		city.city, -- City name
		COUNT(DISTINCT customer.customer_id) AS number_of_customers -- Unique customer count per city
    FROM customer
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
	LIMIT 10
)

-- Step 3: Find the top 5 customers by total payments from the top 10 cities
SELECT
	customer.customer_id, -- Customer ID
	SUM(payment.amount) AS total_sum -- Total amount spent by each customer
FROM customer

	INNER JOIN payment ON payment.customer_id = customer.customer_id
	INNER JOIN address ON address.address_id = customer.address_id
	INNER JOIN city ON city.city_id = address.city_id
	
WHERE city.city IN (
	    SELECT city 
	    FROM customers_top10_cities -- Filter only top 10 cities
)

GROUP BY customer.customer_id
ORDER BY total_sum DESC
LIMIT 5