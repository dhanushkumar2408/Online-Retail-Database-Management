/*CREATING AN INDEX ON email addresses are often unique and commonly used
 to find customers, an index on the email column can speed up searches by email.*/
 
 create index index_email on customers(email);
 
 select* from customers where email = 'david.brown@example.com';
 
 /* Index on category_id in the products Table
 category_id is used frequently to JOIN queries and to link products with their categories,
 an index on this column can help improve performance*/
 
 create index index_category_id on products(category_id);
 
 
 /*Creating an Index on first_name and last_name in the customers Table*/
 
 create index index_name on customers(first_name,last_name);
 
 /*creating index on order_date orders table*/
 
 create index index_order_date on orders(order_date);
 
 
 /*to drop an index*/
 
 drop index index_order_date  on orders;
 