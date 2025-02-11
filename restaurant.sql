USE restaurant_db;

-- view the menu_items table
SELECT * FROM menu_items;
-- find the number of items in the menu 
SELECT COUNT(*) FROM menu_items;
-- least and most expensive items on the menu
select * from menu_items
order by price DESC;
-- How many italian dishes on the menu
select count(*) from menu_items
where category = 'Italian';
-- least and most expensive italian dishes on the menu
SELECT *
FROM menu_items
WHERE category='Italian'
ORDER BY 	price;

SELECT *
FROM menu_items
WHERE category='Italian'
ORDER BY 	price DESC;

-- how many dishes are in each category
SELECT category, count(menu_item_id) AS num_dishes FROM menu_items
group by category;
 
 -- average price within each category
 SELECT category, AVG(price) AS avg_price FROM menu_items
group by category;

-- view the order details table 
SELECT * FROM order_details;

-- date range of the table
SELECT * FROM order_details
ORDER BY order_date DESC;

SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- how many orders were made within this date range
SELECT COUNT(distinct order_id) FROM order_details;

-- how many items were ordered within this date range
SELECT COUNT(*) FROM order_details;

-- which orders had the most no of items
SELECT order_id, COUNT(item_id) AS num_items FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- how many orders had more than 12 items
SELECT COUNT(*) FROM
(SELECT order_id, COUNT(item_id) AS num_items FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;

-- combining menu_items and order_details into single table
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT * 
FROM order_details od LEFT JOIN menu_items mi
 ON od.item_id = mi.menu_item_id;
 
 -- least and most ordered items? what categories were they in?
SELECT item_name, COUNT(order_details_id) as num_purchases
FROM order_details od LEFT JOIN menu_items mi
 ON od.item_id = mi.menu_item_id
 GROUP BY item_name
ORDER BY num_purchases DESC;

-- top 5 orders that spend the most money
SELECT order_id, SUM(price) as total_spend
FROM order_details od LEFT JOIN menu_items mi
 ON od.item_id = mi.menu_item_id
 GROUP BY order_id
 ORDER BY total_spend DESC
 LIMIT 5;

-- view the details of the top 5 highest spend orders. insights
SELECT order_id,category, COUNT(item_id) as num_items
FROM order_details od LEFT JOIN menu_items mi
 ON od.item_id = mi.menu_item_id
 WHERE order_id IN (440, 2075,1975,330,2675)
 GROUP BY order_id,  category;












