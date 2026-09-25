-- FUNCTIONS
-- PRE-DEFINED FUNCTIONS:
	-- UPPER(),LOWER(),CONCAT() etc
-- USER DEFINED FUNCTIONS - Are functions defined by us.

When to Use What?
✅ Use Stored Procedure when:
	You need complex logic
	Performing multiple operations (CRUD)
	Need transactions
	Handling large ETL/data pipelines (very relevant for Data Engineers)

✅ Use Function when:
	You need a calculated value
	Want to use logic inside a SELECT query
	Need reusability in queries

--------- SYNTAX--------------
CREATE FUNCTION function_name (parameters)
RETURNS data_type
[DETERMINISTIC | NOT DETERMINISTIC]
BEGIN
    -- Function body
END;
-----------------------
DELIMITER //
CREATE FUNCTION square_it(x INT)
RETURNS INT
DETERMINISTIC
BEGIN 
	return x*x ;
END //

DELIMITER ;



SELECT 
	unit_price,
    square_it(unit_price)
FROM 
	dim_product;
    
	
    
    
    
