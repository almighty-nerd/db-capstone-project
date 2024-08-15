CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATE,
    TableNumber INT,
    CustomerID VARCHAR(13),
    CONSTRAINT fk_Bookings_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
	ON DELETE CASCADE
	ON UPDATE SET NULL
);