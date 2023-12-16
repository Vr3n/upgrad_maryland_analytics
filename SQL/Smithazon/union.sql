SELECT c.customer_num, c.customer_name
FROM customer c
WHERE c.rep_num = 107
UNION ALL
SELECT c.customer_num, c.customer_name
FROM customer c
	INNER JOIN orders o ON o.customer_num = c.customer_num;


SELECT location.city, location.state, COUNT(*) AS 'Count'
FROM (
	SELECT c.city, c.state
    FROM customer c
    UNION ALL
    SELECT r.city, r.state
    FROM representative r
) location
GROUP BY location.city, location.state
ORDER BY `Count` DESC, location.state, location.city;