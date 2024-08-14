USE mydb;  -- Ensure you are using the correct database

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()  -- Include empty parentheses
BEGIN
    SELECT MAX(o.Quantity) AS MaxQuantity
    FROM orderdetails o;
END //

DELIMITER ;
