-- Creating Database

CREATE DATABASE Umuzi;

-- Use the Umuzi Database

USE Umuzi;

-- Creating a Customers Table

CREATE TABLE Customers(
customer_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(7),
address VARCHAR(200),
phone BIGINT,
email VARCHAR(100),
city VARCHAR(20),
country VARCHAR(50),
PRIMARY KEY(customer_id)
);

-- Creating a Employees Table

CREATE TABLE Employees(
employee_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
job_title VARCHAR(20),
PRIMARY KEY(employee_id)
);

-- Creating a Products Table

CREATE TABLE Products(
product_id INT NOT NULL AUTO_INCREMENT,
product_name VARCHAR(100),
description VARCHAR(300),
buy_price DECIMAL,
PRIMARY KEY(product_id)
);

-- Creating a Payments Table

CREATE TABLE Payments(
payment_id INT NOT NULL AUTO_INCREMENT,
customer_id INT ,
payment_date DATETIME,
amount DECIMAL,	
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id) ON DELETE SET NULL,
PRIMARY KEY(payment_id)
);

-- Creating a Orders Table

CREATE TABLE Orders(
order_id INT NOT NULL AUTO_INCREMENT ,
product_id INT,
payment_id INT,
fullfilled_by_employee_id INT,
date_required DATETIME,
date_shipped DATETIME,
status VARCHAR(20),
FOREIGN KEY(product_id) REFERENCES Products(product_id) ON DELETE SET NULL,
FOREIGN KEY(payment_id) REFERENCES Payments(payment_id) ON DELETE SET NULL,
FOREIGN KEY(fullfilled_by_employee_id) REFERENCES Employees(employee_id) ON DELETE SET NULL,
PRIMARY KEY(order_id)
);

-- Inserting Data into the Customers Table

INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('John','Hibert','Male','284 chaucer st',084789657,'john@gmail.com','Johannesburg','South Africa')	;
INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('Thando','Sithole','Female','240 Sect 1',0794445584,'thando@gmail.com	','Cape Town','South Africa')	;
INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('Leon','Glen','Male','81 Everton Rd,Gillits',0820832830,'Leon@gmail.com','Durban','South Africa')	;
INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('Charl','Muller','Male','290A Dorset Ecke',+44856872553	,'Charl.muller@yahoo.com','Berlin','Germany')	;
INSERT INTO Customers(first_name,last_name ,gender ,address ,phone ,email ,city ,country) VALUES ('Julia','Stein','Female','2 Wernerring',+448672445058	,'Js234@yahoo.com','Frankfurt','Germany')	;

-- Inserting Data into the Employees Table

INSERT INTO Employees(first_name,last_name ,email ,job_title) VALUES ('Kani','Matthew','mat@gmail.com','Manager')	;
INSERT INTO Employees(first_name,last_name ,email ,job_title) VALUES ('Lesly','Cronje','LesC@gmail.com','Clerk')	;
INSERT INTO Employees(first_name,last_name ,email ,job_title) VALUES ('Gideon','Maduku','m@gmail.com','Accountant')	;

-- Inserting Data into the Products Table

INSERT INTO Products(product_name,description ,buy_price) VALUES ('Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75);
INSERT INTO Products(product_name,description ,buy_price) VALUES ('Classic Car','Turnable front wheels, steering function',550.75)	;
INSERT INTO Products(product_name,description ,buy_price) VALUES ('Sports car','Turnable front wheels, steering function',700.60)	;

-- Inserting Data into the Payments Table

INSERT INTO Payments(customer_id,payment_date ,amount) VALUES (1,'2018-09-01',150.75)	;
INSERT INTO Payments(customer_id,payment_date ,amount) VALUES (5,'2018-09-03',150.75)	;
INSERT INTO Payments(customer_id,payment_date ,amount) VALUES (4,'2018-09-03',700.60)	;

-- Inserting Data into the Orders Table

INSERT INTO Orders(product_id,payment_id ,fullfilled_by_employee_id,date_required,status) VALUES (1,1,2,'2018-09-05','Not shipped');
INSERT INTO Orders(product_id,payment_id ,fullfilled_by_employee_id,date_required,date_shipped,status) VALUES (1,2,2,'2018-09-04','2018-09-03','Shipped');
INSERT INTO Orders(product_id,payment_id ,fullfilled_by_employee_id,date_required,status) VALUES (3,3,3,'2018-09-06','Not shipped');




-- PART 2

-- 1.
SELECT * FROM Customers;

-- 2.
SELECT first_name FROM Customers;

-- 3.
SELECT first_name FROM Customers WHERE customer_id = 1 ;

-- 4.
UPDATE Customers SET first_name = 'Lerato', last_name = 'Mabitso' WHERE customer_id = 1;

-- 5.
DELETE FROM Customers WHERE customer_id = 2;

-- 6.
SELECT DISTINCT status FROM Orders;
SELECT COUNT(DISTINCT status) FROM Orders;

-- 7.
SELECT MAX(amount) AS LargestPrice FROM Payments;

-- 8.
SELECT * FROM Customers ORDER BY country;

-- 9.
SELECT * FROM Products WHERE buy_price BETWEEN 100 AND 600; 

-- 10.
SELECT * FROM Customers WHERE country = 'Germany' AND city = 'Berlin';

-- 11.
SELECT * FROM Customers WHERE country = 'Cape Town' OR city = 'Durban';

-- 12.
SELECT * FROM Products WHERE buy_price > 500;

-- 13.
SELECT SUM(amount) FROM Payments ;

-- 14.
SELECT COUNT(DISTINCT status) FROM Orders WHERE status = 'Shipped';

-- 15.
SELECT AVG(buy_price) FROM Products;
SELECT AVG(buy_price)*12 FROM Products;

-- 16.
SELECT * FROM Payments
INNER JOIN Customers ON Payments.customer_id = Customers.customer_id;

-- 17.
SELECT * FROM Products WHERE description LIKE '%turnable front wheels%'

/*Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).
Using INNER JOIN create a query that selects all Payments with Customer information.
Select all products that have turnable front wheels.*/
