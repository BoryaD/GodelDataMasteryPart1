--Query 8
SELECT
    SSOH.CustomerID,
    PP.FirstName + ' ' + MiddleName + ' ' + PP.LastName AS CustomerFullName,
    PR.Name
FROM Person.Person PP
LEFT JOIN Sales.Customer SC 
    ON PP.BusinessEntityID=SC.PersonID
LEFT JOIN Sales.SalesOrderHeader SSOH 
    ON SC.CustomerID=SSOH.CustomerID
LEFT JOIN Sales.SalesOrderDetail SSOD 
    ON SSOD.SalesOrderID=SSOH.SalesOrderID
LEFT JOIN Production.Product PR 
    ON PR.ProductID=SSOD.ProductID
JOIN Person.BusinessEntityAddress PBEA 
    ON PBEA.BusinessEntityID = PP.BusinessEntityID
JOIN Person.Address PA 
    ON PBEA.AddressID = PA.AddressID
JOIN Person.StateProvince PSP 
    ON PA.StateProvinceID = PSP.StateProvinceID
JOIN Person.CountryRegion AS PCR 
    ON pcr.CountryRegionCode = PSP.CountryRegionCode
WHERE 
    PP.MiddleName = 'R'
    AND
    PCR.Name = 'France'
ORDER BY SSOH.CustomerID, PR.Name
;
