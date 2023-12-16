use classicmodels;

-- Graded Questions
-- Comprehension 2 - Classic models

-- Q1. Total Revenue Earned
-- What is the total revenue earned from the products sold by the company? Hint: This is the total amount in payments received from customers.
SELECT SUM(p.amount) AS 'Total Amount'
FROM payments AS p;


-- Q2. Total Inventory Value
-- The company wants to estimate the total value of its inventory. For this, you can multiply the quantity available of each car model by its price to obtain the total value of the model; then add the resulting amount for all models to obtain the total inventory value. Which of these is the correct estimate of the inventory’s total value?

-- quantity_available * price.
-- sum up all the models price in inventory.
SELECT SUM(p.quantityInStock * p.buyPrice)
FROM products AS p;

-- Q3. Disputed Cases
-- The company is in disputes with customers over certain orders. It wants to resolve the disputes to improve its ratings. Of the queries below, which one will help you find the names and contact information of customers who have active disputes on file? Note: The status of each order is recorded in the orders table.
 SELECT c.customerName, c.phone
FROM orders AS ord
	INNER JOIN customers AS c ON c.customerNumber = ord.customerNumber
WHERE ord.status = 'Disputed';

-- Q4. New Office
-- The company wants to open an office in a new country. It wants to choose the country where it has the highest number of customers. Which of these countries should the company select?
SELECT c.country, COUNT(c.customerNumber) AS 'No of Customers'
FROM customers AS c
GROUP BY c.country
ORDER BY `No of Customers` DESC;

