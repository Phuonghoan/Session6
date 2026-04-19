Create Employee (
	id Serial Primary key,
	full_name VARCHAR(100),
	department VARCHAR(50),
	salary Numeric(10,2),
	hire_date DATE
);

-- 1. Thêm 6 nhân viên mới
INSERT INTO Employee (full_name, department, salary, hire_date) VALUES
('Nguyễn Văn An', 'IT', 8500000, '2023-01-15'),
('Trần Thị Bình', 'HR', 7200000, '2022-11-20'),
('Lê Hoàng Anh', 'IT', 9500000, '2023-05-10'),
('Phạm Minh Châu', 'Marketing', 6800000, '2023-08-01'),
('Võ Quốc An', 'Sales', 5900000, '2023-03-25'),
('Bùi Thanh Hà', 'IT', 12000000, '2024-01-12');

-- 2. Cập nhật mức lương tăng 10% cho nhân viên thuộc phòng IT
UPDATE Employee
SET salary = salary * 1.10
WHERE department = 'IT';

-- 3. Xóa nhân viên có mức lương dưới 6,000,000
DELETE FROM Employee
WHERE salary < 6000000;

-- 4. Liệt kê các nhân viên có tên chứa chữ "An" (không phân biệt hoa thường)
SELECT *
FROM Employee
WHERE full_name ILIKE '%An%';

-- 5. Hiển thị các nhân viên có ngày vào làm việc trong khoảng từ '2023-01-01' đến '2023-12-31'
SELECT *
FROM Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';