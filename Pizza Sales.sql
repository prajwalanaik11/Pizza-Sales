select * from pizza_sales

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

SELECT SUM(total_price)/ COUNT(DISTINCT(order_id)) AS Avg_Order_Value FROM pizza_sales

SELECT SUM(quantity) as Total_Pizza_Sold FROM pizza_sales

SELECT COUNT(DISTINCT(order_id)) AS Total_Orders FROM pizza_sales

SELECT 
CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizza_Per_Order FROM pizza_sales


-----------------------------------------------------------------------------------------------------------------

SELECT 
	DATENAME(DW,order_date) as Order_Day, 
	COUNT(DISTINCT(order_id)) AS Total_Orders from pizza_sales
GROUP BY DATENAME(DW,order_date) 

SELECT 
	DATENAME(MONTH,order_date) as Order_Day, 
	COUNT(DISTINCT(order_id)) AS Total_Orders from pizza_sales
GROUP BY DATENAME(MONTH,order_date)

SELECT pizza_category, SUM(total_price) as Total_Sales,
	SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS Percentage_Total_Sales
FROM pizza_sales
GROUP BY pizza_category

SELECT pizza_size, SUM(total_price) as Total_Sales,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage_Total_Sales
FROM pizza_sales
GROUP BY pizza_size

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders 