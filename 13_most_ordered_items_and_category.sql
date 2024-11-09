-- 13. What were the least and most ordered items? What categories were they in? 

SELECT
	category,
	item_name,
    COUNT(order_details_id) AS total_order_count
FROM 
    menu_items
LEFT JOIN order_details ON menu_items.menu_item_id = order_details.item_id
GROUP BY 
    item_name, 
    category
ORDER BY 
    total_order_count DESC;

/*
 FINDINGS: Hamburger (category American) was the most ordered item with order count of 622 while Chicken Tacos (category Mexican) was the least ordered item with order count of 123.
*/