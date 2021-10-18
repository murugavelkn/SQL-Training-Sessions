
-- ORDER BY - Concept
-- Syntax:

SELECT * FROM <table_name>
ORDER BY <ColunmName1>,<ColumnName2>...<ColumnNameN> [ASC/DESC]
-- Note : Default ORDER is Ascending Order. If Need to Order by Descending then use to specify DESC 



SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID

-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID asc

-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID DESC

-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID, SalesOrderID

-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID, SalesOrderID DESC

-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID asc, SalesOrderID DESC

-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID desc, SalesOrderID

SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID DESC
