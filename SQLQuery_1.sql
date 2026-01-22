USE Company_DB
GO

-- Tüm kayıtları getir
SELECT * FROM employee;

--İlk 1000 satırı getir
SELECT TOP 1000 * FROM employee;


--/ ORDER BY --

-- Çalışanlar Maaşlarına göre büyükten küçüğe sıralanır
SELECT EmployeeID, FirstName, LastName, Salary FROM employee
ORDER BY Salary DESC;


-- Çalışanlar isimlerine göre artan(a-z), maaş ve çalışma yıllarına göre azalan sırada sıralanır
SELECT EmployeeID, FirstName, YearsAtCompany, Salary FROM employee
ORDER BY FirstName ASC, Salary DESC,YearsAtCompany DESC;


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

-- İsmi Me ile başlayan çalışanlar getirilir
SELECT * FROM employee
WHERE FirstName LIKE 'me%';


-- Ö ile başlayıp bir joker karakter sonra tü ile devam eden ve sonra iki joker karakter içeren soyadlara sahip çalıaşnlar
SELECT * FROM employee
WHERE LastName LIKE 'ö_tü__';


-- İçinde L harfi bulunlar isimlere sahip çalışanlar getirilir
SELECT * FROM employee
WHERE FirstName LIKE '%L%';


-- İsmi T ile biten çalışanlar getirilir
SELECT * FROM employee
WHERE FirstName LIKE '%t';


-- İsmi C ile başlayıp T ile biten çalışanlar getirilir
SELECT * FROM employee
WHERE FirstName LIKE 'C%N';


--İsmi E ile başlayıp en az 4 karakter uzunluğunda olan çalışanlar
SELECT * FROM employee
WHERE FirstName LIKE 'E___%';


-- İsmi B, S, K ile başlayan çalışanlar
SELECT * FROM employee
WHERE FirstName LIKE '[bsk]%';


-- İsimleri A-B-C-D-E-F ile başlayan çalışanlar getirilir.
SELECT * FROM employee
WHERE FirstName LIKE '[A-F]%'; 


-- İsmi Ali olan çalışanlar getirilir.
SELECT * FROM employee
WHERE FirstName LIKE 'Ali';


-- BI Analyst olan ve ismi C ile başlayan çalışanlar listelenir
SELECT * FROM employee
WHERE JobRole = 'BI Analyst' AND FirstName LIKE 'C%';


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


-- Tüm verileri siler. Tablo kalır.
DELETE FROM employee;


-- Tabloyu tamamen siler.
-- DROP TABLE employee;


--/ SELECT TOP --

-- employee tablosundan ilk 3 satırı getir
SELECT TOP 3 * FROM employee;


-- Kayıtların ilk yarısını getir
SELECT TOP 50 PERCENT * FROM employee;


-- IT departmanındaki ilk 3 kayıt getirilir
SELECT TOP 3 * FROM employee
WHERE Department = 'IT';


-- Yaşa göre azalan sırada ilk 10 kaydı getir.
SELECT TOP 10 * FROM employee
ORDER BY Age DESC;

---// SQL Aggregate Functions --

--/ MIN -- 

-- Seçilen Salary sütunundaki en küçük değeri getirir
SELECT MIN(Salary) AS MinSalary
FROM employee;


--/ MAX --

-- Seçilen Salary sütunundaki en büyük değeri getirir 
SELECT MAX(Salary) AS MaxSalary
FROM employee;


-- En yüksek kadın maaşı
SELECT MAX(Salary) AS FemaleMaxSalary
FROM employee
WHERE Gender = 'Female';


-- Departmanlardaki en düşük maaşlar
SELECT MIN(Salary) AS MinSalary, Department
FROM employee
GROUP BY Department;


--/ COUNT -- 

-- Tabloda kaç kayıt olduğunu öğreniriz
SELECT COUNT(*) AS [Number of Records]
FROM employee;


-- 59 yaşının üstündeki çalışanların sayısı
SELECT COUNT(EmployeeID)
FROM employee
WHERE Age > 59;


-- Kaç çeşit iş rolü var
SELECT COUNT(DISTINCT JobRole)
FROM employee;


-- Her departmanda kaç çalışan var
SELECT COUNT(*) AS [Number of Employees], Department
FROM employee
GROUP BY Department;


--/ SUM --

-- Çalışanlara ödenen toplam maaş
SELECT SUM(Salary)
FROM employee;


-- Customer Support departmanına ödenen toplam maaş
SELECT SUM(Salary)
FROM employee
WHERE Department = 'Customer Support';


-- Departmanlara ödenen toplam maaşlar
SELECT SUM(Salary) AS [Total Salary], Department
FROM employee
GROUP BY Department;


--/ AVG --

-- Çalışanlara verilen ortalama maaş
SELECT AVG(Salary) AS [AVG Salary]
FROM employee;


-- IT departmanında bir çalışana verilen ortalama maaş
SELECT AVG(Salary)
FROM employee
WHERE Department = 'IT';


-- Ortalama maaştan daha yüksek maaş alan çalışanlar getirilir
SELECT * FROM employee
WHERE Salary > (SELECT AVG(Salary) FROM employee);

-- Bu çalışanların sayısı
SELECT COUNT(*) FROM employee
WHERE Salary > (SELECT AVG(Salary) FROM employee);


-- Departmanlardaki ortalama maaşlar
SELECT AVG(Salary) AS [AVG Salary], Department
FROM employee
GROUP BY Department;
