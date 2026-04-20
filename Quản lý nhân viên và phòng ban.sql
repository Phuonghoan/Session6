
Create table Department (
	id Serial Primary key,
	name VARCHAR (50)
);

Create table Employee (
	id Serial Primary key,
	full_name VARCHAR (100),
	department_id INT,
	salary Numeric(10.2)
);

-- 1. Liệt kê danh sách nhân viên cùng tên phòng ban của họ
SELECT 
    e.full_name,
    d.name AS department_name
FROM Employee e
INNER JOIN Department d
    ON e.department_id = d.id;

-- 2. Tính lương trung bình của từng phòng ban
SELECT 
    d.name AS department_name,
    AVG(e.salary) AS avg_salary
FROM Department d
INNER JOIN Employee e
    ON d.id = e.department_id
GROUP BY d.name;

-- 3. Hiển thị các phòng ban có lương trung bình > 10 triệu
SELECT 
    d.name AS department_name,
    AVG(e.salary) AS avg_salary
FROM Department d
INNER JOIN Employee e
    ON d.id = e.department_id
GROUP BY d.name
HAVING AVG(e.salary) > 10000000;

-- 4. Liệt kê phòng ban không có nhân viên nào
SELECT 
    d.id,
    d.name AS department_name
FROM Department d
LEFT JOIN Employee e
    ON d.id = e.department_id
WHERE e.id IS NULL;