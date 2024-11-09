-- 6. What are the least and most expensive Italian dishes on the menu
-- Part 1 : Least expensive Italian dish

SELECT
	item_name,
    category,
    price AS least_expensive_italian
FROM menu_items
WHERE category = 'Italian'
ORDER BY price
LIMIT 1;

-- FINDINGS: Spaghetti is the least expensive Italian dish that cost 14.5

-- Part 2 : Most expensive Italian dish

SELECT
	item_name,
    category,
    price AS most_expensive_italian
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC
LIMIT 1;

-- FINDINGS: Shrimp Scampi is the least expensive Italian dish that cost 14.5