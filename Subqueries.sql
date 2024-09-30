/*Retrieve customers who have placed orders worth more than $500.00*/

select 
customer_id,
first_name,
last_name,
email
from customers
where customer_id in(
select customer_id from orders 
 where total_amount>500);

/* Finding all products that are 
in the same category as a specific product ( product_id = 1)*/

select product_name
from products
where category_id =(
select category_id
from products 
where product_id = 1);


/*Get all orders that include at least
 one product from a specific category ( category_id = 2) */
 
select o.order_id,o.customer_id,o.order_date,o.total_amount
from orders o
where exists(
select 1 
from orderitems oi
join products p using(product_id)
where p.category_id = 2
and oi.order_id=o.order_id);


/*retrive full names of customers and their order IDs 
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


/*Retrieve all orders where the total amount is 
greater than the average order total for all orders */

select order_id,customer_id,total_amount
from orders
where total_amount >(
select round(avg(total_amount),2) as avg_amount
from orders);


