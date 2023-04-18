CREATE DATABASE FashionWeb
GO

use FashionWeb
GO

CREATE TABLE Roles
(
	RoleID int identity primary key NOT NULL,
	RoleName nvarchar(50),
	Description nvarchar(MAX)
)
GO

CREATE TABLE Account
(
	AccountID int identity primary key NOT NULL,
	Phone varchar(12),
	Email nvarchar(50),
	Password nvarchar(50),
	Salt nchar(6),
	Active bit,
	FullName nvarchar(150),
	RoleID int,
	LastLogin datetime,
	CreateDate datetime

	CONSTRAINT fk_RoleID FOREIGN KEY(RoleID) REFERENCES Roles(RoleID)
)
GO

CREATE TABLE Categories
(
	CatID int identity primary key NOT NULL,
	CatName nvarchar(250),
	Description nvarchar(MAX),
	ParentID int,
	Levels int,
	Ordering int,
	Published bit,
	Thumb nvarchar(250),
	Title nvarchar(250),
	Alias nvarchar(250),
	Cover nvarchar(250)
)
GO

CREATE TABLE Products
(
	ProductID int identity primary key NOT NULL,
	ProductName nvarchar(250),
	SortDesc nvarchar(250),
	Description nvarchar(MAX),
	CatID int ,
	Price int,
	Discount int,
	Thumb nvarchar(250),
	DateCreated datetime,
	DateModified datetime,
	BestSeller bit,
	HomeFlag bit,
	Active bit,
	Tags nvarchar(MAX),
	Title nvarchar(250),
	Alias nvarchar(250),
	UnitslnStock int,

	CONSTRAINT fk_CatID FOREIGN KEY(CatID) REFERENCES Categories(CatID)
)
GO

CREATE TABLE Locations
(
	LocationID int identity primary key NOT NULL,
	Name nvarchar(100),
	Type nvarchar(20),
	Slug nvarchar(100),
	NameWithType nvarchar(250),
	PathWithType nvarchar(250),
	ParentCode int,
	Levels int
)
GO

CREATE TABLE Customers
(
	CustomerID int identity primary key NOT NULL,
	FullName nvarchar(250),
	Birthday datetime,
	Avatar nvarchar(250),
	Address nvarchar(250),
	Phone varchar(12),
	Email nvarchar(50),
	Password nvarchar(50),
	LocationID int,
	District nvarchar(50),
	Ward int,
	CreateDate datetime,
	Salt nchar(8),
	LastLogin datetime,
	Active bit,

	CONSTRAINT fk_LocationID FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
)
GO

CREATE TABLE TransactStatus
(
	TransactStatusID int identity primary key NOT NULL,
	Status nvarchar(50),
	Description nvarchar(MAX)
)
GO

CREATE TABLE Orders
(
	OrderID int identity primary key NOT NULL,
	CustomerID int,
	OrderDate datetime,
	ShipDate datetime,
	TransactStatusID int,
	Deleted bit,
	Paid bit,
	PaymentDate datetime,
	PaymentID int,
	Note nvarchar(MAX),

	CONSTRAINT fk_CusID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT fk_TransactStatusID FOREIGN KEY(TransactStatusID) REFERENCES TransactStatus(TransactStatusID)
)
GO

CREATE TABLE OrderDetails
(
	OrderDetailID int identity primary key NOT NULL,
	OrderID int,
	ProductID int,
	OrderNumber int,
	Quantity int,
	Discount int,
	Total int,
	Shipdate datetime,

	CONSTRAINT fk_OrderID FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT fk_ProductID FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
)
GO

CREATE TABLE Pages
(
	PageID int identity primary key NOT NULL,
	PageName nvarchar(250),
	Contents nvarchar(MAX),
	Thumbs nvarchar(250),
	Published bit,
	Title nvarchar(250),
	Alias nvarchar(250),
	CreateDate datetime,
	Ordering int
)
GO