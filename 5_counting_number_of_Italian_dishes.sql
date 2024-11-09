-- 5. Count number of Italian dishes in the menu

SELECT 
	COUNT(menu_item_id)
FROM menu_items
WHERE category = 'Italian';

-- FINDINGS: It looks like there are a total of 9 italian dishes that the restaurant sells.