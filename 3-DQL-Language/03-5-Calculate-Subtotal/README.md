How to calculate Subtotals in SQL Queries
------------------------------------------

In this article, we will learn how to calculate and add a subtotal in SQL queries.

Introduction
------------

A subtotal is a figure that shows the sum of similar sets of data but it does not indicate the final total. Subtotals are mainly used in sales, finance, and accounting reports. At the same time, we can notice this figure commonly in the receipts and they commonly locate before tax.

![Subtotal in a receipt ](https://www.sqlshack.com/wp-content/uploads/2021/07/subtotal-in-a-receipt.png)

Calculating a subtotal in SQL query can be a bit complicated than the common aggregate queries. However, SQL Server offers some GROUP BY extensions that help us to resolve this issue. In the next section of this article, we will discover these extensions which help to calculate a subtotal in SQL query.

Pre-Requirement
---------------

In the following examples of the article, we will use the SalesList sample table and the following query helps to create this example table and it will also populate some sample data to this table.


```MySQL
CREATE TABLE SalesList (SalesMonth NVARCHAR(20), SalesQuartes  VARCHAR(5), SalesYear  SMALLINT, SalesTotal MONEY)
GO
INSERT INTO  SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'March','Q1',2019,60)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'March','Q1',2020,50)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'May','Q2',2019,30)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'July','Q3',2020,10)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'November','Q4',2019,120)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'October','Q4',2019,150)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'November','Q4',2019,180)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'November','Q4',2020,120)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'July','Q3',2019,160)
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'March','Q1',2020,170)
GO
SELECT  * FROM SalesList
```

![Create an example table in SQL Server](https://www.sqlshack.com/wp-content/uploads/2021/07/create-an-example-table-in-sql-server-e1627645960329.png)


Understanding ROLLUP extension
------------------------------

The GROUP BY statement is used to groups the rows that have the same values in a new summary row and it is the lead actor of the aggregate queries. ROLLUP, CUBE, and GROUPING SETS are extensions of the GROUP BY statement and add the extra subtotal and grand total rows to the resultset. In order to calculate a subtotal in SQL query, we can use the ROLLUP extension of the GROUP BY statement. The **ROLLUP** extension allows us to generate hierarchical subtotal rows according to its input columns and it also adds a grand total row to the result set. For example, the **GROUP BY ROLLUP (SalesYear)** statement only adds the grand total of all years to the result set but the GROUP BY ROLLUP (SalesYear, SalesQuartes) statement will add the following extra rows to the result set.

```sh
SalesYear,NULL -> Subtotal  
NULL ,NULL -> Grand total
```

As the last point, related to the ROLLUP extension, the subtotal combination will depend on the passed column parameters. In order to understand this concept better, we will look at the following examples:

**Example-1:**

```MySQL
SELECT  SalesYear, SUM(SalesTotal) AS SalesTotal FROM SalesList GROUP BY ROLLUP(SalesYear)
```    
![Calculating and adding a grandtotal into a query](https://www.sqlshack.com/wp-content/uploads/2021/07/calculating-and-adding-a-grandtotal-into-a-query-e1627645928310.png)


We can see an extra row at the end of the result set, this row shows the grand total sales of the years without considering the sales month and quarters.

**Example-2:**

In this example, we will pass two different columns as a parameter to the ROLLUP. In this case, the ROLLUP adds the extra subtotals and a grand total row into the resultset.

```MySQL
SELECT  SalesYear,SalesQuartes, SUM(SalesTotal) AS SalesTotal
    FROM SalesList GROUP BY ROLLUP(SalesYear, SalesQuartes)
```

![How to use ROLLUP extension in T-SQL](https://www.sqlshack.com/wp-content/uploads/2021/07/how-to-use-rollup-extension-in-t-sql-e1627644677400.png)


In the result set of the query, the rows that are marked with numbers 1 and 2 indicate the subtotals by the years. The row marked with the number 3 shows the grand total of the whole sales of the years.

**Example-3:**

In this example, we will pass 3 columns into the ROLLUP extension and then this extension will generate subtotal rows for all hierarchies.

```MySQL
SELECT  SalesYear,SalesQuartes,SalesMonth ,SUM(SalesTotal) AS SalesTotal
FROM SalesList GROUP BY ROLLUP(SalesYear, SalesQuartes, SalesMonth)
```

![Using ROLLUP extension for multiple columns](https://www.sqlshack.com/wp-content/uploads/2021/07/using-rollup-extension-for-multiple-columns-e1627645877103.png)


Understanding GROUPING function
-------------------------------

The GROUPING function is used to determine whether the columns in the GROUP BY list have been aggregated. Therefore, we can use this function to identify the NULL values and replace them.

```MySQL
SELECT SalesYear,
SalesQuartes,
SUM(SalesTotal) AS SalesTotal ,
GROUPING(SalesQuartes) AS SalesQuarterGrp,
GROUPING(SalesYear) AS SYearGrp
FROM SalesList
GROUP BY ROLLUP(SalesYear, SalesQuartes)
```

![Using GROUPING  function in T-SQL](https://www.sqlshack.com/wp-content/uploads/2021/07/using-grouping-function-in-t-sql-e1627645838667.png)


As we can see, grouped rows are determined by GROUPING functions. Now we will use the SQL CASE statement and GROUPING function together so that we will replace NULL values with more meaningful explanations.

```MySQL
SELECT
CASE
WHEN GROUPING(SalesQuartes)=1 AND GROUPING(SalesYear)=0
THEN 'SubTotal'
WHEN GROUPING(SalesQuartes)=1 AND GROUPING(SalesYear)=1
THEN
'Grand Total'
ELSE
CAST(SalesYear AS varchar(10))
END
AS SalesYear,
SalesQuartes,
SUM(SalesTotal) AS SalesTotal
FROM SalesList
GROUP BY ROLLUP(SalesYear,SalesQuartes)
```

![How to use the GROUPING  function  in a query](https://www.sqlshack.com/wp-content/uploads/2021/07/how-to-use-the-grouping-function-in-a-query-e1627645802963.png)


As a result, we added a subtotal and grand total row to the result set with help of the ROLLUP extension.

Calculate subtotal in SQL query only for one column
---------------------------------------------------

For some cases, we may require to add a subtotal in SQL query for only one column. In this circumstance, we can use the ROW_NUMBER() and NEWID() function together to handle this issue. The reason for this combo usage is to add a unique number to each row and then we will use that numbered row for grouping.

```MySQL
SELECT SalesMonth,SalesTotal ,
ROW_NUMBER() OVER(ORDER BY NEWID()) AS RowNumber FROM SalesList
```

![How to calculate a subtotal for one column](https://www.sqlshack.com/wp-content/uploads/2021/07/how-to-calculate-a-subtotal-for-one-column-e1627645770641.png)


As a second step, we are required to work on this result set temporarily to aggregate sales amount and adding the extra subtotals rows. CTE (Common Table Expressions) can the best choice because it allows us to define temporarily named result sets.

```MySQL
WITH CTE AS (
SELECT SalesMonth,SalesTotal ,
ROW_NUMBER() OVER(ORDER BY NEWID())
AS RowNumber FROM SalesList
)

SELECT
    RowNumber ,SalesMonth,SUM(SalesTotal) AS SalesTotal
FROM CTE
GROUP BY ROLLUP(SalesMonth, RowNumber)
```

![Filtering final total in a query](https://www.sqlshack.com/wp-content/uploads/2021/07/filtering-final-total-in-a-query.png)


In this result set, we need to remove the RowNumber column and only show the SalesMonth column and its’ subtotal rows.

```MySQL
WITH CTE AS (
SELECT SalesMonth,SalesTotal ,
ROW_NUMBER() OVER(ORDER BY NEWID())
AS RowNumber FROM SalesList
)

SELECT  
CASE WHEN GROUPING(RowNumber) =1 THEN 'SubTotal'
ELSE

    SalesMonth
    END AS SalesMonth,SUM(SalesTotal) AS SalesTotal
FROM CTE
GROUP BY ROLLUP(SalesMonth, RowNumber)
```

![ROLLUP extension with subtotal](https://www.sqlshack.com/wp-content/uploads/2021/07/rollup-extension-with-subtotal-e1627645732232.png)


In this data set, the row that appears as yellow is not a subtotal row, so we need to avoid that row from appearing in the resulting output of our query. To do this, we will again use the GROUPING function and filter this row.

```MySQL
WITH CTE AS (
SELECT SalesMonth,SalesTotal ,
ROW_NUMBER() OVER(ORDER BY NEWID())
AS RowNumber FROM SalesList
)

SELECT  
CASE WHEN GROUPING(RowNumber) =1 THEN 'SubTotal'
ELSE

    SalesMonth
    END AS SalesMonth,SUM(SalesTotal) AS SalesTotal
FROM CTE
GROUP BY ROLLUP(SalesMonth, RowNumber)
HAVING GROUPING(SalesMonth) = 0
```

![Calculating a subtotal for one column](https://www.sqlshack.com/wp-content/uploads/2021/07/calculating-a-subtotal-for-one-column-e1627645691948.png)


As seen in the result set, we add a subtotal in SQL query with help of the ROLLUP extension.

Using GROUPING SET extension as an alternative method
-----------------------------------------------------

GROUPING SETS is another GROUP BY extension and it allows us to display multiple grouping set in one query. Such as, when we want to display monthly and quarterly sales in one result set we can use the UNION ALL statement but this would be an impractical method.

```MySQL
SELECT NULL AS SalesQuarter, SalesMonth,
SUM(SalesTotal) AS SalesTotal
FROM  SalesList
GROUP BY SalesMonth
UNION ALL
    SELECT  SalesQuartes, NULL AS SalesMonth,
SUM(SalesTotal) AS SalesTotal
FROM  SalesList
GROUP BY SalesQuartes
```

![How to use GROUPING SET extension in T-SQL](https://www.sqlshack.com/wp-content/uploads/2021/07/how-to-use-grouping-set-extension-in-t-sql-e1627645659964.png)


GROUPING SETS extension can create the same result set with only a single query.

```MySql
SELECT  
SalesQuartes,SalesMonth ,
SUM(SalesTotal) AS SalesTotal
FROM SalesList
    GROUP BY GROUPING SETS(SalesQuartes,SalesMonth)
```    

![Using GROUPING SET extension in T-SQL](https://www.sqlshack.com/wp-content/uploads/2021/07/using-grouping-set-extension-in-t-sql-e1627645622430.png)


At the same time, we can use GROUPING SETS to add subtotal in SQL query. Through the following query, we can create the subtotals.

```MySql
SELECT
CASE
WHEN GROUPING(SalesQuartes)=1 AND GROUPING(SalesYear)=0
THEN 'SubTotal'
WHEN GROUPING(SalesQuartes)=1 AND GROUPING(SalesYear)=1
THEN
'Grand Total'
ELSE
CAST(SalesYear AS varchar(10))
END
AS SalesYear,
SalesQuartes,
SUM(SalesTotal) AS SalesTotal
FROM SalesList
GROUP BY GROUPING SETS(SalesYear,(SalesYear,SalesQuartes),())
```

![Using GROUPING SET and ROLLUP similarties](https://www.sqlshack.com/wp-content/uploads/2021/07/using-grouping-set-and-rollup-similarties-e1627645579445.png)


Conclusion
----------

In this article, we have learned the usage of the ROLLUP and GROUPING SETS extensions to calculate subtotals in SQL queries.
