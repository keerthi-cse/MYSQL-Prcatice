-- SUBQUERIES
-- 1)
SELECT AVG(unit_price) FROM dim_product;
SELECT * FROM dim_product WHERE unit_price > '495.790060';
-- One subquery
SELECT 
	* 
FROM 
	dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM dim_product);
    
-- 2)

SELECT AVG(unit_price) FROM dim_product;
SELECT * FROM dim_product WHERE unit_price > '495.790060' and product_name = 'Figure Method';

-- one sub-query with 3-level select statement
SELECT 
	* 
FROM 
(
	SELECT 
	* 
FROM 
	dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM dim_product)
) AS subquery_table
WHERE 
	product_name = 'Figure Method'


