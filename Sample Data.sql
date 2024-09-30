INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zipcode, country)
VALUES
('John', 'Doe', 'john.doe@example.com', '555-123-4567', '123 Main St', 'Los Angeles', 'CA', '90001', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '555-234-5678', '456 Oak St', 'San Francisco', 'CA', '94101', 'USA'),
('Michael', 'Johnson', 'michael.j@example.com', '555-345-6789', '789 Maple Ave', 'New York', 'NY', '10001', 'USA'),
('Emily', 'Davis', 'emily.davis@example.com', '555-456-7890', '101 Pine St', 'Chicago', 'IL', '60601', 'USA'),
('David', 'Brown', 'david.brown@example.com', '555-567-8901', '202 Birch St', 'Houston', 'TX', '77001', 'USA'),
('Jessica', 'Williams', 'jessica.w@example.com', '555-678-9012', '303 Cedar St', 'Phoenix', 'AZ', '85001', 'USA'),
('Daniel', 'Jones', 'daniel.jones@example.com', '555-789-0123', '404 Walnut Ave', 'Dallas', 'TX', '75201', 'USA'),
('Olivia', 'Garcia', 'olivia.g@example.com', '555-890-1234', '505 Spruce St', 'Miami', 'FL', '33101', 'USA'),
('James', 'Martinez', 'james.martinez@example.com', '555-901-2345', '606 Elm St', 'Seattle', 'WA', '98101', 'USA'),
('Sophia', 'Rodriguez', 'sophia.r@example.com', '555-012-3456', '707 Poplar St', 'Denver', 'CO', '80201', 'USA'),
('Matthew', 'Wilson', 'matthew.w@example.com', '555-123-4567', '808 Cherry St', 'Atlanta', 'GA', '30301', 'USA'),
('Ava', 'Lee', 'ava.lee@example.com', '555-234-5678', '909 Peach St', 'Boston', 'MA', '02101', 'USA'),
('Joshua', 'Perez', 'joshua.p@example.com', '555-345-6789', '1010 Plum St', 'Philadelphia', 'PA', '19101', 'USA'),
('Mia', 'Harris', 'mia.harris@example.com', '555-456-7890', '1111 Ash St', 'Orlando', 'FL', '32801', 'USA'),
('Ethan', 'Clark', 'ethan.c@example.com', '555-567-8901', '1212 Beech St', 'Austin', 'TX', '73301', 'USA'),
('Abigail', 'Young', 'abigail.y@example.com', '555-678-9012', '1313 Willow St', 'Portland', 'OR', '97201', 'USA'),
('Liam', 'King', 'liam.k@example.com', '555-789-0123', '1414 Redwood St', 'Las Vegas', 'NV', '89101', 'USA'),
('Isabella', 'Lopez', 'isabella.l@example.com', '555-890-1234', '1515 Fir St', 'San Diego', 'CA', '92101', 'USA'),
('Alexander', 'Hill', 'alexander.h@example.com', '555-901-2345', '1616 Cedar St', 'Tampa', 'FL', '33601', 'USA'),
('Emily', 'Scott', 'emily.s@example.com', '555-012-3456', '1717 Hemlock St', 'San Antonio', 'TX', '78201', 'USA'),
('Benjamin', 'Green', 'benjamin.g@example.com', '555-123-4567', '1818 Pine St', 'Salt Lake City', 'UT', '84101', 'USA'),
('Samantha', 'Adams', 'samantha.a@example.com', '555-234-5678', '1919 Maple St', 'Detroit', 'MI', '48201', 'USA'),
('Noah', 'Nelson', 'noah.n@example.com', '555-345-6789', '2020 Oak St', 'Cleveland', 'OH', '44101', 'USA'),
('Chloe', 'Baker', 'chloe.b@example.com', '555-456-7890', '2121 Birch St', 'Kansas City', 'MO', '64101', 'USA'),
('William', 'Carter', 'william.c@example.com', '555-567-8901', '2222 Spruce St', 'Indianapolis', 'IN', '46201', 'USA'),
('Amelia', 'Mitchell', 'amelia.m@example.com', '555-678-9012', '2323 Elm St', 'Memphis', 'TN', '38101', 'USA'),
('Logan', 'Perez', 'logan.p@example.com', '555-789-0123', '2424 Oak St', 'Columbus', 'OH', '43201', 'USA'),
('Grace', 'White', 'grace.w@example.com', '555-890-1234', '2525 Pine St', 'Charlotte', 'NC', '28201', 'USA'),
('Jacob', 'Harris', 'jacob.h@example.com', '555-901-2345', '2626 Fir St', 'Baltimore', 'MD', '21201', 'USA'),
('Avery', 'Lewis', 'avery.l@example.com', '555-012-3456', '2727 Ash St', 'Milwaukee', 'WI', '53201', 'USA');





INSERT INTO products (product_name, category_id, price, stock)
VALUES
('Apple iPhone 13', 1, 799.99, 50),
('Samsung Galaxy S21', 1, 699.99, 30),
('Google Pixel 6', 1, 599.99, 20),
('Sony WH-1000XM4 Headphones', 2, 349.99, 100),
('Bose QuietComfort 45', 2, 329.99, 80),
('Apple MacBook Pro', 3, 1299.99, 25),
('Dell XPS 13', 3, 999.99, 40),
('HP Spectre x360', 3, 1199.99, 15),
('Samsung 55" 4K TV', 4, 599.99, 60),
('LG 65" OLED TV', 4, 1799.99, 20),
('Sony PlayStation 5', 5, 499.99, 10),
('Microsoft Xbox Series X', 5, 499.99, 8),
('Nintendo Switch', 5, 299.99, 50),
('Logitech MX Master 3 Mouse', 6, 99.99, 200),
('Razer DeathAdder V2 Mouse', 6, 69.99, 150),
('Corsair K95 RGB Keyboard', 6, 199.99, 70),
('Asus ROG Strix Gaming Laptop', 3, 1499.99, 10),
('Acer Predator Helios 300', 3, 1299.99, 12),
('Apple iPad Pro', 7, 999.99, 40),
('Samsung Galaxy Tab S7', 7, 649.99, 35),
('Amazon Echo Dot', 8, 49.99, 500),
('Google Nest Hub', 8, 89.99, 300),
('Fitbit Charge 5', 9, 179.99, 120),
('Apple Watch Series 7', 9, 399.99, 90),
('Garmin Forerunner 245', 9, 299.99, 110),
('Dyson V11 Vacuum Cleaner', 10, 599.99, 75),
('iRobot Roomba i7', 10, 499.99, 80),
('Ninja Air Fryer', 11, 129.99, 150),
('Instant Pot Duo', 11, 89.99, 200),
('Breville Barista Espresso Machine', 12, 599.99, 50);





INSERT INTO categories (category_name, description)
VALUES
('Smartphones', 'Mobile phones with advanced features and capabilities'),
('Headphones', 'Audio devices for personal listening'),
('Laptops', 'Portable computers for personal and professional use'),
('Televisions', 'Large screen electronic devices for video display'),
('Gaming Consoles', 'Devices designed for playing video games'),
('Computer Accessories', 'Peripheral devices for computers, like keyboards and mice'),
('Tablets', 'Portable touch-screen devices for entertainment and work'),
('Smart Home Devices', 'Electronic devices used to automate home functionalities'),
('Wearable Tech', 'Electronic devices worn on the body, such as smartwatches'),
('Home Appliances', 'Electronic devices used in household tasks'),
('Kitchen Appliances', 'Appliances used for cooking and food preparation'),
('Coffee Machines', 'Appliances used to brew coffee beverages');












INSERT INTO orders (customer_id, total_amount)
VALUES
(1, 899.98),  -- Customer 1
(2, 329.99),  -- Customer 2
(3, 1199.99), -- Customer 3
(4, 599.99),  -- Customer 4
(5, 999.99),  -- Customer 5
(6, 300.00),  -- Customer 6
(7, 499.99),  -- Customer 7
(8, 199.98),  -- Customer 8
(9, 299.99),  -- Customer 9
(10, 599.99), -- Customer 10
(11, 449.99), -- Customer 11
(12, 289.99), -- Customer 12
(13, 699.99), -- Customer 13
(14, 120.00), -- Customer 14
(15, 329.99), -- Customer 15
(16, 500.00), -- Customer 16
(17, 219.99), -- Customer 17
(18, 399.99), -- Customer 18
(19, 249.99), -- Customer 19
(20, 1000.00),-- Customer 20
(21, 159.99), -- Customer 21
(22, 489.99), -- Customer 22
(23, 799.99), -- Customer 23
(24, 129.99), -- Customer 24
(25, 579.99), -- Customer 25
(26, 299.99), -- Customer 26
(27, 349.99), -- Customer 27
(28, 150.00), -- Customer 28
(29, 250.00), -- Customer 29
(30, 299.99); -- Customer 30









INSERT INTO orderItems (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 799.99),    -- Order 1: Apple iPhone 13
(1, 2, 1, 699.99),    -- Order 1: Samsung Galaxy S21
(2, 4, 1, 349.99),    -- Order 2: Sony WH-1000XM4 Headphones
(2, 5, 1, 329.99),    -- Order 2: Bose QuietComfort 45
(3, 6, 1, 1299.99),   -- Order 3: Apple MacBook Pro
(3, 7, 1, 999.99),    -- Order 3: Dell XPS 13
(4, 8, 1, 599.99),    -- Order 4: Samsung 55" 4K TV
(4, 9, 1, 1799.99),   -- Order 4: LG 65" OLED TV
(5, 10, 1, 499.99),   -- Order 5: Sony PlayStation 5
(5, 11, 1, 499.99),   -- Order 5: Microsoft Xbox Series X
(6, 12, 1, 299.99),   -- Order 6: Nintendo Switch
(6, 13, 1, 99.99),    -- Order 6: Logitech MX Master 3 Mouse
(7, 14, 1, 1299.99),  -- Order 7: Apple iPad Pro
(7, 15, 1, 649.99),   -- Order 7: Samsung Galaxy Tab S7
(8, 16, 1, 49.99),    -- Order 8: Amazon Echo Dot
(8, 17, 1, 89.99),    -- Order 8: Google Nest Hub
(9, 18, 1, 179.99),   -- Order 9: Fitbit Charge 5
(9, 19, 1, 399.99),   -- Order 9: Apple Watch Series 7
(10, 20, 1, 599.99),  -- Order 10: Dyson V11 Vacuum Cleaner
(10, 21, 1, 499.99),  -- Order 10: iRobot Roomba i7
(11, 22, 1, 129.99),  -- Order 11: Ninja Air Fryer
(11, 23, 1, 89.99),   -- Order 11: Instant Pot Duo
(12, 24, 1, 599.99),  -- Order 12: Breville Barista Espresso Machine
(13, 1, 1, 799.99),   -- Order 13: Apple iPhone 13
(13, 3, 1, 599.99),   -- Order 13: Google Pixel 6
(14, 4, 2, 349.99),   -- Order 14: Sony WH-1000XM4 Headphones (2 units)
(14, 6, 1, 1299.99),  -- Order 14: Apple MacBook Pro
(15, 7, 1, 999.99),   -- Order 15: Dell XPS 13
(15, 8, 1, 599.99),   -- Order 15: Samsung 55" 4K TV
(16, 9, 1, 1799.99),  -- Order 16: LG 65" OLED TV
(16, 10, 1, 499.99),  -- Order 16: Sony PlayStation 5
(17, 11, 1, 499.99),  -- Order 17: Microsoft Xbox Series X
(18, 12, 2, 299.99),  -- Order 18: Nintendo Switch (2 units)
(18, 13, 1, 99.99),   -- Order 18: Logitech MX Master 3 Mouse
(19, 14, 1, 1299.99), -- Order 19: Apple iPad Pro
(19, 15, 1, 649.99),  -- Order 19: Samsung Galaxy Tab S7
(20, 16, 1, 49.99),   -- Order 20: Amazon Echo Dot
(20, 17, 1, 89.99);   -- Order 20: Google Nest Hub



