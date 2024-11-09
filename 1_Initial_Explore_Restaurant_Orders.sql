-- Using the correct Database Schema
USE restaurant_db;

-- Question 1. Exploring the menu_items.

SELECT 
	*
FROM 
	menu_items
LIMIT 10;

/* 
FINDINGS: It looks like there are quite a variety of menu items that the restaurant offers to its customer, such as Hamburger, Cheeseburger, Hot Dog etc. 
We also noticed that the restaurant sells different categories of menu.
*/

-- Question 2. Find number of menu_items that the restaurant sells. 

SELECT
	COUNT(menu_item_id) AS Total_Count
FROM 
    menu_items;

-- 3. Different categorries of menu_items

SELECT DISTINCT 
    category
FROM   
    menu_items;

/* FINDINGS: Based on the results retrieved from the above query, we note that the 32 menu items fall under four categories

These categories are:
i. American
ii. Asian
iii. Mexican
iv. Italian

It looks like the restaurant sells quite a variety of food items. 
*/

-- 4. Least and most expensive items on the menu
-- Part 1 : Least expensive menu_item

SELECT 
	item_name,
    price
FROM 
    menu_items
ORDER BY 
    price
LIMIT 1;

-- FINDINGS: It looks like the least expensive menu_item is Edamame with a price point of 5.00

-- Part 2: Most expensive menu_item

SELECT 
	item_name,
    price
FROM 
    menu_items
ORDER BY 
    price DESC
LIMIT 1;

-- FINDINGS: It looks like the most expensive menu_item is Shrimp Scampi with respective price of 19.95

-- 5. Count number of Italian dishes in the menu

SELECT 
	COUNT(menu_item_id)
FROM 
    menu_items
WHERE 
    category = 'Italian';

-- FINDINGS: It looks like there are a total of 9 italian dishes that the restaurant sells.

-- 6. What are the least and most expensive Italian dishes on the menu
-- Part 1 : Least expensive Italian dish

SELECT
	item_name,
    category,
    price AS least_expensive_italian
FROM 
    menu_items
WHERE 
    category = 'Italian'
ORDER BY 
    price
LIMIT 1;

-- FINDINGS: Spaghetti is the least expensive Italian dish that cost 14.5

-- Part 2 : Most expensive Italian dish

SELECT
	item_name,
    category,
    price AS most_expensive_italian
FROM 
    menu_items
WHERE 
    category = 'Italian'
ORDER BY 
    price DESC
LIMIT 1;

-- FINDINGS: Shrimp Scampi is the least expensive Italian dish that cost 14.5


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


-- 9. How many orders were made within this date range? How many items were ordered within this date range?

SELECT
	COUNT(DISTINCT order_id)
FROM 
    order_details;	


SELECT 
	COUNT(*)
FROM 
    order_details;

/*
 FINDINGS: 
 The total orders made were 5,370.
  The total items ordered were 12,234.
*/

-- 10. Which order had the most number of items?

SELECT 
	order_id,
	COUNT(item_id) AS number_of_items
FROM 
    order_details
GROUP BY 
    order_id
ORDER BY 
    number_of_items DESC;

/*
 FINDINGS: 
 
 At most, 14 items were ordered on one single order.The order_id for such orders are: 
 4305, 
 3473,
 1957,
 330,
 440,
 443, and
 2675
*/

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

-- 12. Combining the menu_items and order_details table into a single table

SELECT 
    *
FROM 
    menu_items
    LEFT JOIN order_details
		ON menu_items.menu_item_id = order_details.item_id;

 -- 13. What were the least and most ordered items? What categories were they in? 

SELECT
	category,
	item_name,
    COUNT(order_details_id) AS total_order_count
FROM 
    menu_items
LEFT JOIN order_details ON menu_items.menu_item_id = order_details.item_id
GROUP BY 
    item_name, 
    category
ORDER BY 
    total_order_count DESC;

/*
 FINDINGS: Hamburger (category American) was the most ordered item with order count of 622 while Chicken Tacos (category Mexican) was the least ordered item with order count of 123.
*/


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

 -- 15. View the details of the highest spend order. What specific items were purchased? 

SELECT 
    *
FROM 
    order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
WHERE 
    order_id = 440;

-- For the highest spend order, what category drove the most order?

SELECT 
	category,
    COUNT(order_details_id) AS total_order_count
FROM 
    order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
WHERE 
    order_id = 440
GROUP BY 
    category;
-- For the highest spend order, Italian food was ordered the most with 8 orders in total. 

-- 16. View the details of the top 5 highest spend orders

SELECT 
    *
FROM 
    order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
WHERE 
    order_id IN (440, 2075, 1957, 330, 2675);


SELECT 
    order_id,
    category,
    COUNT(order_details_id) AS total_order_count
FROM 
    order_details
LEFT JOIN menu_items ON  order_details.item_id = menu_items.menu_item_id
WHERE 
    order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY 
    order_id,
    category;
    
 /*   
 FINDINGS: It looks like the Italian food is the most popular food items. 

  */ 
 
 -- 17. How much was the most expensive order in the dataset? 
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
LIMIT 1;
