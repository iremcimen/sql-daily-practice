USE sales_db
GO

-- Tablonun kendisini deðil içindeki verileri siler.
TRUNCATE TABLE customers;


--/ ALTER TABLE --
-- Tabloya sütun eklemek, silmek veya deðiþtirmek için kullanýlýr.
-- Tabloya kýsýtlamalar eklemek ve kaldýrmak için de kullanýlýr.


-- orders tablosuna OrderName sütununu ekler
ALTER TABLE orders
ADD OrderName varchar(50);


-- orders tablosundan OrderName sütununu siler
ALTER TABLE orders
DROP COLUMN OrderName;


-- orders tablosundaki OrderDate sütun adýný deðiþtirme
EXEC sp_rename 'dbo.orders.OrderDate', 'order_date', 'COLUMN';


-- OrderID sütununun veri tipini deðiþtirir.
ALTER TABLE orders
ALTER COLUMN OrderID int; 
