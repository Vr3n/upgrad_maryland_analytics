use sakila;

-- Comprehension 1
-- Q1. Busiest Actor
-- The team wants to find the actor who starred in the most movies. Find the full name of this actor.
SELECT fa.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS "Actor fullname", COUNT(DISTINCT fa.film_id) AS 'No of Films'
FROM film_actor fa
	INNER JOIN actor a 
    ON a.actor_id = fa.actor_id
GROUP BY fa.actor_id
ORDER BY `No of Films` DESC;

-- Q2. Highest Movie Rental Revenues
-- The team wants to maximize its revenue by adding to its platform the movies that earned the highest rental revenues. Among all the movies in the Sakila database, which movie has the highest rental revenue?
-- Note: You can calculate the total rental revenue by adding the “amount” values for all  movies in the payment table.
-- Hint: You must join multiple tables to perform this operation. You can do that by combining multiple INNER JOIN statements in the query.

-- Movie with high rental revenue.
-- From rental table we can get.
	-- inventory_id -> The inventory number can help identify the films.
    -- rental_id -> payment table has rental_id as foreign key so we can join and get the amount.

SELECT f.title, SUM(pay.amount) AS 'Total Revenue'
FROM rental r
	INNER JOIN inventory inv ON inv.inventory_id = r.inventory_id
    INNER JOIN film f ON inv.film_id = f.film_id
    INNER JOIN payment pay ON pay.rental_id = r.rental_id
GROUP BY f.title
ORDER BY `Total Revenue` DESC;

-- -------------------------------------------------------------------------
-- Comprehension 2
-- Q1. Customers and Staff in the United States
-- The team wants to survey everyone associated with the DVD rental store (customers and staff) to understand their experience. Which of these queries will help the team get the names of these people and their email IDs?

-- staff and customer emails
	-- email column from staff table.
    -- email column from customer table.
    
SELECT email
FROM staff
UNION
SELECT email
FROM customer;


-- Q2. Action movies
-- Find the total number of action movies available in the Sakila database.
SELECT COUNT(fc.film_id) AS "TOTAL ACTION FILMS"
FROM film_category fc
GROUP BY fc.category_id
HAVING fc.category_id = 1;


-- -------------------------------------------------------------------------