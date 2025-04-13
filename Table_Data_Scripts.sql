--drop all the tables
/*
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE BONUS;
DROP TABLE SALGRADE;
DROP TABLE TEST_NULL;
DROP TABLE EMP_JOIN;
DROP TABLE EMP_STR;
DROP TABLE CINEMA_TICKET;
DROP TABLE FRUITS;
DROP TABLE COUNTRY;
DROP TABLE EMPLOYEE;
DROP TABLE ACCOUNTS;
DROP TABLE CURRENT_TEST;
DROP TABLE MV_KILOMETRE;
DROP TABLE CUSTOMERS;
DROP TABLE A;
DROP TABLE B;
DROP TABLE PRIME_TABLE;
*/

--Create all the tables
CREATE TABLE DEPT
	(DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	 DNAME 	VARCHAR2(14) ,
	 LOC 	VARCHAR2(13) 
	 );
CREATE TABLE EMP
   (EMPNO 	NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME 	VARCHAR2(20),
	JOB 	VARCHAR2(9),
	MGR 	NUMBER(4),
	HIREDATE DATE,
	SAL 	NUMBER(7,2),
	COMM 	NUMBER(7,2),
	DEPTNO 	NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
	);
	
CREATE TABLE EMP_JOIN
   (EMPNO 	NUMBER(4) CONSTRAINT PK_EMP_JOIN PRIMARY KEY,
	ENAME 	VARCHAR2(20),
	JOB 	VARCHAR2(9),
	MGR 	NUMBER(4),
	HIREDATE DATE,
	SAL 	NUMBER(7,2),
	COMM 	NUMBER(7,2),
	DEPTNO 	NUMBER(2) --CONSTRAINT FK_DEPTNO_JOIN REFERENCES DEPT
	);
	
CREATE TABLE BONUS
   (ENAME 	VARCHAR2(10),
	JOB 	VARCHAR2(9) ,
	SAL 	NUMBER,
	COMM 	NUMBER
	);
	
CREATE TABLE SALGRADE
   (GRADE 	NUMBER,
	LOSAL 	NUMBER,
	HISAL 	NUMBER
	);
	
CREATE TABLE TEST_NULL
   (SLNO 	NUMBER(3),
	VAL1 	NUMBER(3),
	VAL2 	NUMBER(3),
	VAL3 	NUMBER(3),
	VAL4 	NUMBER(3),
	VAL5 	NUMBER(3)
	);	
		
CREATE TABLE EMP_STR
   (empno 			NUMBER(3),
	first_name 		VARCHAR2(10),
	last_name 		VARCHAR2(10),
	email_id		VARCHAR2(60)
	);		
	
CREATE TABLE customers (
	customer_id NUMBER(10) PRIMARY KEY,
	first_name VARCHAR2(255) NOT NULL,
	last_name VARCHAR2(255) NOT NULL,
	phone VARCHAR2(25),
	email VARCHAR2(255) NOT NULL,
	street VARCHAR2(255),
	city VARCHAR2(50),
	state VARCHAR2(25),
	zip_code VARCHAR2(5)
);

CREATE TABLE MV_KILOMETRE
(
VEHICLE             NUMBER(10),
KILOMETRE			NUMBER(10),
DATE_KILOMETRE		DATE
);

CREATE TABLE A
(
ID    VARCHAR2(2),
VAL   NUMBER(2)
);

CREATE TABLE B
(
ID    VARCHAR2(2),
VAL   NUMBER(2)
);

CREATE TABLE Employee
(
first_name   VARCHAR2(20),
last_name    VARCHAR2(20)
);


CREATE TABLE fruits
(
fruit_id    	NUMBER(3), 
fruit_name   	VARCHAR2(20),
color			VARCHAR2(10)
);

CREATE TABLE Prime_Table (numbs NUMBER);

CREATE TABLE Accounts
(
Customer_Name   VARCHAR2(20),
Amount			NUMBER(10,2),	
Trans_type		VARCHAR2(1)
);

CREATE TABLE Country
(
country_id		NUMBER(2),
country_cd      VARCHAR2(6),
country_desc	VARCHAR2(20)	
);

CREATE TABLE cinema_ticket
(
Theater_id NUMBER,
seat_id NUMBER,
Status  VARCHAR2(12)
);


CREATE TABLE product_Catagory
(
 prod_cat_id  	    NUMBER(5) PRIMARY KEY,
 prod_cat_code      VARCHAR2(15) NOT NULL,
 prod_cat_desc      VARCHAR2(100) NOT NULL 		 
);
	
	
	
CREATE TABLE product
(
 prod_id  	    NUMBER(5) PRIMARY KEY,
 prod_cat_id    NUMBER(5) NOT NULL, 		 
 prod_Desc	    VARCHAR2(100) NOT NULL,
 Year_of_man    NUMBER(4),
 Date_of_man    DATE,
 Unit           NUMBER(5),
 Price        	NUMBER(7,2) NOT NULL
);

ALTER TABLE product ADD constraints con_pk_product_prod_id FOREIGN KEY (prod_cat_id) REFERENCES  product_Catagory(prod_cat_id);



--Insert data into dept table	
INSERT INTO DEPT VALUES	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES	(40,'OPERATIONS','BOSTON');

INSERT INTO customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES(1, 'Debra','Burks',NULL,'debra.burks@yahoo.com','9273 Thorne Ave. ','Orchard Park','NY',14127);
INSERT INTO customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES(2, 'Kasha','Todd',NULL,'kasha.todd@yahoo.com','910 Vine Street ','Campbell','CA',95008);
INSERT INTO customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES(3, 'Tameka','Fisher',NULL,'tameka.fisher@aol.com','769C Honey Creek St. ','Redondo Beach','CA',90278);
INSERT INTO customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES(4, 'Daryl','Spence',NULL,'daryl.spence@aol.com','988 Pearl Lane ','Uniondale','NY',11553);
INSERT INTO customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES(5, 'Charolette','Rice','(916) 381-6003','charolette.rice@msn.com','107 River Dr. ','Sacramento','CA',95820);
INSERT INTO customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES(6, 'Lyndsey','Bean',NULL,'lyndsey.bean@hotmail.com','769 West Road ','Fairport','NY',14450);
INSERT INTO customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES(7, 'Latasha','Hays','(716) 986-3359','latasha.hays@hotmail.com','7014 Manor Station Rd. ','Buffalo','NY',14215);

--Insert data into emp table
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
/*
INSERT INTO EMP VALUES(1005,'JOHN_MILTON','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES(1006,'HARI%RAM','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES(1007,'ALOK RANJAN','MANAGER',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
INSERT INTO EMP VALUES(1001,'MAROOF','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES(1002,'ZARA','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES(1003,'ALOK RANJAN','MANAGER',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
INSERT INTO EMP VALUES(1004,'WOLFGANG','MANAGER',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
*/

INSERT INTO EMP_JOIN VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-1987'),3000,NULL,20);
INSERT INTO EMP_JOIN VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP_JOIN VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP_JOIN VALUES(7876,'ADAMS','CLERK',7788,to_date('13-JUL-1987'),1100,NULL,20);
INSERT INTO EMP_JOIN VALUES(1000,'JAMES','CLERK',7788,to_date('18-JUL-1988'),2100,NULL,50);
INSERT INTO EMP_JOIN VALUES(1001,'HARRY','CLERK',7788,to_date('12-JUL-1975'),2600,NULL,50);

--Insert data into salgrade table
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

--Insert data into TEST_NULL table
INSERT INTO TEST_NULL VALUES (1, 10, 20, NULL, 30, 40);	
INSERT INTO TEST_NULL VALUES (2, 11, 25, 37, NULL, 61);	
INSERT INTO TEST_NULL VALUES (3, NULL, 5, 9, 98, NULL);
INSERT INTO TEST_NULL VALUES (4, NULL, NULL, 15, 98, NULL);
INSERT INTO TEST_NULL VALUES (5, NULL, NULL, NULL, NULL, NULL);

--Insert data into EMP_STR table
INSERT INTO EMP_STR VALUES (1, 'John','Milton', 'John.Milton@mycompany.com');
INSERT INTO EMP_STR VALUES (2, 'Harry','Potter', 'Harry.Potter@mycompany.com');
INSERT INTO EMP_STR VALUES (3, 'James','Brian', 'James.Brian@mycompany.com');

COMMIT;

---------------------------------------------------
--Related to Question
---------------------------------------------------

--Insert data into A table
INSERT INTO A (ID, VAL) VALUES ('A', '10');
INSERT INTO A (ID, VAL) VALUES ('B', '20');
INSERT INTO A (ID, VAL) VALUES ('C', '30');

--Insert data into B table
INSERT INTO B (ID, VAL) VALUES ('B', '20');
INSERT INTO B (ID, VAL) VALUES ('C', '30');
INSERT INTO B (ID, VAL) VALUES ('D', '50');

--Insert data into employee table
INSERT INTO employee values ('Harry','Potter');
INSERT INTO employee values ('John','Milton');
INSERT INTO employee values ('Akash','Sharma');

--Insert data into Accounts table
INSERT INTO Accounts VALUES ('Alex',1000,'C');
INSERT INTO Accounts VALUES ('Alex',120,'D');
INSERT INTO Accounts VALUES ('Alex',180,'D');
INSERT INTO Accounts VALUES ('King',7000,'C');
INSERT INTO Accounts VALUES ('King',500,'D');

--Insert data into Country table
INSERT INTO Country VALUES (1,'ARG','Argentina');
INSERT INTO Country VALUES (2,'BRG','Brazil');
INSERT INTO Country VALUES (3,'GER','Germany');
INSERT INTO Country VALUES (4,'ITA','Italy');
INSERT INTO Country VALUES (5,'GHA','Ghana');

--Insert data into Prime_Table table
INSERT INTO Prime_Table (SELECT * FROM (
                                        SELECT rownum nums
                                          FROM XMLTABLE('1 to 10') 
                                       ) WHERE nums <> 1
						 );

 
--Insert data into fruits table
INSERT INTO fruits VALUES (1, 'Apple','Red');
INSERT INTO fruits VALUES (2, 'Orange','Yellow');
INSERT INTO fruits VALUES (3, 'Muskmelon','Green');
INSERT INTO fruits VALUES (1, 'Apple','Red');
  
--Insert data into cinema_ticket table
INSERT INTO cinema_ticket
(
SELECT 1, rownum, DECODE(MOD(ROUND(dbms_random.value(1,1000)),2),1,'Booked','Free') status
FROM XMLTABLE('1 to 150')
); 

--Insert data into current_test table
INSERT INTO current_test VALUES (1,CURRENT_TIMESTAMP, SYSTIMESTAMP);
INSERT INTO current_test VALUES (2,CURRENT_TIMESTAMP, TIMESTAMP '2003-01-01 00:00:00 America/Los_Angeles');

--Insert data into MV_KILOMETRE table
INSERT INTO MV_KILOMETRE (VEHICLE,KILOMETRE,DATE_KILOMETRE) values (1,2643, to_date('31/12/2015 00:00:00','DD/MM/YYYY HH24:MI:SS'));  
INSERT INTO MV_KILOMETRE (VEHICLE,KILOMETRE,DATE_KILOMETRE) values (1,14806,to_date('31/12/2016 00:00:00','DD/MM/YYYY HH24:MI:SS'));  
INSERT INTO MV_KILOMETRE (VEHICLE,KILOMETRE,DATE_KILOMETRE) values (1,26222,to_date('31/12/2017 00:00:00','DD/MM/YYYY HH24:MI:SS')); 
INSERT INTO MV_KILOMETRE (VEHICLE,KILOMETRE,DATE_KILOMETRE) values (1,27223,to_date('31/12/2018 00:00:00','DD/MM/YYYY HH24:MI:SS')); 
INSERT INTO MV_KILOMETRE (VEHICLE,KILOMETRE,DATE_KILOMETRE) values (1,28134,to_date('31/12/2019 00:00:00','DD/MM/YYYY HH24:MI:SS')); 


INSERT INTO product_Catagory (prod_cat_id, prod_cat_code, prod_cat_desc) VALUES (1,'LP','Laptop' );
INSERT INTO product_Catagory (prod_cat_id, prod_cat_code, prod_cat_desc) VALUES (2,'PD','Pen Drive' );
INSERT INTO product_Catagory (prod_cat_id, prod_cat_code, prod_cat_desc) VALUES (3,'MO','Monitor' );
INSERT INTO product_Catagory (prod_cat_id, prod_cat_code, prod_cat_desc) VALUES (4,'PR','Printers' );
INSERT INTO product_Catagory (prod_cat_id, prod_cat_code, prod_cat_desc) VALUES (5,'MR','Memory' );

					 
INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (1001, 1 , 'Acer Laptops 1.1',2020, TO_DATE('1-03-2020','DD-MM-YYYY'), 1, 1200);
INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (1002, 1 , 'DELL Vostro 15 3501',2020, TO_DATE('13-07-2020','DD-MM-YYYY') ,1, 1500);
INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (1003, 1 , 'HP 15S-du0094tu',2019, TO_DATE('27-09-2019','DD-MM-YYYY'), 1, 1450);					 

INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (2001, 3 , 'LG LED 7.1',2020, TO_DATE('1-03-2020','DD-MM-YYYY'), 1, 250);
INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (2002, 3 , 'HP 21.5-inch Full HD Monitor',2020, TO_DATE('13-07-2020','DD-MM-YYYY'), 1, 300);
INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (2003, 3 , 'ThinkVision S27i-10',2019, TO_DATE('27-09-2019','DD-MM-YYYY'), 1, 310);		

INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (3001, 5 , 'LG RAM 4GB',2017, TO_DATE('1-03-2020','DD-MM-YYYY'), 1, 100);
INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (3002, 5 , 'HP RAM 8GB',2015, TO_DATE('13-07-2020','DD-MM-YYYY'), 1, 125);
INSERT INTO product (prod_id, prod_cat_id, prod_Desc, Year_of_man, Date_of_man, Unit , Price)
             VALUES (3003, 5 , 'LENEVO 8GB',2018, TO_DATE('27-09-2019','DD-MM-YYYY'), 1, 115);					 
	  
	  
COMMIT;

---------------------------------------------------------------------
