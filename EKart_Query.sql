--Database
Create database [E_Trading_SystemDB]

use E_Trading_SystemDB
----------------------This is the table for the Admin-----------------
select * from Hints

Create table [Admin] 
(Admin_Id numeric(10) Primary key not null,
Admin_Email varchar(30) unique not null,
Admin_Name varchar(30) not null, 
[Password] varchar(20) unique not null,
Hint_Id int foreign key references Hints(Hint_Id),
[Hint_Answers] varchar (200) not null)
select * from Admin
insert into Admin values (101,'sharad999@gmail.com','Sharad chaubey','sharad@123',1,'Dhoom3')
insert into Admin values (102,'Vikash@gmail.com','Vikash Vishwakarma','Vikash@123',1,'Krish')

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


Alter Table Products
Add Color varchar(20);
ALTER TABLE Products
ADD ImageUrl varchar(100);




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

INSERT INTO Vendors (Vendor_Id, Vendor_Name, Vendor_Email, Mobile_Number, [Address], Category, Vendor_Age, Hint_Id, Hint_Answers,Passowrd, Status)
VALUES
    (1, 'Vendor1', 'vendor1@example.com', 1234567890, '123 Street, City', 'Electronics', 30, 1, 'Answer1', 'password1', 'Active'),
    (2, 'Vendor2', 'vendor2@example.com', 2345678901, '456 Avenue, Town', 'Fashion', 35, 2, 'Answer2', 'password2', 'Inactive'),
    (3, 'Vendor3', 'vendor3@example.com', 3456789012, '789 Road, Village', 'Food', 40, 3, 'Answer3', 'password3', 'Active'),
    (4, 'Vendor4', 'vendor4@example.com', 4567890123, '012 Lane, County', 'Books', 45, 4, 'Answer4', 'password4', 'Inactive')
	update vendors 
	set Category = 'Groccery' where Vendor_Id=1
	update vendors 
	set Category = 'Groccery' where Vendor_Id=2
	update vendors 
	set Category = 'Electronics' where Vendor_Id=3
	update vendors 
	set Category = 'Electronics' where Vendor_Id=4
	INSERT INTO Vendors (Vendor_Id, Vendor_Name, Vendor_Email, Mobile_Number, [Address], Category, Vendor_Age, Hint_Id, Hint_Answers,Passowrd, Status)
VALUES
    (5, 'Vendor5', 'vendor5@example.com', 1234567890, '123 Street, City', 'Mobile', 30, 1, 'Answer1', 'password5', 'Active'),
    (6, 'Vendor6', 'vendor6@example.com', 2345678901, '456 Avenue, Town', 'Tablets', 35, 2, 'Answer2', 'password6', 'Inactive')

	INSERT INTO Vendors (Vendor_Id, Vendor_Name, Vendor_Email, Mobile_Number, [Address], Category, Vendor_Age, Hint_Id, Hint_Answers,Passowrd, Status)
VALUES
    (7, 'Vendor7', 'vendor7@example.com', 8081216207, '123 Street, City', 'Mobile', 30, 1, 'Answer7', 'password7', 'Active'),
    (8, 'Vendor8', 'vendor8@example.com', 6392435478, '456 Avenue, Town', 'Tablets', 35, 2, 'Answer8', 'password8', 'Inactive')


	INSERT INTO Products 
VALUES
    (1, 1, 'Laptop', 'Dell', 50, 1200.00, 'Available','https://unsplash.com/photos/macbook-pro-on-top-of-brown-table-1SAnrIxw5OY','Red')
 
Create Table Wallet (
wallet_Id int primary key identity,
[Customer_Id] numeric(10) foreign key references Customer(Customer_Id),
[Date_of_Top_Up] date,
[Last_Top_Up] float,
[Total_Top_Up] float
)

Create Table Query
(Complain_No int identity,[Name] varchar(50), Email varchar(60), Phone_Number numeric(10), [Subject] varchar(50),Query varchar(200));

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
select * from Query

Alter table products
ADD imageURL NVARCHAR (400)

update products set imageurl =
'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' where Product_Id=1
select * from Products
INSERT INTO Products 
VALUES
    (2, 2, 'Rice', 'SomeBrand', 100, 10.99, 'Available', 'White', 'https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (3, 2, 'Wheat Flour', 'AnotherBrand', 50, 5.49, 'Available', 'White','https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (4, 2, 'Sugar', 'SweetCo', 80, 8.99, 'Available','White', 'https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (5, 2, 'Salt', 'SaltyCorp', 120, 2.99, 'Available','White', 'https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (6, 2, 'Milk', 'DairyGood', 60, 3.49, 'Available','White', 'https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (7, 2, 'Eggs', 'FarmFresh', 70, 4.99, 'Available', 'White','https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (8, 2, 'Bread', 'BakeryBest', 40, 2.99, 'Available','White', 'https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (9, 2, 'Vegetables', 'GreenVeggie', 90, 6.99, 'Available','White', 'https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (10, 2, 'Fruits', 'FruitCo', 75, 7.99, 'Available', 'White','https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg'),
    (11,2, 'Pasta', 'ItalianPasta', 55, 4.49, 'Available', 'White','https://5.imimg.com/data5/SELLER/Default/2021/3/JS/PW/IL/63039086/new-product-500x500.jpeg');


	Update products 
	set Product_Name ='Pulse' where Product_Id=1;

	Update Products set imageURL='https://5.imimg.com/data5/SELLER/Default/2021/12/UN/GW/FQ/4237930/16-1000x1000.jpg' , Brand='Deepak'
	where Product_Id=1;
    Update Products set imageURL='https://th.bing.com/th/id/OIP.gx4pNRaVHFnmWPVmqcTXQwHaHa?w=173&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7' , Brand='Jasmine'
	where Product_Id=2;
	Update Products set imageURL='https://i.pinimg.com/736x/83/f7/9f/83f79f54ab578417f279b82953305f3f.jpg' , Brand='Rajdhani'
	where Product_Id=3;
	Update Products set imageURL='https://5.imimg.com/data5/SELLER/Default/2022/8/TH/KW/XM/157630557/white-pure-sugar-500x500.jpg' , Brand='Sugar?'
	where Product_Id=4;
    Update Products set imageURL='https://5.imimg.com/data5/SELLER/Default/2023/6/312749105/NC/BE/YE/30944798/1kg-tata-lite-salt-500x500.jpeg' , Brand='Tata'
	where Product_Id=5;
	Update Products set imageURL='https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/assets/products/sliding_images/jpeg/5ee4441d-9109-48fa-9343-f5ce82b905a6.jpg?ts=1706182143' , Brand='Amul'
	where Product_Id=6;
	Update Products set imageURL='https://mir-s3-cdn-cf.behance.net/projects/404/3ffdc9176986613.Y3JvcCwxNDc2LDExNTUsNjIsMA.jpeg' , Brand='Choko Break',Product_Name='Biscuits'
	where Product_Id=7;
	Update Products set imageURL='https://ritadrinks.in/images/stories/virtuemart/product/RITA-US-51559065_glass-320ml-fruit-apple-juice-private-label-brand.webp' , Brand='Hive Apple'
,Product_Name='Apple Juice'	where Product_Id=8;

 Update Products set imageURL='https://img.freepik.com/premium-psd/fruit-sticker-mock-up-orange-fruit_23-2150606250.jpg?w=900' , Brand='Mockup',Product_Name='Orange'
	where Product_Id=9;
		Update Products set imageURL='https://thumbs.dreamstime.com/b/pink-headphones-isolated-white-background-wireless-wired-headset-noise-cancelling-generative-ai-pink-headphones-278929346.jpg' , Color='Pink'
	where Product_Id=17;
		
		


-- Insert 11 values of Electronics products only with Color before ImageFileName
INSERT INTO products
VALUES 
    (12, 3, 'Laptop', 'Dell', 50, 899.99, 'Available', 'Silver', 'https://cdn.moglix.com/p/HeCohRKVrQYqo-xxlarge.jpg'),
    (13, 3, 'Smartphone', 'Samsung', 100, 699.99, 'Available', 'Black', 'https://d2xamzlzrdbdbn.cloudfront.net/products/1cbc926b-2ff2-48bf-9c39-9286dbc1c4d624181233_416x416.jpg'),
    (14, 3, 'Tablet', 'Apple', 30, 499.99, 'Available', 'White', 'https://i.pinimg.com/736x/35/cd/0c/35cd0c6ad9a1312104fc062d3d37231a.jpg'),
    (15, 3, 'Smartwatch', 'Fitbit', 20, 199.99, 'Available', 'Black', 'https://www.reliancedigital.in/medias/Fireboltt-BSW094-Sports-Fitness-Watches-493665448-i-1-1200Wx1200H-300Wx300H?context=bWFzdGVyfGltYWdlc3w0Njc4OHxpbWFnZS9qcGVnfGltYWdlcy9oMjcvaGVlLzk5ODEzMzg4Nzc5ODIuanBnfDY0Njc0YjQ1MjA2MDkwYjA5YzJmYTJjM2M4Njc0YmVhMzc2YTNmNGQ0MmJjYWYxZjIzNzIwM2Q0MWI0YTk2ZmE'),
    (16, 3, 'Camera', 'Canon', 40, 599.99, 'Available', 'Black', 'https://t4.ftcdn.net/jpg/03/42/01/85/360_F_342018547_SnP28SrLYJGWNaN7zgDEohc2JZdCFfWY.jpg'),
    (17, 4, 'Headphones', 'Sony', 80, 149.99, 'Available', 'Black', 'https://sony.scene7.com/is/image/sonyglobalsolutions/wh-ch720_Primary_image?$categorypdpnav$&fmt=png-alpha'),
    (18, 4, 'Printer', 'HP', 25, 299.99, 'Available', 'White', 'https://banner2.cleanpng.com/20180417/zyq/kisspng-hewlett-packard-hp-laserjet-laser-printing-printer-hewlett-packard-5ad5b6a7d43bf7.1033130015239553678693.jpgg'),
    (19, 4, 'Speakers', 'Bose', 35, 249.99, 'Available', 'Black', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2KB4kPNUBleF7fNh49TTgZv706KdwyDP4kxp-49qvUQ&s'),
    (20, 4, 'Router', 'Linksys', 15, 79.99, 'Available', 'Black', 'https://m.media-amazon.com/images/I/61BEYsbrtlL._AC_UF894,1000_QL80_.jpg'),
    (21, 4, 'External Hard Drive', 'Seagate', 60, 129.99, 'Available', 'Black', 'https://drr622wuctn26.cloudfront.net/image/cache/catalog/hdd/seagate/stky1000400/seagate-onetouch-1tb-external-hdd-black-image-main-600x600.jpg'),
    (22, 4, 'Keyboard', 'Logitech', 70, 49.99, 'Available', 'White', 'https://resource.logitech.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical-mini-mac/gallery/pale-grey/mx-mechanical-mini-for-mac-keyboard-top-view-pale-grey-us.png?v=1');



	--Mobile and Tablets
	INSERT INTO Products (Product_Id, Vendor_Id, Product_Name, Brand, Stock, Price, [Status], Color, ImageUrl)
VALUES 
    (23, 6, 'Tablet', 'Apple', 30, 499.99, 'Available', 'White', 'https://i.pinimg.com/736x/35/cd/0c/35cd0c6ad9a1312104fc062d3d37231a.jpg'),
    (24, 6, 'Tablet', 'Samsung', 25, 399.99, 'Available', 'Black', 'https://img.freepik.com/premium-vector/samsung-galaxy-s23-ultra-official-presentation-new-flagship-new-generation-smartphone-phone-with-builtin-stylus-black-color-original-wallpaper-screen-editorial_661108-12683.jpg'),
    (25, 6, 'Tablet', 'Lenovo', 20, 299.99, 'Available', 'Gray', 'https://p1-ofp.static.pub/fes/cms/2023/02/22/ruxauvfp1qmj4daj3iblygyqbqgh4u193444.png'),
    (26, 6, 'Tablet', 'Huawei', 15, 249.99, 'Available', 'Gray', 'https://consumer.huawei.com/content/dam/huawei-cbg-site/other/in/mkt/pdp/tablets/new_plp/matepad-t8.jpg'),
    (27, 5, 'Mobile', 'Samsung', 50, 699.99, 'Available', 'black', 'https://d2xamzlzrdbdbn.cloudfront.net/products/1cbc926b-2ff2-48bf-9c39-9286dbc1c4d624181233_416x416.jpg'),
    (28, 5, 'Mobile', 'Apple', 40, 899.99, 'Available', 'Green', 'https://media.istockphoto.com/id/1307266466/photo/iphone-12-green-against-white-background-new-smartphone-from-apple-company-close-up.jpg?s=612x612&w=0&k=20&c=D4OkfAfRAJVWGtlqBAGp3ET9wqpqElDsv7xBJP7mO84='),
    
	(29, 5, 'Mobile', 'OnePlus', 35, 799.99, 'Available', 'BluePink', 'https://img.freepik.com/premium-photo/isolated-oneplus-9-pro-smartphone-rear-view-emphasizing-clean-w-white-background-clean_655090-800162.jpg'),
    (30, 5, 'Mobile', 'Xiaomi', 30, 599.99, 'Available', 'Grey', 'https://img.freepik.com/premium-photo/isolated-xiaomi-mi-11-mobile-back-view-white-background-highlig-white-background-clean_655090-799884.jpg'),
    (31, 5, 'Mobile', 'Google', 45, 899.99, 'Available', 'Grey', 'https://lh3.googleusercontent.com/GCgLMaQYBwiV9cPNaHbiKJR9yk6PsuT2djEtOoKS3Xds6W-Jixul2qumlfYkOXL_vtc-Vrk1NPc3kzZUM7TDBETNlVYiGtspLpk'),
    (32, 5, 'Mobile', 'Realme', 30, 499.99, 'Available', 'Blue', 'https://i.pinimg.com/474x/8f/09/e2/8f09e2e26581b407201f244de0a7d27a.jpg')
    
	

	--Fashion 
	-- Insert 11 values for fashion-related products with real image URLs and Product_Id starting from 33
INSERT INTO Products (Product_Id, Vendor_Id, Product_Name, Brand, Stock, Price, [Status], Color, ImageUrl)
VALUES 
    (33, 7, 'Dress', 'Zara', 50, 79.99, 'Available', 'Red White', 'https://static.zara.net/assets/public/5019/5af8/b692493a91c0/2e202dec014b/01285419600-e1/01285419600-e1.jpg?ts=1707897418418'),
    (34, 7, 'T-Shirt', 'H&M', 100, 29.99, 'Available', 'white', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F12%2F55%2F12554f55ce381d738198d856546a923d00fb4136.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bkids_boys_clothing_tshirtsshirts_tshirts%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]'),
    (35, 7, 'Jeans', 'Levis', 75, 59.99, 'Available', 'white', 'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/23626338/2023/7/12/e8d11489-b5d3-4603-a91f-508e60dc409b1689160812074-Levis-501-Men-Regular-Fit-Low-Rise-Pure-Cotton-Jeans-3416891-1.jpg'),
    (36, 8, 'Shoes', 'Nike', 40, 99.99, 'Available', 'Black', 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/4d080a4c-8f98-45a4-9089-f4fb41697914/defy-all-day-training-shoe-LtD2G1.png'),
    (37, 8, 'Sunglasses', 'Ray-Ban', 30, 149.99, 'Available', 'Brown', 'https://m.media-amazon.com/images/I/61C9-hcww7L._AC_UX466_.jpg'),

    (38, 7, 'Handbag', 'Gucci', 20, 299.99, 'Available', 'Black', 'https://media.gucci.com/style/DarkGray_Center_0_0_490x490/1515495607/447632_DTD1T_9022_001_067_0036_Light.jpg'),
    (39, 8, 'Watch', 'Rolex', 15, 999.99, 'Available', 'Silver', 'https://images.jdmagicbox.com/quickquotes/images_main/rolex_datejust_ii_men_watch_silver_116300__10724298_0.jpg'),
    (40, 7, 'Scarf', 'Burberry', 25, 199.99, 'Available', 'Black', 'https://assets.burberry.com/is/image/Burberryltd/E99439AF-EC1A-40D9-97B9-09796D528674?$BBY_V3_SL_1$&wid=1501&hei=1500'),
    (41, 8, 'Hat', 'Adidas', 35, 39.99, 'Available', 'Cream', 'https://e7.pngegg.com/pngimages/202/875/png-clipart-baseball-cap-adidas-originals-light-hat-baseball-cap-hat-adidas-thumbnail.png'),
    (42, 7, 'Shirt', 'Peter England', 30, 199.99, 'Available', 'Pink', 'https://img3.junaroad.com/uiproducts/19389295/pri_175_p-1676786305.jpg')

	
	
	update products
	set imageurl='https://lp2.hm.com/hmgoepprod?set=source[/7c/c9/7cc90f04de2c47bd23ddf09dfbb0258759292531.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[z],hmver[2]&call=url[file:/product/main]'
	,Color ='Cream' where Product_Id=34

select * from Customer