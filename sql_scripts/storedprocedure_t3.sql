DELIMITER //

CREATE PROCEDURE CancelOrder(
    IN p_OrderID VARCHAR(13)  -- Adjusting the parameter type to VARCHAR
)
BEGIN
    -- Check if the order exists
    IF EXISTS (SELECT 1 FROM Orders WHERE OrderID = p_OrderID) THEN
        -- Delete the order
        DELETE FROM Orders WHERE OrderID = p_OrderID;
        
        -- Output a success message
        SELECT CONCAT('Order ', p_OrderID, ' has been cancelled.') AS Result;
    ELSE
        -- Output an error message if the order doesn't exist
        SELECT CONCAT('Order ', p_OrderID, ' does not exist.') AS Result;
    END IF;
END //

DELIMITER ;