use smithazon;

-- Practice Problem - inner joins.

-- 1.For each order, what is the order number and date along with the name of the customer that placed the order?

-- Order number -> order_num column in order table.
-- Date -> order_date column in order table.
-- Name of the customer who placed the order
	-- -> inner join the customer table with customer_num column in both tables.
    -- -> customer_name in customer table.


SELECT c.customer_name, ord.order_num, ord.order_date
FROM orders ord
	INNER JOIN customer c ON c.customer_num = ord.customer_num;
    
    
-- 2. For each customer in Maryland, New Jersey, New York, or Washington, and for each order placed on February 24, 2022, find the customer name, order number, and order date.

-- Print customer name, order number, and order date.
	-- Order table has all the necessary columns.
		-- 1. order_num, order_date, and customer_num.
        -- 2. Inner join the customer_num with customer table to get customer names.
-- Each customer in Maryland, New York, or Washington.
	-- filter by the state column in the customer table.
-- Orders placed on February 24, 2022.
	-- using where clause we can filter by the required date.

SELECT c.customer_name, ord.order_num, ord.order_date, c.state
FROM orders ord
	INNER JOIN customer c ON c.customer_num = ord.customer_num
WHERE ord.order_date = '2022-02-24'
	AND c.state IN ('MD', 'NJ', 'NY', 'WA');

-- 3. Find the city, state, and zip code of the supply warehouse for every out-of-stock part.

-- Filter out-of-stock parts.
	-- quantity_in_stock column in part table will help us find the out-of-stock parts.
-- print city, state, and zip code of the supply warehouse.
	-- Inner join using warehouse_id in part and warehouse tables will help us print the required details of warehouse.
    
SELECT w.city, w.state, w.zip
FROM part p
INNER JOIN warehouse w ON w.warehouse_id = p.warehouse_id
	WHERE p.quantity_in_stock = 0;



