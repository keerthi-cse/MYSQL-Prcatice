-- Setting the context before learning windows functions
select * from dim_product;
SELECT avg(unit_price) AS avg_price from dim_product
SELECT sum(unit_price) AS total_price from dim_product

SELECT 
	category,
    avg(unit_price) AS avg_price,
    sum(unit_price) AS total_price
FROM 
	dim_product
GROUP BY 
	category;
	
-- WINDOW FUNCTIONS : These are applied on ROW. These are Row-level operations
-- 1) -- RUNNING SUM/TOTAL BY DATE
SELECT
	*,
    SUM(unit_price) OVER(ORDER BY unit_price)
FROM 
	dim_product;
-- 1.1)
SELECT
	*,
    SUM(unit_price) OVER(ORDER BY launch_date)
FROM 
	dim_product;
    
-- 2) FRAMES
SELECT 
	*,
    SUM(unit_price) OVER(ORDER BY launch_date ROWS BETWEEN unbounded preceding AND current row)
FROM 
	dim_product;

SELECT 
	*,
    SUM(unit_price) OVER(ORDER BY launch_date ROWS BETWEEN unbounded preceding AND unbounded following)
FROM 
	dim_product;

-- RANKING
-- 1 @ 454)
SELECT 
	unit_price,
    ROW_NUMBER() OVER(ORDER BY unit_price) AS 'row_number',
    RANK() OVER(ORDER BY unit_price) AS 'rank',
    DENSE_RANK() OVER(ORDER BY unit_price) AS 'dense_rank'
FROM 
	dim_product;

-- 2)
SELECT 
	unit_price,
    category,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY unit_price) AS 'row_number',
    RANK() OVER(PARTITION BY category ORDER BY unit_price) AS 'rank',
    DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price) AS 'dense_rank'
FROM 
	dim_product



