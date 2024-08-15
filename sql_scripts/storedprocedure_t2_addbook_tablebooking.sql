DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_booking_date DATE
)
BEGIN
    -- Update the BookingDate for the specified BookingID
    UPDATE Bookings
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;
    
    -- Return a success message with the updated booking details
    SELECT CONCAT('Booking ', booking_id, ' updated to ', new_booking_date) AS Message;
END //

DELIMITER ;