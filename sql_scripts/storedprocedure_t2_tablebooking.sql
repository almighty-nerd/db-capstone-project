DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN booking_date DATE,
    IN table_num INT
)
BEGIN
    DECLARE table_booked VARCHAR(10) DEFAULT 'Available';
    
    IF EXISTS (
        SELECT * 
        FROM Bookings
        WHERE BookingDate = booking_date
        AND TableNumber = table_num
    ) THEN
        SET table_booked = 'Booked';
    END IF;
    
    SELECT table_booked AS 'Table Status';
END //

DELIMITER ;