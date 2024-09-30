/*retreiving top5 customers by total spending*/

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

/*finding Most popular product category*/

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

/*out of stock products*/

select*from products where stock = 0;


