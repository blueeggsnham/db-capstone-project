-- INSERT statements to populate the LittleLemonDB --
 
INSERT INTO Customers(CustomerID, FullName, ContactNo, Email) 
VALUES 
	(1, "Vanessa McCarthy", 0757536378, 'vanessa.mc@gmail.com'), 
    (2, "Marcos Romero", 0757536379, 'r_marcos@gmail.com'), 
    (3, "Hiroki Yamane", 0757536376, 'hiroki_y@gmail.com'), 
    (4, "Anna Iversen", 0757536375, 'a_iversen@gmail.com'), 
    (5, "Diana Pinto", 0757536374, 'd_pinto@gmail.com');
    
SELECT * FROM Customers;
    
INSERT INTO Staffs (StaffID, Name, Role, Address, ContactNo, Email, AnnualSalary)
VALUES
(1,'Mario Gollini','Manager','724, Parsley Lane, Old Town, Chicago, IL','351258074','Mario.g@littlelemon.com','$70,000'),
(2,'Adrian Gollini','Assistant Manager','334, Dill Square, Lincoln Park, Chicago, IL','351474048','Adrian.g@littlelemon.com','$65,000'),
(3,'Giorgos Dioudis','Head Chef','879 Sage Street, West Loop, Chicago, IL','351970582','Giorgos.d@littlelemon.com','$50,000'),
(4,'Fatma Kaya','Assistant Chef','132  Bay Lane, Chicago, IL','351963569','Fatma.k@littlelemon.com','$45,000'),
(5,'Elena Salvai','Head Waiter','989 Thyme Square, EdgeWater, Chicago, IL','351074198','Elena.s@littlelemon.com','$40,000'),
(6,'John Millar','Receptionist','245 Dill Square, Lincoln Park, Chicago, IL','351584508','John.m@littlelemon.com','$35,000');

SELECT * FROM Staffs;

INSERT INTO MenuItems (Course, Starter, Dessert, Price)
VALUES
('Kabasa', 'Tomato bread', 'Ice cream', 44),
('Pizza', 'Falafel', 'Cheesecake', 40),
('Carbonara', 'Minestrone', 'Affogato', 46),
('Shwarma', 'Hummus', 'Baklava', 43),
('Greek salad', 'Olives', 'Greek yoghurt', 39),
('Kabasa', 'Falafel', 'Turkish yogurt', 46),
('Bean soup', 'Flatbread', 'Ice cream', 38),
('Greek salad', 'Falafel', 'Greek yoghurt', 39),
('Carbonara', 'Hummus', 'Affogato', 45);

SELECT * FROM MenuItems;

INSERT INTO Menus (MenuName, Cuisine)
VALUES
('Greek Menu', 'Greek'),
('Italian Menu', 'Italian'),
('Turkish Menu', 'Turkish');

SELECT * FROM Menus;

INSERT INTO MenuItems_Menus (MenuItemID, MenuID)
VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 1),
(6, 3),
(7, 2),
(8, 1),
(9, 3);

SELECT * FROM MenuItems_Menus;

INSERT INTO Orders (OrderID, MenuItemID, CustomerID, OrderDate, Quantity, TotalCost)
VALUES
(1,6,1,'2024-04-27',5, 250),
(2,3,2,'2024-04-28',3, 200),
(3,9,5,'2024-04-28',2, 115),
(4,8,4,'2024-04-25',1, 55),
(5,4,3,'2024-04-28',2, 100);

SELECT * FROM Orders;