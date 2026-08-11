-- SETTING UP TABLES TO UNDERSTAND "JOINS"
CREATE TABLE orders
(
	o_id INT,
	cust_id INT,
	price INT
);

INSERT INTO orders VALUES
(1,101,1000),
(2,201,1100),
(3,501,1200);

CREATE TABLE customers
(
	cust_id INT,
	CUST_name VARCHAR(100),
	email VARCHAR(100)
);

INSERT INTO customers VALUES
(101,'nag','aa@gmail.com'),
(201,'chiru','bb@gmail.com'),
(301,'venki','cc@gmail.com');

-- **************************

-- WORKING WITH "JOINS" 
-- INNER JOIN : if you just mention JOIN, by default it treats as INNER JOIN.
SELECT 
	*
FROM 
	orders o 
INNER JOIN 
	customers c 
    ON 
		o.cust_id = c.id;

-- LEFT JOIN
SELECT 
	*
FROM 
	orders o 
LEFT JOIN 
	customers c 
    ON 
		o.cust_id = c.id;

-- RIGHT JOIN
SELECT 
	*
FROM 
	orders o 
RIGHT JOIN 
	customers c 
    ON 
		o.cust_id = c.id;
        
-- FULL JOIN (Not Supported in MySQL, however can be achieved using "UNION")
SELECT 
	*
FROM 
	orders o 
FULL JOIN 
	customers c 
    ON 
		o.cust_id = c.id;
        
        
-- UNIONS
SELECT 
	*
FROM 
	orders o 
LEFT JOIN 
	customers c 
    ON 
		o.cust_id = c.id

UNION

SELECT 
	*
FROM 
	orders o 
RIGHT JOIN 
	customers c 
    ON 
		o.cust_id = c.id;
        
        
        
        
        