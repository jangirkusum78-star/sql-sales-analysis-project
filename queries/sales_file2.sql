-- counting the rows
select count(*) from file_out;
select count(*) from file_out2

-- finding average price of products;
SELECT 
    AVG(price) AS avg_price
FROM
    file_out;

-- total discounts given
SELECT 
    SUM(discount) AS total_discount
FROM
    file_out;

-- finding products with highest discount
SELECT 
    product_id, MAX(discount) AS highest_discount
FROM
    file_out
GROUP BY product_id
ORDER BY highest_discount DESC
LIMIT 5;
-- average quantity ordered
SELECT 
    AVG(quantity) AS avg_quantity
FROM
    file_out;
--
--
-- most frequently sold product
SELECT 
    product_id, COUNT(*) AS purchase_freq
FROM
    file_out
GROUP BY product_id
ORDER BY purchase_freq DESC
LIMIT 3;
--
--
-- duplicate product_ids
SELECT 
    product_id, COUNT(*) AS count
FROM
    file_out
GROUP BY product_id
HAVING COUNT(*) > 1;
--
--
-- finding loweest selling products
SELECT 
    product_id, SUM(quantity) AS total
FROM
    file_out
GROUP BY product_id
ORDER BY total ASC
LIMIT 5;
--
--
-- second highest selling product
SELECT 
    product_id, total_sales
FROM
    file_out2
WHERE
    total_sales = (SELECT 
            MAX(total_sales)
        FROM
            file_out2
        WHERE
            total_sales < (SELECT 
                    MAX(total_sales)
                FROM
                    file_out2));
--
--
-- 