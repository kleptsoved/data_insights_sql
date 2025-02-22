-- Customer Table Statistics Summary
SELECT 
    -- Mode (most frequent value) for categorical columns
    MODE() WITHIN GROUP (ORDER BY first_name) as mode_first_name,	-- Most common first name
    MODE() WITHIN GROUP (ORDER BY last_name) as mode_last_name,		-- Most common last name
	MODE() WITHIN GROUP (ORDER BY email) as mode_email,				-- Most common email (if applicable)
    
    -- Percentage of active customers
    SUM(CASE WHEN activebool THEN 1 ELSE 0 END)::FLOAT / COUNT(*) * 100 as active_percentage,
    
    --- Customer registration timeline
    MIN(create_date) as earliest_customer,	-- Date of the first registered customer
    MAX(create_date) as latest_customer,	-- Date of the most recently registered customer
	MIN(last_update) as first_update,		-- Earliest recorded update to customer records
    MAX(last_update) as latest_updated,		-- Most recent customer update
    
    -- General customer statistics
    COUNT(*) as total_customers,					-- Total number of customers
    COUNT(DISTINCT store_id) as unique_stores,		-- Number of unique stores customers belong to
    COUNT(DISTINCT address_id) as unique_addresses	-- Number of unique addresses customers have
FROM customer;