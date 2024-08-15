DELIMITER //

CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN customer_id VARCHAR(13),
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    -- Insert a new booking record into the Bookings table
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (booking_id, customer_id, booking_date, table_number);
    
    -- Return a success message with the booking ID
    SELECT CONCAT('Booking added successfully! Booking ID: ', booking_id) AS Message;
END //

DELIMITER ;