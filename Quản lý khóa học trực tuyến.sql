Create table Course (
	id Serial Primary key,
	title VARCHAR(100),
	instructor VARCHAR(50),
	price NUMERIC(10,2),
	duration INT
);

-- 1. Thêm ít nhất 6 khóa học vào bảng
INSERT INTO Course (title, instructor, price, duration) VALUES
('SQL Cơ Bản', 'Nguyễn Văn A', 600000, 20),
('SQL Nâng Cao', 'Trần Thị B', 1200000, 35),
('Python for Data Analysis', 'Lê Minh C', 1800000, 40),
('Web Development Demo', 'Phạm Văn D', 900000, 25),
('Machine Learning', 'Hoàng Thị E', 2000000, 50),
('Excel SQL Report', 'Ngô Văn F', 750000, 15);

-- 2. Cập nhật giá tăng 15% cho các khóa học có thời lượng trên 30 giờ
UPDATE Course
SET price = price * 1.15
WHERE duration > 30;

-- 3. Xóa khóa học có tên chứa từ khóa “Demo”
DELETE FROM Course
WHERE title ILIKE '%Demo%';

-- 4. Hiển thị các khóa học có tên chứa từ “SQL” (không phân biệt hoa thường)
SELECT *
FROM Course
WHERE title ILIKE '%SQL%';

-- 5. Lấy 3 khóa học có giá nằm giữa 500,000 và 2,000,000, sắp xếp theo giá giảm dần
SELECT *
FROM Course
WHERE price BETWEEN 500000 AND 2000000
ORDER BY price DESC
LIMIT 3;