CREATE TABLE Department(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT pk_Department PRIMARY KEY (id),
	dept_name varchar(40)
	
)
SELECT * FROM Department;

INSERT INTO Department (dept_name) VALUES ('IT');
INSERT INTO Department (dept_name) VALUES ('Technical');
INSERT INTO Department (dept_name) VALUES ('Sales');
INSERT INTO Department (dept_name) VALUES ('Graphics');
INSERT INTO Department (dept_name) VALUES ('Marketing');
INSERT INTO Department (dept_name) VALUES ('Management');
INSERT INTO Department (dept_name) VALUES ('Administration');

CREATE TABLE  Employee
 (
     id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	 CONSTRAINT pk_Employee PRIMARY KEY (id),
	 dept_id INT NOT NULL,
	 CONSTRAINT fk_Department FOREIGN KEY (dept_id) REFERENCES Department(id),
	 mngr_id smallint NOT NULL, 
	 emp_name character varying(50),
	 salary DECIMAL(10,2)
	 
);

INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (1,2,'PARTH',10000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (1,2,'KEVAL',10000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (2,2,'VATSAL',80000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (2,2,'YASH',70000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (3,2,'Shreyansh',60000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (3,2,'UMANG',50000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (4,2,'UDAY',40000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (4,2,'VANDAN',30000);

UPDATE Employee
SET emp_name='SHREYANSH'
WHERE salary='60000';

DROP TABLE Employee;  
SELECT * FROM Employee;

-- 1
SELECT emp_name,dept_id FROM EMPLOYEE WHERE salary IN (SELECT MAX(salary) FROM EMPLOYEE GROUP BY dept_id);


-- 2

SELECT id,dept_name FROM Department GROUP BY id HAVING COUNT(*)<3;

-- 3
SELECT dept_id,COUNT(*) FROM Employee GROUP BY id;

-- 4
SELECT dept_id,SUM(salary)FROM Employee GROUP BY dept_id;
