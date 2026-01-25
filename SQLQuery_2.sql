USE Company_DB
GO

-- JOIN:
-- Birden fazla tablodaki satýrlarý, ortak bir sütuna göre birleþtirmek için kullanýlýr. 


--/ INNER JOIN --
-- Her iki tabloda da eþleþen deðerlere sahip kayýtlarý döndürür.

-- Projelerin çalýþanlarý kim, baþlangýç tarhileri ne?
SELECT employee.EmployeeID, projects.ProjectName, projects.StartDate
FROM projects
INNER JOIN employee
ON projects.EmployeeID = employee.EmployeeID;

-- Çalýþanlarýn hangi projeleri var, baþlangýç tarhileri ne?
SELECT e.EmployeeID, p.ProjectName, p.StartDate
FROM employee e
INNER JOIN projects p
ON e.EmployeeID = p.EmployeeID;

-- Projedeki çalýþanlarýn rolleri ve bulunduklarý departmanlar
SELECT p.ProjectName, e.EmployeeID, p.ProjectRole, e.Department AS [Employee Department]
FROM projects p
JOIN employee e
ON p.EmployeeID = e.EmployeeID
ORDER BY p.ProjectName ASC;


--/ LEFT JOIN --
-- Sol tablodaki(tablo_1) tüm kayýtlarý ve sað tablodaki(tablo_2) eþleþen kayýtlarý döndürür.

-- Tüm çalýþanlarý listele. Projesi olanlarýn proje adýný göster, projesi olmayanlar da listede kalsýn.
SELECT e.*, p.ProjectName
FROM employee e
LEFT JOIN projects p 
ON e.EmployeeID = p.EmployeeID
ORDER BY p.ProjectName DESC;


--/ RIGHT JOIN --
--Sað tablodaki(tablo_2) tüm kayýtlarý ve sol tablodaki(tablo_1) eþleþen kayýtlarý döndürür.

-- Tüm projeleri listele. Projeye atanmýþ bir çalýþan varsa ad–soyadýný göster, yoksa proje yine de listede kalsýn.
SELECT e.FirstName, e.LastName, p.*
FROM employee e
RIGHT JOIN projects p
ON e.EmployeeID = p.EmployeeID
ORDER BY P.ProjectName DESC;


--/ FULL JOIN --
-- Sol veya sað tabloda eþleþme olduðunda tüm kayýtlarý döndürür.

-- Projeleri de, çalýþanlarý da kaybetmeden listele. Eþleþenler eþleþsin, eþleþmeyenler de NULL ile gelsin.
SELECT p.*, e.*
FROM projects p
FULL JOIN employee e
ON p.EmployeeID = e.EmployeeID
ORDER BY ProjectName DESC;


--/ Self Join --
-- Normal bir birleþtirme iþlemidir, ancak tablo kendisiyle birleþtirilir.

--
SELECT A.EmployeeID, B.EmployeeID, A.Department
FROM employee A, employee B;