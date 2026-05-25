# Sql Sales &  Invoice Analysis Project

## Project Overview

This project focuses on analyzing sales and invoice transaction datasets using SQL. The analysis was performed to derive business insights related to product performance, revenue trends, customer purchasing behavior, discounts, and sales growth.

The project demonstrates practical SQL skills including:

* Data cleaning
* Data transformation
* Aggregations
* Joins
* Window functions
* Subqueries
* Common Table Expressions (CTEs)
* Business KPI analysis

The datasets contain transactional sales and invoice information that were analyzed using MySQL.

---

# Dataset Information

## Table 1: file_out

| Column Name | Description                    |
| ----------- | ------------------------------ |
| document_id | Unique transaction document ID |
| order_date  | Date of order placed           |
| product_id  | Product identifier             |
| price       | Product price                  |
| customer    | Customer information           |
| quantity    | Quantity purchased             |

---

## Table 2: file_out2

| Column Name  | Description             |
| ------------ | ----------------------- |
| invoice_id   | Invoice identifier      |
| invoice_date | Invoice generation date |
| product_id   | Product identifier      |
| total_sales  | Total invoice sales     |
| discount     | Discount applied        |
| customer_id  | Customer identifier     |
| quantity     | Quantity sold           |

---

# Objectives

The main objectives of this project were:

* Analyze product-wise revenue generation
* Identify top-selling and low-performing products
* Perform customer purchasing analysis
* Analyze discounts and invoice trends
* Generate cumulative and monthly sales insights
* Practice advanced SQL concepts using real transactional datasets

---

# Data Cleaning & Preprocessing

The following preprocessing steps were performed before analysis:

* Removed unnecessary blank index columns
* Renamed columns for better readability
* Standardized `sku` column to `product_id`
* Converted date columns into SQL-compatible format (`YYYY-MM-DD`)
* Handled duplicate primary key import issues
* Standardized naming conventions using snake_case

---


---

#  important Key SQL Queries Performed

## 1. Total Revenue Per Product

```sql
SELECT
    product_id,
    SUM(price * quantity) AS total_revenue

FROM file_out

GROUP BY product_id;
```

---

## 2. Top 5 Highest Revenue Products

```sql
SELECT
    product_id,
    SUM(price * quantity) AS revenue

FROM file_out

GROUP BY product_id

ORDER BY revenue DESC

LIMIT 5;
```

---

## 3. Monthly Revenue Trend

```sql
SELECT
    MONTH(order_date) AS month_no,

    SUM(price * quantity) AS monthly_revenue

FROM file_out

GROUP BY MONTH(order_date)

ORDER BY month_no;
```

---

## 4. Product Ranking Based On Revenue

```sql
SELECT
    product_id,

    SUM(quantity * price) AS revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(quantity * price) DESC
    ) AS revenue_rank

FROM file_out

GROUP BY product_id;
```

---

## 5. Second Highest Selling Product

```sql
SELECT
    product_id,
    total_sale

FROM file_out2

WHERE total_sale = (

    SELECT MAX(total_sale)

    FROM file_out2

    WHERE total_sale < (

        SELECT MAX(total_sale)
        FROM file_out2
    )
);
```

---

## 6. Cumulative Revenue Analysis

```sql
SELECT
    product_id,
    order_date,

    SUM(price * quantity)
    OVER(
        ORDER BY order_date
    ) AS cumulative_revenue

FROM file_out;
```

---

## 7. Revenue & Discount Analysis Using JOIN

```sql
SELECT
    f1.product_id,

    SUM(f1.price * f1.quantity) AS revenue,

    SUM(f2.discount) AS total_discount

FROM file_out f1

INNER JOIN file_out2 f2
ON f1.product_id = f2.product_id

GROUP BY f1.product_id;
```

---

```

---

# Key Business Findings

* Identified top-performing products contributing maximum revenue.
* Performed cumulative revenue analysis to track business growth trends.
* Analyzed monthly and daily sales performance.
* Ranked products using window functions for performance comparison.
* Detected low-performing products based on sales quantity.
* Evaluated total discounts provided across invoices.
* Analyzed customer purchasing behavior using grouped aggregations.
* Generated revenue contribution analysis for product-level insights.
* Joined sales and invoice datasets to create integrated business analysis.

---

# Project Outcomes


---

# Tools & Technologies Used

* MySQL
* SQL
* CSV Dataset


---

# Skills Demonstrated

* Data Cleaning
* SQL Query Writing
* Data Aggregation
* Joins & Relationships
* Window Functions
* Business KPI Analysis
* Revenue Analysis
* Customer Analytics
* Sales Trend Analysis

---

# Future Improvements

Possible future enhancements include:

* Power BI dashboard integration
* Tableau visualizations
* Customer segmentation analysis
* Profitability analysis
* Predictive sales forecasting using Python

---

# Conclusion

This project demonstrates end-to-end SQL-based sales and invoice analysis using transactional datasets. The analysis covers revenue generation, product ranking, cumulative sales analysis, customer behavior insights, and discount analysis using begineer-to-intermediate SQL techniques. The project highlights practical analytical problem-solving and business intelligence skills applicable to real-world data analyst and SQL-focused roles.
