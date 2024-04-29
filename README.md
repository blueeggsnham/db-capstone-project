# db-capstone-project
Meta Database Engineering Capstone Project: Database system for fictional Little Lemon Restaurant

## How to run the project
- Clone the repository in your local machine

- Access the database model in `LittleLemonDB_ERD.png`

- In MySQL WorkBench run the following scripts (in the order listed):

    1. To set up the database: `LittleLemonDB_Schema.sql`

    2. To populate the database tables: `Week1_LittleLemon_Table_Inserts.sql`

    3. Week 2 Exercises 1 & 2: `Week2_LittleLemon_Sales_Report.sql`
        - `OrdersView` virtual table
        - `GetMaxQuantity` stored procedure
        - `GetOrderDetail` prepared statement
        - `CancelOrder` stored procedure
        
    4. Week  Exercises 3 & 4: `Week2_LittleLemon_Table_Booking_System.sql`
        - `AddBooking` stored procedure
        - `UpdateBooking` stored procedure
        - `CancelBooking` stored procedure

- In Jupyter Notebook: `LittleLemon_Database_Client.ipynb`

    - To connect to this database from Jupyter notebook replace the username and password in the `config` variable with your own username and passowrd.



## Scenario Setup 
Little Lemon restaurant requires an update to their booking systems. There are several aspects that need to be considered when engaging with this project including:

- Maintaining consistency when updating code.

- Ensuring there are sufficient structures in place to save, alter and query data. 

- Ensuring there is a mechanism for displaying the data in a manner that is easily interpretable. 

- Checking that there is a front-end system for accessing and updating the data. 


