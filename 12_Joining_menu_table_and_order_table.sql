-- 12. Combining the menu_items and order_details table into a single table

SELECT 
    *
FROM 
    menu_items
    LEFT JOIN order_details
		ON menu_items.menu_item_id = order_details.item_id;
        
