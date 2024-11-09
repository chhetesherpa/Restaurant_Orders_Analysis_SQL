-- 4. Least and most expensive items on the menu
-- Part 1 : Least expensive menu_item

SELECT 
	item_name,
    price
FROM menu_items
ORDER BY price
LIMIT 1;

-- FINDINGS: It looks like the least expensive menu_item is Edamame with a price point of 5.00

-- Part 2: Most expensive menu_item

SELECT 
	item_name,
    price
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- FINDINGS: It looks like the most expensive menu_item is Shrimp Scampi with respective price of 19.95