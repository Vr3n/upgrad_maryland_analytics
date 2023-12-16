SELECT c.customer_name AS "Customer Name",
       r.first_name AS "Rep First Name",
       r.last_name AS "Rep Last Name"
FROM customer c
	INNER JOIN representative r ON r.rep_num = c.rep_num;
    
SELECT p.part_name, SUM(ol.quantity_ordered * ol.quoted_price) AS "Total Order Sales (in $)"
FROM order_line ol
	INNER JOIN part p ON ol.part_id = p.part_id
GROUP BY p.part_name
ORDER BY `Total Order Sales (in $)` DESC;
