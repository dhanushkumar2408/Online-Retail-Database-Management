# Online-Retail-Database-Management

# Database Schema Overview

## Database: `Online_RetailDB`

All operations are conducted within the `Online_RetailDB` schema.

---

## Tables

### 1. Customers Table

**Description**: Holds customer details.

**Fields**:

- `customer_id` (Primary Key, Auto-Increment)
- `first_name`
- `last_name`
- `email`
- `phone`
- `address`
- `city`
- `state`
- `zipcode`
- `country`
- `created_at`

---

### 2. Products Table

**Description**: Contains product details.

**Fields**:

- `product_id` (Primary Key, Auto-Increment)
- `product_name`
- `category_id` (Foreign Key to `Categories.category_id`)
- `price`
- `stock`
- `created_at`

---

### 3. Categories Table

**Description**: Stores product categories.

**Fields**:

- `category_id` (Primary Key, Auto-Increment)
- `category_name`
- `description`

---

### 4. Orders Table

**Description**: Records customer orders.

**Fields**:

- `order_id` (Primary Key, Auto-Increment)
- `customer_id` (Foreign Key to `Customers.customer_id`)
- `order_date`
- `total_amount`

---

## Relationships

- **Customers ↔ Orders**: A one-to-many relationship where a customer can have multiple orders. The `customer_id` in the `Orders` table references the `customer_id` in the `Customers` table.
- **Products ↔ Categories**: A many-to-one relationship where multiple products can belong to one category. The `category_id` in the `Products` table references the `category_id` in the `Categories` table.

---

## Schema Description

This schema represents a simple relational database structure for managing retail operations, including customers, products, categories, and orders. It follows best practices such as:

- **Primary Keys**: Unique identifiers for each record in a table, using auto-increment for automatic assignment.
- **Foreign Keys**: Establish relationships between tables to maintain referential integrity.
- **Timestamps**: Use of `created_at` fields to track when records are created.

---

## Diagrammatic Representation

Below is a textual representation of the relationships:

```
Customers (customer_id) -----< Orders (customer_id)
Products (category_id)  -----> Categories (category_id)
```

---

## SQL Snippets

Here are example `CREATE TABLE` statements for clarity:

```sql
-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode VARCHAR(20),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100),
    description TEXT
);

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    stock INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

---

## Additional Notes

- **Data Integrity**: The use of foreign keys ensures that relationships between tables remain consistent.
- **Scalability**: The schema is designed to be scalable, allowing for easy addition of new tables or fields as needed.
- **Performance**: Indexes on primary and foreign keys improve query performance.

---
