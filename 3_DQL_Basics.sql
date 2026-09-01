-- FIRST SELECT 
SELECT * FROM dim_customer;
select count(*) from dim_product;


-- LIMIT 
SELECT 
	customer_id,
	email 
FROM 
	dim_customer
LIMIT 15;


-- WHERE [CONDITION]
-- 1
SELECT 
	* 
FROM 
	dim_customer 
WHERE 
	gender = 'F';

-- WHERE CONDITION/CLAUSE WITH 'DISTINCT'
SELECT DISTINCT COUNTRY FROM dim_customer WHERE GENDER = 'F';

/* WHERE CLAUSE OPERATORS: BETWEEN, LIKE, IN, >, >=, <, <=, ==, <> */
-- WHERE CLAUSE WITH 'IN'
SELECT * FROM dim_customer WHERE CITY IN ('Lake Timothy' ,'Josephstad');
SELECT * FROM dim_customer WHERE GENDER <> 'M';

-- USING (AND/OR) : GENDER AND COUNTRY/JOIN DATE 
SELECT 
	* 
FROM 
	dim_customer 
WHERE 
	(gender = 'F') AND ((country = 'France') OR (join_date > '2022-01-01'));
    

-- USING 'LIKE' FOR FIRST_NAME
-- 1)
SELECT 
	* 
FROM 
	dim_customer
WHERE 
	first_name LIKE 'T%';

-- USING 'LIKE' FOR FIRST_NAME : START AND END LETTERS
-- 2)
SELECT 
	* 
FROM 
	dim_customer
WHERE 
	first_name LIKE 'T__f%y';

    
-- Sorting ORDER BY : ASC/DESC
SELECT 
	* 
FROM 
	dim_product
ORDER BY 
	unit_price DESC 
LIMIT 3;


--  TABLE & COLUMN ALIAS
SELECT 
	product_key,
    product_id,
    product_name AS 'product name',
    category
FROM 
	dim_product;


-- GROUPING
-- 1
SELECT 
	category,
    avg(unit_price) AS avg_price,
    sum(unit_price) AS total_price
FROM 
	dim_product
GROUP BY 
	category;
    
-- 2
SELECT 
	category,
    avg(unit_price) AS avg_price,
    sum(unit_price) AS total_price
FROM 
	dim_product
GROUP BY 
	category
HAVING
	avg_price > 500;
    
    
    