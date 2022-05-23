/* Creating Database for E-commerce website */
/* 1. Create Database */
create database ecommerce_dbms;
use ecommerce_dbms;

/* 2. Create tables supplier, customer, category, product, supplier_pricing, order, rating */
create table SUPPLIER( 
SUPP_ID int primary key auto_increment,
SUPP_NAME varchar(50),
SUPP_CITY varchar(50),
SUPP_PHONE varchar(50)
);

create table CUSTOMER(
CUS_ID int primary key auto_increment,
CUS_NAME varchar(20),
CUS_PHONE varchar(20),
CUS_CITY varchar(30),
CUS_GENDER char
);

create table CATEGORY(
CAT_ID int primary key auto_increment,
CAT_NAME varchar(20)
);

create table PRODUCT(
PRO_ID int primary key auto_increment,
PRO_NAME varchar(20),
PRO_DESC varchar(60),
CAT_ID int,
foreign key(CAT_ID) references CATEGORY(CAT_ID)
);

create table SUPPLIER_PRICING(
PRICING_ID int not null primary key,
PRO_ID int not null,
foreign key(PRO_ID) references PRODUCT(PRO_ID),
SUPP_ID int not null,
foreign key(SUPP_ID) references SUPPLIER(SUPP_ID),
SUPP_PRICE int default 0
);

create table `order`(
ORD_ID int primary key auto_increment,
ORD_AMOUNT int not null,
ORD_DATE date not null,
CUS_ID int,
foreign key(CUS_ID) references CUSTOMER(CUS_ID),
PRO_ID int,
foreign key(PRO_ID) references PRODUCT(PRO_ID)
);
drop table if exists `order`;

create table RATING(
RAT_ID int primary key auto_increment,
ORD_ID int,
foreign key(ORD_ID) references `order`(ORD_ID),
RAT_RATSTARS int not null
);
drop table if exists RATING;

/* Insert data in tables*/
insert into SUPPLIER (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (1, 'Rajesh Retails', 'Delhi', 1234567890);
insert into SUPPLIER (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (2, 'Appario Ltd.', 'Mumbai', 2589631470);
insert into SUPPLIER (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (3, 'Knome products', 'Banglore', 9785462315);
insert into SUPPLIER (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (4, 'Bansal Retails', 'Kochi', 8975463285);
insert into SUPPLIER (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (5, 'Mittal Ltd.', 'Lucknow', 7898456532);
select * from SUPPLIER;

insert into CUSTOMER (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values (1, 'AAKASH', 9999999999, 'DELHI', 'M');
insert into CUSTOMER (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values (2, 'AMAN', 9785463215, 'NOIDA', 'M');
insert into CUSTOMER (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values (3, 'NEHA', 9999999999, 'MUMBAI', 'F');
insert into CUSTOMER (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values (4, 'MEGHA', 9994562399, 'KOLKATA', 'F');
insert into CUSTOMER (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values (5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');
select * from CUSTOMER;

insert into CATEGORY (CAT_ID, CAT_NAME) values (1, 'BOOKS');
insert into CATEGORY (CAT_ID, CAT_NAME) values (2, 'GAMES');
insert into CATEGORY (CAT_ID, CAT_NAME) values (3, 'GROCERIES');
insert into CATEGORY (CAT_ID, CAT_NAME) values (4, 'ELECTRONICS');
insert into CATEGORY (CAT_ID, CAT_NAME) values (5, 'CLOTHES');
select * from CATEGORY;

insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (2, 'TSHIRT', 'SIZE-L with Black, Blue, and White variations', 5);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (4, 'OATS', 'Highly Nutritious from Nestle', 3);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (5, 'HARRY POTTER', 'Best Collection of all time by J.K.Rowling', 1);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (6, 'MILK', '1L Toned Milk', 3);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (9, 'Project IGI', 'compatible with windows 7 and above', 2);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1);
insert into PRODUCT (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (12, 'Train Your Brain', 'By Shireen Stephen', 1);
select * from PRODUCT;

insert into SUPPLIER_PRICING (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values (1, 1, 2, 1500);
insert into SUPPLIER_PRICING (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values (2, 3, 5, 30000);
insert into SUPPLIER_PRICING (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values (3, 5, 1, 3000);
insert into SUPPLIER_PRICING (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values (4, 2, 3, 2500);
insert into SUPPLIER_PRICING (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) values (5, 4, 1, 1000);
select * from SUPPLIER_PRICING;

insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (101, 1500, '2021-10-06', 2, 1);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (102, 1000, '2021-10-12', 3, 5);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (103, 30000, '2021-09-16', 5, 2);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (104, 1500, '2021-10-05', 1, 1);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (105, 3000, '2021-08-16', 4, 3);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (106, 1450, '2021-08-18', 1, 9);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (107, 789, '2021-09-01', 3, 7);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (108, 780, '2021-09-07', 5, 6);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (109, 3000, '2021-00-10', 5, 3);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (110, 2500, '2021-09-10', 2, 4);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (111, 1000, '2021-09-15', 4, 5);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (112, 789, '2021-09-16', 4, 7);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (113, 31000, '2021-09-16', 1, 8);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (114, 1000, '2021-09-16', 3, 5);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (115, 3000, '2021-09-16', 5, 3);
insert into `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRO_ID) values (116, 99, '2021-09-17', 2, 14);
select * from `order`;

insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (1, 101, 4);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (2, 102, 3);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (3, 103, 1);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (4, 104, 2);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (5, 105, 4);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (6, 106, 3);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (7, 107, 4);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (8, 108, 4);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (9, 109, 3);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (10, 110, 5);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (11, 111, 3);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (12, 112, 4);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (13, 113, 2);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (14, 114, 1);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (15, 115, 1);
insert into RATING (RAT_ID, ORD_ID, RAT_RATSTARS) values (16, 116, 0);
select * from RATING;
delete from RATING;

/* QUERIES */
select CUS_GENDER, COUNT(*) from CUSTOMER WHERE CUS_ID IN 
(SELECT distinct CUS_ID FROM `order` WHERE ORD_AMOUNT >= 3000) GROUP BY CUS_GENDER;

select * from `order` ord
join SUPPLIER_PRICING SP ON ord.PRO_ID = SP.PRICING_ID
join PRODUCT P ON SP.PRO_ID = P.PRO_ID WHERE ord.CUS_ID = 2;

select SUPP_ID, COUNT(*) from SUPPLIER_PRICING
GROUP BY SUPP_ID HAVING COUNT(SUPP_ID) > 1;
select * from SUPPLIER WHERE SUPP_ID IN ( SELECT SUPP_ID FROM SUPPLIER_PRICING
GROUP BY SUPP_ID HAVING COUNT(SUPP_ID) > 1);

select C.CAT_ID, C.CAT_NAME, P.PRO_NAME, MIN(SUPP_PRICE) FROM SUPPLIER_PRICING SP
JOIN PRODUCT P ON SP.PRO_ID = P.PRO_ID 
JOIN CATEGORY C ON P.CAT_ID = C.CAT_ID GROUP BY C.CAT_ID;

select ord.*, PR.PRO_ID, PR.PRO_NAME FROM `order` ord 
join SUPPLIER_PRICING SP ON ord.PRO_ID = SP.PRICING_ID
join PRODUCT PR ON SP.PRO_ID = PR.PRO_ID
where ord.ORD_DATE > '2021-10-05';

select CUS_NAME, CUS_GENDER FROM CUSTOMER
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';

DELIMITER $
CREATE PROCEDURE Display()
begin
select S.SUPP_ID, S.SUPP_NAME, R.RAT_RATSTARS,
CASE
when R.RAT_RATSTARS = 5 THEN 'Excellent Service'
when R.RAT_RATSTARS >= 4 THEN 'Good Service'
when R.RAT_RATSTARS > 2 THEN 'Average Service'
else 'Poor Service'
END AS TYPE_OF_SERVICE from RATING R 
JOIN `order` ord ON R.ORD_ID = ord.ORD_ID
JOIN SUPPLIER_PRICING SP ON ord.PRO_ID = SP.PRICING_ID
JOIN SUPPLIER S ON SP.SUPP_ID = S.SUPP_ID;
end$

DELIMITER ;
call Display();






















































 
