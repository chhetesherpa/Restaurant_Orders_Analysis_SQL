-- 11. How many orders had more than 12 items?

SELECT 
	order_id,
	COUNT(item_id) AS number_of_items
FROM 
    order_details
GROUP BY 
    order_id
HAVING 
    number_of_items > 12
ORDER BY 
    number_of_items DESC;

/*
 FINDINGS: There were 20 orders that had more than 12 items ordered in a single order. This conclusion was achieved based on the count of total rows returned from the Action Output.
 However, we can also use a Sub Query to get the exact count
*/
-- SUB QUERY method to get the same result

SELECT 
    COUNT(*) 
FROM
    (SELECT 
        order_id,
        COUNT(item_id) AS number_of_items
    FROM 
        order_details
    GROUP BY 
        order_id
    HAVING 
        number_of_items > 12) AS num_orders;