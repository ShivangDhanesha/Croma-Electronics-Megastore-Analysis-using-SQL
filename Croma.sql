show databases;

use fingertips;

show tables;

create table electronics (
product_code int (2),
product_name varchar (30),
product_price int (10),
manufacturer_code int (2)
);

select * from electronics;

insert into electronics values
(1, "1TB Hard Disk Drive",2500,1),
(2,"Printer", 6500, 3),
(3,"64GB Pen Drive", 700, 6),
(4, "6 GB Graphic Card", 12800, 5),
(5,"22 Inches Monitor", 10600,2),
(6, "512GB Solid State Drive", 4200,1),
(7,"Mouse", 400,6),
(8,"450 Watt Power Supply Unit", 3600,4),
(9,"Printer Cartridge", 2500,3),
(10, "Membrane Keyboard",900,4),
(11,"Bluetooth Speakers",2000,10),
(12,"42 Inches Television",24600,2),
(13, "CPU Cabinet", 1900, 6),
(14, "Laptop Adjustable Stand",1250,7),
(15,"8GB RAM",2600,4),
(16,"Motherboard",6500,8),
(17,"Ergonomic Chair",9700,6),
(18,"Monitor Arm Stand", 2600,7),
(19,"Wifi Adapter",300,9),
(20,"HD Webcam",1000,8);

show tables;

create table Manufacturers (
Manufacturer_code int(2),
Manufacturer_Name varchar (20));

select * from manufacturers;

insert into manufacturers values
(1, "Western Digital"),
(2,"Samsung"),
(3,"Hewlett Packard"),
(4,"Corsair"),
(5, "Asus"),
(6,"Ant esports"),
(7,"Cosmic Byte"),
(8,"Zebronics"),
(9,"TP-Link"),
(10,"boAt");

show tables;

#1 Select the names of all the products in the inventory.
select * from electronics;

#2 Select the names and the prices of all the products in the inventory.
select product_name,product_price from electronics;

#3  Use an Alias "Name" and print all the product names
select product_name as Name from electronics;

#4 Select the name of the products with a price less than or equal to 8000 Indian Rupees.
select product_name,product_price from electronics where product_price <=8000;

#5 Select all the products with a price between 2000 and 10000 Indian Rupees.
select * from electronics where product_price between 2000 and 10000;

#6 List the details of all such products whose manufacturer_code is 6
select * from electronics where manufacturer_code = 6;

#7 List the details of all such products whose manufacturer_code is 6 as well as their price is greater than 5000
select * from electronics where manufacturer_code = 6 and product_price > 5000;

#8 List the details of all such products other than whose manufacturer_code is 6
select * from electronics where not manufacturer_code = 6;

#9 Select the name of the products whose name starts with 'M'
select * from electronics where product_name like "m%";

#10 List the name of products whose name starts with "M" and ends with "D"
select * from electronics where product_name like "m%d";

#11 List the name of products which starts from "M" ends with "D" but also has ONLY 9 characters in between.
select * from electronics where product_name like "m_________d";

#12 Concatenate name of the product with its price in a single column
select concat(product_name,"    ",product_price) as Name_and_Price from electronics; 

#13 Select the name and price in dollars (i.e. the price must be divided by 80.)
select product_name,product_price as Price_in_Rupees , product_price/80 as Price_in_dollars from electronics;

#14 Compute the average price of all the products in Indian Rupees.
select avg(product_price) from electronics;

#15 Compute the average price of all products with manufacturer code equal to 3.
select avg(product_price) from electronics where manufacturer_code = 3 ;

#16 What is the total cost of products where manufacturer_code is 2?
select sum(product_price) from electronics where manufacturer_code = 2;

#17 Compute the number of products with a price greater than or equal to 5000.
select count(product_name) from electronics where product_price >= 5000;

#18 Select the name and price of all products with a price larger than or equal to 5000 Indian Rupees and sort them by price (in descending order), and then by their name (in ascending order).
select product_name, product_price from electronics where product_price >=5000 order by product_price desc, product_name asc;

#19 Select all the data from the inventory, including all the data for each product's manufacturer.
select electronics.* , manufacturers.* from electronics inner join manufacturers on electronics.manufacturer_code = manufacturers.Manufacturer_code;

#20 Select the product name, price, and manufacturer name of all the products.
select electronics.product_name ,electronics.product_price , manufacturers.Manufacturer_Name from electronics inner join manufacturers
on electronics.manufacturer_code = manufacturers.Manufacturer_code;

#21 Select the average price of each manufacturer's products, showing only the manufacturer's code.
select manufacturer_code, avg(product_price) from electronics group by manufacturer_code;

#22 Select the average price of each manufacturer's products, showing the manufacturer's name.
select manufacturers.Manufacturer_Name ,avg(electronics.product_price) from electronics inner join manufacturers 
on electronics.manufacturer_code = manufacturers.Manufacturer_code 
group by manufacturers.Manufacturer_Name order by avg(electronics.product_price);

#23 Select the names of manufacturer whose products have an average price greater than or equal to 5000 Indian Rupees.
select manufacturers.Manufacturer_Name , avg(electronics.product_price) from electronics inner join manufacturers 
on electronics.manufacturer_code = manufacturers.Manufacturer_code 
group by manufacturers.Manufacturer_Name having avg(electronics.product_price) >= 5000;

#24 Select the name and price of the cheapest product.
select product_name, product_price from electronics where product_price = (select min(product_price) from electronics);

#25 Select the name of each manufacturer along with the name and price of its most expensive product. 
select manufacturers.Manufacturer_Name, electronics.product_name, electronics.product_price from electronics inner join manufacturers
on electronics.manufacturer_code = manufacturers.Manufacturer_code where electronics.product_price = (select max(product_price) from electronics);

#26  Add a new product: Speaker with a price 1000 INR and manufacturer code 10 
insert into electronics values 
(21, "Speaker",1000,10);
select * from electronics ;

#27 Update the name of the product "Speakers" to "Wired Speakers". 
update electronics set product_name = "Wired Speakers" where product_name = 'Speakers'; 

#28 Apply a 10% discount to all products.
select product_code,product_name,product_price as Old_Price, product_price * 0.1 as Discount, product_price * 0.9 as Selling_Price from electronics;

#29 Apply a 10% discount to all products with a price greater than or equal to 5000 Indian Rupees.
select product_Code,product_Name,product_Price, product_price*10/100 as Discount,product_price* 90/100 as Selling_Price
from electronics where product_Price >= 5000;

#30 List the name of the products along with their manufacturer name and price and arrange them as per their price
select electronics.product_name,electronics.product_price , manufacturers.Manufacturer_Name from electronics inner join manufacturers
on electronics.manufacturer_code = manufacturers.Manufacturer_code order by electronics.product_price asc;