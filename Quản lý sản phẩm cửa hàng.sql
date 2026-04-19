-- 1. Thêm 5 sản phẩm vào bảng bằng lệnh INSERT
INSERT INTO Product (name, category, price, stock) VALUES
('Laptop Dell Inspiron', 'Điện tử', 18500000, 10),
('iPhone 13', 'Điện tử', 15900000, 7),
('Tai nghe Bluetooth', 'Điện tử', 950000, 25),
('Máy giặt LG', 'Điện tử', 8900000, 5),
('Bàn học sinh', 'Nội thất', 1200000, 15);

-- 2. Hiển thị danh sách toàn bộ sản phẩm
SELECT * 
FROM Product;

-- 3. Hiển thị 3 sản phẩm có giá cao nhất
SELECT * 
FROM Product
ORDER BY price DESC
LIMIT 3;

-- 4. Hiển thị các sản phẩm thuộc danh mục "Điện tử" có giá nhỏ hơn 10,000,000
SELECT * 
FROM Product
WHERE category = 'Điện tử'
  AND price < 10000000;

-- 5. Sắp xếp sản phẩm theo số lượng tồn kho tăng dần
SELECT * 
FROM Product
ORDER BY stock ASC;