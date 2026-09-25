-- CTEs [Common Table Expressions] : These are Alternatives to Sub-queries
-- We use CTEs, when we want to treat the result as a Table/temporary table.
-- CTEs can only be used at FROM clause but cannot be used at WHERE (or) any conditions.

-- Sub-query:
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
	product_name = 'Figure Method';

-- CTEs replace above subquery
-- 1
WITH cte_table AS
(
SELECT 
	* 
FROM 
	dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM dim_product)
)
SELECT * FROM cte_table WHERE product_name = 'Figure Method' ;

-- 2
WITH cte_table AS
(
SELECT 
	* 
FROM 
	dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM dim_product)
) 
SELECT * FROM cte_table
WHERE 
	product_name IN ('Figure Method','Huge Change', 'Film Finally') ;
    
-- 3
WITH cte_table AS
(
SELECT 
	* 
FROM 
	dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM dim_product)
),
cte_table_2 AS
(
SELECT * FROM cte_table
WHERE 
	product_name IN ('Figure Method','Huge Change', 'Film Finally') 
)
SELECT * FROM cte_table_2
WHERE product_name = 'Figure Method'