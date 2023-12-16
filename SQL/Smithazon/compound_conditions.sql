-- AND
SELECT part_id, part_name
FROM part
WHERE wholesale_price < 10
	AND quantity_in_stock > 0;

-- OR
SELECT rep_num, first_name, last_name
FROM representative
WHERE state = "MD"
	OR state = "VA";
    
    
-- Find All parts that need to be reordered form warehouse 1 or warehouse 2.alter
SELECT part_name, warehouse_id, quantity_in_stock
FROM part
WHERE (warehouse_id = 1
	OR warehouse_id = 2)
    AND quantity_in_stock < 10;
    
-- NOT Living in New york.
SELECT customer_name
FROM customer
WHERE state = 'NY';