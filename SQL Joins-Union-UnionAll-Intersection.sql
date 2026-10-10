create database ACW4;

use acw4;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    State VARCHAR(50),
    Region VARCHAR(50)
);
select * from Customers

INSERT INTO Customers (CustomerID, CustomerName, State, Region)
VALUES
(101, 'Dangote Agro', 'Lagos', 'South West'),
(102, 'Green Farms Ltd', 'Kano', 'North West'),
(103, 'Prime Agro Nigeria', 'Kaduna', 'North West'),
(104, 'Farmers Hub', 'Oyo', 'South West'),
(105, 'Agro Plus Ltd', 'Rivers', 'South South'),
(106, 'Northern Farmers', 'Katsina', 'North West'),
(107, 'Golden Harvest', 'Enugu', 'South East'),
(108, 'Future Farms', 'Abuja', 'North Central');


-- ============================================
-- PRODUCTS TABLE
-- ============================================

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

INSERT INTO Products (ProductID, ProductName, Category, UnitPrice)
VALUES
(201, 'Urea Fertilizer', 'Fertilizer', 45000),
(202, 'NPK Fertilizer', 'Fertilizer', 50000),
(203, 'Organic Fertilizer', 'Fertilizer', 35000),
(204, 'Pesticide', 'Agro Chemical', 18000),
(205, 'Herbicide', 'Agro Chemical', 22000);


-- ============================================
-- ORDERS TABLE
-- ============================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID, Quantity)
VALUES
(1001, 101, '2026-09-01', 201, 100),
(1002, 102, '2026-09-02', 202, 50),
(1003, 101, '2026-09-05', 203, 80),
(1004, 103, '2026-09-06', 201, 120),
(1005, 104, '2026-09-08', 204, 40),
(1006, 105, '2026-09-10', 202, 70),
(1007, 102, '2026-09-12', 201, 90),
(1008, 106, '2026-09-15', 205, 60),
(1009, 101, '2026-09-18', 202, 30),
(1010, 107, '2026-09-20', 203, 100);


--Question
-- INNER JOIN
-- 1. Show all customers who have placed orders.
SELECT * FROM CUSTOMERS
SELECT * FROM ORDERS
SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    C.Region
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;

--LEFT JOIN
-- 2. Show all customers, including customers who have never placed an order.
SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID;
-- RIGHT JOIN
--Find orders with no matching customer
SELECT
    o.OrderID,
    o.OrderDate,
    o.CustomerID,
    c.CustomerName
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL; --incase we have order but no customer which not possible in the real world a customer must made an order

--RIGHT JOIN 2
--Show all orders and the products purchased
SELECT
    o.OrderID,
    o.OrderDate,
    o.ProductID,
    p.ProductName,
    p.Category,
    o.Quantity
FROM Products p
RIGHT JOIN Orders o
    ON p.ProductID = o.ProductID;

-- RIGHT Join 3
--Find orders with invalid/missing products
SELECT
    o.OrderID,
    o.ProductID,
    o.Quantity,
    p.ProductName
FROM Products p
RIGHT JOIN Orders o
    ON p.ProductID = o.ProductID
WHERE p.ProductID IS NULL;

--RIGHT & LEFT 1
--Show all orders with customer and product information

SELECT
    o.OrderID,
    o.OrderDate,
    c.CustomerName,
    p.ProductName,
    o.Quantity,
    p.UnitPrice
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID
LEFT JOIN Products p
    ON o.ProductID = p.ProductID;

  --RIGHT & LEFT 2  
  --The company wants to audit its order records. Find all orders that have either an invalid CustomerID or an invalid ProductID. Display the OrderID, CustomerID, ProductID, CustomerName and ProductName.

    SELECT
    o.OrderID,
    o.CustomerID,
    o.ProductID,
    c.CustomerName,
    p.ProductName
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID
LEFT JOIN Products p
    ON o.ProductID = p.ProductID
WHERE c.CustomerID IS NULL
   OR p.ProductID IS NULL;

-- JOIN three tables
-- 3. Show the customer, order and product purchased.
SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    p.ProductName,
    o.Quantity
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID;

-- JOIN + calculated column
-- 4. Calculate the total value of each order.
SELECT
    c.CustomerName,
    o.OrderID,
    p.ProductName,
    o.Quantity,
    p.UnitPrice,
    o.Quantity * p.UnitPrice AS OrderValue
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID;

-- JOIN + WHERE
-- 5. Show only Urea orders.
SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    p.ProductName,
    o.Quantity
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
WHERE p.ProductName = 'Urea Fertilizer';

 --JOIN + GROUP BY
-- 6. How much quantity has each customer ordered?
SELECT
    c.CustomerName,
    SUM(o.Quantity) AS TotalQuantity
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
--OR
--Total sales value by customer
SELECT
    c.CustomerName,
    SUM(o.Quantity * p.UnitPrice) AS TotalSales
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY c.CustomerName;

-- LEFT JOIN + GROUP BY
--Find customers who have never placed an order.
SELECT
    c.CustomerID,
    c.CustomerName
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Find the top 3 customers by total sales value.
SELECT top 3
    c.CustomerName,
    SUM(o.Quantity * p.UnitPrice) AS TotalSales
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSales DESC

--UNION, UNION ALL, INTERSECTION
--first table creation
CREATE table Table1(
id int,
empname varchar(20)
)

--second table creation
CREATE table Table2(
id int,
empname varchar(20)
)

--Insert record to table 1 and table 2

Insert into table1 values (1,'blessing'),(2,'joy'),(3,'Phillip')
Insert into table2 values (1,'paul'),(3,'Phillip'),(5,'pelumi')

-- union
select * from table1  union select * from table2
--union all
select * from table1 union all select * from table2
--intersection
select * from table1 intersect select * from table2;
