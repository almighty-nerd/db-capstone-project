DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_num INT
)
BEGIN
    -- Declare a variable to check if the table is booked
    DECLARE table_booked INT DEFAULT 0;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO table_booked
    FROM Bookings
    WHERE BookingDate = booking_date
    AND TableNumber = table_num;

    IF table_booked > 0 THEN
        -- If the table is already booked, rollback the transaction
        ROLLBACK;
        SELECT 'Booking declined: Table is already booked.' AS Message;
    ELSE
        -- If the table is available, insert the new booking
        INSERT INTO Bookings (BookingDate, TableNumber)
        VALUES (booking_date, table_num);
        
        -- Commit the transaction
        COMMIT;
        SELECT 'Booking successful!' AS Message;
    END IF;
END //

DELIMITER ;