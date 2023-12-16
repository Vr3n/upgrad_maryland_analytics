SELECT p.part_id, p.part_name, SUM(ol.quantity_ordered) AS 'total_ordered'
FROM part p
	LEFT OUTER JOIN order_line ol ON ol.part_id = p.part_id
GROUP BY p.part_id, p.part_name
ORDER BY `total_ordered`;

SELECT c.customer_num, c.customer_name, r.first_name, r.last_name
FROM representative r
	RIGHT JOIN customer c ON c.rep_num = r.rep_num;