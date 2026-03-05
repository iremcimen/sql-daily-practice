-- Yeni bir veritabanı oluşturur.
CREATE DATABASE clients_db;

-- Mevcut veritabanını siler.
-- DROP DATABASE clients_db;

--/ FULL BACKUP:
-- FULL backup, bir veritabanının o andaki TAM halinin yedeğini alır.

-- Mevcut veritabanının tam yedeğini(full backup) oluşturur.
BACKUP DATABASE clients_db
TO DISK = 'C:\SQLBackups\clients_db.bak';
-- “.bak”, SQL Server yedek dosyasının uzantısıdır.


--/ DIFFERENTIAL(fark) BACKUP :

-- Son FULL Backup'tan bu yana değişen verileri yedekler.
BACKUP DATABASE clients_db
TO DISK = 'D:\backups\clients_db.bak'
WITH DIFFERENTIAL;

/*

FULL – DIFF – LOG ilişkisi:
- FULL → temel
- DIFF → FULL’dan farklar
- LOG → anlık değişiklikler (dakika/dakika)

Kurumsalda tipik düzen:
FULL → günde 1
DIFF → günde 1
LOG → 5–15 dk

*/
