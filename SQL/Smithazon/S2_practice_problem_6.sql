use smithazon;

-- 1. Find out which customers and representatives are located in either Maryland (MD) or New York (NY):
--    For customers, list their names, and for representatives, list their last names. For both customers and representatives, list their states. (Hint: You may have to use an alias for this.) 

-- Customers and Representatives located in MD or NY.
-- customers list full names.
-- representatives list their last names.
-- list the states.

SELECT c.customer_name AS 'names', c.state AS 'state'
FROM customer c
WHERE c.state IN ('MD', 'NY')
UNION
SELECT r.last_name, r.state
FROM representative r
WHERE r.state IN ('MD', 'NY');



-- 2. What is the part number and part name for each part ordered?

-- order_line table has all the required details.
	-- part_id will help find the part name for each part ordered.
SELECT p.part_name
FROM part p
WHERE p.part_id IN (
	SELECT orl.part_id
    FROM order_line orl
);

SELECT DISTINCT p.part_name
FROM order_line orl
	INNER JOIN part p ON p.part_id = orl.part_id;

-- 3. What is the part number and part name for each part not yet ordered? 

SELECT p.part_name
FROM part p
WHERE p.part_id NOT IN (
	SELECT orl.part_id
    FROM order_line orl
);