DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = booking_id;

    SELECT CONCAT('Booking ', booking_id, ' has been canceled successfully.') AS Message;
END //

DELIMITER ;