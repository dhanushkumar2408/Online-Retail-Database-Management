/* ranking customers by total order amount*/

select
c.customer_id,
concat(first_name, ' ',last_name) as full_name,
sum(o.total_amount) as total_spent,
rank()over(order by sum(o.total_amount)desc) as customer_rank
from customers c
join orders o using(customer_id)
group by c.customer_id                          
order by customer_rank;

/*Finding the Latest Order Date per Customer */

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

 /*Finding Customers Who Spent Above Average on Their Orders
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


/* Calculating Percentage of Total Sales Contributed by Each Product */

select
p.product_id,
p.product_name,
sum(oi.quantity*oi.price) as total_sales,
sum(oi.quantity*oi.price) / sum(sum(oi.quantity*oi.price)) over()*100 as percentage_of_total_sales
from orderitems oi
join products p using(product_id)
group by 1,2
order by 1;




