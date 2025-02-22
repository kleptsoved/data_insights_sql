	SELECT
	d.country,
	COUNT(DISTINCT a.customer_id) AS number_of_customers
	FROM
	customer a
	LEFT JOIN address b ON a.address_id = b.address_id
	LEFT JOIN city c ON b.city_id = c.city_id
	LEFT JOIN country d ON c.country_id = d.country_id
	GROUP BY
	d.country
	ORDER BY
	number_of_customers DESC
	LIMIT 10