Create table Customer (
	id Serial Primary key,
	name VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(20),
	point INT
);

-- 1. Thêm 7 khách hàng (trong đó có 1 người không có email)
INSERT INTO Customer (name, email, phone, points) VALUES
('Nguyễn Văn An', 'an.nguyen@gmail.com', '0901234567', 120),
('Trần Thị Bình', 'binh.tran@gmail.com', '0912345678', 250),
('Lê Hoàng Nam', 'nam.le@gmail.com', '0923456789', 180),
('Phạm Thu Hà', NULL, '0934567890', 90),
('Võ Minh Khang', 'khang.vo@gmail.com', '0945678901', 300),
('Bùi Ngọc Anh', 'anh.bui@gmail.com', '0956789012', 210),
('Đặng Gia Huy', 'huy.dang@gmail.com', '0967890123', 150);

-- 2. Truy vấn danh sách tên khách hàng duy nhất
SELECT DISTINCT name
FROM Customer;

-- 3. Tìm các khách hàng chưa có email
SELECT *
FROM Customer
WHERE email IS NULL;

-- 4. Hiển thị 3 khách hàng có điểm thưởng cao nhất, bỏ qua khách hàng cao điểm nhất
SELECT *
FROM Customer
ORDER BY points DESC
LIMIT 3 OFFSET 1;

-- 5. Sắp xếp danh sách khách hàng theo tên giảm dần
SELECT *
FROM Customer
ORDER BY name DESC;