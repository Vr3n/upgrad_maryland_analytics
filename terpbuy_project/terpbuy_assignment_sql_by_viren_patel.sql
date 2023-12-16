use terpbuy;
-- ************************************ --
-- 1. How many rows of data are stored for each table in the database? List the name of each table followed by he number of rows it has.
SELECT
    -- Alias to 'Table Name' for better readability.
	table_name AS 'Table Name',
    -- Alias to 'Number of Rows' for better readability.
    table_rows AS 'Number of Rows'
FROM
	-- `information_schema.tables` table,
    --  contains metadata about all the tables in the database.
	information_schema.tables
WHERE
	-- providing the database name to fetch
    -- the table information from the schema.
	information_schema.tables.TABLE_SCHEMA = 'terpbuy';
/* Viren Patel - 22/09/2023 */

    
-- ************************************ --    
-- 2. Which products are considered high-priced products? 
		-- A high-priced product has a price exceeding $100.00. 
        -- List the names and prices of the high-priced products.
SELECT
	p.product_name AS 'Product Name',
    p.product_price AS 'Product Price (in $)'
FROM 
	terpbuy.product AS p
WHERE
	-- Get the prices which are greater than $100.00.
	p.product_price > 100.00
ORDER BY p.product_price DESC;
/* Viren Patel - 22/09/2023 */

-- ************************************ --
-- 3. List all orders placed by customers in the state of Florida. Note: The state abbreviation for Florida is 'FL'. 
-- 	  Include the customers’ first names, last names, city, and segment, along with the order ID and order date.

-- The table name customer is Aliased as 'c' and orders is Aliased as 'o'.
SELECT 
	-- Selecting customers' first and last names, city, and segment.
	c.first_name,
    c.last_name,
    c.city,
    c.segment,
    -- Selecting orders order_id, and order_date.
    o.order_id,
    o.order_date
FROM
	-- setting customer table alias as c
	terpbuy.customer AS c
    -- joining the Orders table and customer table with column `customer_id`.
	INNER JOIN orders AS o ON c.customer_id = o.customer_id
WHERE
	-- Only show output where The state is florida.
	c.state = 'FL';
/* Viren Patel - 22/09/2023 */


-- ************************************ --
-- 4. List all products that fall in one of the following categories:
-- 	  1. 'Computers', 
--    2. 'Toys', 
--    3. 'Tennis  & Racquet'. 
--    - Include the products’ names, category, department, and price.

SELECT
	p.product_name, c.category_name,
	d.department_name, p.product_price
FROM
	-- product table alias as p.
	product AS p
    -- Inner join the category and product table on column `category_id`.
    -- category table aliased as c.
    INNER JOIN category AS c ON p.category_id = c.category_id
    -- Inner join the department and product table on column `department_id`.
    INNER JOIN department AS d ON p.department_id = d.department_id
WHERE
	-- get only the categories in the given list.
	c.category_name IN ('Computers', 'Toys', 'Tennis & Racquet');
/* Viren Patel - 22/09/2023 */


-- ************************************ --
-- 5. TerpBuy is considering reducing its product offerings.
--    Which products have not yet been sold? 
--       Include the name, category, and department for each such product.

-- Selecting the columns
SELECT
    p.product_name, c.category_name, d.department_name
FROM
	product AS p
INNER JOIN category AS c ON c.category_id = p.category_id
INNER JOIN department AS d ON d.department_id = p.department_id
WHERE
	p.product_id NOT IN (
		SELECT DISTINCT
			ol.product_id
		FROM
			order_line AS ol
    );
/* Viren Patel - 22/09/2023 */

-- ************************************ --
-- 6. List the names of all cities from where orders are shipped. 
--    Also, for such cities, find the number of orders for which shipping was delayed.
--    Sort the list of cities in order from the highest to the least number of shipping orders.

SELECT 
    o.order_city, COUNT(o.order_id) AS 'Delayed Orders'
FROM
    orders AS o
WHERE
    o.actual_shipping_days > o.scheduled_shipping_days
GROUP BY o.order_city
ORDER BY `Delayed Orders` DESC;
/* Viren Patel - 22/09/2023 */


-- ************************************ --
-- 7. How many customers are there in each segment? 
--    Show the most popular segment at the top of the result.
--    Incorporate a column alias in the result.

SELECT
	c.segment AS 'Customer segment',
    COUNT(c.customer_id) AS 'Total Customers'
FROM
	customer AS c
GROUP BY c.segment
ORDER BY `Total Customers` DESC;
/* Viren Patel - 22/09/2023 */

-- ************************************ --
-- 8. How many orders were placed in the first quarter of 2021? Note: A quarter consists of three months. 
--    Incorporate a column alias in the result.

SELECT
	COUNT(o.order_date) AS 'Total Orders In 1st Quarter 2021'
FROM
	orders AS o
WHERE
	-- YEAR function returns The year from the date.
    -- QUARTER function returns quarters from the given year.
	YEAR(o.order_date) = '2021' AND QUARTER(o.order_date) = 1;
/* Viren Patel - 22/09/2023 */
    
-- ************************************ --
-- 9. List in alphabetical order all states supporting multiple customer segments
SELECT
	c.state
FROM
	customer AS c
GROUP BY c.state
HAVING
	COUNT(c.segment) > 1
ORDER BY c.state ASC;
/* Viren Patel - 22/09/2023 */


-- ************************************ --
-- 10. To help the commercial sales department with its marketing, find all customers in the corporate segment who have not placed any orders.
--     Include each customers’ first name, last name, street, city, state, and zip code. 
--     Sort the results by the last name first and then by the first name.

SELECT
	c.first_name AS 'First Name', c.last_name AS 'Last Name',
    c.street AS 'Street', c.city AS 'City',
    c.state AS 'State', c.zipcode AS 'Zip code'
FROM
	customer AS c
    LEFT JOIN orders AS o ON o.customer_id = c.customer_id
WHERE
	c.segment = 'CORPORATE'
    AND o.customer_id IS NULL
ORDER BY `Last Name`, `First Name`;
/* Viren Patel - 22/09/2023 */

-- ************************************ --
-- 11. There has been a recall of the product Nike Mens Free 5.0+ Running Shoe (product_id = 191). 
--     TerpBuy would have to offer a discount coupon to all customers who purchased this product. 
--     Find all orders that included this product as a part of the purchase. 
--     For all such orders, list the customers’ first names, last names, street, state, zip code, and order date.
--     Each customer can be offered only one discount coupon. 
--     Hence, do not list the same customer more than once.

SELECT DISTINCT
	c.first_name AS 'First Name', c.last_name AS 'Last Name',
    c.street AS 'Street', c.city AS 'City',
    c.state AS 'State', c.zipcode AS 'Zip code',
	o.order_date AS 'Order date'
FROM
	order_line AS ol
    INNER JOIN product AS p ON p.product_id = ol.product_id
    INNER JOIN orders AS o ON o.order_id = ol.order_id
    INNER JOIN customer AS c ON o.customer_id = c.customer_id
WHERE
	p.product_name = 'Nike Mens Free 5.0+ Running Shoe';
/* Viren Patel - 22/09/2023 */

-- ************************************ --
-- 12. Premium customers are those customers who have placed orders with order amounts greater than the average order amount.
--     For each customer, find the first and last names, and the order amount for all orders that exceeded the average order amount.

SELECT
	c.first_name,
    c.last_name,
    AVG(ol.total_price)
FROM
	order_line AS ol
    INNER JOIN orders AS o ON o.order_id = ol.order_id
    INNER JOIN customer AS c ON c.customer_id = o.customer_id
WHERE
	ol.total_price > (
		SELECT 
			AVG(ol.total_price)
		FROM
			order_line AS ol
    )
GROUP BY c.customer_id;
/* Viren Patel - 22/09/2023 */


