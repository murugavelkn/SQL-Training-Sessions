-- GROUP BY
-- Group By Clause used for Aggregate functions Like COUNT(), AVG(), MAX(), MIN().. like this.
-- Group By used when using aggregate functions with list os Column Names to group by the value based on the list of columns.
-- Agregate functions are used for the value colums like INT / FLOAT


SELECT SUM(orderQty)
FROM [Sales].[SalesOrderDetail]   -- No GROUP BY used in this query because no grouping columnName


-- GROUP BY
SELECT ProductID, SUM(orderQty)
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID         -- GROUP BY USED because grouping ColumnName (ProductID) Listed.


-- GROUP BY
SELECT ProductID, SUM(orderQty)
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
ORDER BY ProductID    -- GROUP BY Result ORDER By using Grouping ColumnName.

-- GROUP BY
SELECT ProductID, SUM(orderQty)
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
ORDER BY ProductID

-- GROUP BY
SELECT ProductID, SUM(orderQty)
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
ORDER BY ProductID DESC

-- GROUP BY
SELECT ProductID, SUM(orderQty) AS TotalQty
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
ORDER BY ProductID

SELECT ProductID, SUM(orderQty) AS TotalQty
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
ORDER BY SUM(orderQty)


SELECT TOP 5 ProductID, SUM(orderQty) AS TotalQty
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
ORDER BY SUM(orderQty) DESC

SELECT AVG(orderqty) AS avgQty
FROM [Sales].[SalesOrderDetail]

SELECT ProductID, AVG(orderqty) AS avgQty
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID

SELECT ProductID, MAX(orderqty) AS avgQty
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID

SELECT ProductID, MIN(orderqty) AS avgQty
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
