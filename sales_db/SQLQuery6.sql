USE sales_db
GO

--/ SQL KISITLAMALARI (CONSTRAINTS) --

-- Bir tabloya girebilecek veri türünü sýnýrlamak için kullanýlýr.

-- PRIMARY KEY: NOT NULL ve UNIQUE'in birleþimidir. Tablodaki her satýrý benzersiz bir þekilde tanýmlar.
-- FOREIGN KEY: Tablolar arasýndaki baðlantýlarý bozacak eylemleri önler.
-- CHECK: Bir sütundaki deðerlerin belirli bir koþulu karþýladýðýndan emin olur.
-- DEFAULT: Herhangi bir deðer belirtilmezse, bir sütun için varsayýlan bir deðer belirler.
-- CREATE INDEX: Veritabanýndan çok hýzlý bir þekilde veri oluþturmak ve almak için kullanýlýr.


--/ NOT NULL --
-- Bir sütunun NULL deðerleri kabul etmemesini saðlar.

-- clients tablosu oluþturulurken ID, LastName ve FirstName sütunlarýnýn NULL deðer kabul etmemesini saðlar.
CREATE TABLE clients (
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255) NOT NULL,
Age int
);


-- clients tablosu zaten oluþturulmuþken Age sütununa NOT NULL kýsýtlamasý eklenir.

ALTER TABLE clients
ALTER COLUMN Age int NOT NULL;


--/ UNIQUE --
-- Bir sütundaki tüm deðerlerin birbirinden farklý olmasýný saðlar.

-- persons tablosu oluþturulurken ID sütununa UNIQUE kýsýtlamaSI getirilir.
CREATE TABLE persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);


-- Birden fazla sütun üzerinde kýsýtlama tanýmlanabilir.
-- ID + LastName birlikte unique olsun. (1-KAYA, 1-DEMÝR, 2-KAYA vs.)
CREATE TABLE persons2 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UniquePerson UNIQUE (ID, LastName)
);


-- Tablo zaten oluþturulmuþken ID sütununa UNIQUE kýsýtlamasý eklemek.
ALTER TABLE persons2
ADD UNIQUE (Age);


-- Tablo zaten oluþturulmuþken birden fazla sütun üzerinde kýsýtlama tanýmlanabilir.
ALTER TABLE persons2
ADD CONSTRAINT UniquePerson2 UNIQUE (ID, LastName);


-- Oluþturulan bir kýsýtlamayý kaldýrmak.
ALTER TABLE persons2
DROP CONSTRAINT UniquePersons2;


--/ Foreign Key --
-- Tablolar arasýndaki baðlantýlarý bozacak eylemleri önlemek için kullanýlýr.
-- Foreign Key, bir tablodaki baþka bir tablonun birincil anahtarýný temsil eder.


-- orders5 tablosu oluþturulurken CustomerID sütununda bir foreign key oluþturulur.
CREATE TABLE orders5 (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    CustomerID tinyint FOREIGN KEY REFERENCES customers(CustomerID)
);


-- orders6 tablosu oluþturulurken CustomerID sütunu için, bir foreign key kýsýtlamasý tanýmlanýr.
CREATE TABLE orders6 (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    CustomerID tinyint,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (CustomerID)
    REFERENCES customers(CustomerID)
);


-- orders tablosu zaten oluþturulmuþken PersonsID sütununa bir foreign key kýsýtlamasý eklenir.
ALTER TABLE orders5
ADD FOREIGN KEY (PersonID)
REFERENCES persons(PersonID);


-- orders tablosu zaten oluþturulmuþken PersonsID sütununa FK_PersonOrder ismiyle foreign key kýsýtlamasý eklenir.
ALTER TABLE orders3
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES persons(PersonID);


--Ýsmini kullanarak foreign keyi silmek.
-- ALTER TABLE orders3
-- DROP FOREIGN KEY FK_PersonOrder;


--/ CHECK --
-- Bir sütuna CHECK kýsýtlamasý tanýmlarsak bu sütun için yalnýzca belirli deðerlere izin verilir.

-- Tabloyu oluþtururken, CHECK kýsýtlamasýyla yaþ deðerinin 18 ve üzeri olmasý þartý getirilir.
CREATE TABLE persons5 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);

-- Birden fazla sütun üzerinde CHECK kýsýtlamasý tanýmlanabilir
CREATE TABLE persons6 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHECK_PersonAge CHECK (Age>=18 AND City='Sandnes')
);

-- Tablo zaten oluþturulmuþsa yine kýsýtlama eklenebilir.
ALTER TABLE persons5
ADD CHECK (Age >= 18);

-- Kýsýtlamaya isim vererek tanýmlama.
ALTER TABLE persons6
ADD CONSTRAINT CHECK_PersonAge CHECK (Age>=18 AND City='Sandnes');

-- CHECK kýsýtlamasýný ismini kullanarak bir tablodan kaldýrma.
ALTER TABLE persons6
DROP CONSTRAINT CHECK_PersonAge;

--