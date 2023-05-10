CREATE DATABASE WebBanHang
GO

USE WebBanHang
go

DROP DATABASE WebBanHang

CREATE TABLE Menu
(
	MenuId int identity(1,1) primary key not null,
	Title nvarchar(150),
	Description nvarchar(500),
	Position int,
	SeoTitle nvarchar(250),
	SeoDescription nvarchar(550),
	SeoKeywords nvarchar(250),
	CreatedDate datetime,
	CreatedBy nvarchar(150),
	ModifierDate datetime,
	ModifierBy nvarchar(150)
)
GO

-- Advertisment
CREATE TABLE Avd
(
	AvdId int identity(1,1) primary key not null,
	Title nvarchar(150),
	Description nvarchar(500),
	Image nvarchar(500),
	Type int,
	Link nvarchar(500),
	CreatedDate datetime,
	CreatedBy nvarchar(150),
	ModifierDate datetime,
	ModifierBy nvarchar(150)
)
GO

CREATE TABLE ProductCategory
(
	CateId int identity(1,1) primary key not null,
	Title nvarchar(150),
	Description nvarchar(500),
	Icon nvarchar(500),
	CreatedDate datetime,
	CreatedBy nvarchar(150),
	ModifierDate datetime,
	ModifierBy nvarchar(150)
)
GO

CREATE TABLE Product
(
	ProductId int identity(1,1) primary key not null,
	CateId int,
	Title nvarchar(150),
	Description nvarchar(500),
	Detail nvarchar(MAX),
	SeoTitle nvarchar(250),
	SeoDescription nvarchar(550),
	SeoKeywords nvarchar(250),
	Image nvarchar(500),
	Price decimal(18,2),
	PriceSale decimal(18,2),
	Quantity int,
	CreatedDate datetime,
	CreatedBy nvarchar(150),
	ModifierDate datetime,
	ModifierBy nvarchar(150),
	
	CONSTRAINT fk_Product_CateId FOREIGN KEY (CateId) REFERENCES ProductCategory(CateId)
)
GO

CREATE TABLE New
(
	NewsId int identity(1,1) primary key not null,
	CateId int,
	Title nvarchar(150),
	Description nvarchar(500),
	Detail nvarchar(MAX),
	SeoTitle nvarchar(250),
	SeoDescription nvarchar(550),
	SeoKeywords nvarchar(250),
	Image nvarchar(500),
	CreatedDate datetime,
	CreatedBy nvarchar(150),
	ModifierDate datetime,
	ModifierBy nvarchar(150),
	
	CONSTRAINT fk_New_CateId FOREIGN KEY (CateId) REFERENCES ProductCategory(CateId)
)
GO

CREATE TABLE Cart
(
	CartId int identity(1,1) primary key not null,
	Code nvarchar(50),
	CustomerName nvarchar(150),
	Phone nvarchar(12),
	Address nvarchar(500),
	TotalAmount decimal(18,0),
	Quantity int,
	CreatedDate datetime,
	CreatedBy nvarchar(150),
	ModifierDate datetime,
	ModifierBy nvarchar(150),
)
GO

CREATE TABLE CartDetail
(
	CartDetailId int identity(1,1) primary key not null,
	CartId int,
	ProductId int,
	Price decimal(18,0),
	Quantity int,

	CONSTRAINT fk_CartId FOREIGN KEY (CartId) REFERENCES Cart(CartId),
	CONSTRAINT fk_ProductId FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
)
GO

CREATE TABLE SystemSetting
(
	SettingKey nvarchar(50) primary key not null,
	SettingValue nvarchar(MAX),
	SettingDescription nvarchar(250)
)
GO