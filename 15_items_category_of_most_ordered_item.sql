-- 15. View the details of the highest spend order. What specific items were purchased? 

SELECT *
FROM order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
WHERE order_id = 440;

-- For the highest spend order, what category drove the most order?

SELECT 
	category,
    COUNT(order_details_id) AS total_order_count
FROM order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
WHERE order_id = 440
GROUP BY category;
-- For the highest spend order, Italian food was ordered the most with 8 orders in total. 