-- 2. Find number of menu_items that the restaurant sells. 

SELECT
	COUNT(menu_item_id) AS Total_Count
FROM 
    menu_items;