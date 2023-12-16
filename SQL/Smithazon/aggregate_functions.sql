-- Aggregate Functions.
SELECT sum(balance_due) AS "Accounts Receivable Total", avg(balance_due) AS 'Average Balance Due',
		min(balance_due) AS "Min Balance Due", max(balance_due) AS "Max Balance Due"
FROM customer;

-- Count func
SELECT count(DISTINCT customer_num)
FROM orders;