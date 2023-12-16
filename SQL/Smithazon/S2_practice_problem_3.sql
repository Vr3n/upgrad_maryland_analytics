-- Practice Problems 3

-- 1. How much is the most expensive part?

-- Select from part table.
-- display "Part Name", "Wholesale Price"
-- Sort by Descending order.

SELECT part.part_name AS "Part Name", 
	   part.wholesale_price AS "Wholesale Price",
       part.quantity_in_stock * part.wholesale_price AS "Inventory Value"
FROM part
ORDER BY part.wholesale_price DESC;

-- 2. How many parts are out of stock?

-- Select from part table.
-- Get the parts which have no quantity or quantity is 0.
-- Count the total of parts which are out of stock.
SELECT COUNT(part.quantity_in_stock) AS "Out of stock products"
FROM part
WHERE part.quantity_in_stock = 0;
 
-- 3. How much credit has been extended to customers serviced by representative 107?

-- select customer with customer_rep number 107.

SELECT SUM(customer.credit_limit)
FROM customer
WHERE customer.rep_num = 107;

-- 4. How many sales representatives have been assigned to a customer?

SELECT COUNT(DISTINCT customer.rep_num) AS "Sales Rep Assigned"
FROM customer;
