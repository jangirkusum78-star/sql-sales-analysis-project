--  products existing in both tables
SELECT 
    f1.product_id, f1.price, f2.customer_id, f2.total_sales
FROM
    file_out f1
        INNER JOIN
    file_out2 f2 ON f1.product_id = f2.product_id
ORDER BY f1.price DESC;
--
--
-- revenue and discount analysis using join
SELECT 
    f1.product_id,
    SUM(f1.quantity * f1.price) AS revenue,
    SUM(f2.discount) AS total_discount
FROM
    file_out f1
        INNER JOIN
    file_out2 f2 ON f1.product_id = f2.product_id
GROUP BY f1.product_id;