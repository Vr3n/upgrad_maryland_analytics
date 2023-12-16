-- List all rows and columns for the full representative table.
SELECT *
FROM representative;

-- List the part id and name for all parts that are out of stock.
SELECT part_id, part_name, quantity_in_stock
FROM part
WHERE quantity_in_stock = 0;

-- List the city, state, and zip code for each warehouse in the
-- State of Maryland (MD).
SELECT city, state, zip
FROM warehouse
WHERE state = "MD";

-- List the customer number and name for all customers
-- with a credit limit of at least $20,000.
SELECT customer.customer_num, customer.customer_name
FROM customer
WHERE customer.credit_limit >= 20000;