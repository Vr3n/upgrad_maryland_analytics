/*
Database script to create Smithazon, a B2B e-commerce database
Copyright: Dr. John Bono
*/

CREATE DATABASE IF NOT EXISTS smithazon;

USE smithazon; 

DROP TABLE IF EXISTS order_line;
DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS part_category;
DROP TABLE IF EXISTS warehouse;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS representative;

CREATE TABLE representative (
	rep_num INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(20),
	email VARCHAR(50),
	city VARCHAR(20),
	state CHAR(2),
	zip CHAR(5),
	base_salary DECIMAL(7,2),
	commission_rate DECIMAL(3,2)
);

CREATE TABLE customer (
	customer_num INT PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
	street VARCHAR(50),
	city VARCHAR(20),
	state CHAR(2),
	zip CHAR(5),
	balance_due DECIMAL(8,2),
	credit_limit DECIMAL(8,2),
	rep_num INT,
	FOREIGN KEY (rep_num) REFERENCES representative (rep_num)
);

CREATE TABLE orders (
	order_num INT PRIMARY KEY,
	order_date DATE,
	customer_num INT,
	FOREIGN KEY (customer_num) REFERENCES customer (customer_num)
);

CREATE TABLE warehouse (
	warehouse_id SMALLINT PRIMARY KEY,
    city VARCHAR(20),
    state char(2),
    zip CHAR(5)    
);

CREATE TABLE part_category (
	category_id SMALLINT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE part (
	part_id CHAR(7) PRIMARY KEY,
	part_name VARCHAR(50),
	quantity_in_stock INT,
	category_id SMALLINT,
	warehouse_id SMALLINT,
	wholesale_price DECIMAL(6,2),
    FOREIGN KEY (category_id) REFERENCES part_category (category_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse (warehouse_id)
);

CREATE TABLE order_line (
	order_num INT,
	part_id CHAR(7),
	quantity_ordered INT,
	quoted_price DECIMAL(6,2),
	FOREIGN KEY (part_id) REFERENCES part (part_id),
	FOREIGN KEY (order_num) REFERENCES orders (order_num),
	PRIMARY KEY (order_num, part_id)
);


INSERT INTO representative (rep_num, first_name, last_name, email, city, state, zip, base_salary, commission_rate)
VALUES
(101, 'Tara', 'Johnson', 'tjohnson@smith-store.com', 'College Park', 'MD', '20742', 24000.00, 0.15),
(102, 'Patrick', 'White', 'pwhite@smith-store.com', 'Arlington', 'VA', '22201', 31500.00, 0.17),
(103, 'Timothy', 'Ferguson', 'tferguson@smith-store.com', 'Washington', 'DC', '20036', 15000.00, 0.09),
(104, 'Steven', 'Ferguson', 'sferguson@smith-store.com', 'Baltimore', 'MD', '21201', 52000.00, 0.14),
(105, 'Danny', 'Lang', 'dlang@smith-store.com', 'Arlington', 'VA', '22201', 27100.00, 0.21),
(106, 'Christina', 'Drake', 'cdrake@smith-store.com', 'Washington', 'DC', '20036', 30000.00, 0.22),
(107, 'Aaron', 'Lee', 'alee@smith-store.com', 'Ellicott City', 'MD', '21041', 65000.00, 0.02);

INSERT INTO customer (customer_num, customer_name, street, city, state, zip, balance_due, credit_limit, rep_num)
VALUES
(1001, 'Traders'' Emporium', '4281 Farm Meadow Dr', 'Ehrenberg', 'AZ', '85328', 0.00, 25000.00, 103),
(1002, 'Leny and Trond', '1952 Confer Dr', 'Seattle', 'WA', '98109', 5100.00, 10000.00, 102),
(1003, 'Shop Cog', '2709 Hillcrest Rd', 'Tukwila', 'WA', '98168', 17200.00, 15000.00, 102),
(1004, 'Store Folk', '10245 Big Elm St', 'Lenexa', 'MO', '66214', 14500.00, 10000.00, 104),
(1005, 'retail.ly', '1115 Bedford St', 'West Haven', 'CT', '06516', 6000.00, 25000.00, 101),
(1006, 'Stuff & Things', '534 Longview Ave', 'Bronx', 'NY', '10452', 0.00, 15000.00, 107),
(1007, 'Unboxed', '3185 Alexander Dr', 'Denton', 'TX', '76201', 16250.00, 10000.00, 107),
(1008, 'Shop Nation', '3570 Stratford Ct', 'Charlotte', 'NC', '28202', 2400.00, 15000.00, 101),
(1009, 'Retail Creed', '3093 Margaret St', 'Houston', 'TX', '77002', 0.00, 10000.00, 107),
(1010, 'Merchant Aisle', '4832 Finwood Rd', 'Neptune', 'NJ', '07753', 8400.00, 15000.00, 106),
(1011, 'Smith & Sons', '2586 Rinehart Rd', 'Fort Lauderdale', 'FL', '33311', 6500.00, 25000.00, 101);

INSERT INTO orders (order_num, order_date, customer_num)
VALUES
(10001, '2022-01-22', 1003),
(10002, '2022-01-27', 1007),
(10003, '2021-11-14', 1006),
(10004, '2021-07-06', 1011),
(10005, '2021-09-30', 1009),
(10006, '2022-02-08', 1009),
(10007, '2022-01-22', 1004),
(10008, '2021-01-22', 1007),
(10009, '2022-02-24', 1002),
(10010, '2020-12-16', 1008),
(10011, '2021-10-08', 1006),
(10012, '2021-03-15', 1004),
(10013, '2021-06-15', 1010),
(10014, '2021-04-20', 1005),
(10015, '2022-01-19', 1002),
(10016, '2021-03-15', 1003),
(10017, '2022-01-04', 1009),
(10018, '2021-07-06', 1010),
(10019, '2021-08-23', 1002),
(10020, '2021-05-31', 1007),
(10021, '2021-08-23', 1008),
(10022, '2021-07-07', 1003),
(10023, '2021-08-23', 1005),
(10024, '2020-11-01', 1006),
(10025, '2022-02-24', 1006),
(10026, '2022-02-24', 1003);

INSERT INTO warehouse (warehouse_id, city, state, zip)
VALUES
(1, 'College Park', 'MD',  '20742'),
(2, 'West Islip', 'NY',  '11795'),
(3, 'Fort Lauderdale', 'FL',  '33317'),
(4, 'Dallas', 'TX',  '75087');

INSERT INTO part_category (category_id, category_name)
VALUES
(1, 'Automotive'),
(2, 'Sporting Goods'),
(3, 'Pet Supplies'),
(4, 'Health & Beauty'),
(5, 'Outdoors'),
(6, 'Home & Garden');

INSERT INTO part (part_id, part_name, quantity_in_stock, category_id, warehouse_id, wholesale_price)
VALUES
('A598462', 'Universal Car Battery', 47, 1, 4, 18.50),
('G254098', 'Inflatable Swimming Pool', 26, 6, 3, 75.00),
('U265843', 'Skateboard', 102, 2, 4, 25.50),
('T864522', 'Gardening Tool Set', 360, 6, 4, 40.00),
('M248541', 'Universal Car Seat Covers', 50, 1, 2, 15.90),
('T469851', 'Birdcage', 27, 3, 3, 35.00),
('Y320014', 'Wall Mirror', 0, 6, 2, 40.00),
('Q695410', 'Personal Care Travel Kit', 293, 4, 2, 6.50),
('Y487514', 'Baseball Glove', 95, 2, 3, 16.00),
('F695420', 'Fish Tank', 0, 3, 4, 60.00),
('L659834', 'Knife Set', 152, 6, 4, 150.00),
('F557849', 'Keychain', 483, 1, 1, 0.95),
('T354710', 'Camping Tent', 12, 5, 4, 105.00),
('R659978', 'Spa Gift Basket', 174, 4, 3, 35.99),
('G003541', 'Sport Bicycle', 3, 2, 1, 500.00),
('K100047', 'Hair Dryer', 39, 4, 2, 9.00),
('D695869', 'Party Balloons - Assorted', 475, 6, 1, 6.75),
('S246907', 'Cell Phone Holder', 350, 1, 2, 14.25),
('U205471', 'Television Stand', 25, 6, 4, 66.00),
('J354643', 'Dog Food Bowl', 0, 3, 3, 8.99),
('S516842', 'Kayak', 9, 5, 3, 275.00);

INSERT INTO order_line (order_num, part_id, quantity_ordered, quoted_price)
VALUES
(10001, 'T469851', 15, 34.50),
(10001, 'G003541', 2, 300.00),
(10001, 'S516842', 1, 275.00),
(10002, 'Q695410', 100, 3.50),
(10003, 'D695869', 45, 6.20),
(10003, 'S246907', 300, 4.50),
(10004, 'A598462', 5, 15.00),
(10004, 'G003541', 1, 500.00),
(10004, 'K100047', 74, 6.25),
(10004, 'G254098', 2, 75.00),
(10005, 'U205471', 50, 49.50),
(10006, 'T864522', 8, 38.25),
(10006, 'U265843', 12, 18.20),
(10007, 'R659978', 65, 25.00),
(10007, 'M248541', 3, 9.85),
(10007, 'S246907', 20, 9.99),
(10007, 'D695869', 500, 3.99),
(10008, 'A598462', 1, 18.50),
(10008, 'J354643', 30, 7.00),
(10009, 'G003541', 2, 500.00),
(10010, 'G254098', 2, 74.50),
(10011, 'S246907', 6, 11.15),
(10011, 'Q695410', 75, 3.99),
(10012, 'U265843', 7, 19.00),
(10013, 'T354710', 16, 95.00),
(10013, 'U205471', 20, 65.00),
(10013, 'T469851', 6, 24.45),
(10014, 'R659978', 14, 33.00),
(10015, 'A598462', 25, 9.00),
(10015, 'D695869', 1500, 2.85),
(10015, 'Q695410', 23, 6.25),
(10015, 'M248541', 7, 11.00),
(10015, 'L659834', 25, 140.00),
(10016, 'M248541', 11, 10.90),
(10016, 'G254098', 3, 75.00),
(10017, 'J354643', 5, 8.89),
(10018, 'Q695410', 20, 6.30),
(10018, 'T864522', 15, 37.99),
(10018, 'G003541', 7, 350.00),
(10019, 'A598462', 8, 12.75),
(10019, 'R659978', 54, 26.00),
(10020, 'F695420', 1, 60.00),
(10021, 'Y487514', 1, 16.00),
(10021, 'M248541', 2, 15.90),
(10021, 'G254098', 10, 51.75),
(10021, 'S246907', 9, 9.99),
(10022, 'A598462', 50, 6.00),
(10022, 'G254098', 20, 48.00),
(10023, 'K100047', 30, 8.45),
(10023, 'J354643', 2, 8.99),
(10024, 'U265843', 6, 24.00),
(10025, 'U205471', 5, 85.00),
(10025, 'Y487514', 7, 13.85),
(10025, 'K100047', 40, 5.10),
(10026, 'A598462', 3, 16.00),
(10026, 'R659978', 100, 15.59);

