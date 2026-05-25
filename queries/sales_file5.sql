-- ranking producs by revenue
SELECT product_id, sum(quantity * price) as revenue,
       DENSE_RANK() 
              OVER(ORDER BY sum(quantity * price)) AS rank_revenue 
FROM file_out
GROUP BY product_id; 
--
--
-- top products per customer
WITH ranked_products as (
SELECT product_id, customer, 
SUM(quantity) as total_quantity,
   DENSE_RANK() over(PARTITION BY customer ORDER BY sum(quantity) DESC) AS rank_product 
             FROM file_out GROUP BY  product_id, customer)
SELECT 
    *
FROM
    ranked_products
WHERE
    rank_product = 1;
--
--
-- 