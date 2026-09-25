-- STORED PROCEDURE

DELIMITER //
CREATE PROCEDURE first_procedure(IN p_id INT, IN p_name CHAR(100), IN p_email CHAR(100))
BEGIN
	INSERT INTO customers
    VALUES
    (p_id, p_name, p_email);
END //

DELIMITER ;

call ecom.first_procedure(10, 'blabla', 'ejccagcjg');

-- Multiple commands in Stored PROCEDURE

DELIMITER //
CREATE PROCEDURE second_procedure(IN p_id INT, IN p_name CHAR(100), IN p_email CHAR(100), IN p_id_update INT)
BEGIN
	INSERT INTO customers VALUES (p_id, p_name, p_email);
    update customers set email = p_email where id = p_id_update;
END //
DELIMITER ;

call second_procedure(110, 'hhhh', 'siva@gmail.com',101);

--- DROP PROCEDURE

DROP PROCEDURE first_procedure;