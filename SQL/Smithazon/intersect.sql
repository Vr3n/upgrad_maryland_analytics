SELECT c.customer_num, c.customer_Name
FROM customer c
WHERE c.rep_num = 107 
AND c.customer_num NOT IN (
	SELECT c.customer_num
	FROM customer c
		INNER JOIN orders  o ON o.customer_num = c.customer_num
);

