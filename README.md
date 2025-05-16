Database ( MySQL ) code . 

CREATE DATABASE restaurant_db;
USE restaurant_db;

-- Users table for authentication
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    role ENUM('admin', 'manager', 'staff') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tables in the restaurant
CREATE TABLE restaurant_tables (
    table_id INT AUTO_INCREMENT PRIMARY KEY,
    table_number VARCHAR(20) NOT NULL UNIQUE,
    capacity INT NOT NULL,
    status ENUM('available', 'occupied', 'reserved', 'out_of_service') DEFAULT 'available',
    location VARCHAR(100)
);

-- Menu Categories
CREATE TABLE menu_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

-- Menu Items
CREATE TABLE menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    item_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_path VARCHAR(255),
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (category_id) REFERENCES menu_categories(category_id)
);

-- Orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    table_id INT,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'preparing', 'ready', 'served', 'paid', 'cancelled') DEFAULT 'pending',
    total_amount DECIMAL(10,2),
    notes TEXT,
    FOREIGN KEY (table_id) REFERENCES restaurant_tables(table_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Order Items
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT NOT NULL,
    special_requests TEXT,
    price_at_order DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- Inventory
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    quantity DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    reorder_level DECIMAL(10,2),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert admin user
INSERT INTO users (username, password, email, full_name, role) 
VALUES ('admin', 'admin@123', 'admin@restaurant.com', 'Admin User', 'admin');
-- Password: admin@123
