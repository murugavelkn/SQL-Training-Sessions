
-- 1. Show Customer Name and Customer Area detail only from Customer Master in Jordan DB for all the customers.
SELECT [Customer_Name] ,[Area]
FROM [JORDANSALES].[dbo].[JOCustomer]


-- 2. Show the Itemcode, Description, oldcode, and Jdescription for the Country UAE for the Items mebo from tblCntryProdCodeMaps in MasterData
SELECT  [ItemCode]
       ,[Description]
       ,[OldCode]
       ,[JDescription]
FROM [MasterData].[dbo].[tblCntryProdCodeMaps]
WHERE [Country]='AE' AND [Description] LIKE 'MEBO%'


-- 3. Show the brand name on which country for the oldcode 121101.1. Use tblCntryProdCodeMaps table from MasterData DB.
SELECT  [Country], Brand2
FROM [MasterData].[dbo].[tblCntryProdCodeMaps]
WHERE [OldCode]='121101.1'


-- 4. Show the Countries belong to the oldcodes 121215.3, 121118.4, 122133.1, 123306.1, 121618.2, 123107.3 by country. Use tblCntryProdCodeMaps table from MasterData DB.
SELECT  [Country],[oldcode]
FROM [MasterData].[dbo].[tblCntryProdCodeMaps]
WHERE [OldCode] IN ('121215.3','121118.4','122133.1','123306.1','121618.2','123107.3')
GROUP BY [Country],[OldCode]   ORDER BY [Country] DESC


-- 5. Show the Countries belong to the oldcodes 121215.3, 121118.4, 122133.1, 123306.1, 121618.2, 123107.3 by oldcode. Use tblCntryProdCodeMaps table from MasterData DB.
SELECT  [oldcode],[Country]
FROM [MasterData].[dbo].[tblCntryProdCodeMaps]
WHERE [OldCode] IN ('121215.3','121118.4','122133.1','123306.1','121618.2','123107.3')
GROUP BY [Country],[OldCode]   ORDER BY [OldCode] DESC


-- 6. Show the Sales for the Country OMAN for August month of this year by using vwCountrySales by date wise.
SELECT [Doc_Dt]
      ,SUM([SalesQty]) AS SalesQt
      ,SUM([SalesBonusQty]) AS BnsQt
      ,SUM([CIFSalesBonusAED]) AS BnsValueAED
      ,SUM([SalesAfterDiscountAED]) AS SalesAfterDiscountAED
      ,SUM([NetSalesAED]) AS NetSalAED
  FROM [MasterData].[dbo].[vwCountrySales]
  WHERE [Country]='OM' AND YEAR(Doc_Dt)=2021 AND MONTH (Doc_Dt)=8
  GROUP BY Doc_Dt   ORDER BY Doc_Dt


-- 7. show total quantity, total CIFSalesvalue in AED, total SalesAfterDiscount in AED and NetSales value in AED for KSA Country, UAE Country, OMAN Country
--    in One table by using vwCountrySales by date wise.
SELECT [Doc_Dt],[Country]
      ,SUM([SalesQty]) AS SalesQt
      ,SUM(CIFSalesAED) AS CIFSalesAED
      ,SUM([SalesAfterDiscountAED]) AS SalesAfterDiscountAED
      ,SUM([NetSalesAED]) AS NetSalAED
  FROM [MasterData].[dbo].[vwCountrySales]
  WHERE [Country] IN('OM','SA','AE') AND YEAR(Doc_Dt)=2021 AND MONTH (Doc_Dt)=8
  GROUP BY Doc_Dt ,Country   ORDER BY Doc_Dt


-- 8. Show Material Code (SAP Code) from SAPCodeMap table in MasterData for every Sales transaction made by the countries Kuwait, Algeria, Lebanon
--    for the month of October from this year. Use vwCountrySales view by country wise and date wise. Use Joins for the output.
SELECT B.Country, T.[Material Code], B.OldCode, B.Doc_Dt
FROM [MasterData].[dbo].[vwCountrySales] as B
LEFT OUTER JOIN  MasterData.dbo.SAPCodeMap AS T  ON B.OldCode = T.OldCode
WHERE B.[Country] IN('KW','DZ','LB') AND YEAR(Doc_Dt)=2021 AND MONTH (Doc_Dt)=10
GROUP BY Doc_Dt ,B.Country ,B.OldCode,T.[Material Code]   ORDER BY Doc_Dt


-- 9. Show Item Details from tblCntryProdCodeMaps table for the countries other than UAE, OMAN, KSA, Algeria.
SELECT  [ItemCode]
       ,[Description]
       ,[OldCode]
       ,[JDescription]
       ,[Brand]
       ,[Country]
       ,[Brand2]
  FROM [MasterData].[dbo].[tblCntryProdCodeMaps]
  WHERE country NOT IN ('AE','OM','SA','DZ')


-- 10. Show the total Netsales Value, total SalesAfterDiscount, total CIFSalesvalue in Currency type AED
--     for the closing month September for this year except Lebanon
SELECT [Country]
      ,SUM([CIFSalesAED]) AS CIFSalesAED
      ,SUM([SalesAfterDiscountAED]) AS SalesAfterDiscountAED
      ,SUM([NetSalesAED]) AS NetSalesAED
  FROM [MasterData].[dbo].[vwCountrySales]
  WHERE YEAR(Doc_Dt)=2021 AND MONTH(Doc_Dt)=9 AND country <> 'LB'
  GROUP BY [Country]


--//----------------------------- : End of Task - 1. Solution : ----------------------------
