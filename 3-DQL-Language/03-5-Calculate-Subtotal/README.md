
In this article, we will learn how to calculate and add a subtotal in SQL queries.

Introduction
------------

A subtotal is a figure that shows the sum of similar sets of data but it does not indicate the final total. Subtotals are mainly used in sales, finance, and accounting reports. At the same time, we can notice this figure commonly in the receipts and they commonly locate before tax.

![Subtotal in a receipt ](https://www.sqlshack.com/wp-content/uploads/2021/07/subtotal-in-a-receipt.png)

Calculating a subtotal in SQL query can be a bit complicated than the common aggregate queries. However, SQL Server offers some GROUP BY extensions that help us to resolve this issue. In the next section of this article, we will discover these extensions which help to calculate a subtotal in SQL query.

Pre-Requirement
---------------

In the following examples of the article, we will use the SalesList sample table and the following query helps to create this example table and it will also populate some sample data to this table.

![SQL-01](SQL-Source/01-SQL-Query.sql)

![Create an example table in SQL Server](/wp-content/uploads/2021/07/create-an-example-table-in-sql-server-e1627645960329.png)

![Create an example table in SQL Server](/wp-content/uploads/2021/07/create-an-example-table-in-sql-server-e1627645960329.png)

Understanding ROLLUP extension
------------------------------

The GROUP BY statement is used to groups the rows that have the same values in a new summary row and it is the lead actor of the aggregate queries. ROLLUP, CUBE, and GROUPING SETS are extensions of the GROUP BY statement and add the extra subtotal and grand total rows to the resultset. In order to calculate a subtotal in SQL query, we can use the ROLLUP extension of the GROUP BY statement. The **ROLLUP** extension allows us to generate hierarchical subtotal rows according to its input columns and it also adds a grand total row to the result set. For example, the **GROUP BY ROLLUP (SalesYear)** statement only adds the grand total of all years to the result set but the GROUP BY ROLLUP (SalesYear, SalesQuartes) statement will add the following extra rows to the result set.

SalesYear,NULL -> Subtotal  
NULL ,NULL -> Grand total

As the last point, related to the ROLLUP extension, the subtotal combination will depend on the passed column parameters. In order to understand this concept better, we will look at the following examples:

**Example-1:**

|     |     |
| --- | --- |
| 1<br><br>2 | SELECTSalesYear,  SUM(SalesTotal)  AS  SalesTotal  FROM  SalesList<br><br>GROUP  BY  ROLLUP(SalesYear) |

![Calculating and adding a grandtotal into a query](/wp-content/uploads/2021/07/calculating-and-adding-a-grandtotal-into-a-query-e1627645928310.png)

![Calculating and adding a grandtotal into a query](/wp-content/uploads/2021/07/calculating-and-adding-a-grandtotal-into-a-query-e1627645928310.png)

We can see an extra row at the end of the result set, this row shows the grand total sales of the years without considering the sales month and quarters.

**Example-2:**

In this example, we will pass two different columns as a parameter to the ROLLUP. In this case, the ROLLUP adds the extra subtotals and a grand total row into the resultset.

|     |     |
| --- | --- |
| 1<br><br>2 | SELECTSalesYear,SalesQuartes,  SUM(SalesTotal)  AS  SalesTotal<br><br>FROM  SalesList  GROUP  BY  ROLLUP(SalesYear,  SalesQuartes) |

![How to use ROLLUP extension in T-SQL](/wp-content/uploads/2021/07/how-to-use-rollup-extension-in-t-sql-e1627644677400.png)

![How to use ROLLUP extension in T-SQL](/wp-content/uploads/2021/07/how-to-use-rollup-extension-in-t-sql-e1627644677400.png)

In the result set of the query, the rows that are marked with numbers 1 and 2 indicate the subtotals by the years. The row marked with the number 3 shows the grand total of the whole sales of the years.

**Example-3:**

In this example, we will pass 3 columns into the ROLLUP extension and then this extension will generate subtotal rows for all hierarchies.

|     |     |
| --- | --- |
| 1<br><br>2 | SELECTSalesYear,SalesQuartes,SalesMonth  ,SUM(SalesTotal)  AS  SalesTotal<br><br>FROM  SalesList  GROUP  BY  ROLLUP(SalesYear,  SalesQuartes,  SalesMonth) |

![Using ROLLUP extension for multiple columns](/wp-content/uploads/2021/07/using-rollup-extension-for-multiple-columns-e1627645877103.png)

![Using ROLLUP extension for multiple columns](/wp-content/uploads/2021/07/using-rollup-extension-for-multiple-columns-e1627645877103.png)

Understanding GROUPING function
-------------------------------

The GROUPING function is used to determine whether the columns in the GROUP BY list have been aggregated. Therefore, we can use this function to identify the NULL values and replace them.

|     |     |
| --- | --- |
| 1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7 | SELECT  SalesYear,<br><br>SalesQuartes,<br><br>SUM(SalesTotal)  AS  SalesTotal  ,<br><br>GROUPING(SalesQuartes)  AS  SalesQuarterGrp,<br><br>GROUPING(SalesYear)  AS  SYearGrp<br><br>FROM  SalesList<br><br>GROUP  BY  ROLLUP(SalesYear,  SalesQuartes) |

![Using GROUPING  function in T-SQL](/wp-content/uploads/2021/07/using-grouping-function-in-t-sql-e1627645838667.png)

![Using GROUPING  function in T-SQL](/wp-content/uploads/2021/07/using-grouping-function-in-t-sql-e1627645838667.png)

As we can see, grouped rows are determined by GROUPING functions. Now we will use the SQL CASE statement and GROUPING function together so that we will replace NULL values with more meaningful explanations.

|     |     |
| --- | --- |
| 1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8<br><br>9<br><br>10<br><br>11<br><br>12<br><br>13<br><br>14<br><br>15 | SELECT<br><br>CASE<br><br>WHEN  GROUPING(SalesQuartes)=1  AND  GROUPING(SalesYear)=0<br><br>THEN  'SubTotal'<br><br>WHEN  GROUPING(SalesQuartes)=1  AND  GROUPING(SalesYear)=1<br><br>THEN<br><br>'Grand Total'<br><br>ELSE<br><br>CAST(SalesYear  AS  varchar(10))<br><br>END<br><br>AS  SalesYear,<br><br>SalesQuartes,<br><br>SUM(SalesTotal)  AS  SalesTotal<br><br>FROM  SalesList<br><br>GROUP  BY  ROLLUP(SalesYear,SalesQuartes) |

![How to use the GROUPING  function  in a query](/wp-content/uploads/2021/07/how-to-use-the-grouping-function-in-a-query-e1627645802963.png)

![How to use the GROUPING  function  in a query](/wp-content/uploads/2021/07/how-to-use-the-grouping-function-in-a-query-e1627645802963.png)

As a result, we added a subtotal and grand total row to the result set with help of the ROLLUP extension.

Calculate subtotal in SQL query only for one column
---------------------------------------------------

For some cases, we may require to add a subtotal in SQL query for only one column. In this circumstance, we can use the ROW_NUMBER() and NEWID() function together to handle this issue. The reason for this combo usage is to add a unique number to each row and then we will use that numbered row for grouping.

|     |     |
| --- | --- |
| 1<br><br>2 | SELECT  SalesMonth,SalesTotal  ,<br><br>ROW_NUMBER()  OVER(ORDER  BY  NEWID())  AS  RowNumber  FROM  SalesList |

![How to calculate a subtotal for one column](/wp-content/uploads/2021/07/how-to-calculate-a-subtotal-for-one-column-e1627645770641.png)

![How to calculate a subtotal for one column](/wp-content/uploads/2021/07/how-to-calculate-a-subtotal-for-one-column-e1627645770641.png)

As a second step, we are required to work on this result set temporarily to aggregate sales amount and adding the extra subtotals rows. CTE (Common Table Expressions) can the best choice because it allows us to define temporarily named result sets.

|     |     |
| --- | --- |
| 1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8<br><br>9<br><br>10 | WITH  CTE  AS  (<br><br>SELECT  SalesMonth,SalesTotal  ,<br><br>ROW_NUMBER()  OVER(ORDER  BY  NEWID())<br><br>AS  RowNumber  FROM  SalesList<br><br>)<br><br>SELECT<br><br>RowNumber  ,SalesMonth,SUM(SalesTotal)  AS  SalesTotal<br><br>FROM  CTE<br><br>GROUP  BY  ROLLUP(SalesMonth,  RowNumber) |

![Filtering final total in a query](/wp-content/uploads/2021/07/filtering-final-total-in-a-query.png)

![Filtering final total in a query](/wp-content/uploads/2021/07/filtering-final-total-in-a-query.png)

In this result set, we need to remove the RowNumber column and only show the SalesMonth column and its’ subtotal rows.

|     |     |
| --- | --- |
| 1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8<br><br>9<br><br>10<br><br>11<br><br>12<br><br>13<br><br>14 | WITH  CTE  AS  (<br><br>SELECT  SalesMonth,SalesTotal  ,<br><br>ROW_NUMBER()  OVER(ORDER  BY  NEWID())<br><br>AS  RowNumber  FROM  SalesList<br><br>)<br><br>SELECT<br><br>CASE  WHEN  GROUPING(RowNumber)  =1  THEN  'SubTotal'<br><br>ELSE<br><br>SalesMonth<br><br>END  AS  SalesMonth,SUM(SalesTotal)  AS  SalesTotal<br><br>FROM  CTE<br><br>GROUP  BY  ROLLUP(SalesMonth,  RowNumber) |

![ROLLUP extension with subtotal](/wp-content/uploads/2021/07/rollup-extension-with-subtotal-e1627645732232.png)

![ROLLUP extension with subtotal](/wp-content/uploads/2021/07/rollup-extension-with-subtotal-e1627645732232.png)

In this data set, the row that appears as yellow is not a subtotal row, so we need to avoid that row from appearing in the resulting output of our query. To do this, we will again use the GROUPING function and filter this row.

|     |     |
| --- | --- |
| 1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8<br><br>9<br><br>10<br><br>11<br><br>12<br><br>13<br><br>14<br><br>15 | WITH  CTE  AS  (<br><br>SELECT  SalesMonth,SalesTotal  ,<br><br>ROW_NUMBER()  OVER(ORDER  BY  NEWID())<br><br>AS  RowNumber  FROM  SalesList<br><br>)<br><br>SELECT<br><br>CASE  WHEN  GROUPING(RowNumber)  =1  THEN  'SubTotal'<br><br>ELSE<br><br>SalesMonth<br><br>END  AS  SalesMonth,SUM(SalesTotal)  AS  SalesTotal<br><br>FROM  CTE<br><br>GROUP  BY  ROLLUP(SalesMonth,  RowNumber)<br><br>HAVING  GROUPING(SalesMonth)  =  0 |

![Calculating a subtotal for one column](/wp-content/uploads/2021/07/calculating-a-subtotal-for-one-column-e1627645691948.png)

![Calculating a subtotal for one column](/wp-content/uploads/2021/07/calculating-a-subtotal-for-one-column-e1627645691948.png)

As seen in the result set, we add a subtotal in SQL query with help of the ROLLUP extension.

Using GROUPING SET extension as an alternative method
-----------------------------------------------------

GROUPING SETS is another GROUP BY extension and it allows us to display multiple grouping set in one query. Such as, when we want to display monthly and quarterly sales in one result set we can use the UNION ALL statement but this would be an impractical method.

|     |     |
| --- | --- |
| 1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8<br><br>9 | SELECT  NULL  AS  SalesQuarter,  SalesMonth,<br><br>SUM(SalesTotal)  AS  SalesTotal<br><br>FROMSalesList<br><br>GROUP  BY  SalesMonth<br><br>UNION  ALL<br><br>SELECTSalesQuartes,  NULL  AS  SalesMonth,<br><br>SUM(SalesTotal)  AS  SalesTotal<br><br>FROMSalesList<br><br>GROUP  BY  SalesQuartes |

![How to use GROUPING SET extension in T-SQL](/wp-content/uploads/2021/07/how-to-use-grouping-set-extension-in-t-sql-e1627645659964.png)

![How to use GROUPING SET extension in T-SQL](/wp-content/uploads/2021/07/how-to-use-grouping-set-extension-in-t-sql-e1627645659964.png)

GROUPING SETS extension can create the same result set with only a single query.

|     |     |
| --- | --- |
| 1<br><br>2<br><br>3<br><br>4<br><br>5 | SELECT<br><br>SalesQuartes,SalesMonth  ,<br><br>SUM(SalesTotal)  AS  SalesTotal<br><br>FROM  SalesList<br><br>GROUP  BY  GROUPING  SETS(SalesQuartes,SalesMonth) |

![Using GROUPING SET extension in T-SQL](/wp-content/uploads/2021/07/using-grouping-set-extension-in-t-sql-e1627645622430.png)

![Using GROUPING SET extension in T-SQL](/wp-content/uploads/2021/07/using-grouping-set-extension-in-t-sql-e1627645622430.png)

At the same time, we can use GROUPING SETS to add subtotal in SQL query. Through the following query, we can create the subtotals.

|     |     |
| --- | --- |
| 1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8<br><br>9<br><br>10<br><br>11<br><br>12<br><br>13<br><br>14<br><br>15 | SELECT<br><br>CASE<br><br>WHEN  GROUPING(SalesQuartes)=1  AND  GROUPING(SalesYear)=0<br><br>THEN  'SubTotal'<br><br>WHEN  GROUPING(SalesQuartes)=1  AND  GROUPING(SalesYear)=1<br><br>THEN<br><br>'Grand Total'<br><br>ELSE<br><br>CAST(SalesYear  AS  varchar(10))<br><br>END<br><br>AS  SalesYear,<br><br>SalesQuartes,<br><br>SUM(SalesTotal)  AS  SalesTotal<br><br>FROM  SalesList<br><br>GROUP  BY  GROUPING  SETS(SalesYear,(SalesYear,SalesQuartes),()) |

![Using GROUPING SET and ROLLUP similarties](/wp-content/uploads/2021/07/using-grouping-set-and-rollup-similarties-e1627645579445.png)

![Using GROUPING SET and ROLLUP similarties](/wp-content/uploads/2021/07/using-grouping-set-and-rollup-similarties-e1627645579445.png)

Conclusion
----------

In this article, we have learned the usage of the ROLLUP and GROUPING SETS extensions to calculate subtotals in SQL queries.

See more
--------

ApexSQL Complete is a [SQL code complete tool](https://www.apexsql.com/sql-tools-complete.aspx?utm_source=sqlshack&utm_campaign=complete&utm_medium=native_link&utm_content=sql-shack) that includes features like code snippets, SQL auto-replacements, tab navigation, saved queries and more for SSMS and Visual Studio

[![](https://www.apexsql.com/images/blog-footer-banners/ApexSQL Fundamentals Banner 2.jpg)](https://shop.quest.com/682/purl-apexsql-fundamentals-toolkit-pd?x-adcode=sqlshkbnr)

* [Author](#abh_about)
* [Recent Posts](#abh_posts)

[![Esat Erkec](https://s33046.pcdn.co/wp-content/uploads/gravatar/esat_erkec.png)<br>![Esat Erkec](https://s33046.pcdn.co/wp-content/uploads/gravatar/esat_erkec.png)](https://www.sqlshack.com/author/esat-erkec/ "Esat Erkec")

[Esat Erkec](https://www.sqlshack.com/author/esat-erkec/)

Esat Erkec is a SQL Server professional who began his career 8+ years ago as a Software Developer. He is a SQL Server Microsoft Certified Solutions Expert.  

Most of his career has been focused on SQL Server Database Administration and Development. His current interests are in database administration and Business Intelligence. You can find him on [LinkedIn](https://www.linkedin.com/in/esat-erke%C3%A7-22433882/).  

[View all posts by Esat Erkec](/author/esat-erkec/)

[![Esat Erkec](https://s33046.pcdn.co/wp-content/uploads/gravatar/esat_erkec.png)<br>![Esat Erkec](https://s33046.pcdn.co/wp-content/uploads/gravatar/esat_erkec.png)](https://www.sqlshack.com/author/esat-erkec/ "Esat Erkec")

Latest posts by Esat Erkec ([see all](https://www.sqlshack.com/author/esat-erkec/))

* [SQL LEFT function in queries](https://www.sqlshack.com/sql-left-function-in-queries/) \- October 22, 2021
* [How to use SQL Check Constraints](https://www.sqlshack.com/how-to-use-sql-check-constraints/) \- October 15, 2021
* [Monitoring SQL Server blocking problems](https://www.sqlshack.com/monitoring-sql-server-blocking-problems/) \- October 12, 2021

### Related posts:

1.  [GROUP BY ROLLUP for Data Analysis](https://www.sqlshack.com/group-by-rollup-for-data-analysis/ "GROUP BY ROLLUP for Data Analysis")
2.  [Develop your extensions for Azure Data Studio](https://www.sqlshack.com/develop-your-extensions-for-azure-data-studio/ "Develop your extensions for Azure Data Studio")
3.  [Static and Dynamic SQL Pivot and Unpivot relational operator overview](https://www.sqlshack.com/static-and-dynamic-sql-pivot-and-unpivot-relational-operator-overview/ "Static and Dynamic SQL Pivot and Unpivot relational operator overview")
4.  [Revisión del operador relacional y descripción general de Pivot y Unpivot estático y dinámico de SQL](https://www.sqlshack.com/es/revision-del-operador-relacional-y-descripcion-general-de-pivot-y-unpivot-estatico-y-dinamico-de-sql/ "Revisión del operador relacional y descripción general de  Pivot y Unpivot estático y dinámico de SQL")
5.  [Data science in SQL Server: Data analysis and transformation – grouping and aggregating data II](https://www.sqlshack.com/data-science-in-sql-server-data-analysis-and-transformation-grouping-and-aggregating-data-ii/ "Data science in SQL Server: Data analysis and transformation – grouping and aggregating data II")
