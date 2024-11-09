-- 8. View the order details table. What is the date range of the table?

SELECT 
    *
FROM 
    order_details;

SELECT 
	MIN(order_date),
	MAX(order_date)
FROM 
    order_details;

/*
 FINDINGS: 
 The earliest date is 2023-01-01
  The last date is 2023-03-31
*/