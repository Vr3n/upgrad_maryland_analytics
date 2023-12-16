use terpbuy;

-- 1. Write a query to show the quantity of items sold by each department. Sort the results by department name.

SELECT
	d.department_name,
    SUM(ol.quantity_sold) AS 'Total quantity of items sold'
FROM
	department AS d
    INNER JOIN product AS p ON p.department_id = d.department_id
    INNER JOIN order_line AS ol ON ol.product_id = p.product_id
GROUP BY d.department_name
ORDER BY d.department_name;

-- 2. Write a query to show the number of orders placed in each year in which at least one order was placed.
-- 	  Hint: Search online to learn about MySQL’s YEAR() function to query data.

SELECT
	YEAR(o.order_date),
	COUNT(o.order_id) AS 'Number of Orders Placed'
FROM
	orders AS o
GROUP BY YEAR(o.order_date)
HAVING COUNT(o.order_id) >= 1;

SELECT DISTINCT
	o.order_status
FROM
	orders AS o;