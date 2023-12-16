use smithazon;
-- Comprehension 1: Simple SQL Queries + Filtering 

-- Q1. All categories
-- The team wants to know the list of all product categories that Smithazon deals in. Which of the following SQL code will print the name of all categories?

-- Q2. Sporting goods
-- The organization has decided that it will increase its focus on the sporting goods category. The management therefore wants to know all the products that are a part of this category. Hence you are required to write a SQL query to print the names of all products that fall under this category. (Note that the category id for sporting goods is 2)


-- ------------------------------------------------------------------------------
-- Comprehension 2: Computed Columns + Compound Conditions

-- Q1. Florida warehouse
-- As a part of the expansion, the organization wants to focus on products which are stored at the warehouse in Florida and are lucrative for the business. Which of the following products fit the above description? Note that a product is defined as being lucrative if its wholesale price is greater than $10. Also note that the warehouse id for the warehouse in Florida is 3. 

-- Q2. Best representative
-- The organization has decided to reward customer representatives who are performing exceedingly at the job. This will be awarded to the customer representative serving the most number of customers. Which of the following customer representatives will get the reward?

-- Q3. NewYork warehouse
-- The management wants to understand the total inventory value stored at the warehouse in New York. (Note that the warehouse id for the new york warehouse is 2). Which of the following SQL query will provide you with the value of the inventory at New york warehouse in a column titled ‘Inventory_value’?


-- ------------------------------------------------------------------------------
-- Comprehension 3: Special operators + Sorting + Aggregate functions

-- Q1. Dallas warehouse
-- The management wants to use the Dallas warehouse to fuel the expansion in Texas and Canada. However, to roll out any marketing campaign, it needs to ascertain the total inventory value available at Dallas. What is the total inventory value stored at the Dallas warehouse. Note that the warehouse id for the warehouse is 4)

-- Q2. Salary expense
-- The finance department is interested in finding the total salary expense of the organization on customer representatives. Which of the following queries will print the total base salary expense for the organization?

-- Q3. Partnership firms
-- The finance department has a hypothesis that partnership firms have a low amount of balance due. To check the same, you need to determine the average balance due to partnership firms. What is the average balance due of customers which are partnership firms? You can identify if a customer is a partnership if it contains an ‘and’ in its name. For example, ‘Jack and Hobbs’ is a partnership firm. Note that the ‘and’ can be expressed in two forms; ‘and’ and ‘&’.


-- ------------------------------------------------------------------------------
-- Comprehension 4: Nested Queries + Grouping + Having

-- Q1. High balance due
-- The finance department is interested in targeting customers who have a high amount due as compared to the normal. How many customers have a balance due which is greater than average balance due for the customers?

-- Q2. Automotive inventory
-- The company wants to order a new batch of automotive parts to restock the inventory. Can you help them determine the current value of all automotive parts in stock? Note that category id for automotive is 1.

-- Q3. Total sales
-- The finance department wants to know the total sales figure to make the suitable orders to restock the inventory. Find the total sales value for Smitazon.


-- ------------------------------------------------------------------------------