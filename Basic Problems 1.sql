/*Business Problems*/

/*selecting customers from spcific city*/

select* from customers where city ='Tampa';

/*products with a price greater than $500, sorted by price*/

select*from products
where price>500
order by price;

/*orders with a total amount between $100 and $500*/

select*from orders
where total_amount between 100 and 500;

/*counting number of products in each category*/

select 
category_id,
count(*) as product_count
from products
group by category_id;

/*total sales amount per customer*/

select 
customer_id,
sum(total_amount)as total_sales
from orders
group by customer_id;



/*finding avg product price*/

select 
round(avg(price),2)as average_price
from products;

/* finding avg order value*/

select
round(avg(total_amount),1)
from orders;

/*retrive all orders for a specific customer*/

select
o.order_id,
o.order_date,
o.total_amount,
concat(first_name,' ',last_name)as customer_fullname
from orders o
join customers c on o.customer_id=c.customer_id
where c.customer_id = 3;

/*finding total sales for each product*/

select
p.product_name,
sum(oi.quantity*oi.price)as total_sales
from orderitems oi 
join products p 
on oi.product_id=p.product_id
group by p.product_name;


