-- Graded Questions
-- Comprehension 1 - Retail Sales

use supply_db;

-- Q1. Total Orders
-- How many orders did the online store receive?
SELECT COUNT(ord.order_id) AS 'Orders Received'
FROM orders ord
WHERE ord.order_id IS NOT NULL;


-- Q2. Most Valuable Order
-- The company wants to shift its focus to high-value orders, or orders that have the highest total values. What is the highest value of any individual order?

-- Orders which has highest total values.

SELECT ori.Order_id ,SUM(ori.Sales) AS 'total_value'
FROM ordered_items ori
GROUP BY ori.Order_id
ORDER BY `total_value` DESC;


-- Q3. Cash Sales
-- As part of scheduled audits, the company wants to tally the total sales where the payment was made in cash. Find the total sales where the payment was made in cash.

-- Payment mode: cash
-- Total sales.

SELECT ord.Type AS 'type_of_payment', SUM(ori.Sales) AS 'total_amount'
FROM orders ord
	INNER JOIN ordered_items ori ON ori.Order_id = ord.Order_id
GROUP BY ord.Type
HAVING ord.Type = 'CASH';

SELECT SUM(ori.Sales) AS 'total_amount'
FROM ordered_items as ori
WHERE ori.Order_Id IN (
	SELECT ord.Order_id
    FROM orders ord
    WHERE ord.Type = 'CASH'
);


-- Q4. Most Valuable Customer
-- Find the customer ID of the customer who has contributed the highest sales to the company.

-- Order table has order_id, and customer_id.
-- GROUP by customer_id
-- Join ordered_items inner join with order_id and get the Sales value.
-- Sum the sales value and order by highest to lowest.

SELECT ord.Customer_Id, COUNT(ord.Customer_Id) AS 'Number of Orders', SUM(ori.Sales) AS 'Sales Value'
FROM orders AS ord
	INNER JOIN ordered_items ori ON ori.Order_Id = ord.Order_Id
GROUP BY ord.Customer_Id
ORDER BY `Sales Value` DESC;


-- Q5. Biggest Market
-- Which of these states has the highest number of customers?
SELECT ci.State, COUNT(ci.State) AS 'No of customers'
FROM customer_info AS ci
GROUP BY ci.State
ORDER BY `No of customers` DESC;

-- Q6. The “Petersen” Customer
-- As part of an internal review, the audit team wants to know the total money that anyone with the last name “Petersen” has spent on the platform. Determine this amount.

-- Last name as "Peterson".
-- Total amount of money spent.

SELECT SUM(ori.Sales) AS 'Total Orders'
FROM orders AS ord
	INNER JOIN ordered_items AS ori ON ord.Order_Id = ori.Order_Id
WHERE ord.Customer_Id IN (
	SELECT ci.Id
	FROM customer_info AS ci
	WHERE ci.Last_Name = 'Petersen'
);



