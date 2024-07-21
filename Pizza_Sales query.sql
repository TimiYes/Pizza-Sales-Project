SELECT * 
FROM pizza_sales;

SELECT SUM(total_price)
AS Total_Revenue
FROM pizza_sales;

SELECT SUM(total_price)/COUNT(DISTINCT order_id) 
AS Avg_Order_Value
FROM pizza_sales;

SELECT SUM(quantity)
AS Total_Pizza_Sold
FROM pizza_sales ;

SELECT SUM(
SELECT COUNT(DISTINCT order_id)
AS Total_Orders
FROM pizza_sales;

--Hourly Trend For Total Pizzas Sold
SELECT DATEPART(Hour, order_time)
AS order_hour,
SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY DATEPART(Hour, order_time)
ORDER BY DATEPART(Hour, order_time);

--Weekly Trend For Total Orders
SELECT DATEPART(ISO_WEEK, order_date) AS week_number,
YEAR(order_date) AS Order_Year,
COUNT(DISTINCT order_id) As Total_Orders
FROM pizza_sales
GROUP BY DATEPART(ISO_WEEK, order_date), YEAR(order_date)
ORDER BY DATEPART(ISO_WEEK, order_date), YEAR(order_date);


SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id)AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizza_per_Order
FROM pizza_sales;

SELECT pizza_category, sum(total_price)*100/( SELECT sum(total_price) FROM pizza_sales)
AS PCT
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size, sum(total_price)*100/( SELECT sum(total_price) FROM pizza_sales)
AS PCT
FROM pizza_sales
GROUP BY pizza_size


