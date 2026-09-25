-- VIEWS
CREATE VIEW dedup_view AS
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
    
-- Example-2
CREATE VIEW avg_unitprice_dimproduct_view AS    
SELECT * FROM dim_product WHERE unit_price > (SELECT AVG(unit_price) FROM dim_product);


-- Example-3
CREATE VIEW case_view AS    
select *,
CASE
when unit_price <= 100 and category = 'Clothing' then 'affordable'
when unit_price <= 200 and category = 'Clothing' then 'normal price'
when unit_price > 201 and category = 'Clothing' then 'expensive'
else 'not for anybody'
end as 'price_section'
from dim_product
    
-- To show the code/query inside the view
SHOW CREATE VIEW avg_unitprice_dimproduct_view;

-- To list the views in the database
SHOW FULL TABLES 
WHERE TABLE_TYPE = 'VIEW';    
    
    
    
    
    
    
    