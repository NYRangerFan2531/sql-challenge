-- Schema for SQL Challange

-- Create tables and import data

-- Drop table if exists
DROP TABLE IF EXISTS departments;

-- Create new table
CREATE TABLE departments (
	dept_no varchar(4) PRIMARY KEY,
	dept_name varchar(50) NOT NULL
);

-- Drop table if exists
DROP TABLE IF EXISTS title;

-- Create new table
CREATE TABLE title (
	title_id varchar(5) PRIMARY KEY,
	title varchar(50) NOT NULL
);

-- Drop table if exists
DROP TABLE IF EXISTS Employess;

-- Create new table
CREATE TABLE Employess (
	emp_no int PRIMARY KEY,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	sex varchar(1) NOT NULL,
	hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) references title(title_id)
);

-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;

-- Create new table
CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no varchar(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employess(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

	
-- Drop table if exists
DROP TABLE IF EXISTS dept_manager;

-- Create new table
CREATE TABLE dept_manager (
	dept_no varchar(4),
	emp_no int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employess(emp_no)
);


-- Drop table if exists
DROP TABLE IF EXISTS salaries;
-- Create new table
CREATE TABLE  salaries(
	emp_no int PRIMARY KEY,
	SALARY int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employess(emp_no)
);
