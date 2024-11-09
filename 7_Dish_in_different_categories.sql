
-- 7. How many dishes are in each category? What is the average of dish price in each category? 

SELECT 
	category,
	COUNT(menu_item_id) AS dish_count,
    AVG(price) AS average_price
FROM 
    menu_items
GROUP BY 
    category;

-- FINDINGS below: 
-- 
/* 
Category    dish_count    Avg_price
American	6				10.06
Asian		8				13.47
Mexican		9				11.8
Italian		9				16.75

*/