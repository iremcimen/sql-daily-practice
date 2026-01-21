USE Company_DB
GO

--İlk 1000 satırı getir
SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
      ,[Department]
      ,[JobRole]
      ,[Salary]
      ,[YearsAtCompany]
      ,[HireDate]
  FROM [Company_DB].[dbo].[employee]


--/ ORDER BY --

-- Çalışanlar Maaşlarına göre büyükten küçüğe sıralanır
SELECT EmployeeID, FirstName, LastName, Salary FROM employee
ORDER BY Salary DESC;


-- Çalışanlar isimlerine göre artan(a-z), maaş ve çalışma yıllarına göre azalan sırada sıralanır
SELECT EmployeeID, FirstName, YearsAtCompany, Salary FROM employee
ORDER BY FirstName ASC, Salary,YearsAtCompany DESC;


--/ SELECT DISTINCT --

-- Benzersiz iş rollerini öğreniriz
-- (distinct = benzersiz değerleri getirir)
SELECT DISTINCT JobRole FROM employee
ORDER BY JobRole;


-- Kaç çeşit departman olduğunu öğreniriz
SELECT COUNT(DISTINCT Department) AS DepartmentCount
FROM employee;


--/ WHERE --

-- Yaşı 55ten büyük çalışanlar getirilir
SELECT EmployeeID, FirstName, Age
FROM employee
WHERE Age > 55;


-- IT departmanındaki çalışanları getir
SELECT EmployeeID, FirstName FROM employee
WHERE Department = 'IT';


--/ LIKE --

-- BI Analyst olan ve ismi C ile başlayan çalışanlar listelenir
SELECT * FROM employee
WHERE JobRole = 'BI Analyst' AND FirstName LIKE 'C%';

-- LIKE '[BSP]%' = İsimleri B,S,P ile başlayan çalışanlar getirilir.
-- LIKE '[A-F]%' = İsimleri A-B-C-D-E-F ile başlayan çalışanlar getirilir.
-- LIKE 'Bahar' = İsmi Bahar olan çalışanlar getirilir.


--/ AND --

-- Cinsiyeti erkek, yaşı 50'den büyük olan Finans departmanındaki çalışanlar getirilir
SELECT * FROM employee
WHERE Gender = 'Male'
AND AGE > 50
AND Department = 'Finance';


-- İsmi D veya T ile başlayan kadın çalışanları getir
SELECT FirstName, EmployeeID FROM employee
WHERE Gender = 'Female' AND (FirstName LIKE 'D%' OR  FirstName LIKE 'T%');


--/ OR --

-- İş rolü  Team Lead veya Finance Manager olan çalışanları listele
SELECT * FROM employee
WHERE JobRole = 'Team Lead' OR JobRole = 'Finance Manager';


-- Yaşı 30dan küçük olan çalışanlar veya ismi E ile başlayan çalışanlar veya erkek olan çalışanlar listelenir
SELECT * FROM employee
WHERE Age < 30  OR FirstName LIKE 'E%' OR Gender = 'Male';


--/ NOT --

-- Erkek olmayan çalışanları getir
SELECT * FROM employee
WHERE NOT Gender = 'Male';


-- İsmi F ile başlamayan çalışanları getir
SELECT * FROM employee
WHERE FirstName NOT LIKE 'F%'


-- Yaşı 50 ile 60 arasında olmayan çalışanları getir
SELECT * FROM employee
WHERE Age NOT BETWEEN 50 AND 60;


-- Sales, Operations ve Marketing departmanında çalışmayan çalışanları getir
SELECT * FROM employee
WHERE Department NOT IN('Sales', 'Operations', 'Marketing');


-- Yaşı 30dan büyük olmayan çalışanları getir
SELECT * FROM employee
WHERE NOT Age > 30;


--/ INSERT INTO --

-- Tüm sütunlara data ekleyeceksek sütun sırasını bozmadan değerleri yazabiliriz
INSERT INTO employee
VALUES (10001, 'Yağız', 'Türkmen', 25, 'Male', 'IT', 'IT Support', 80100, 3, '2022-01-10');


-- Sütun isimlerini yazarak data girmek data kontrollüdür.
INSERT INTO employee(EmployeeID, FirstName, LastName, Age, Gender, Department, JobRole, Salary, YearsAtCompany, HireDate)
VALUES (10002, 'Çağrı', 'Tufan', 31, 'Male', 'Finance', 'Accountat', 65200, 3, '2022-01-02');


-- Seçtiğimiz bazı sütunlara da data girebiliriz.
INSERT INTO employee(EmployeeID, FirstName, LastName, Gender, Department, HireDate)
VALUES (10003, 'Merve', 'Taş', 'Female', 'HR', '2025-12-10');


-- Birden fazla satıra değer girebiliriz
INSERT INTO employee(EmployeeID, FirstName, LastName, Age, Gender, Department, JobRole, Salary, YearsAtCompany, HireDate)
VALUES
(10004, 'Hakkı', 'Bayır', 25, 'Male', 'IT', 'DBA', 85100, 2, '2023-04-14'),
(10005, 'Yalçın', 'Tek', 25, 'Male', 'Finance', 'Financial Analyst', 70200, 2, '2023-02-25'),
(10006, 'Tarkan', 'Bulut', 25, 'Male', 'Marketing', 'SEO Analyst', 90000, 4, '2021-11-10');


--/ IS NULL --

-- Departman sütunundaki null dataları getirir
SELECT Department
FROM employee
WHERE Department IS NULL; 


--/ IS NOT NULL --

-- Departman kolonundaki null olmayan dataları getirir
SELECT Department
FROM employee
WHERE Department IS NOT NULL; 


--/ UPDATE --

-- Seçtiğimiz çalışanın cinsiyetini ve yaşını güncelledik.
UPDATE employee
SET Gender = 'Female', Age = 29
WHERE EmployeeID = 4685;


-- Şirkette 10 yıldan fazladır bulunan çalışanların maaşları 100000 dolar yapılır
UPDATE employee
SET Salary = 100000
WHERE YearsAtCompany > 10;


--/ DELETE --

-- Seçtiğimiz çalışanın kayıtlarını sildik
DELETE FROM employee
WHERE EmployeeID = 440;


-- Tablonun içini boşaltır. Sadece dataları siler.
DELETE FROM employee;


-- Tabloyu tamamen siler. Datalarla birlikte tabloyu da siler.
DROP TABLE employee;
