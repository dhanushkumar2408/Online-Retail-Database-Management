/* retrieving Total Revenue by Product Category */

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
