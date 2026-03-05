USE sales_db
GO

--/ CASE:

-- if-else mantığıyla çalışan koşullu bir ifadedir.
-- Koşulları yukarıdan aşağıya kontrol eder
-- İlk doğru olan koşulda durur. O koşula ait sonucu döndürür
-- Hiçbir koşul sağlanmazsa: ELSE varsa → onu döndürür. ELSE yoksa → NULL döner

/*
- Gerçek hayatta nerede kullanılır?
-Sipariş büyüklüğü sınıflandırma
-Raporlama etiketleri
-Dashboard metinleri
-BI tool (Power BI, Tableau) backend sorguları
*/

--Herbir satır için koşulları tek tek inceler ve ilk koşul karşılandığında bir değer döndürür.
SELECT OrderID, Quantity,
CASE
	WHEN Quantity > 30 THEN 'The quantity is greater than 30'
	WHEN Quantity = 30 THEN 'The quantity is 30'
	ELSE 'The quantity is under 30'
END AS QuantityText
FROM orderdetails;

-- Eğer müşterinin City bilgisi varsa City’ye göre sırala, City NULL ise onun yerine Country’ye göre sırala.
SELECT CustomerName, City, Country
FROM customers
ORDER BY
(CASE
	WHEN City IS NULL THEN Country
	ELSE City
END);

--/ ISNULL() --
-- Bir ifadenin NULL olması durumunda alternatif bir değer döndürür.

-- City boşsa Country yaz
SELECT ISNULL(City, Country) AS City
FROM customers;


--/ COALESCE() --
-- Bir ifadenin NULL olması durumunda birden fazla alternatif değer döndürebilir.

SELECT COALESCE(City, Country, 'Unknown') AS City
FROM customers;


--- NOT:
-- ISNULL(), ikinci değerin tipini belirlemek için ilk değerin tipini zorla kullanır
-- ISNULL(), null'ı görünce tipi yok der yerine konacak değerin tipini int yapar
-- ör: ISNULL(NULL, 1.5) = null değer 1 ile değiştirilir

-- COALESCE(), ikinci değerin tipini belirlemek için en mantıklı geniş değeri seçer(decimal-float-int)
-- COALESCE(), birden fazla değer tipi var en yüksek öncelikliden başlayayım der
-- ör: COALESCE(NULL, 1.5) = null değer 1,5 ile değiştirilir