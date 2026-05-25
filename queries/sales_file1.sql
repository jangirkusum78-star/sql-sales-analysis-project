-- creating database
create database sales_analysis;
show databases;
use sales_analysis;
drop table if exists file_out;
-- creating tables
create table file_out (
    document_id INT,
    order_date Date,
	product_id INT,
    price DECIMAL(10,2),
    discount decimal(10,2),
    customer INT,
    quantity INT);
-- creating table 2
CREATE TABLE file_out2 (
      invoice_id INT,
    invoice_date DATE,
	product_id VARCHAR(50),
    total_sales DECIMAL(10,2),
    discount DECIMAL(5,2),
    customer_id INT,
    quantity INT);
    
-- checking the datasets
select * from file_out;
select * from file_out2;
