 */ 
 
 -- 17. How much was the most expensive order in the dataset? 
 SELECT 
	order_id,
    SUM(price) AS total_spend
FROM order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 1;