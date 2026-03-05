USE pizza_sales_db
GO

SELECT TOP 1000 *
FROM pizza_sales;

--Toplam kaç pizza sipariþ edilmiþ?
SELECT SUM(quantity) total_pizza_orders
FROM pizza_sales;

-- Toplam kaç sipariþ alýnmýþ?
SELECT COUNT(DISTINCT order_id) total_orders
FROM pizza_sales;

-- Toplam ne kadar kazanç elde edilmiþ?
SELECT SUM(total_price) total_revenue
FROM pizza_sales;

-- En çok hangi pizzadan satýlmýþ?
SELECT pizza_name, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC;

-- En az hangi pizzadan satýlmýþ?
SELECT pizza_name, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;

-- En çok kazanç getiren pizza hangisi?
SELECT pizza_name, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC;

-- En çok hangi pizza boyutundan satýlmýþ ?
SELECT pizza_size, SUM(quantity) total_sold
FROM pizza_sales
GROUP BY pizza_size
ORDER BY SUM(quantity) DESC;

-- En çok hangi kategoriden pizza satýlmýþ?
SELECT pizza_category, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY SUM(quantity) DESC;

-- En çok hangi ayda gelir saðlanmýþ?
SELECT order_month, SUM(total_price) AS total_sold
FROM pizza_sales
GROUP BY order_month
ORDER BY SUM(total_price) DESC;

-- En çok hangi kategoriden gelir elde edilmiþ?
SELECT pizza_category, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY SUM(total_price) DESC;

-- Pizza kategorilerindeki en pahalý pizzalar
SELECT pizza_category, MAX(unit_price) AS max_price
FROM pizza_sales
GROUP BY pizza_category
ORDER BY MAX(unit_price) DESC;

-- En pahalý pizza hangisi?
SELECT DISTINCT pizza_name, unit_price
FROM pizza_sales
ORDER BY unit_price DESC;

-- Günlük kazançlar ne kadar ?
SELECT order_date, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date ASC;

-- Haftanýn hangi günü daha yoðun?
SELECT DATENAME(WEEKDAY, order_date) AS day_name, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY revenue DESC;

-- Günün hangi saati daha yoðun ?
SELECT DATEPART(HOUR, order_time) AS order_hour, COUNT(DISTINCT order_id) AS order_count
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_hour;

-- Herbir sipariþte kaç pizza söylenmiþ ?
SELECT order_id, SUM(quantity) AS pizza_count
FROM pizza_sales
GROUP BY order_id;

-- Sipariþ baþýna ortalama pizza sayýsý
SELECT AVG(pizza_count) AS avg_pizza_per_order
FROM (
SELECT order_id, SUM(quantity) AS pizza_count
FROM pizza_sales
GROUP BY order_id
)pizza_sales;
