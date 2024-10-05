/*Business Problems*/

/*1.selecting customers from spcific city*/

select* from customers where city ='Tampa';

/*2.products with a price greater than $500, sorted by price*/

select*from products
where price>500
order by price;

/*3.orders with a total amount between $100 and $500*/

select*from orders
where total_amount between 100 and 500;

/*4.counting number of products in each category*/

select 
category_id,
count(*) as product_count
from products
group by category_id;

/*5.total sales amount per customer*/

select 
customer_id,
sum(total_amount)as total_sales
from orders
group by customer_id;



/*6.finding avg product price*/

select 
round(avg(price),2)as average_price
from products;

/* finding avg order value*/

select
round(avg(total_amount),1)
from orders;

/*7.retrive all orders for a specific customer*/

select
o.order_id,
o.order_date,
o.total_amount,
concat(first_name,' ',last_name)as customer_fullname
from orders o
join customers c on o.customer_id=c.customer_id
where c.customer_id = 3;

/*8.finding total sales for each product*/

select
p.product_name,
sum(oi.quantity*oi.price)as total_sales
from orderitems oi 
join products p 
on oi.product_id=p.product_id
group by p.product_name;



/*9.retreiving top5 customers by total spending*/

select*from orders;

select
c.customer_id,
concat(c.first_name,' ',c.last_name)as customer_fullname,
sum(total_amount) as total_spent
from customers c
join
orders o using(customer_id)
group by c.customer_id
order by sum(total_amount) desc
limit 5;

/*10.finding Most popular product category*/

select category_id,category_name,total_qty_sold 
from
(select
c.category_id,
c.category_name,
sum(oi.quantity) as total_qty_sold,
row_number()over(order by sum(oi.quantity)desc)as row_num
from orderitems oi
join products p
on oi.product_id=p.product_id
join categories c
on p.category_id=c.category_id
group by c.category_id,c.category_name) as t1
where
row_num = 1;

/*11.out of stock products*/

select*from products where stock = 0;



/*12.finding customers who placed orders in last 30 days*/

select c.customer_id,
concat(c.first_name,' ',c.last_name) as full_name,
c.phone,
c.email
from customers c
join
orders o
on c.customer_id=o.customer_id
where o.order_date >= curdate() - interval 30 day;

/*13.caluculate total number of orders placed each month*/

select 
count(order_id) as total_orders,
year(order_date) as order_year,
month(order_date) as order_month
from orders
group by order_year , order_month
order by order_year , order_month;

/*14.retrieve details of most recent order*/

select
o.order_id,
o.customer_id,
o.order_date,
o.total_amount
from 
orders o
order by o.order_date desc
limit 1;

/*15.finding average price of products in each category*/

select
p.product_id,
p.product_name,
c.category_name,
avg(p.price) as average_price
from 
products p
join
categories c using (category_id)
group by 1,2,3
order by 1,2;

/*16.listing customers who never placed order*/

select
c.customer_id,
concat(first_name,' ',last_name) as full_name,
c.phone,
c.email
from
customers c
left join 
orders o
using(customer_id)
where o.customer_id is null;

/*17.total quantity sold for each product*/

select
p.product_id,
p.product_name,
sum(oi.quantity)as total_quantity
from products p 
join
orderitems oi
on
p.product_id = oi.product_id
group by p.product_id , p.product_name
order  by p.product_id;

/*18.total revenue generated from each category*/

select
c.category_id,
c.category_name,
sum(oi.quantity*oi.price)as revenue
from categories c
join
products p using(category_id)
join
orderitems oi using(product_id)
group by c.category_id, c.category_name
order by c.category_id;

/*19.highest priced product in each category*/

select
c.category_name,
p.product_name,
p.price
from products p
join 
categories c on p.category_id = c.category_id
where p.price =
(select
max(p2.price)
from products p2
where p2.category_id = p.category_id)
order by c.category_name;


/*20.retreiving orders with total amount greater than $450 */

select
order_id,
customer_id,
total_amount
from 
orders 
where total_amount > 450
order by total_amount desc;

/*21.listing the products along with number of orders they appear in*/

select
p.product_id,
p.product_name,
count(oi.order_id) as number_of_orders
from products p
join orderitems oi using(product_id)
group by p.product_id, p.product_name
order by count(oi.order_id) desc;

/*22.finding top 3 most frequently ordered products*/

select
p.product_id,
p.product_name,
count(oi.order_id) as order_count
from products p 
join orderitems oi using(product_id)
group by p.product_id, p.product_name
order by count(oi.order_id) desc
limit 3;

/*23.Total number of customers from each country*/

select
state,
count(customer_id) as number_of_customers
from customers 
group by state;


/*24.listing customers along with their customer spending*/

select
c.customer_id,
concat(first_name," ",last_name) as full_name,
sum(o.total_amount) as customer_spending
from
customers c
join
orders o using (customer_id)
group by 1,2
order by 1;








