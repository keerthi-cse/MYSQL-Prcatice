-- DML COMMANDS

-- INSERT COMMAND (Already Done)

-- UPDATE COMMAND
UPDATE customers
SET name = 'sam'
WHERE email = 'aa';


-- DELETE COMMAND
DELETE FROM customers 
WHERE email = 'aa';

SELECT * FROM customers

-- TCL COMMANDS
SELECT * FROM ecom.orders;

START TRANSACTION;
delete from orders where o_id = 3;
update orders set price = 999 where o_id = 1;


ROLLBACK;

-------------- TRY BLOCK
BEGIN TRY
    BEGIN TRANSACTION;

    SAVE TRANSACTION del_up;

    DELETE FROM orders
    WHERE o_id = 3;

    UPDATE orders
    SET price = 999
    WHERE o_id = 1;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION del_up;

    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;