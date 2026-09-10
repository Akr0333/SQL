CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    salary DECIMAL(12,2) NOT NULL CHECK (salary > 0),
    effective_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);