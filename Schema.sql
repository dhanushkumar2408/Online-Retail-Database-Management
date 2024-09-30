create database Online_RetailDB;

USE online_retaildb;

/*Creating Customer Table*/

create table customers
(
customer_id INT PRIMARY KEY auto_increment,
first_name varchar(50),
last_name varchar(50),
email varchar(100),
phone varchar(20),
address varchar(255),
city varchar(25),
state varchar(25),
zipcode varchar(50),
country varchar(20),
created_at datetime default current_timestamp
);


/*creating products table*/

create table products(
product_id int primary key auto_increment,
product_name varchar(100),
category_id int,
price decimal(10,2),
stock int,
created_at datetime default current_timestamp
);


/*creating categories table*/

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100),
    description VARCHAR(255)
);

/*Creating orders table*/

create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date datetime default current_timestamp,
total_amount decimal(10,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

/*creating orderitems table*/

create table orderItems(
order_itemId INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
product_id int,
quantity int,
price decimal(10,2),
foreign key (product_id) REFERENCES products(product_id),
foreign key(order_id) references orders(order_id)
);

select*from customers;





