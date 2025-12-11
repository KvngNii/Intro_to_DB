
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database
USE alx_book_store;

-- Drop tables if they exist
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Customers;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Create Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Create indexes for better query performance
CREATE INDEX idx_books_author ON Books(author_id);
CREATE INDEX idx_books_title ON Books(title);
CREATE INDEX idx_orders_customer ON Orders(customer_id);
CREATE INDEX idx_orders_date ON Orders(order_date);
CREATE INDEX idx_order_details_order ON Order_Details(order_id);
CREATE INDEX idx_order_details_book ON Order_Details(book_id);
CREATE INDEX idx_customers_email ON Customers(email);
