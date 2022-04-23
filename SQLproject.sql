#create Product table and insert values

drop table if exists Customer;
drop table if exists Address;
drop table if exists Payment;
drop table if exists courier;
drop table if exists Orders;
drop table if exists Order_Details;
drop table if exists CustomerLog;
drop table if exists Product;
drop trigger CustomerInsert;

CREATE TABLE CustomerLog (
customer_id int,
LogDate DATE,
Action VARCHAR(255)
);

CREATE TABLE Product (
  product_id int NOT NULL,
  price float NOT NULL,
  brand varchar(50) NOT NULL,
  type varchar(50) NOT NULL,
  alcohol_percentage float not null,
  volume float not null,
  quantity int not NULL
);

ALTER TABLE Product
  ADD PRIMARY KEY (product_id);
ALTER TABLE 
	product MODIFY product_id INTEGER NOT NULL AUTO_INCREMENT;

INSERT INTO Product (price, brand, type, alcohol_percentage, volume, quantity) VALUES
(20.99, 'Jagermeister', 'Liqueur', 35, 1, 34),
(25.99, 'Jack Daniels', 'Whiskey', 40, 1, 7),
(21.99, 'Jameson', 'Whiskey', 40, 1, 14),
(16.99, 'Absolut', 'Vodka', 40, 1, 69),
(17.99, 'Finlandia', 'Vodka', 40, 1, 54),
(1.09, 'Heineken', 'Beer', 5, 0.5, 197),
(13.99, 'Captain Morgan', 'Rum', 37.5, 0.7, 28),
(0.99, 'Corona extra', 'Beer', 4.5, 0.355, 256),
(11.99, 'Sierra Tequila', 'Tequila', 38, 0.5, 3),
(12.99, 'Beefeater', 'Gin', 40, 0.7, 9);

#create Customer table and insert values
CREATE TABLE Customer (
  customer_id int NOT NULL,
  order_id int NOT NULL,
  payment_id int NOT NULL,
  first_name varchar(20) DEFAULT NULL,
  last_name varchar(20) DEFAULT NULL,
  phone_number varchar(20) DEFAULT NULL,
  e_mail varchar(50) DEFAULT NULL,
  address_id int DEFAULT NULL
);

ALTER TABLE Customer
  ADD PRIMARY KEY (customer_id),
  ADD KEY address_id (address_id),
  ADD KEY payment_id (payment_id),
  ADD KEY order_id (order_id),
  MODIFY customer_id INTEGER NOT NULL AUTO_INCREMENT;
  
CREATE TRIGGER CustomerInsert AFTER INSERT ON Customer FOR EACH ROW
INSERT INTO CustomerLog (customer_id, LogDate, Action)
VALUES (NEW.customer_id, SYSDATE(), 'Naujas klientas');

INSERT INTO Customer (order_id, payment_id, first_name, last_name, phone_number, e_mail, address_id) VALUES
(1, 1, 'first_name_1', 'last_name_1', '+37064827559', '1_email@gmail.com', 1),
(2, 2, 'first_name_1', 'last_name_1', '+37064848614', '2_email@gmail.com', 2),
(3, 3, 'first_name_3', 'last_name_3', '+37064827559', '3_email@gmail.com', 3),
(4, 4, 'first_name_4', 'last_name_4', '+37064827894', '4_email@gmail.com', 4),
(5, 5, 'first_name_5', 'last_name_5', '+37061127559', '5_email@gmail.com', 5),
(6, 6, 'first_name_6', 'last_name_6', '+37064567894', '6_email@gmail.com', 6),
(7, 7, 'first_name_7', 'last_name_7', '+37061155159', '7_email@gmail.com', 7),
(8, 8, 'first_name_8', 'last_name_8', '+37064563364', '8_email@gmail.com', 8),
(9, 9, 'first_name_9', 'last_name_9', '+37061654559', '9_email@gmail.com', 9),
(10, 10, 'first_name_10', 'last_name_10', '+37064217894', '10_email@gmail.com', 10);

#create Orders table and insert values
CREATE TABLE Orders (
  order_id int NOT NULL,
  order_details_id int NOT NULL,
  order_date date DEFAULT NULL,
  shipping_date date DEFAULT NULL
);

ALTER TABLE Orders
  ADD PRIMARY KEY (order_id),
  ADD KEY order_details_id (order_details_id),
  MODIFY order_id INTEGER NOT NULL AUTO_INCREMENT;

INSERT INTO Orders (order_details_id, order_date, shipping_date) VALUES
(1, '2020-03-01', '2020-03-08'),
(2, '2020-03-03', '2020-03-05'),
(3, '2020-03-04', '2020-03-06'),
(4, '2020-03-05', '2020-03-07'),
(5, '2020-03-05', '2020-03-07'),
(6, '2020-03-07', '2020-03-09'),
(7, '2020-03-08', '2020-03-10'),
(8, '2020-03-09', '2020-03-11'),
(9, '2020-03-10', '2020-03-12'),
(10, '2020-03-11', '2020-03-13');

#create Adress table and insert values
CREATE TABLE Address (
  address_id int NOT NULL,
  country varchar(20) DEFAULT NULL,
  town varchar(20) DEFAULT NULL,
  street varchar(20) DEFAULT NULL,
  house int DEFAULT NULL,
  zip_code varchar(20) NOT NULL
);

ALTER TABLE Address
  ADD PRIMARY KEY (address_id),
  MODIFY address_id INTEGER NOT NULL AUTO_INCREMENT;

INSERT INTO Address (country, town, street, house, zip_code) VALUES
('Lithuania', 'Vilnius', '1_didlaukio', 15, '14892'),
('Lithuania', 'Kaunas', '2_didlaukio', 20, '18562'),
('Lithuania', 'Klaipeda', '3_didlaukio', 45, '15856'),
('Lithuania', 'Šiauliai', '4_didlaukio', 56, '17456'),
('Lithuania', 'Ukmergė', '5_didlaukio', 10, '17895'),
('Latvia', 'Riga', '6_didlaukio', 48, '17654'),
('Latvia', 'Riga', '7_didlaukio', 49, '14656'),
('Latvia', 'Riga', '8_didlaukio', 99, '18656'),
('Poland', 'Warsaw', '9_didlaukio', 49, '14656'),
('Poland', 'Warsaw', '10_didlaukio', 3, '14979');

#create Payment table and insert values
CREATE TABLE Payment (
  payment_id int NOT NULL,
  date datetime NOT NULL,
  method varchar(20) NOT NULL
);

ALTER TABLE Payment
  ADD PRIMARY KEY (payment_id),
  MODIFY payment_id INTEGER NOT NULL AUTO_INCREMENT;
  
INSERT INTO Payment (date, method) VALUES
('2021-03-02 19:37:09.000000', 'SwedBank'),
('2021-03-03 20:28:16.000000', 'SEB'),
('2021-03-04 20:28:16.000000', 'Revolut'),
('2021-03-05 20:29:03.000000', 'SwedBank'),
('2021-03-06 20:29:03.000000', 'Western Union'),
('2021-03-07 20:29:48.000000', 'Revolut'),
('2021-03-08 20:29:48.000000', 'Luminor'),
('2021-03-09 20:30:33.000000', 'SwedBank'),
('2021-03-10 20:30:33.000000', 'SEB'),
('2021-03-11 20:31:00.000000', 'SwedBank');

#create Order_details table and insert values
CREATE TABLE Order_details (
  order_details_id int NOT NULL,
  product_id int NOT NULL,
  quantity int NOT NULL,
  total_price float NOT NULL
);

ALTER TABLE Order_details
  ADD PRIMARY KEY (order_details_id),
  ADD KEY product_id (product_id),
  MODIFY order_details_id INTEGER NOT NULL AUTO_INCREMENT;

INSERT INTO Order_details (product_id, quantity, total_price) VALUES
(1, 1, 20.99),
(2, 2, 51.98),
(3, 1, 21.99),
(4, 1, 16.99),
(5, 2, 35.98),
(6, 1, 1.09),
(7, 1, 13.99),
(8, 1, 0.99),
(9, 1, 11.99),
(10, 2, 26.98);

#Kurjerio lentele
create table courier
(
	courier_id int not null,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
    order_id int NOT NULL,
	phone_number varchar(20) NOT NULL,
	e_mail varchar(30) NOT NULL,
	bank_account varchar(15) NOT NULL
);

ALTER TABLE courier
	ADD PRIMARY KEY (courier_id),
    ADD KEY order_id2 (order_id),
    MODIFY courier_id INTEGER NOT NULL AUTO_INCREMENT;

INSERT INTO courier (first_name, last_name, order_id, phone_number, e_mail, bank_account) VALUES
('Mantas', 'Kubilius', 6, '+37064209969', 'parduodukubilus@gmail.com', 'LT100045698213'),
('Viktoras', 'Baryga', 5, '+37063565522', 'vezuimu@gmail.com', 'LT100009166213'),
('Paulius', 'Mykolaitis', 9, '+37067968844', 'paulekas2@gmail.com', 'LT100009142069'),
('Igor', 'Katin', 4, '+37063697711', 'katinukas@gmail.com', 'LT100098766654'),
('Julius', 'Spiperofskis', 2, '+37062584621', '360noscope@gmail.com', 'LT100009166111');

CREATE TRIGGER OrderDetailsInsert BEFORE INSERT ON order_details FOR EACH ROW
UPDATE Product
SET Product.quantity = Product.quantity - NEW.quantity
WHERE Product.product_id = NEW.product_id;


#Add constraints
 ALTER TABLE Customer
  ADD CONSTRAINT address_id FOREIGN KEY (address_id) REFERENCES Address (address_id),
  ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES Orders (order_id),
  ADD CONSTRAINT payment_id FOREIGN KEY (payment_id) REFERENCES Payment (payment_id);
  
ALTER TABLE Orders
  ADD CONSTRAINT order_details_id FOREIGN KEY (order_details_id) REFERENCES Order_details (order_details_id);

ALTER TABLE Order_details
  ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES Product (product_id);
  
ALTER TABLE courier
  ADD CONSTRAINT order_id2 FOREIGN KEY (order_id) REFERENCES Orders (order_id);
  
#Užklausos

#1 Gauname Kliento duomenis
SELECT first_name as Name, last_name as Surname, phone_number as Phone, e_mail as Email
FROM Customer
WHERE customer_id = 5; 

#2 Gauname Klientų duomenis nuo vieno ID iki kito
SELECT * FROM customer
where customer_id between 3 and 7;

#3 Pakeiciame kliento pasta pagal ID
UPDATE customer
set e_mail = 'kristiskietas@gmail.com'
where customer_id = 5;

UPDATE address 
SET country = 'Switzerland', town = 'Zurich', street = 'Meisweiser'
where address_id = 5; 

SELECT brand as Brand, type as Type, alcohol_percentage as '%', volume as Volume, price as Price
FROM product
where brand = 'Captain Morgan';

SELECT Customer.first_name as Name, Customer.last_name as Surname, Payment.method
FROM customer
JOIN payment ON Customer.payment_id = Payment.payment_id
WHERE Payment.method = 'SwedBank';

select count(*) as Klientu_kiekis from customer;

SELECT c.customer_id, c.first_name, c.last_name, p.type FROM customer c 
JOIN orders o ON c.order_id = o.order_id
JOIN order_details od ON o.order_details_id = od.order_details_id
JOIN product p ON od.product_id = p.product_id
WHERE p.type IN ('Whiskey', 'Vodka');

SELECT first_name as Name, last_name as Surname, e_mail as E_mail, phone_number as Phone
FROM courier
where courier_id = 5;

SELECT courier_id as ID, first_name as Name, last_name as Surname
FROM courier
WHERE order_id = 6;

update product
set quantity = 40
where product_id = 2;

insert into product (price, brand, type, alcohol_percentage, volume, quantity) VALUES
(12.99, 'Bacardi', 'Romas', 37.5, 0.7, 63);
