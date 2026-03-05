USE sales_db
GO

--/ EXISTS --

-- En az bir ürünü 300 dolardan ucuz olan tedarikçileri var mý?
SELECT SupplierID, SupplierName
FROM suppliers
WHERE EXISTS (SELECT ProductID
			FROM products
			WHERE products.SupplierID = suppliers.SupplierID
			AND price < 300);

-- JOIN ile yazýlmýþ hali ?
SELECT DISTINCT s.SupplierName
FROM suppliers s
JOIN products p
ON s.SupplierID = p.SupplierID
WHERE p.Price < 300;


--/ ANY -- 
-- Bir kolunun alt sorguda dönen listeyle karþýlaþtýrýlmasýdýr

-- Alt sorgu deðerlerinden HERHANGÝ BÝRÝ koþulu saðlýyorsa TRUE deðerini döndürür.
-- "=ANY" kullanýmý pratikte IN ile eþdeðerdir

-- Quantity'si 10 olan herhangi bir sipariþte geçen ürünleri getir
SELECT ProductName
FROM products
WHERE productID IN (SELECT ProductID
FROM orderdetails
WHERE Quantity = 10
);


--/ ALL --
-- Alt sorgudaki tüm deðerler koþulu karþýlýyorsa TRUE deðerini döndürür.


-- Tüm ürün adlarýný listeler
SELECT ALL ProductName
FROM products
WHERE 1=1;   -- ' 1=1 herbir satýrý getir demek'

-- OrderDetails tablosundaki tüm kayýtlarýn Quantity deðeri 10 ise ProductName'i listeler.
SELECT ProductName
FROM products
WHERE ProductID = ALL
	(SELECT ProductID
	FROM orderdetails
	WHERE Quantity = 10);


--/ SELECT INTO --
--Verileri bir tablodan yeni oluþturulan bir tabloya kopyalar

-- Müþteriler tablosunun yedek kopyasýný oluþturur.
SELECT * INTO customers_backup
FROM customers;

-- Önceden var olan baþka bir veritabanýndaki yeni bir tabloya kopyalanýr.
SELECT *
INTO  Company_DB.dbo.customers_backup_1
FROM sales_db.dbo.customers;

-- Yeni bir tabloya yalnýzca birkaç sütunu kopyalar.
SELECT CustomerName, ContactName INTO customers_backup_1
FROM customers;

-- Alman müþterileri yeni bir tabloya kopyalar
SELECT * INTO customers_germany
FROM customers
WHERE Country = 'Germany';

-- Tüm müþteriler ve sipariþi olanlarda orderID dolu olarak gelir ve tabloya eklenir
SELECT customers.CustomerName, orders.OrderID INTO customers_order_backup1
FROM customers
LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID;

-- Sadece tablonun yapýsýný kopyalar (kolonlar ayný ama içinde data yok)
SELECT * INTO template_table
FROM customers
WHERE 1=0;


--/ INSERT INTO --
-- Verileri bir tablodan kopyalayýp var olan baþka bir tabloya ekler

-- Tedarikçiler tablosundaki seçilen sütunlardaki verileri müþteriler tablosundaki seçilen sütunlara kopyalayýn
INSERT INTO customers (CustomerName, City, Country)
SELECT SupplierName, City, Country
FROM suppliers;

-- Müþteriler tablosuna yalnýzca Alman tedarikçileri kopyalayýn
INSERT INTO customers (CustomerName, City, Country)
SELECT SupplierName, City, Country
FROM suppliers
WHERE Country = 'Germany';

