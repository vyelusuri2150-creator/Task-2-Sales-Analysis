-- Create Database
CREATE DATABASE task2;
USE task2;

-- Create Orders Table
CREATE TABLE Orders (
    Order_ID VARCHAR(30),
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Product_Category VARCHAR(50),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

-- Create Customers Table
CREATE TABLE Customers (
    Customer_ID VARCHAR(20),
    Segment VARCHAR(50),
    Region VARCHAR(50)
);

-- Verify Orders Data
SELECT COUNT(*) AS Total_Orders
FROM orders;

-- Verify Customers Data
SELECT COUNT(*) AS Total_Customers
FROM customers;

-- INNER JOIN Query
SELECT
    o.`Order ID`,
    o.`Order Date`,
    o.`Customer ID`,
    c.Region,
    c.Segment,
    o.Category,
    o.Sales,
    o.Profit
FROM orders o
INNER JOIN customers c
ON o.`Customer ID` = c.Customer_ID;

-- Total Sales by Region
SELECT
    c.Region,
    ROUND(SUM(o.Sales),2) AS Total_Sales
FROM orders o
INNER JOIN customers c
ON o.`Customer ID` = c.Customer_ID
GROUP BY c.Region;

-- Top 5 Customers by Revenue
SELECT
    o.`Customer ID`,
    ROUND(SUM(o.Sales),2) AS Total_Revenue
FROM orders o
GROUP BY o.`Customer ID`
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Category-wise Sales
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Category;

-- Average Profit by Category
SELECT
    Category,
    ROUND(AVG(Profit),2) AS Average_Profit
FROM orders
GROUP BY Category;