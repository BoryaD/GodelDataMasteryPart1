--Query 4
SELECT 
    P.BusinessEntityID,
    P.LastName,
    P.FirstName
FROM Person.Person P
LEFT JOIN Person.BusinessEntityAddress BA 
    ON P.BusinessEntityID = BA.BusinessEntityID
LEFT JOIN Person.AddressType A 
    ON A.AddressTypeID = BA.AddressTypeID
WHERE
    A.Name != 'Home'
    OR		
    A.Name IS NULL
ORDER BY P.BusinessEntityID
;
