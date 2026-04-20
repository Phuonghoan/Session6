
Create table Product (
	id Serial Primary key,
	name VARCHAR (100),
	category VARCHAR(50),
	price Numeric(10,2)
);

Create table OrderDetail (
	id Serial Primary key,
	order_id INT,
	product_id INT,
	quantity INT
);

-- 1. Tính tổng doanh thu từng sản phẩm
SELECT 
    p.name AS product_name,
    SUM(p.price * od.quantity) AS total_sales
FROM Product p
JOIN OrderDetail od
    ON p.id = od.product_id
GROUP BY p.id, p.name;

-- 2. Tính doanh thu trung bình theo từng loại sản phẩm
SELECT 
    p.category,
    AVG(p.price * od.quantity) AS avg_sales
FROM Product p
JOIN OrderDetail od
    ON p.id = od.product_id
GROUP BY p.category;

-- 3. Chỉ hiển thị các loại sản phẩm có doanh thu trung bình > 20 triệu
SELECT 
    p.category,
    AVG(p.price * od.quantity) AS avg_sales
FROM Product p
JOIN OrderDetail od
    ON p.id = od.product_id
GROUP BY p.category
HAVING AVG(p.price * od.quantity) > 20000000;

-- 4. Hiển thị tên sản phẩm có doanh thu cao hơn doanh thu trung bình toàn bộ sản phẩm
SELECT product_name
FROM (
    SELECT 
        p.name AS product_name,
        SUM(p.price * od.quantity) AS total_sales
    FROM Product p
    JOIN OrderDetail od
        ON p.id = od.product_id
    GROUP BY p.id, p.name
) t
WHERE total_sales > (
    SELECT AVG(total_sales)
    FROM (
        SELECT 
            SUM(p.price * od.quantity) AS total_sales
        FROM Product p
        JOIN OrderDetail od
            ON p.id = od.product_id
        GROUP BY p.id
    ) x
);

-- 5. Liệt kê toàn bộ sản phẩm và số lượng bán được (kể cả sản phẩm chưa có đơn hàng)
SELECT 
    p.name AS product_name,
    COALESCE(SUM(od.quantity), 0) AS total_quantity_sold
FROM Product p
LEFT JOIN OrderDetail od
    ON p.id = od.product_id
GROUP BY p.id, p.name;