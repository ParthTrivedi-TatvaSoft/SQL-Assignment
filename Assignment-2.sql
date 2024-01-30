CREATE TABLE SALESMAN(
	salesman_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT pk_salesman PRIMARY KEY (salesman_id),
	name VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	commission DECIMAL(7,2) NOT NULL
);
select * from SALESMAN;
-- drop table salesman;

INSERT INTO SALESMAN (name,city,commission) VALUES ('PARTH','RAJKOT',0.15);
INSERT INTO SALESMAN (name,city,commission) VALUES ('YASH','SURAT',0.13);
INSERT INTO SALESMAN (name,city,commission) VALUES ('VIVEK','JUNAGADH',0.11);
INSERT INTO SALESMAN (name,city,commission) VALUES ('VATSAL','RAJKOT',0.14);
INSERT INTO SALESMAN (name,city,commission) VALUES ('UMANG','AHMEDABAD',0.12);



CREATE TABLE CUSTOMER(
	customer_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT pk_customer PRIMARY KEY (customer_id),
	cust_name VARCHAR(30),
	city VARCHAR(30),
	grade INT,
	salesman_id INT,
	CONSTRAINT fk_salesman FOREIGN KEY (salesman_id) REFERENCES SALESMAN(salesman_id)
);

select * from CUSTOMER;

INSERT INTO CUSTOMER (cust_name,city,grade,salesman_id) VALUES ('SHREY','RAJKOT','100',1);
INSERT INTO CUSTOMER (cust_name,city,grade,salesman_id) VALUES ('UDAY','JAMNAGAR','200',2);
INSERT INTO CUSTOMER (cust_name,city,grade,salesman_id) VALUES ('VANDAN','SURAT','300',3);
INSERT INTO CUSTOMER (cust_name,city,grade,salesman_id) VALUES ('JAY','RAJKOT','600',4);
INSERT INTO CUSTOMER (cust_name,city,grade,salesman_id) VALUES ('RAJ','JUNAGADH','600',5);
						
																
																
																


CREATE TABLE ORDERS(
	ord_no INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT pk_order PRIMARY KEY (ord_no),
	purch_amt DECIMAL(10,2) NOT NULL,
	ord_date DATE,
	customer_id INT,
	CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
	salesman_id INT,
	CONSTRAINT fk_salesman FOREIGN KEY (salesman_id) REFERENCES SALESMAN(salesman_id)
);

select * from ORDERS;

INSERT INTO ORDERS (purch_amt,ord_date,customer_id,salesman_id) VALUES ('150.5','2024-01-22','1',1);
INSERT INTO ORDERS (purch_amt,ord_date,customer_id,salesman_id) VALUES ('270.65','2022-02-20','2',2);
INSERT INTO ORDERS (purch_amt,ord_date,customer_id,salesman_id) VALUES ('110.5','2020-03-18','3',3);
INSERT INTO ORDERS (purch_amt,ord_date,customer_id,salesman_id) VALUES ('1983.43','2018-04-16','4',4);
INSERT INTO ORDERS (purch_amt,ord_date,customer_id,salesman_id) VALUES ('1983.43','2016-05-14','4',4);


-- 1
SELECT name,cust_name,salesman.city FROM SALESMAN INNER JOIN CUSTOMER ON SALESMAN.city=CUSTOMER.city;

-- 2
SELECT ord_no,purch_amt,cust_name,CUSTOMER.city FROM ORDERS INNER JOIN CUSTOMER ON ORDERS.ord_no = CUSTOMER.customer_id 
where ORDERS.purch_amt BETWEEN 500 AND 2000;

-- 3
SELECT cust_name,CUSTOMER.city,name,commission FROM CUSTOMER INNER JOIN SALESMAN ON CUSTOMER.customer_id=SALESMAN.salesman_id;

-- 4
SELECT cust_name,CUSTOMER.city,name,commission FROM CUSTOMER INNER JOIN SALESMAN ON CUSTOMER.customer_id=SALESMAN.salesman_id WHERE commission>0.12;

-- 5
SELECT cust_name,CUSTOMER.city,name,SALESMAN.city,commission FROM CUSTOMER INNER JOIN SALESMAN ON CUSTOMER.customer_id=SALESMAN.salesman_id WHERE CUSTOMER.city<>SALESMAN.city AND commission>0.12;

-- 6
SELECT ord_no,ord_date,purch_amt,cust_name,grade,name,commission FROM ORDERS INNER JOIN CUSTOMER ON ORDERS.ord_no=CUSTOMER.customer_id INNER JOIN SALESMAN ON ORDERS.ord_no=SALESMAN.salesman_id;

-- 7
SELECT * FROM ORDERS NATURAL JOIN CUSTOMER NATURAL JOIN SALESMAN;

-- 8
SELECT cust_name,CUSTOMER.city,grade,name,SALESMAN.city FROM CUSTOMER LEFT JOIN SALESMAN ON CUSTOMER.customer_id=SALESMAN.salesman_id ORDER BY CUSTOMER.customer_id;

-- 9
SELECT cust_name,CUSTOMER.city,grade,name,SALESMAN.city FROM CUSTOMER LEFT OUTER JOIN SALESMAN ON CUSTOMER.customer_id=SALESMAN.salesman_id WHERE CUSTOMER.grade<300 ORDER BY CUSTOMER.customer_id;

-- 10
SELECT cust_name,CUSTOMER.city,ord_no,ord_date,purch_amt FROM CUSTOMER LEFT OUTER JOIN ORDERS ON CUSTOMER.customer_id=ORDERS.ord_no ORDER BY ORDERS.ord_date;

-- 11
SELECT cust_name,CUSTOMER.city,ord_no,ord_date,purch_amt,name,commission FROM CUSTOMER LEFT OUTER JOIN ORDERS ON CUSTOMER.customer_id=ORDERS.ord_no LEFT OUTER JOIN SALESMAN ON SALESMAN.salesman_id=ORDERS.ord_no;

-- 12
SELECT CUSTOMER.cust_name,CUSTOMER.city,grade,name,SALESMAN.salesman_id FROM CUSTOMER RIGHT OUTER JOIN SALESMAN ON CUSTOMER.customer_id=SALESMAN.salesman_id ORDER BY SALESMAN;

-- 13
SELECT name,cust_name,CUSTOMER.city,grade,ord_no,ord_date,purch_amt FROM CUSTOMER INNER JOIN SALESMAN ON CUSTOMER.customer_id=SALESMAN.salesman_id INNER JOIN ORDERS ON CUSTOMER.customer_id=ORDERS.ord_no;

-- 14
SELECT cust_name,CUSTOMER.city,grade,name,ord_no,ord_date,purch_amt FROM CUSTOMER RIGHT OUTER JOIN SALESMAN ON CUSTOMER.customer_id=SALESMAN.salesman_id LEFT OUTER JOIN ORDERS ON CUSTOMER.customer_id=ORDERS.ord_no WHERE ORDERS.purch_amt>=200 AND CUSTOMER.grade IS NOT NULL;
SELECT name,purch_amt,grade FROM SALESMAN  JOIN CUSTOMER ON SALESMAN.salesman_id=CUSTOMER.customer_id  JOIN ORDERS ON ORDERS.ord_no=CUSTOMER.customer_id WHERE ORDERS.purch_amt>=200 AND CUSTOMER.grade IS NOT NULL;


-- 16
SELECT cust_name,CUSTOMER.city,ord_no,ord_date,purch_amt FROM CUSTOMER FULL OUTER JOIN  ORDERS ON CUSTOMER.customer_id=ORDERS.ord_no WHERE grade IS NOT NULL;

-- 17
SELECT * FROM SALESMAN CROSS JOIN CUSTOMER;

-- 18
SELECT * FROM SALESMAN CROSS JOIN CUSTOMER WHERE SALESMAN.city IS NOT NULL;

-- 19
SELECT * FROM SALESMAN CROSS JOIN CUSTOMER WHERE SALESMAN.city IS NOT NULL AND grade IS NOT NULL;

-- 20
SELECT * FROM SALESMAN CROSS JOIN CUSTOMER WHERE SALESMAN.city IS NOT NULL AND grade IS NOT NULL AND SALESMAN.city<>CUSTOMER.city;




