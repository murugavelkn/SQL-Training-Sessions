```SQL
-- ORDER BY - Concept
-- Syntax:


SELECT * FROM <table_name>
ORDER BY <ColunmName1>,<ColumnName2>...<ColumnNameN> [ASC/DESC]
-- Note : Default ORDER is Ascending Order. If Need to Order by Descending then use to specify DESC
```

```SQL
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID
```

```SQL
-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID asc
```

```SQL
-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID DESC
```

```SQL
-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID, SalesOrderID
```

```SQL
-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID, SalesOrderID DESC
```

```SQL
-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID asc, SalesOrderID DESC
```

```SQL
-- ORDER BY
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID desc, SalesOrderID
```

```SQL
SELECT *
FROM [Sales].[SalesOrderDetail]
ORDER BY ProductID DESC
```
