CREATE OR ALTER FUNCTION
dbo.Fibonacci (@n INTEGER)
RETURNS INTEGER
AS 
BEGIN
declare @n0 INTEGER = 0, @n1 INTEGER = 1, @fib INTEGER, @i INTEGER = 0
SET @n = @n-1
--pierwsze dwa wyrazy sa w n0 i n1
WHILE @i< @n
BEGIN 
--SELECT @ciag = CAST(@n0 AS varchar(20)) + ',' + CAST(@n1 AS varchar(20))
SET @fib = @n0 + @n1
SET @n0 = @n1
SET @n1 = @fib
--SELECT @ciag = @ciag + CAST(@fib AS varchar(20))
SET @i = @i +1
END
RETURN @fib
END;
select dbo.Fibonacci(5);

CREATE OR ALTER PROCEDURE 
dbo.fibo (@n INTEGER)
AS
BEGIN
DECLARE @i INTEGER =1, @ciag INTEGER, @n0 INTEGER = 0, @n1 INTEGER = 1, @print VARCHAR(80)
PRINT @n0
PRINT @n1
WHILE @i <= @n
BEGIN 
SET @ciag = dbo.Fibonacci(@i)
SET @print = CAST(@ciag AS VARCHAR)
SET @i = @i + 1
PRINT @print 
END
END;
EXEC fibo 

--zad2
DROP TRIGGER [Person].[caps]

GO
CREATE OR ALTER TRIGGER caps
ON [Person].[Person] 
AFTER DELETE
AS
BEGIN
SELECT UPPER(LastName) as nazwisko
FROM [Person].[Person]
END
INSERT INTO [Person].[BusinessEntity](rowguid) VALUES (NEWID())
INSERT INTO [Person].[Person] VALUES (20778, 'IN', 0, NULL, 'Carol', 'M', 'Cook', NULL, 2, NULL, NULL,
'1773C8F3-2CC7-4826-A7F5-30D3F36543CB', GETDATE())
DELETE FROM [Person].[Person] WHERE BusinessEntityID = 20778;


--zad3

GO
CREATE TRIGGER taxRateMonitoring
ON [Sales].[SalesTaxRate]
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT i.TaxRate, d.TaxRate FROM deleted AS d
	INNER JOIN Inserted AS i
	ON d.TaxRate * 1.3 < i.TaxRate OR d.TaxRate * 0.7 > i.TaxRate) 
print 'Blad! Za duza zmiana wartosci'
END

UPDATE Sales.SalesTaxRate
SET TaxRate = 20 WHERE SalesTaxRateID = 1