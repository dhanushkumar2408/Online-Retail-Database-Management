/*25.creating a stored procedure to add a customer*/

DELIMITER $$

CREATE procedure add_customer(
IN p_first_name varchar(50),
IN p_last_name varchar(50),
IN p_email varchar(100),
IN p_phone varchar(20),
IN p_address varchar(255),
IN p_city varchar(25),
IN p_state varchar(25),
IN p_zipcode varchar(50),
IN p_country varchar(20)
)
begin
insert into customers(first_name,last_name,email,phone,address,city,state,zipcode,country)
values(p_first_name,p_last_name,p_email,p_phone,p_address,p_city,p_state,p_zipcode,p_country);
end $$

DELIMITER ;


/*26. getting customer information*/

DELIMITER $$

create PROCEDURE get_customer_info(IN p_customer_id int)
begin
select*from customers
where customer_id=p_customer_id;
end $$

delimiter ;


/*27.Updating stock for a product- This updates stock of a product when an order is placed*/


DELIMITER $$

create procedure update_product_stock(IN p_product_id INT,IN p_quantity INT)
begin
update products
set stock = stock - p_quantity
where product_id = p_product_id;
end $$

delimiter ;

/*28.getting order details*/

delimiter $$

create procedure get_order_details(IN p_order_id INT)
begin
select o.order_id,o.order_date,o.total_amount,
c.first_name,c.last_name,c.email
from orders o
join
customers c using(customer_id)
where o.order_id = p_order_id;
end$$

delimiter ;


/*29.getting products by category*/

delimiter $$

create procedure get_products_by_category(IN p_category_id INT)
BEGIN
select product_id,product_name,price,stock
from products
where category_id = p_category_id;
END$$

delimiter ;


/*30.Update Stock After an Order* - This trigger decreases the stock qty
after an order is placed in orderitems table*/

delimiter $$

create trigger update_stock_after_order
after insert on orderitems
for each row
begin
update products
set stock = stock - NEW.quantity
where product_id = NEW.product_id;
end $$

/*31.to Update Total Amount in Orders*/

delimiter $$

create trigger update_order_total
after insert on orderitems
for each row 
begin
update orders
set total_amount = total_amount + (new.quantity * new.price)
where order_id = new.order_id;
end $$

delimiter ;

/*32.Trigger to Log Deletion of Orders
 logs the deletion of an order to a separate order_logs table.*/

create table order_logs(
log_id int primary key auto_increment,
order_id int,
customer_id int,
deletion_time datetime default current_timestamp
);

delimiter $$
create trigger log_order_deletion
after delete on orders
for each row
begin
 insert into order_logs(order_id,customer_id)
 values(old.order_id, old.customer_id);
 end $$
 
 delimiter ;


/*inserting sample to check orderlogs*/ 

INSERT INTO orders (customer_id, total_amount)
VALUES (2, 150.00);

delete from orders
where order_id = 32;


/*33.view to show order detailes with product info*/

create view order_detail as
select
o.order_id,
o.order_date,
p.product_name,
oi.quantity,
oi.price as item_price,
(oi.quantity*oi.price) as total_price
from orders o
join
orderitems oi using(order_id)
join products p using(product_id);


/*34.List Orders by Customers in a Specific Country*/

create view orders_by_country as
select
c.customer_id,
concat(c.first_name , ' ',c.last_name) as customer_name,
o.order_id,
o.order_date,
o.total_amount,
c.country
from customers c
join orders o using(customer_id)
where c.country = 'USA';


/*35.CREATING AN INDEX ON email addresses are often unique and commonly used
 to find customers, an index on the email column can speed up searches by email.*/
 
 create index index_email on customers(email);
 
 select* from customers where email = 'david.brown@example.com';
 
 /* 36 .Index on category_id in the products Table
 category_id is used frequently to JOIN queries and to link products with their categories,
 an index on this column can help improve performance*/
 
 create index index_category_id on products(category_id);
 
 
 /*37.Creating an Index on first_name and last_name in the customers Table*/
 
 create index index_name on customers(first_name,last_name);
 
 /*38.creating index on order_date orders table*/
 
 create index index_order_date on orders(order_date);
 
 
 /*to drop an index*/
 
 drop index index_order_date  on orders;
 
 
 /*39.Retrieve customers who have placed orders worth more than $500.00*/

select 
customer_id,
first_name,
last_name,
email
from customers
where customer_id in(
select customer_id from orders 
 where total_amount>500);

/* 40.Finding all products that are 
in the same category as a specific product ( product_id = 1)*/

select product_name
from products
where category_id =(
select category_id
from products 
where product_id = 1);


/*41.Get all orders that include at least
 one product from a specific category ( category_id = 2) */
 
select o.order_id,o.customer_id,o.order_date,o.total_amount
from orders o
where exists(
select 1 
from orderitems oi
join products p using(product_id)
where p.category_id = 2
and oi.order_id=o.order_id);


/*42. retrive full names of customers and their order IDs 
 for orders that include more than one distinct product. */

select 
concat(c.first_name, ' ' , c.last_name) as full_name,
o.order_id
from customers c
join orders o using(customer_id)
where o.order_id in(
select oi.order_id
from orderitems oi
group by oi.order_id
having count(distinct oi.product_id)>1
);


/*43.Retrieve all orders where the total amount is 
greater than the average order total for all orders */

select order_id,customer_id,total_amount
from orders
where total_amount >(
select round(avg(total_amount),2) as avg_amount
from orders);


/* 44.ranking customers by total order amount*/

select
c.customer_id,
concat(first_name, ' ',last_name) as full_name,
sum(o.total_amount) as total_spent,
rank()over(order by sum(o.total_amount)desc) as customer_rank
from customers c
join orders o using(customer_id)
group by c.customer_id                          
order by customer_rank;

/*45.Finding the Latest Order Date per Customer */

select
customer_id,
order_id,
order_date,
total_amount
from
(select
o.customer_id,
o.order_id,
o.order_date,
o.total_amount,
row_number()over(partition by o.customer_id order by o.order_date desc) as rn
from orders o) t1
where rn = 1;

 /*46.Finding Customers Who Spent Above Average on Their Orders
  --finds customers whose order totals exceed the average total for all orders*/

select
o.customer_id,
concat(c.first_name, ' ', c.last_name)as full_name,
o.order_id,
o.total_amount,
avg(o.total_amount) over() as avg_order_total
from orders o
join
customers c using(customer_id)
where o.total_amount > (
select avg(total_amount)from orders);


/*47. Calculating Percentage of Total Sales Contributed by Each Product */

select
p.product_id,
p.product_name,
sum(oi.quantity*oi.price) as total_sales,
sum(oi.quantity*oi.price) / sum(sum(oi.quantity*oi.price)) over()*100 as percentage_of_total_sales
from orderitems oi
join products p using(product_id)
group by 1,2
order by 1;


/* 48.retrieving Total Revenue by Product Category */

with category_revenue as(
select 
c.category_name,
sum(oi.quantity*oi.price)as total_revenue
from orderitems oi
join products p  using(product_id)
join categories c using(category_id)
group by c.category_name)
select* from category_revenue
order by total_revenue desc;

/*49. Retreiving Highest Quantity sold */

with popular_products as
(select
p.product_name,
sum(oi.quantity) as total_quantity_sold
from orderitems oi
join products p using(product_id)
group by p.product_name)
select*from popular_products
order by total_quantity_sold desc
limit 5;


/*50.display customers based on their spending*/

select
c.customer_id,
concat(c.first_name , ' ',c.last_name) as full_name,
sum(o.total_amount) as total_spent,
case 
when sum(o.total_amount)> 1000 then 'Premium'
when sum(o.total_amount) between 500 and 1000 then 'Gold'
else 'Regular'
end as customer_status
from customers c
join orders o
using(customer_id)
group by 1,2
order by 1;


/* 51.To display products based on stock levels */

select
p.product_id,
p.product_name,
p.stock,
case
when p.stock = 0 then 'Out of Stock'
when p.stock between 90 and 200 then 'Medium In Stock'
else 'High In Stock'
end as stock_status
from products p
order by 1;

/* 52.To display orders based on total amount */

select
o.order_id,
o.customer_id,
o.total_amount,
case
when o.total_amount > 1000 then 'High Value'
when o.total_amount between 450 and 1000 then 'Medium Value'
else 'Low Value'
end as order_category
from orders o
order by 1;




