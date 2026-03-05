USE sales_db
GO

--/ Stored Procedure:
-- Kaydedilebilen ve böylece tekrar tekrar kullanabileceðiniz önceden hazýrlanmýþ bir SQL kodudur.


-- customers tablosundaki tüm kayýtlarý seçen "select_all_customers" adlý bir stored procedure oluþturur.
CREATE PROCEDURE select_all_customers
AS
SELECT * FROM customers
GO;

-- Oluþturduðumuz stored prosedürü aþaðýdaki gibi çalýþtýrýrýz.
-- EXEC select_all_customers;


--/ Tek parametreli stored procedure --

-- customers tablosundan belirli bir þehre ait müþterileri seçen bir stored prosedür oluþturur.
CREATE PROCEDURE select_all_customers_city @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;
-- @City NVARCHAR(30) = Bu prosedürün dýþarýdan alacaðý parametreyi tanýmlar.


-- Oluþturduðumuz stored prosedürü aþaðýdaki gibi çalýþtýrýn. Bir þehir adý vererek çalýþtýrýz.
-- EXEC select_all_customers_city @City = 'London';


--/ Birden çok parametreli stored procedure --

-- customers tablosundan belirli bir þehre ve belirli bir posta koduna sahip müþterileri seçen bir saklý prosedür oluþturur.
CREATE PROCEDURE all_customers_city_posta @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM customers WHERE City = @City AND PostalCode = @PostalCode
GO;


-- Oluþturduðunuz stored prosedürü aþaðýdaki gibi çalýþtýrýn:
-- EXEC all_customers_city_posta @City = 'London', @PostalCode = 'WA1 1DP';