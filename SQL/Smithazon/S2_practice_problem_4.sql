-- Practice Problem – Nested Queries

-- 1. How many different parts come from each warehouse?

SELECT part.warehouse_id, COUNT(DISTINCT part.part_id) AS "No of Parts"
FROM part
GROUP BY part.warehouse_id;


-- 2. Which representatives are servicing more than one customer with a credit limit under $20,000?
--    Include all customers having a credit limit under $20,000. 

-- filter customer with credit limit under $20,000.
-- Select representative with more than 1 customers.

SELECT customer.rep_num, COUNT(customer.customer_num) AS "No of customers"
FROM customer
WHERE customer.credit_limit < 20000
GROUP BY customer.rep_num
HAVING COUNT(customer.customer_num) > 1;


-- 3. What is the total quantity ordered for each part? 

-- Select from order_line table.
-- Group by part_id.
-- Aggregate by sum to get total quantity.
SELECT order_line.part_id, SUM(order_line.quantity_ordered) AS "Total Quantity Ordered"
FROM order_line
GROUP BY order_line.part_id
HAVING `Total Quantity Ordered` >= 50
ORDER BY `Total Quantity Ordered` DESC;

