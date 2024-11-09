
-- 9. How many orders were made within this date range? How many items were ordered within this date range?

SELECT
	COUNT(DISTINCT order_id)
FROM order_details;	


SELECT 
	COUNT(*)
FROM order_details;

/*
 FINDINGS: 
 The total orders made were 5,370.
  The total items ordered were 12,234.
*/