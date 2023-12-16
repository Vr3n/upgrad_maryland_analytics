use sakila;

-- Customer Database
	-- The team wants to increase subscriptions by reaching out to all the customers in the Sakila database. To do this, you need to gather the following details for the customers:
		-- first_name
        -- last_name
        -- email
        -- address
        -- district
	-- The team wants you to include customers even if their address details might be missing. Which of these queries will help you create a table containing these details?alter
    
SELECT c.first_name, c.last_name, c.email, adr.address, adr.district
FROM customer c
	LEFT OUTER JOIN address adr ON adr.address_id = c.address_id;