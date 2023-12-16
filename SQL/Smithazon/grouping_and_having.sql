-- GROUPING

SELECT rep_num, AVG(balance_due) AS "Average Balance DUE"
FROM customer
GROUP BY rep_num
ORDER BY rep_num;

-- SELECT rep that are servicing more than 2 customers.
-- Having for filtering groups.
-- WHERE for filtering rows.
SELECT customer.rep_num, COUNT(customer.customer_num) AS 'customer_count'
FROM customer
GROUP BY customer.rep_num
HAVING COUNT(*) > 2
ORDER BY customer.rep_num;

-- HIGH Profile Cusotmer.

SELECT customer.rep_num, COUNT(customer.customer_num) AS 'customer_count'
FROM customer
WHERE customer.credit_limit > 10000
GROUP BY customer.rep_num
HAVING COUNT(*) > 2
ORDER BY customer.rep_num;

