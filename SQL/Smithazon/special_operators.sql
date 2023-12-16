-- SPECIAL OPERATORS

-- 1. BETWEEN
SELECT part.part_id, part.part_name, part.quantity_in_stock
FROM part
WHERE part.quantity_in_stock BETWEEN 5 AND 20;

-- 2. IS NULL

SELECT part.part_id, part.part_name
FROM part
WHERE part_name IS NOT NULL;

-- 3. IN
SELECT customer.customer_name, customer.state, customer.city
FROM customer
WHERE customer.state IN ('AZ', 'WA', 'CT');

-- 4. LIKE (Pattern Matching)

SELECT *
FROM customer
WHERE customer.customer_name LIKE '%&%';



