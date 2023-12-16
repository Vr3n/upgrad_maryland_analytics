-- List the customer number, name, and city and state names for all customers residing in New Jersey (NJ) or Washington (WA).
SELECT customer.customer_num, customer.customer_name, customer.city, customer.state
FROM customer
WHERE customer.state = 'NJ'
	OR customer.state = 'WA';

-- List the order number, order date, and customer number for each order placed by customer numbers 1002, 1004, or 1006 on February 24, 2022.

-- 1. columns: order number, order date, and customer number
-- 2. customer numbers: 1002, 1004, or 1006
-- 3. order date: February 24, 2022
SELECT orders.order_num, orders.order_date, orders.customer_num
FROM orders
WHERE orders.order_date = '2022-02-24';

-- List the name of each part and its total wholesale value.
 
-- 1. Part names.
-- 2. Calculate wholesale value -> quantity * wholesale price.
SELECT part.part_name AS "Part Name", part.quantity_in_stock * part.wholesale_price AS "Wholesale Value"
FROM part;