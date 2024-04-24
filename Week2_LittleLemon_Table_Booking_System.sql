-- Exercise 3: Create SQL queries to check available bookings based on user input --
-- Task 1. populate the Bookings table
INSERT INTO Bookings 
(BookingID, BookingDate, TableNo, CustomerID) 
VALUES 
(1, '2024-04-25', 5, 4),
(2, '2024-04-28', 3, 3 ),
(3, '2024-04-28', 2, 2),
(4, '2024-04-27', 2, 1),
(5, '2024-04-26', 1, 5);

SELECT BookingID, BookingDate, TableNo, CustomerID FROM Bookings;

-- Task 2. Create a stored procedure CheckBooking to check the avaiability of a table
DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_no INT)
BEGIN
DECLARE tableStatus VARCHAR(20);
SELECT IF(COUNT(*) > 0, 'already booked', 'still available') INTO TableStatus 
FROM Bookings
WHERE BookingDate = booking_date AND TableNo = table_no;
SELECT CONCAT('Table ', table_no, ' is ', TableStatus) AS 'Booking Status';
END //
DELIMITER ;

CALL CheckBooking("2024-04-28", 3);

-- Task 3. Create a procedure AddValidBooking (use a transaction statement to perform a rollback if 
-- a customer reserves a table that’s already booked under another name).  
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_no INT, IN customer_id INT)
BEGIN
DECLARE booking_id INT;
SELECT MAX(BookingID) + 1 INTO booking_id FROM Bookings;

START TRANSACTION;
INSERT INTO Bookings (BookingID, BookingDate, TableNo, CustomerID)
VALUES (booking_id, booking_date, table_no, customer_id);
IF EXISTS(
	SELECT 1 FROM Bookings 
	WHERE BookingDate = booking_date AND TableNo = table_no) 
    THEN
	ROLLBACK;
    SELECT CONCAT('Table ', table_no, ' is already booked - booking cancelled') AS 'Booking Status';
ELSE
	COMMIT;
    SELECT CONCAT('Booking successful') AS 'Booking Status';
END IF;
END //
DELIMITER ;

CALL AddValidBooking("2024-04-28", 5, 4);

-- Exercise 4: Create SQL queries to add and update bookings --
-- Task 1. Create a new procedure AddBooking to add a new table booking record
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER // 
CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id INT, IN table_no INT, IN booking_date DATE)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNo, CustomerID) 
VALUES (booking_id, booking_date, table_no, customer_id);
SELECT 'New booking added' AS Confirmation;
END //
DELIMITER ;

CALL AddBooking(9, 3, 4, "2022-12-30");

-- Task 2. Create a new procedure called UpdateBooking (BookingID, Updated-Date)
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER // 
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
UPDATE Bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
SELECT CONCAT('Booking ', booking_id, ' is updated') AS Confirmation;
END //
DELIMITER ;

CALL UpdateBooking(9, "2022-12-17");

-- Task 3. Create a new procedure called CancelBooking (BookingID)
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER // 
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = booking_id;
SELECT CONCAT('Booking ', booking_id, ' cancelled') AS Confirmation;
END //
DELIMITER ;

CALL CancelBooking(9);
