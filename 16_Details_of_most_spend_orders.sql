-- 16. View the details of the top 5 highest spend orders

SELECT 
    *
FROM 
    order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
WHERE 
    order_id IN (440, 2075, 1957, 330, 2675);


SELECT 
    order_id,
    category,
    COUNT(order_details_id) AS total_order_count
FROM 
    order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
WHERE 
    order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY 
    order_id,
    category;
    
 /*   
 FINDINGS: It looks like the Italian food is the most popular food items. 