CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Department (
    depart_id INT PRIMARY KEY,
    depart_name VARCHAR(50),
    depart_city VARCHAR(50)
);

CREATE TABLE Roles (
    role_id INT PRIMARY KEY,
    role VARCHAR(50)
);

CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    salary_pa DECIMAL(10, 2)
);

CREATE TABLE OvertimeHours (
    overtime_id INT PRIMARY KEY,
    overtime_hours INT
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    surname VARCHAR(50),
    gender CHAR(1),
    address VARCHAR(100),
    email VARCHAR(100),
    depart_id INT,
    role_id INT,
    salary_id INT,
    overtime_id INT,
    FOREIGN KEY (depart_id) REFERENCES Department(depart_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id),
    FOREIGN KEY (salary_id) REFERENCES Salaries(salary_id),
    FOREIGN KEY (overtime_id) REFERENCES OvertimeHours(overtime_id));




-- Insert data into Department table
INSERT INTO Department (depart_id, depart_name, depart_city) VALUES 
(1, 'Human Resources', 'New York'),
(2, 'Finance', 'Chicago'),
(3, 'Engineering', 'San Francisco');

-- Insert data into Roles table
INSERT INTO Roles (role_id, role) VALUES 
(1, 'Manager'),
(2, 'Accountant'),
(3, 'Engineer');

-- Insert data into Salaries table
INSERT INTO Salaries (salary_id, salary_pa) VALUES 
(1, 75000.00),
(2, 55000.00),
(3, 90000.00);

-- Insert data into OvertimeHours table
INSERT INTO OvertimeHours (overtime_id, overtime_hours) VALUES 
(1, 10),
(2, 5),
(3, 20);

-- Insert data into Employees table
INSERT INTO Employees (emp_id, first_name, surname, gender, address, email, depart_id, role_id, salary_id, overtime_id) VALUES 
(1, 'John', 'Doe', 'M', '123 Elm St, New York, NY', 'johndoe@example.com', 1, 1, 1, 1),
(2, 'Jane', 'Smith', 'F', '456 Oak St, Chicago, IL', 'janesmith@example.com', 2, 2, 2, 2),
(3, 'Alice', 'Johnson', 'F', '789 Pine St, San Francisco, CA', 'alicejohnson@example.com', 3, 3, 3, 3);

SELECT 
    e.emp_id, 
    e.first_name, 
    e.surname, 
    e.gender, 
    e.address, 
    e.email, 
    d.depart_name, 
    d.depart_city, 
    r.role, 
    s.salary_pa, 
    o.overtime_hours
FROM 
    Employees e
JOIN 
    Department d ON e.depart_id = d.depart_id
JOIN 
    Roles r ON e.role_id = r.role_id
JOIN 
    Salaries s ON e.salary_id = s.salary_id
JOIN 
    OvertimeHours o ON e.overtime_id = o.overtime_id;
