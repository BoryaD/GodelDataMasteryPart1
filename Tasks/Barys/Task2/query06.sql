--Query 6
SELECT 
    SH.CustomerID,
    P.Name as BikeName,
    SH.OrderDate,
    SH.OnlineOrderFlag
FROM Sales.SalesOrderHeader SH
JOIN Sales.SalesOrderDetail SD 
    ON SD.SalesOrderID = SH.SalesOrderID
JOIN Production.Product P 
    ON P.ProductID = SD.ProductID
JOIN Production.ProductSubcategory PS 
    ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN Production.ProductCategory PC 
    On PC.ProductCategoryID = PS.ProductCategoryID
WHERE 
    SH.OrderDate = '2013-01-01'
    AND 
    SH.OnlineOrderFlag = 1
    AND 
    PC.Name='Bikes'
ORDER BY SH.CustomerID
;
