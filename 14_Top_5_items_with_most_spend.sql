
-- 14. What were the top 5 orders that spent the most money?

SELECT 
	order_id,
    SUM(price) AS total_spend
FROM 
    order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
GROUP BY 
    order_id
ORDER BY 
    total_spend DESC
LIMIT 5;

/*
 FINDINGS: Top 5 order_id that drove highest spend were 440, 2075, 1957, 330 and 2675
 
 */