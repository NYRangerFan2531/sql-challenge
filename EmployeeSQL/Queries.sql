SELECT *
FROM DEPARTMENTS
SELECT *
FROM DEPT_EMP -- List the employee number, last name, first name, sex, and salary of each employee.

SELECT EMPLOYESS.EMP_NO AS "Employee Number",
	EMPLOYESS.LAST_NAME AS "Last Name",
	EMPLOYESS.FIRST_NAME AS "Fist Name",
	EMPLOYESS.SEX AS "Sex",
	SALARIES.SALARY AS "Salary"
FROM EMPLOYESS
JOIN SALARIES ON EMPLOYESS.EMP_NO = SALARIES.EMP_NO;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT FIRST_NAME AS "Fist Name",
	LAST_NAME AS "Last Name",
	HIRE_DATE AS "Hire Date"
FROM EMPLOYESS
WHERE HIRE_DATE >= '1986-01-01'
	AND HIRE_DATE <= '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT DEPT_MANAGER.DEPT_NO AS "Department Number",
	DEPARTMENTS.DEPT_NAME AS "Department Name",
	EMPLOYESS.EMP_NO AS "Employee Number",
	EMPLOYESS.LAST_NAME AS "Last Name",
	EMPLOYESS.FIRST_NAME AS "Fist Name"
FROM DEPT_MANAGER
JOIN EMPLOYESS ON DEPT_MANAGER.EMP_NO = EMPLOYESS.EMP_NO
JOIN DEPARTMENTS ON DEPT_MANAGER.DEPT_NO = DEPARTMENTS.DEPT_NO;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT EMPLOYESS.EMP_NO AS "Employee Number",
	EMPLOYESS.LAST_NAME AS "Last Name",
	EMPLOYESS.FIRST_NAME AS "Fist Name",
	DEPARTMENTS.DEPT_NAME AS "Department Name"
FROM EMPLOYESS
JOIN DEPT_EMP ON (EMPLOYESS.EMP_NO = DEPT_EMP.EMP_NO)
JOIN DEPARTMENTS ON (DEPARTMENTS.DEPT_NO = DEPT_EMP.DEPT_NO);

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT FIRST_NAME,
	LAST_NAME,
	SEX
FROM EMPLOYESS
WHERE FIRST_NAME like 'Hercules'
	AND LAST_NAME like 'B%' 
	
--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT EMPLOYESS.EMP_NO AS "Employee Number",
	EMPLOYESS.LAST_NAME AS "Last Name",
	EMPLOYESS.FIRST_NAME AS "Fist Name"
FROM EMPLOYESS
JOIN DEPT_EMP ON (EMPLOYESS.EMP_NO = DEPT_EMP.EMP_NO)
JOIN DEPARTMENTS ON (DEPARTMENTS.DEPT_NO = DEPT_EMP.DEPT_NO) WHERE DEPARTMENTS.DEPT_NAME like 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT EMPLOYESS.EMP_NO AS "Employee Number",
	EMPLOYESS.LAST_NAME AS "Last Name",
	EMPLOYESS.FIRST_NAME AS "Fist Name",
	DEPARTMENTS.DEPT_NAME AS "Department Name"
FROM EMPLOYESS
JOIN DEPT_EMP ON (EMPLOYESS.EMP_NO = DEPT_EMP.EMP_NO)
JOIN DEPARTMENTS ON (DEPARTMENTS.DEPT_NO = DEPT_EMP.DEPT_NO)
WHERE DEPARTMENTS.DEPT_NAME like 'Sales'
	OR DEPARTMENTS.DEPT_NAME like 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT EMPLOYESS.LAST_NAME AS "Last Name",
	COUNT(EMPLOYESS.LAST_NAME) AS "Frequency"
FROM EMPLOYESS
GROUP BY LAST_NAME
ORDER BY COUNT(EMPLOYESS.LAST_NAME) DESC;