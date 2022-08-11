```SQL
-- Syntax
SELECT <clause>, Aggregatefun()/CalculativeColumn AS <Alias Name>
FROM <clause>
{WHERE <clause> | HAVING <Condition> -- for aggregatefunction to filter }
{ORDER BY Columnname1, columnname2,...[ASC/DESC]}   -- Called as sorting asc :=  Min to Max;  Desc : = Max to Min
{GROUP BY ColunmName2, ColumnName2,...} -- can be use when aggregate function involves
										-- COUNT(), SUM(),MAX(),MIN().AVG(),...
										-- with colunmName1,columName2...
```

```SQL
--/*------------------------------------------------------------------------
SELECT <columnname1, columname2, columnname3......
FROM <TABLE NAME>
WHERE <Conditions>

conditions := condition1 + condition2 + condition3
??  AND / OR
```

```SQL
--/*----------------------
SELECT SalesOrderID, SalesOrderDetailID, ProductID, OrderQty
FROM [Sales].[SalesOrderDetail]
```

```SQL
-- AND Condition
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE ProductID = 712 AND orderQty > 4 AND orderQty <=8 AND ModifiedDate = '2012-06-30'

```

```SQL
-- BETWEEN
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE ProductId = 712 AND ORDERQty BETWEEN 4 AND 8 AND ModifiedDate BETWEEN '2012-01-01' AND '2012-03-15'

```

```SQL
-- OR
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE ProductID = 712 OR ProductID = 711
```

```SQL
-- IN

SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE ProductID  IN (711,712)

```

```SQL
--NOT IN

SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE ProductID NOT IN (711,712)
```
