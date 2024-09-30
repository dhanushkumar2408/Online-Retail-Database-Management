/*view to show order detailes with product info*/

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


/*List Orders by Customers in a Specific Country*/

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





