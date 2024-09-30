/*creating a stored procedure to add a customer*/

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


/*getting customer information*/

DELIMITER $$

create PROCEDURE get_customer_info(IN p_customer_id int)
begin
select*from customers
where customer_id=p_customer_id;
end $$

delimiter ;


/*updating stock for a product- This updates stock of a product when an order is placed*/


DELIMITER $$

create procedure update_product_stock(IN p_product_id INT,IN p_quantity INT)
begin
update products
set stock = stock - p_quantity
where product_id = p_product_id;
end $$

delimiter ;

/*getting order details*/

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


/*getting products by category*/

delimiter $$

create procedure get_products_by_category(IN p_category_id INT)
BEGIN
select product_id,product_name,price,stock
from products
where category_id = p_category_id;
END$$

delimiter ;



