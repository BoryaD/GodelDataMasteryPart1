--Query 5
SELECT DISTINCT
    P.BusinessEntityID,
    P.LastName,
    CASE 
        WHEN PT.Name = 'Cell' THEN Ph.PhoneNumber
        ELSE NULL
    END AS PhoneNumber
FROM Person.Person P
JOIN Person.PersonPhone Ph 
    ON P.BusinessEntityID = Ph.BusinessEntityID
JOIN Person.PhoneNumberType PT 
    ON PT.PhoneNumberTypeID = Ph.PhoneNumberTypeID
JOIN HumanResources.Employee E 
    ON P.BusinessEntityID = E.BusinessEntityID
;
