-- HAVING clause
/*
1. WHERE clause not used with Aggregate function
2. Aggregate function filters are used by using HAVING condition (Ex. Count(SalesOrderQty) > 2500) Clause
3. In simple query WHERE Clause should be after FROM Clause
4. HAVING Clause should be after GROUP BY Clause.
*/

SELECT ProductID, COUNT(SalesOrderID) AS cnt
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
HAVING COUNT(SalesOrderID) > 2500
ORDER BY COUNT(SalesOrderID) desc


SELECT ProductID, SUM(SalesValue) AS TotalSalesValue
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
HAVING SUM(SalesValue) > 25000
ORDER BY SUM(SalesValue) desc


SELECT ProductID, SUM(SalesValue) AS TotalSalesValue
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
HAVING SUM(SalesValue) > 25000 and SUM(SalesValue) < 100000
ORDER BY SUM(SalesValue) desc


SELECT ProductID, SUM(SalesValue) AS TotalSalesValue
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
HAVING SUM(SalesValue) BETWEEN 25000 AND 100000
ORDER BY SUM(SalesValue) desc
