
-- 2021-09-19 - Training Session
-- DDL - Data Defenition Language ------------------------------

CREATE TABLE Employee (
   Empno NVARCHAR(10),
   EmpName NVARCHAR(155),
   DOB DATE,
   Salary NUMERIC(20,2),
   MGR NVARCHAR(10),
   age NUMERIC(3)
)


 ALTER TABLE dbo.Employee
 ALTER COLUMN age FLOAT

 ALTER TABLE dbo.Employee
 ALTER COLUMN Salary FLOAT

 ALTER TABLE dbo.Employee
 ADD  Designation NVARCHAR(55)

 ALTER TABLE dbo.Employee
 DROP COLUMN Designation


 DROP TABLE dummy


 --  DML - Data Manipulation Language ------------------------
 --Syntax
 INSERT INTO <tableName> (Column list) VALUES(ValueList)

 -- Query Execution
INSERT INTO dbo.Employee ( Empno,EmpName,DOB,Salary,MGR,age) VALUES ('10003148','Murugavel','2021-09-13',55555.55,'10003333',15)

SELECT * FROM dbo.Employee

-- Insert more than one record into the table
INSERT INTO dbo.Employee ( Empno,EmpName,DOB,Salary,MGR,age) VALUES ('10003148','Murugavel','2021-09-13',55555.55,'10003333',15.55),
('10003149','Murug','2021-09-13',55555.55,'10003333',15.55),
 ('10003150','Muruga','2021-09-13',55555.55,'10003333',15.55),
 ('10003151','Mvel','2021-09-13',55555.55,'10003333',15.55)



 -- Syntax
 DELETE FROM <TblName> [WHERE <Condition>]

 -- Query Execution
 DELETE FROM Employee --WHERE Empno = '10003148'

 
 -- Syntax
 UPDATE <tblName> SET <colName> = <Value> [WHERE <Condition>]

 -- Query Execution
 UPDATE dbo.Employee
 SET Salary = 5000.50
 WHERE Empno = '10003149'








-- 2021-09-22

-- SESSION 2 :
-- DQL - Data Query Language
-- 

-- Syntax
SELECT <clause>, Aggregatefun()/CalculativeColumn AS <Alias Name>
FROM <clause>
{WHERE <clause> | HAVING <Condition> -- for aggregatefunction to filter }
{ORDER BY Columnname1, columnname2,...[ASC/DESC]}   -- Called as sorting asc :=  Min to Max;  Desc : = Max to Min
{GROUP BY ColunmName2, ColumnName2,...} -- can be use when aggregate function involves 
										-- COUNT(), SUM(),MAX(),MIN().AVG(),...
										-- with colunmName1,columName2...


--/*------------------------------------------------------------------------
SELECT <columnname1, columname2, columnname3...... 
FROM <TABLE NAME>
WHERE <Conditions>

conditions := condition1 + condition2 + condition3
??  AND / OR

--/*----------------------
SELECT SalesOrderID, SalesOrderDetailID, ProductID, OrderQty
FROM [Sales].[SalesOrderDetail]


-- AND Condition
SELECT * 
FROM [Sales].[SalesOrderDetail] 
WHERE ProductID = 712 AND orderQty > 4 AND orderQty <=8 AND ModifiedDate = '2012-06-30'


-- BETWEEN
SELECT *
FROM [Sales].[SalesOrderDetail] 
WHERE ProductId = 712 AND ORDERQty BETWEEN 4 AND 8 AND ModifiedDate BETWEEN '2012-01-01' AND '2012-03-15'


-- OR
SELECT * 
FROM [Sales].[SalesOrderDetail]
WHERE ProductID = 712 OR ProductID = 711

-- IN

SELECT * 
FROM [Sales].[SalesOrderDetail]
WHERE ProductID  IN (711,712)


--NOT IN

SELECT * 
FROM [Sales].[SalesOrderDetail]
WHERE ProductID NOT IN (711,712)


-- ORDER BY
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


-- GROUP BY
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


-- HAVING clause
/*
1. WHERE clause not used with Aggregate function
2. Aggregate function filters are used by using HAVING condition (Ex. Count(SalesOrderQty) > 2500) Clause
3. WHERE Clause should after FROM Clause
4. HAVING Clause should after GROUP BY 
*/

SELECT ProductID, COUNT(SalesOrderID) AS cnt
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
HAVING COUNT(SalesOrderID) > 2500
ORDER BY COUNT(SalesOrderID) desc
 

 --/* End of this Session ------------------------------------------ 2021-09-22 -------
 
 
 
 
 -- 2021-09-29

-- SESSION : 3

-- Multiple Tables in the Query

SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,T1.[ProductID]
	  ,T2.Name AS ProductName
	  ,T2.ProductNumber AS BatchNo
	  ,T2.SafetyStockLevel AS SOH
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
   
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] AS T1, [AdventureWorks2016_DEV].[Production].[Product] AS T2
  WHERE T1.ProductID = T2.ProductID 


/*
   JOINS - for multiple tables

   1. LEFT JOIN / LEFT OUTER JOIN 
   2. RIGHT JOIN / RIGHT OUTER JOIN
*/

   --1. LEFT JOIN /LEFT OUTER JOIN  instead of WHERE Clause

SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,LT.[ProductID]
	  ,RT.Name AS [ProductName]
	  ,RT.ProductNumber as  BatchNo
	  ,RT.SafetyStockLevel as SOH
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] AS  LT
  LEFT OUTER JOIN [AdventureWorks2016_DEV].[Production].[Product] AS RT ON RT.ProductID = LT.ProductID


  -- Alias Name without 'AS'
  SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,LT.[ProductID]
	  ,RT.Name  [ProductName]
	  ,RT.ProductNumber   BatchNo
	  ,RT.SafetyStockLevel  SOH
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail]   LT
  LEFT OUTER JOIN [AdventureWorks2016_DEV].[Production].[Product]  RT ON RT.ProductID = LT.ProductID



-- Arranging Column Information 
SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,LT.[ProductID]
	  ,RT.Name AS [ProductName]
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
	  ,RT.ProductNumber as  BatchNo
	  ,RT.SafetyStockLevel as SOH
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] AS  LT
  LEFT OUTER JOIN [AdventureWorks2016_DEV].[Production].[Product] AS RT ON RT.ProductID = LT.ProductID




 SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,LT.[ProductID]
	  ,RT.Name AS [ProductName]
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
	  ,RT.ProductNumber as  BatchNo
	  ,RT.SafetyStockLevel as SOH
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] AS  LT
  LEFT JOIN [AdventureWorks2016_DEV].[Production].[Product] AS RT ON RT.ProductID = LT.ProductID


  -- SubQuery for Column Name Mapping from another table

  SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,[ProductID]
	  ,(SELECT P.[Name] FROM [AdventureWorks2016_DEV].[Production].[Product] P WHERE P.ProductID = T.ProductID) ProductName
	  ,(SELECT P.[ProductNumber] FROM [AdventureWorks2016_DEV].[Production].[Product] P WHERE P.ProductID = T.ProductID) Batch
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] T


  -- SubQuery in WHERE Clause 
  SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,[ProductID]
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] A
  WHERE a.productID IN ( SELECT ProductID FROM [AdventureWorks2016_DEV].[Production].[Product])

  -- Above Query as same this query result
  -- In the above Query First the WHERE Clause subquery executes and gice the list of values to the outer Query.
  -- Ex. Like blow Query.

  SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,[ProductID]
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] A
  WHERE a.productID IN (980,365,771,404)

  -- Subquery for NOT IN the Master Query (Outer Query)
  SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,[ProductID]
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] A
  WHERE a.productID NOT IN ( SELECT ProductID FROM [AdventureWorks2016_DEV].[Production].[Product])

  -- This will return as the above Query Result.
  SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,[ProductID]
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_DEV].[Sales].[SalesOrderDetail] A
  WHERE a.productID NOT IN (980,365,771,404)

  --//-----  End of the Session --------------------------------------------
  
  
  
  
 -- 2021-10-11
 -- SESSION  :  4  - SUBQUERIES 


-- SubQueries used in two places
-- 1. Column level
-- 2. for Where Clause


-- Column Level SubQuery

SELECT *
, (SELECT B.CIF FROM [KuwaitSales_DEV].[dbo].[KWItemMaster] AS B WHERE B.ItemCode = A.ItemCode AND YEAR = 2021 AND month = 9 ) CIFCal
FROM [MasterData_DEV].[dbo].tblCountrySales AS A
WHERE country = 'KW'


SELECT *
, (SELECT B.CIF FROM [KuwaitSales_DEV].[dbo].[KWItemMaster] AS B WHERE B.ItemCode = A.ItemCode AND YEAR = 2021 AND month = 9 ) CIFCal
,(SELECT Exrate FROM [MasterData_DEV].[dbo].[tblBdgExRate] WHERE Country ='KW') ExRate
FROM [MasterData_DEV].[dbo].tblCountrySales AS A
WHERE country = 'KW'

SELECT *
, (SELECT B.CIF FROM [KuwaitSales_DEV].[dbo].[KWItemMaster] AS B WHERE B.ItemCode = A.ItemCode AND YEAR = 2021 AND month = 9 ) CIFCal
,(SELECT Exrate FROM [MasterData_DEV].[dbo].[tblBdgExRate] WHERE Country ='KW') ExRate
, (SELECT B.CIF FROM [KuwaitSales_DEV].[dbo].[KWItemMaster] AS B WHERE B.ItemCode = A.ItemCode AND YEAR = 2021 AND month = 9 ) * (SELECT Exrate FROM [MasterData_DEV].[dbo].[tblBdgExRate] WHERE Country ='KW') CIFAED
FROM [MasterData_DEV].[dbo].tblCountrySales AS A
WHERE country = 'KW'



-- WHERE Clause

-- This Query is executing by Specifying year and month by user.

SELECT * FROM [MasterData_DEV].[dbo].tblCountrySales
WHERE country = 'AE' AND YEAR(Doc_Dt) = 2021 AND MONTH(Doc_Dt) > 8


-- Same as used based on the table which has the values to satisfy the conditions by using SubQuery. (Dynamic Values to the Query)

SELECT * FROM [MasterData_DEV].[dbo].tblCountrySales
--WHERE country = 'AE' AND YEAR(Doc_Dt) = 2021 AND MONTH(Doc_Dt) > 8
WHERE YEAR(Doc_dt) = (SELECT SealedYear FROM  [MasterData_DEV].dbo.[Countrylist] WHERE Country = 'AE') AND MONTH(Doc_Dt) = (SELECT SealedMonth+2 FROM [MasterData_DEV].dbo.[CountryList] WHERE country ='AE')


-- End of Session : 4 ----------------- : 12/10/2021 : -------------



-- 2021-10-17.

-- WorkBook Tasks.

Write SQL Query for the following to display output related to each task. Fetch the Query command and past it under each task as answer.


1. Show Customer Name and Customer Area detail only from Customer Master in Jordan DB for all the customers.

2. Show the Itemcode, Description, oldcode, and Jdescription for the Country UAE for the Items mebo from tblCntryProdCodeMaps in MasterData

3. Show the brand name on which country for the oldcode 121101.1. Use tblCntryProdCodeMaps table from MasterData DB.

4. Show the Countries belong to the oldcodes 121215.3, 121118.4, 122133.1, 123306.1, 121618.2, 123107.3 by country. Use tblCntryProdCodeMaps table from MasterData DB.

5. Show the Countries belong to the oldcodes 121215.3, 121118.4, 122133.1, 123306.1, 121618.2, 123107.3 by oldcode. Use tblCntryProdCodeMaps table from MasterData DB.

6. Show the Sales for the Country OMAN for August month of this year by using vwCountrySales by date wise.

7. show total quantity, total CIFSalesvalue in AED, total SalesAfterDiscount in AED and NetSales value in AED for KSA Country, UAE Country, OMAN Country in One table by using vwCountrySales by date wise.

8. Show Material Code (SAP Code) from SAPCodeMap table in MasterData for every Sales transaction made by the countries Kuwait, Algeria, Lebanon for the month of October from this year. 
   Use vwCountrySales view by country wise and date wise. Use Joins for the output.

9. Show Item Details from tblCntryProdCodeMaps table for the countries other than UAE, OMAN, KSA, Algeria.

10. Show the total Netsales Value, total SalesAfterDiscount, total CIFSalesvalue in Currency type AED for the closing month September for this year except Lebanon 

--//---------------- END of Task ---------------------------  