--Database
Create database [E_Trading_SystemDB]

use E_Trading_SystemDB
----------------------This is the table for the Admin-----------------

Create table [Admin] 
(Admin_Id numeric(10) Primary key not null,
Admin_Email varchar(30) unique not null,
Admin_Name varchar(30) not null, 
[Password] varchar(20) unique not null,
Hint_Id int foreign key references Hints(Hint_Id),
[Hint_Answers] varchar (200) not null)

----------------------This is the table for the Customer ----------------
Create Table Customer 
([Customer_Id] numeric(10) Primary key,
[Customer_Name] varchar(30) not null,
[Customer_Email] varchar(30) unique not null,
[Address] varchar(50) not null,
Balance float default 0,
Mobile_Number numeric(10),
[Password] varchar(20) not null,
Hint_Id int foreign key references Hints(Hint_Id),
[Hint_Answers] varchar (200) not null,
[Status] varchar(20))

INSERT INTO Customer (Customer_Id, Customer_Name, Customer_Email, Address, Balance, Mobile_Number, Password, Hint_Id, Hint_Answers, Status)
VALUES 
    (1, 'John Doe', 'john@example.com', '123 Main St', 100.50, 1234567890, 'password1', 1, 'Answer1', 'Active'),
    (2, 'Jane Smith', 'jane@example.com', '456 Elm St', 75.25, 9876543210, 'password2', 2, 'Answer2', 'Active'),
    (3, 'Alice Johnson', 'alice@example.com', '789 Oak St', 50.75, 5551112222, 'password3', 3, 'Answer3', 'Inactive'),
    (4, 'Bob Brown', 'bob@example.com', '101 Pine St', 200.00, 9998887777, 'password4', 1, 'Answer4', 'Active'),
    (5, 'Emily Davis', 'emily@example.com', '202 Cedar St', 150.20, 4443332222, 'password5', 2, 'Answer5', 'Active');


----------------------This is the table for the User_Wallet ----------------
Create Table Wallet 
([Customer_Id] numeric(10) foreign key references Customer(Customer_Id),
Remaining_Amount float,
Last_Top_Up_Amount float)


----------------------This is the table for the Vendors ----------------
Create Table Vendors 
(Vendor_Id Numeric(10) Primary Key,
Vendor_Name varchar(20) not null,
Vendor_Email varchar(30) unique not null,
Mobile_Number Numeric(10) not null,
[Address] varchar(50) not  null,
Category varchar(40) not null,
Vendor_Age int not null,
Hint_Id int foreign key references Hints(Hint_Id),
[Hint_Answers] varchar (200) not null,
[Passowrd] varchar(20) not null,
Status varchar(20))

----------------------This is the table for the Orders ----------------
Create Table Orders
(Purchase_Id numeric(5) Primary key,
[Customer_Id] numeric(10) foreign key references Customer(Customer_Id),
Delivery_Date date,
[Order_Amount] float,
[Payment_Mode] varchar(20),
[Address] varchar(50),
[Status] varchar(30))

----------------------This is the table for the Order Details ----------------

Create Table Order_Details
(Order_Id numeric(3) primary key,
[Purchase_Id] numeric(5) foreign key references Orders(Purchase_Id),
Product_Name varchar(30),
Product_Price float)

----------------------This is the table for the Products ----------------

Create Table Products
(Product_Id numeric(8) primary key,
Vendor_Id numeric(10) foreign key references Vendors(Vendor_Id),
Product_Name varchar(40),
Brand varchar(30),
Stock int,
Price float,
[Status] varchar(25))

----------------------This is the table for the Order_Cancellation----------------
Create table Order_Cancellation
(Cancellation_Id numeric(5) Primary key,
Order_Id numeric(3) foreign key references Order_Details(Order_Id),
Cancellation_Date DateTime not null,
Refund_Amount numeric(8))

----------------------This is the table for the Hint Questions--------
Create table Hints 
(Hint_Id  int Primary Key Identity ,
Questions NVarchar (100))


----------------------This is the Table for Bucket------------------
create Table BucketList(
Serial_Number int  identity,
Product_Id numeric(8) foreign key references Products(Product_Id),
Customer_Id numeric(10) foreign key references Customer(Customer_Id))

--Insertion of Data
Insert into [Admin]
values(107,'shantanu2@gmail.com','Shantanu','@Shan123',1,'LoveTriangle')

Insert into Hints
values('Favourite M'),('Favourite food'),('Favourite City');


--Data Fetch from all Tables
select * from Admin
Select * from Customer
select * from Vendors
select * from Products
select * from Order_Details
select * from Order_Cancellation
select * from Orders
select * from Wallet
select * from BucketList
select * from Hints
select * from Orders
