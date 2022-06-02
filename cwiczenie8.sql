--zad1
--adventureWorks2019
WITH Temp_Employee_info (ID, tytul, imie, drugie, nazwisko, stawka) AS
(
SELECT a.BusinessEntityID, a.Title, a.FirstName, a.MiddleName, a.LastName, s.Rate
FROM [Person].[Person] a
LEFT OUTER JOIN [HumanResources].[EmployeePayHistory] s
ON a.BusinessEntityID = s.BusinessEntityID
)
SELECT *
FROM dane_pracownikow_CTE;


SELECT *
FROM HumanResources.EmployeePayHistory; --st¹d zabrac id i stawke
SELECT *
FROM Person.Person; --st¹d zabrac ID, tytu³, imiê, drugie imie, nazwisko, 


--AdventureWorksLT2019
--zad2
WITH Customer_Sales_CTE (CompanyContact, Revenue) AS
(
SELECT CONCAT(a.CompanyName, ' (', a.FirstName, ' ', a.LastName, ')'), s.TotalDue
FROM [SalesLT].[Customer] a
JOIN [SalesLT].[SalesOrderHeader] s
ON a.CustomerID = s.CustomerID
)
SELECT *
FROM Customer_Sales_CTE;

--zad3
WITH Categories_Value_CTE (Category, SalesValue) AS
(
SELECT a.Name,	SUM(CONVERT(MONEY, t.LineTotal))
FROM [SalesLT].[ProductCategory] a
JOIN [SalesLT].[Product] s
ON a.[ProductCategoryID] = s.[ProductCategoryID]
JOIN [SalesLT].[SalesOrderDetail] t
ON t.ProductID = s.ProductID
GROUP BY a.Name
)
SELECT *
FROM Categories_Value_CTE

select *
from SalesLT.Product
