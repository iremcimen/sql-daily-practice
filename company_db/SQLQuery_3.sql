USE Company_DB
GO

--/ UNION --

-- Ayný yapýda iki ayrý sorgunun sonuçlarýný alt alta koyar.
-- Sadece farklý(distinct) deðerleri döndürür.
-- Sütunlarýn veri tipleri ayný olmalý.(string-string, int-int)
-- SELECT lerde ayný sayýda sütun kullanýlmalý


-- Çalýþan ve proje isimlerini tek listede gösterir. (Tekrarsýz)
SELECT FirstName FROM employee
UNION
SELECT ProjectName FROM projects
ORDER BY FirstName;


--/ UNION ALL --

-- Çalýþan ve proje isimlerini tek listede gösterir. (Tekrarlý)
SELECT FirstName FROM employee
UNION ALL
SELECT ProjectName FROM projects
ORDER BY FirstName;
 

--/ GROUP BY --

-- Departmanlarda çalýþan toplam çalýþan sayýlarý
SELECT COUNT(EmployeeID) [Total Employee], Department
FROM employee
GROUP BY Department
ORDER BY [Total Employee];


-- Projelerde çalýþan toplam çalýþan sayýlarý
SELECT p.ProjectName, COUNT(e.EmployeeID) [Total Employee]
FROM projects p
LEFT JOIN employee e
ON p.EmployeeID = e.EmployeeID
GROUP BY p.ProjectName
ORDER BY [Total Employee] DESC, p.ProjectName ASC;


--/ HAVING --

-- Çalýþan sayýsý 1000den fazla olan departmanlarý listele
SELECT COUNT(EmployeeID), Department
FROM employee
GROUP BY Department
HAVING COUNT(EmployeeID) > 1000
ORDER BY COUNT(EmployeeID) DESC;


-- 30dan fazla proje yapan çalýþaný olan departmanlar
SELECT e.Department, COUNT(DISTINCT e.EmployeeID)
FROM employee e
INNER JOIN projects p
ON e.EmployeeID = p.EmployeeID
GROUP BY e.Department
HAVING COUNT(DISTINCT e.EmployeeID) > 30
ORDER BY COUNT(DISTINCT e.EmployeeID) DESC;


-- Her departmanda proje yapan kaç çalýþan var
SELECT e.Department, COUNT(DISTINCT e.EmployeeID)
FROM employee e
INNER JOIN projects p
ON e.EmployeeID = p.EmployeeID
GROUP BY e.Department
ORDER BY COUNT(DISTINCT e.EmployeeID) DESC;


-- Departmanlardaki çalýþan sayýlarý
SELECT COUNT(EmployeeID), Department
FROM employee
GROUP BY Department
ORDER BY COUNT(EmployeeID) DESC;


-- Seçilen departmanlarda ne kadar proje yapýlmýþ 10dan fazla ise getir
SELECT e.Department, COUNT(p.EmployeeID)
FROM employee e
INNER JOIN projects p
ON e.EmployeeID = p.EmployeeID
WHERE Department IN ('Finance', 'Sales')
GROUP BY Department
HAVING COUNT(p.EmployeeID) > 10;
