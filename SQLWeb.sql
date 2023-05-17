CREATE DATABASE Fashiondb
GO

USE Fashiondb
go

CREATE TABLE tb_Category
(
	Id int identity(1,1) primary key not null,
	Title nvarchar(150) not null,
	Alias nvarchar(150) not null,
	Description nvarchar(500),
	Position int not null,
	SeoTitle nvarchar(250),
	SeoDescription nvarchar(550),
	SeoKeywords nvarchar(250),
	CreatedDate datetime not null,
	CreatedBy nvarchar(150),
	ModifiedDate datetime not null,
	ModifiedBy nvarchar(150)
)
GO

-- Advertisment
CREATE TABLE tb_Avd
(
	Id int identity(1,1) primary key not null,
	Title nvarchar(150) not null,
	Description nvarchar(500),
	Image nvarchar(500),
	Type int not null,
	Link nvarchar(500),
	CreatedDate datetime not null,
	CreatedBy nvarchar(150),
	ModifiedDate datetime not null,
	ModifiedBy nvarchar(150)
)
GO

CREATE TABLE tb_ProductCategory
(
	Id int identity(1,1) primary key not null,
	Title nvarchar(150) not null,
	Description nvarchar(500),
	Icon nvarchar(500),
	CreatedDate datetime not null,
	CreatedBy nvarchar(150),
	ModifiedDate datetime not null,
	ModifiedBy nvarchar(150),
	SeoTitle nvarchar(250),
	SeoDescription nvarchar(550),
	SeoKeywords nvarchar(250),
	Alias nvarchar(150) not null,
)
GO

CREATE TABLE tb_Product
(
	Id int identity(1,1) primary key not null,
	ProductCategoryId int not null,
	Title nvarchar(150) not null,
	Alias nvarchar(150),
	ProductCode nvarchar(MAX),
	Description nvarchar(500),
	Detail nvarchar(MAX),
	SeoTitle nvarchar(250),
	SeoDescription nvarchar(550),
	SeoKeywords nvarchar(250),
	Image nvarchar(500),
	OriginalPrice decimal(18,2) not null,
	Price decimal(18,2) not null,
	PriceSale decimal(18,2) not null,
	Quantity int not null,
	CreatedDate datetime not null,
	CreatedBy nvarchar(150),
	ModifiedDate datetime not null,
	ModifiedBy nvarchar(150),
	IsHome bit not null,
	IsSale bit not null,
	IsFeature bit not null,
	IsHot bit not null,
	IsActive bit not null,
	
	CONSTRAINT fk_Product_ProductCategoryId FOREIGN KEY (ProductCategoryId) REFERENCES tb_ProductCategory(Id)
)
GO

CREATE TABLE tb_Cart
(
	Id int identity(1,1) primary key not null,
	Code nvarchar(50),
	CustomerName nvarchar(150),
	Phone nvarchar(12),
	Address nvarchar(500),
	TotalAmount decimal(18,0),
	Quantity int,
	CreatedDate datetime not null,
	CreatedBy nvarchar(150),
	ModifiedDate datetime not null,
	ModifiedBy nvarchar(150),
)
GO

CREATE TABLE tb_CartDetail
(
	Id int identity(1,1) primary key not null,
	CartId int not null,
	ProductId int not null,
	Price decimal(18,0) not null,
	Quantity int not null,

	CONSTRAINT fk_CartId FOREIGN KEY (CartId) REFERENCES tb_Cart(Id),
	CONSTRAINT fk_ProductId FOREIGN KEY (ProductId) REFERENCES tb_Product(Id)
)
GO

CREATE TABLE tb_SystemSetting
(
	SettingKey nvarchar(50) primary key not null,
	SettingValue nvarchar(MAX),
	SettingDescription nvarchar(250)
)
GO

DROP DATABASE Fashiondb