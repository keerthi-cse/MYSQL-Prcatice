-- REAL TIME SCENARIOS

-- -- SCENARIO 1 [Finding the nth value]
SELECT 
	subquery.* 
FROM 
(
SELECT 
	*,
    DENSE_RANK() OVER(ORDER BY unit_price) AS ranking
FROM 
	dim_product
) subquery
WHERE 
	ranking = 5;
    

-- SCENARIO 2 [Finding the nth value of each category most affordable]
SELECT 
	subquery.* 
FROM 
(
SELECT 
	*,
    DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price) AS ranking
FROM 
	dim_product
) subquery
WHERE 
	ranking = 5;

-- SCENARIO 3 [Finding the nth value of each category most expensive]
SELECT 
	subquery.* 
FROM 
(
SELECT 
	*,
    DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price DESC) AS ranking
FROM 
	dim_product
) subquery
WHERE 
	ranking = 5;    
  
  
-- SCENARIO 4 [Removing Duplicates using Row_number]
INSERT INTO customers VALUES
(301,'venki','cc@gmail.com');

select * from customers;
--
 
SELECT 
	subquery.*
FROM 
(
SELECT 
	*,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS dedup
FROM 
	customers
) subquery
WHERE 
	dedup = 1;


-- SCENARIO 5 [Lag & Lead]

CREATE TABLE weather
(
	id INT,
	temp FLOAT
);

INSERT INTO weather VALUES
(1,10),
(2,12),
(3,9),
(4,15),
(5,20),
(6,15),
(7,12);

SELECT * FROM weather;

-- Need to display the temperature of previous day.
SELECT 
	*,
    LAG(temp,1,0) OVER(ORDER BY id ASC) AS prev_day_temp,
    LAG(temp,2,0) OVER(ORDER BY id ASC) AS prev_2days_temp,
    LEAD(temp,1,0) OVER(ORDER BY id ASC) AS next_day_temp
FROM 
	weather;