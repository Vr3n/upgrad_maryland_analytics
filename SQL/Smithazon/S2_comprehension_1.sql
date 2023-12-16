use smithazon;
-- Comprehension 1: Simple SQL Queries + Filtering 

-- Q1. All categories
-- The team wants to know the list of all product categories that Smithazon deals in. Which of the following SQL code will print the name of all categories?
SELECT category_id, category_name
FROM part_category;

-- Q2. Sporting goods
-- The organization has decided that it will increase its focus on the sporting goods category. The management therefore wants to know all the products that are a part of this category. Hence you are required to write a SQL query to print the names of all products that fall under this category. (Note that the category id for sporting goods is 2)
SELECT part_id, part_name, category_id
FROM part
WHERE category_id = 2;


-- ------------------------------------------------------------------------------
-- Comprehension 2: Computed Columns + Compound Conditions

-- Q1. Florida warehouse
-- As a part of the expansion, the organization wants to focus on products which are stored at the warehouse in Florida and are lucrative for the business. Which of the following products fit the above description? Note that a product is defined as being lucrative if its wholesale price is greater than $10. Also note that the warehouse id for the warehouse in Florida is 3. 

-- Print Product name and id.
-- 1. Florida warehouse id is 3.
-- 2. A product is lucrative when -> wholesale price is greater than $10.

SELECT part.part_id, part.part_name
FROM part
WHERE part.wholesale_price > 10
  AND part.warehouse_id = 3;

-- Q2. Florida Customer
-- As the representative with id 103 is moving to Florida, the company decided that they can manage all customers based in Florida. The company thus needs to know the names of customers residing in Florida who are not assigned to the representative with id 103. Which of the following is one of those customers?

-- Company needs to know the names of the customers residing in Florida who are not assigned to the representative with id 103.
SELECT customer.customer_name
FROM customer
WHERE customer.state = "FL"
	AND customer.rep_num != 103;


-- Q3. NewYork warehouse
-- The management wants to understand the total inventory value stored at the warehouse in New York. (Note that the warehouse id for the new york warehouse is 2). Which of the following SQL query will provide you with the value of the inventory at New york warehouse in a column titled ‘Inventory_value’?
SELECT part.part_name AS "Part Name", part.wholesale_price * part.quantity_in_stock AS "Inventory Value"
FROM part
WHERE part.warehouse_id = 2;

-- ------------------------------------------------------------------------------
-- Comprehension 3: Special operators + Sorting + Aggregate functions

-- Q1. Dallas warehouse
-- The management wants to use the Dallas warehouse to fuel the expansion in Texas and Canada. However, to roll out any marketing campaign, it needs to ascertain the total inventory value available at Dallas. What is the total inventory value stored at the Dallas warehouse. Note that the warehouse id for the warehouse is 4)

-- Total Value in the Dallas Inventory (id is 4).
-- Part table consists the cost of the inventory and number of items.

SELECT SUM(part.quantity_in_stock * part.wholesale_price) AS "Total Value Of Inventory"
FROM part
WHERE part.warehouse_id = 4;

-- Q2. Salary expense
-- The finance department is interested in finding the total salary expense of the organization on customer representatives. Which of the following queries will print the total base salary expense for the organization?

SELECT SUM(representative.base_salary) AS "Total Salaries"
FROM representative;


-- Q3. Partnership firms
-- The finance department has a hypothesis that partnership firms have a low amount of balance due. To check the same, you need to determine the average balance due to partnership firms. What is the average balance due of customers which are partnership firms? You can identify if a customer is a partnership if it contains an ‘and’ in its name. For example, ‘Jack and Hobbs’ is a partnership firm. Note that the ‘and’ can be expressed in two forms; ‘and’ and ‘&’.

	-- Find partnership firms.
		-- by 'and' or '&'
	-- Determine Average balance_due.
SELECT avg(customer.balance_due)
FROM customer
WHERE customer.customer_name LIKE '%and%'
	OR customer.customer_name LIKE '%&%';


-- ------------------------------------------------------------------------------
-- Comprehension 4: Nested Queries + Grouping + Having

-- Q1. High balance due
-- The finance department is interested in targeting customers who have a high amount due as compared to the normal. How many customers have a balance due which is greater than average balance due for the customers?

-- select customer who have higher than average balance due.

SELECT COUNT(customer.customer_name) AS "Customers with balance due"
FROM customer
WHERE customer.balance_due > (
	SELECT avg(customer.balance_due)
    FROM customer
)
ORDER BY customer.balance_due DESC;

-- Q2. Automotive inventory
-- The company wants to order a new batch of automotive parts to restock the inventory. Can you help them determine the current value of all automotive parts in stock? Note that category id for automotive is 1.

-- currrent value of all automative parts in stock.

SELECT part.category_id, SUM(part.quantity_in_stock * part.wholesale_price)
FROM part
GROUP BY part.category_id;


-- Q3. Total sales
-- The finance department wants to know the total sales figure to make the suitable orders to restock the inventory. Find the total sales value for Smitazon.
SELECT SUM(order_line.quoted_price * order_line.quantity_ordered) AS "total price"
FROM order_line;



-- ------------------------------------------------------------------------------