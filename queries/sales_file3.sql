-- revenue based 
-- finding total revenue per product
SELECT 
    product_id, SUM(price * quantity) AS revenue
FROM
    file_out
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;
-- products above average revenue
SELECT 
    product_id, SUM(quantity * price) AS revenue
FROM
    file_out
GROUP BY product_id
HAVING revenue > (SELECT 
        AVG(price * quantity)
    FROM
        file_out);
-- finding monthly revenue trend
SELECT 
    MONTH(order_date) AS month_no,
    SUM(price * quantity) AS monthly_revenue
FROM
    file_out
GROUP BY MONTH(order_date)
ORDER BY month_no;

-- finding revenue generated per day
SELECT 
    order_date, SUM(price * quantity) AS daily_revenue
FROM
    file_out
GROUP BY order_date
ORDER BY order_date;
-- 

-- finding revenue by customer
SELECT 
    customer, SUM(price * quantity) AS revenue
FROM
    file_out
GROUP BY customer
ORDER BY revenue DESC;
-- finding running cumalative revenue
SELECT product_id, order_date, 
    SUM(price * quantity) 
            OVER(ORDER BY  order_date) AS cumalative_revenue FROM file_out;

--
-- finding revenue contibution percentage
SELECT 
    product_id,
    SUM(quantity * price) AS revenue,
    ROUND(SUM(quantity * price) * 100 / (SELECT 
                    SUM(price * quantity)
                FROM
                    file_out),
            2) AS revenue_percentage
FROM
    file_out
GROUP BY product_id;
--
-- 
-- 