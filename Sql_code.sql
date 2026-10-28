CREATE DATABASE sales_analysis_db;
USE sales_analysis_db;

SELECT *
FROM orders
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM Orders;

SELECT *
FROM Orders
LIMIT 10;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT OrderID) AS unique_orders,
    COUNT(*) - COUNT(TotalAmount) AS missing_total_amount,
    COUNT(*) - COUNT(OrderDate) AS missing_order_dates
FROM Orders;


# How much total sales revenue and how many units sold does each product category generate?

SELECT 
	Category, 
	ROUND(SUM(TotalAmount)) AS Total_sale, 
    SUM(Quantity) AS Quantity, 
    COUNT(DISTINCT OrderID) AS Unique_order
FROM orders
GROUP BY Category
ORDER BY Total_sale DESC; 


# How much total sales revenue and how many unique orders are associated with each payment method?

SELECT 
	PaymentMethod, 
	ROUND(SUM(TotalAmount)) AS Total_sale,
    COUNT(DISTINCT OrderID) AS Unique_order,
    ROUND(AVG(TotalAmount)) AS Average_order_amount
FROM orders
GROUP BY PaymentMethod
ORDER BY Total_sale DESC;


# How do total sales revenue and unique order counts change month by month?

SELECT 
	DATE_FORMAT(OrderDate, '%Y-%m') AS sales_month,
	ROUND(SUM(TotalAmount)) AS Total_sale,
    COUNT(DISTINCT OrderID) AS Unique_order,
    SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY sales_month ASC;


# Which countries generate the highest total sales, and how many unique orders come from each country?

SELECT 
	Country,
	ROUND(SUM(TotalAmount)) AS Total_sales,
    COUNT(DISTINCT OrderID) AS Unique_orders
FROM orders
GROUP BY Country
ORDER BY Total_sales DESC;
    
    
# How do total sales, unique order counts, and average order amounts differ across order statuses?

SELECT 
	OrderStatus,
	ROUND(SUM(TotalAmount)) AS Total_sales,
    count(DISTINCT OrderID) AS Unique_order,
    ROUND(AVG(TotalAmount)) AS Average_order_sale
FROM orders
GROUP BY OrderStatus
ORDER BY Total_sales;


# Which 10 products generate the highest total sales revenue, and how many units of each product were sold?

SELECT 
	ProductName,
	ROUND(SUM(TotalAmount)) AS Total_sales,
    SUM(Quantity) AS Total_quantity
FROM orders
GROUP BY ProductName
ORDER BY Total_sales DESC
LIMIT 10;
    
    
# Which brands generate the highest total sales revenue, and how many units are sold for each brand?

SELECT 
	Brand,
	ROUND(SUM(TotalAmount)) AS Total_amount,
    SUM(Quantity) AS Total_quantity
FROM orders
GROUP BY Brand
ORDER BY Total_amount DESC;


# Which 10 customers contribute the highest total sales revenue, and how many unique orders has each customer placed?

SELECT 
	CustomerName, 
	ROUND(SUM(TotalAmount)) AS Total_sale,
    COUNT(DISTINCT OrderID) AS Total_order
FROM orders
GROUP BY CustomerName
ORDER BY Total_sale
LIMIT 10;


# Which states generate the highest sales revenue, and how many unique orders and units sold does each state contribute?

SELECT 
	State,
	ROUND(SUM(TotalAmount)) AS Total_sales,
    COUNT(DISTINCT OrderID) AS Unique_order,
    SUM(Quantity) AS Total_quantity
FROM orders
GROUP BY State
ORDER BY Total_sales DESC;


# Which 10 cities generate the highest sales revenue, and how many unique orders and units sold does each city contribute?

SELECT 
	City,
	ROUND(SUM(TotalAmount)) AS Total_sales,
    COUNT(DISTINCT OrderID) AS Unique_order,
    SUM(Quantity) AS Total_quantity
FROM orders
GROUP BY City
ORDER BY Total_sales DESC
LIMIT 10;


# What is the average discount and total sales for each product category?

SELECT 
	Category,
	ROUND(AVG(Discount), 5) AS Average_discount,
    ROUND(SUM(TotalAmount)) AS Total_amount
FROM orders
GROUP BY Category
ORDER BY Average_discount DESC;


# How much total tax is recorded for each product category, and what is the average tax per order?

SELECT 
	Category,
	SUM(Tax) AS Total_tax,
    AVG(Tax) AS Average_tax
FROM orders
GROUP BY Category
ORDER BY Total_tax DESC;


# Which product categories have the highest total shipping costs, and what is their average shipping cost per record?

SELECT 
	Category,
	ROUND(SUM(ShippingCost)) AS Total_shippingCost,
    ROUND(AVG(ShippingCost), 2) AS Average_shippingcost
FROM orders
GROUP BY Category
ORDER BY Total_shippingCost;


# Which product categories have the highest average order amount, and how many unique orders belong to each category?

SELECT 
	Category,
	ROUND(AVG(TotalAmount), 2) AS Average_amount_Category,
    COUNT(DISTINCT OrderID) AS Unique_orders
FROM orders
GROUP BY Category
ORDER BY Average_amount_Category DESC;


# How do sales revenue and unique order counts vary when payment method and order status are analyzed together?

SELECT 
	PaymentMethod,
    OrderStatus,
    ROUND(SUM(TotalAmount)) AS Total_sales,
    COUNT(DISTINCT OrderID) AS Unique_order
FROM orders
GROUP BY PaymentMethod, OrderStatus
ORDER BY Total_sales DESC;


# What is the month-over-month percentage change in total sales revenue?

WITH month_sales AS (
SELECT 
	DATE_FORMAT(OrderDate, "%Y-%m") AS Month_sale,
    ROUND(SUM(TotalAmount)) AS Total_sales
FROM orders
GROUP BY Month_sale
ORDER BY Month_sale ASC
) SELECT
	Month_sale,
	Total_sales,
    LAG(Total_sales) OVER(ORDER BY Month_sale ASC) AS previous_month_sales,
    ROUND((Total_sales - LAG(Total_sales) OVER(ORDER BY Month_sale ASC)) / 
    LAG(Total_sales) OVER(ORDER BY Month_sale ASC) * 100, 2)  AS month_over_month_growth_pct
FROM month_sales;


# Identify the top 10 customers who have placed more than one order, ranked by order count and then total sales.

SELECT 
	CustomerID,
    CustomerName,
    COUNT(OrderID) AS total_order,
    ROUND(SUM(TotalAmount)) AS total_sale
FROM orders
GROUP BY CustomerID, CustomerName
HAVING total_order > 1
ORDER BY total_order DESC, total_sale DESC
LIMIT 10;



