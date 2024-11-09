-- 10. Which order had the most number of items?

SELECT 
	order_id,
	COUNT(item_id) AS number_of_items
FROM order_details
GROUP BY order_id
ORDER BY number_of_items DESC;

/*
 FINDINGS: 
 At most, 14 items were ordered on one single order.The order_id for such orders are: 
 4305, 
 3473,
 1957,
 330,
 440,
 443, and
 2675
*/