-- SELECT customer_num, customer_name, balance_due
-- FROM customer
-- WHERE balance_due > avg(balance_due);

SELECT customer_num, customer_name, balance_due
FROM customer
WHERE balance_due > (
	SELECT AVG(balance_due)
    FROM customer
);

SELECT DISTINCT order_num
FROM order_line
WHERE part_id IN (
	SELECT part_id
    FROM part
    WHERE category_id = 3
)
ORDER BY order_num;







