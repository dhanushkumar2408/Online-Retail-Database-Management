/*Update Stock After an Order* - This trigger decreases the stock qty
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

/*to Update Total Amount in Orders*/

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

/*Trigger to Log Deletion of Orders
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



INSERT INTO orders (customer_id, total_amount)
VALUES (2, 150.00);

delete from orders
where order_id = 32;
