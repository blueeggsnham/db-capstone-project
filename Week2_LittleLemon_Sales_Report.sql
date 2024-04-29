-- Week-2_Exercise-1: Create a virtual table to summarize data --
-- Task 1. Create a virtual table to summarize data
DROP VIEW IF EXISTS `OrdersView`;
CREATE VIEW `OrdersView` AS
    SELECT 
        OrderID, Quantity, TotalCost
    FROM
        Orders
    WHERE
        Quantity > 2;

SELECT 
    *
FROM
    OrdersView;

-- Task 2. Info on Customers with order cost > 150 
SELECT 
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost AS Cost,
    m.MenuName,
    mi.Course AS CourseName
FROM
    Customers AS c
        INNER JOIN
    Orders AS o ON c.CustomerID = o.CustomerID
        INNER JOIN
    MenuItems AS mi ON o.MenuItemID = mi.ItemID
        INNER JOIN
    MenuItems_Menus AS mim ON mi.ItemID = mim.MenuItemID
        INNER JOIN
    Menus AS m ON mim.MenuID = m.MenuID
WHERE
    o.TotalCost > 150;

-- Task 3. MenuName for MenuItems with order quantity > 2
SELECT 
    m.MenuName
FROM
    Menus AS m
        INNER JOIN
    MenuItems_Menus AS mim ON m.MenuID = mim.MenuID
WHERE
    mim.MenuItemID = ANY (SELECT 
            MenuItemID
        FROM
            Orders
        WHERE
            Quantity > 2);

-- Week-2_Exercise-2: Create optimized queries to manage and analyze data --
-- Task 1. Stored Procedure GetMaxQuantity
DROP PROCEDURE IF EXISTS `GetMaxQuantity`;
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(Quantity) AS 'Max Quantity in Order' FROM Orders;
END //
DELIMITER ;

CALL GetMaxQuantity();

-- Task 2. Create a prepared statement called GetOrderDetail
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost AS Cost FROM Orders WHERE CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3. Create a stored procedure to delete an order record based on the user input of the order id.
DROP PROCEDURE IF EXISTS `CancelOrder`;
DELIMITER //
CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
Delete FROM Orders WHERE OrderID = order_id;
SELECT CONCAT('Order ', order_id, ' is cancalled') AS 'Confirmation';
END //
DELIMITER ;
/*
CALL CancelOrder(5);
*/