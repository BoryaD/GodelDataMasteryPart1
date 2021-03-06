--Query 7
SELECT DISTINCT
    SC.CustomerID,
    P.FirstName + ' ' + COALESCE(P.MiddleName+ ' ', '') + P.LastName AS CustomerFullName,
    CASE
        WHEN YEAR(SOI.OrderDate) = '2013' THEN 'Yes'
        ELSE 'No'
    END AS Has_Orders_in_2013
FROM Sales.Customer SC 
LEFT JOIN Sales.SalesOrderHeader SOI 
    ON SC.CustomerID=SOI.CustomerID 
    AND 
    YEAR(SOI.OrderDate) = 2013
JOIN Person.Person P 
    ON SC.PersonID=P.BusinessEntityID
WHERE P.FirstName = 'Zoe'
ORDER BY Sc.CustomerID
;
