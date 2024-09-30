/*finding customers who placed orders in last 30 days*/

select c.customer_id,
concat(c.first_name,' ',c.last_name) as full_name,
c.phone,
c.email
from customers c
join
orders o
on c.customer_id=o.customer_id
where o.order_date >= curdate() - interval 30 day;

/*caluculate total number of orders placed each month*/

select 
count(order_id) as total_orders,
year(order_date) as order_year,
month(order_date) as order_month
from orders
group by order_year , order_month
order by order_year , order_month;

/*retrieve details of most recent order*/

select
o.order_id,
o.customer_id,
o.order_date,
o.total_amount
from 
orders o
order by o.order_date desc
limit 1;

/*finding average price of products in each category*/

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

/*listing customers who never placed order*/

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

/*total quantity sold for each product*/

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

/*total revenue generated from each category*/

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

/*highest priced product in each category*/

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


/*retreiving orders with total amount greater than $450 */

select
order_id,
customer_id,
total_amount
from 
orders 
where total_amount > 450
order by total_amount desc;

/*listing the products along with number of orders they appear in*/

select
p.product_id,
p.product_name,
count(oi.order_id) as number_of_orders
from products p
join orderitems oi using(product_id)
group by p.product_id, p.product_name
order by count(oi.order_id) desc;

/*finding top 3 most frequently ordered products*/

select
p.product_id,
p.product_name,
count(oi.order_id) as order_count
from products p 
join orderitems oi using(product_id)
group by p.product_id, p.product_name
order by count(oi.order_id) desc
limit 3;

/*Total number of customers from each country*/

select
state,
count(customer_id) as number_of_customers
from customers 
group by state;


/*listing customers along with their customer spending*/

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






















