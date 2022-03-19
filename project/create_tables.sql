--create tables
-- 171044098

/*Use master
Go
if exists (select * from sysdatabases where name='YemekSepeti')
		drop database YemekSepeti
Go
Create Database YemekSepeti
Go
Use YemekSepeti
Go
Create Table TelephoneNumber (
	NumberID int identity (1, 1) NOT NULL,
	CountryCode nvarchar (20),
	PhoneNumber nvarchar (50),
	CONSTRAINT PK_PhoneNumber PRIMARY KEY CLUSTERED 
	(
		NumberID
	)
)
Go
Create Table AddressType (
	TypeID int identity (1, 1) NOT NULL,
	TypeName nvarchar (50),
	CONSTRAINT PK_AddressType PRIMARY KEY CLUSTERED 
	(
		TypeID
	)
)
Go
Create Table Address (
	AddressID int identity (1, 1) NOT NULL,
	AddressTypeIDF int,
	PhoneNumberIDF int,
	AdressTitle nvarchar (50), 
	City nvarchar (50),
	Region nvarchar (50),
	AdressDetail nvarchar (MAX),
	
	CONSTRAINT PK_Address PRIMARY KEY CLUSTERED 
	(
		AddressID
	),
	CONSTRAINT FK_Address_Tpypes FOREIGN KEY 
	(
		AddressTypeIDF
	) REFERENCES dbo.AddressType (
		TypeID
	),
	CONSTRAINT FK_Address_Phones FOREIGN KEY 
	(
		PhoneNumberIDF
	) REFERENCES dbo.TelephoneNumber (
		NumberID
	)
)
Go
Create Table Email (
	MailID int identity (1, 1) NOT NULL,
	MailAddress nvarchar (MAX),
	CONSTRAINT PK_EMail PRIMARY KEY CLUSTERED 
	(
		MailID
	)
)
Go
Create Table Basket (
	BasketID int identity (1, 1) NOT NULL,
	IsEmpty bit,
	TotalCost money,
	
	CONSTRAINT PK_Basket PRIMARY KEY CLUSTERED 
	(
		BasketID
	)
)
Go
Create Table DigitalWallet (
	WalletID int identity (1, 1) NOT NULL,
	Balance money default '0',
	BillingAdressIDF int NULL ,
	BillingMailIDF int NULL ,
	MaximumLimit money default '5000' ,
	LastLoadDate datetime NULL ,

	CONSTRAINT PK_DigitalWallet PRIMARY KEY CLUSTERED 
	(
		WalletID
	),
	CONSTRAINT FK_DigitalWallets_Address FOREIGN KEY 
	(
		BillingAdressIDF
	) REFERENCES dbo.Address (
		AddressID
	),
	CONSTRAINT FK_DigitalWallets_Mails FOREIGN KEY 
	(
		BillingMailIDF
	) REFERENCES dbo.Email (
		MailID
	),
	CONSTRAINT CK_Balance CHECK (Balance <= MaximumLimit)
)
Go
Create Table Customer (
	CustomerID int identity (1, 1) NOT NULL,
	FirstName nvarchar (50),
	LastName nvarchar (50),
	BirthDate datetime NULL ,
	Password nvarchar (MAX) NULL ,
	RecorDate datetime NULL ,
	EmailIDF int NULL ,
	BasketIDF int NULL ,
	WalletIDF int NULL ,
	CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED 
	(
		CustomerID
	),
	CONSTRAINT FK_Customers_Emails FOREIGN KEY 
	(
		EmailIDF
	) REFERENCES dbo.Email (
		MailID
	),
	CONSTRAINT FK_Customers_Wallets FOREIGN KEY 
	(
		WalletIDF
	) REFERENCES dbo.DigitalWallet (
		WalletID
	),
	CONSTRAINT FK_Customers_Baskets FOREIGN KEY 
	(
		BasketIDF
	) REFERENCES dbo.Basket (
		BasketID
	),
	CONSTRAINT CK_Birthdate CHECK (BirthDate < getdate())
)
Use YemekSepeti
Go

Create Table CustomerAdress (
	CustomerIDF int NOT NULL,
	AddressIDF int NOT NULL,
	
	CONSTRAINT FK_Customer_Customer FOREIGN KEY 
	(
		CustomerIDF
	) REFERENCES dbo.Customer (
		CustomerID
	),
	CONSTRAINT FK_Address_Address FOREIGN KEY 
	(
		AddressIDF
	) REFERENCES dbo.Address (
		AddressID
	)
)
Go
Create Table WorkingHours (
	HourID int identity (1, 1) NOT NULL,
	HoursDetail nvarchar (50) NULL, 
	TotalHours int NULL,
	OpensAt time NULL,
	ClosesAt time NULL,
	CONSTRAINT PK_WorkingHours PRIMARY KEY CLUSTERED 
	(
		HourID
	)
)
Go
Create Table Restaurant (
	RestaurantID int identity (1, 1) NOT NULL,
	RestaurantName nvarchar (100),
	Logo nvarchar (MAX),
	MinDeliveryTime nvarchar (50) NULL ,
	MinDeliveryPrice money NULL ,
	IsOpen bit NULL,
	AverageScore float NULL ,
	AddressIDF int NULL ,
	PhoneNumberIDF int NULL ,
	WorkingHoursIDF int NULL ,
	CONSTRAINT PK_Restaurant PRIMARY KEY CLUSTERED 
	(
		RestaurantID
	),
	CONSTRAINT FK_Restaurant_PhoneNumber FOREIGN KEY 
	(
		PhoneNumberIDF
	) REFERENCES dbo.TelephoneNumber (
		NumberID
	),
	CONSTRAINT FK_Restaurant_Address FOREIGN KEY 
	(
		AddressIDF
	) REFERENCES dbo.Address (
		AddressID
	),
	CONSTRAINT FK_Restaurant_WorkingHours FOREIGN KEY 
	(
		WorkingHoursIDF
	) REFERENCES dbo.WorkingHours (
		HourID
	)
)
Go
Create Table FavouriteRestaurant (
	CustomerIDF int NOT NULL,
	RestaurantIDF int NOT NULL,
	
	CONSTRAINT FK_Customer_Customer_Fav FOREIGN KEY 
	(
		CustomerIDF
	) REFERENCES dbo.Customer (
		CustomerID
	),
	CONSTRAINT FK_Restaurant_Restaurant_Fav FOREIGN KEY 
	(
		RestaurantIDF
	) REFERENCES dbo.Restaurant (
		RestaurantID
	)
)
Go
Create Table PaymentType (
	PaymentTypeID int identity (1, 1) NOT NULL,
	PaymentTypeName nvarchar (50),
	IsOnline bit,
	
	CONSTRAINT PK_PaymentType PRIMARY KEY CLUSTERED 
	(
		PaymentTypeID
	)
)
Go
Create Table PaymentRestaurant (
	PaymentIDF int NOT NULL,
	RestaurantIDF int NOT NULL,
	
	CONSTRAINT FK_Payment_Payment_Res FOREIGN KEY 
	(
		PaymentIDF
	) REFERENCES dbo.PaymentType (
		PaymentTypeID
	),
	CONSTRAINT FK_Restaurant_Restaurant_Pay FOREIGN KEY 
	(
		RestaurantIDF
	) REFERENCES dbo.Restaurant (
		RestaurantID
	)
)
Go
Create Table Category (
	CategoryID int identity (1, 1) NOT NULL,
	CategoryName nvarchar (50),
	CONSTRAINT PK_Category PRIMARY KEY CLUSTERED 
	(
		CategoryID
	)
)
Go
Create Table OrderStatus (
	StatusID int identity (1, 1) NOT NULL,
	StatusDetail nvarchar (MAX) NULL,
	LastUpdateTime datetime NULL,
	CONSTRAINT PK_OrderStatus PRIMARY KEY CLUSTERED 
	(
		StatusID
	)
)
Go
Create Table Food (
	FoodID int identity (1, 1) NOT NULL,
	CategoryIDF int,
	Price money,
	FoodName nvarchar (50), 
	FoodDetails nvarchar (MAX),
	
	CONSTRAINT PK_Food PRIMARY KEY CLUSTERED 
	(
		FoodID
	),
	CONSTRAINT FK_Food_Category FOREIGN KEY 
	(
		CategoryIDF
	) REFERENCES dbo.Category (
		CategoryID
	)
)
Go
Create Table Review (
	ReviewID int identity (1, 1) NOT NULL,
	CustomerIDF int,
	RestaurantIDF int,
	ReviewDate datetime, 
	Comment nvarchar (MAX),
	Speed float,
	Service float,
	Taste float,
	ScoreAverage float,
	
	CONSTRAINT PK_Review PRIMARY KEY CLUSTERED 
	(
		ReviewID
	),
	CONSTRAINT FK_Review_Customer FOREIGN KEY 
	(
		CustomerIDF
	) REFERENCES dbo.Customer (
		CustomerID
	),
	CONSTRAINT FK_Review_Restaurant FOREIGN KEY 
	(
		RestaurantIDF
	) REFERENCES dbo.Restaurant (
		RestaurantID
	)
)
Use YemekSepeti
Go
Create Table Campaign (
	CampaignID int identity (1, 1) NOT NULL,
	CampaignName nvarchar (50),
	StartDate  datetime,
	FinishDate datetime, 
	CampaignDetails nvarchar (MAX),
	CampaignImage nvarchar (MAX),
	IsActive bit,
	
	CONSTRAINT PK_Campaign PRIMARY KEY CLUSTERED 
	(
		CampaignID
	)
)
Go
Create Table Coupon (
	CouponID int identity (1, 1) NOT NULL,
	CouponCode uniqueidentifier ,
	CouponName  nvarchar (50),
	CouponDetails nvarchar (MAX), 
	StartDate datetime,
	FinishDate datetime,
	IsActive bit,
	DiscountAmount money,
	MinBasketPrice money,
	PaymentTypeIDF int,

	CONSTRAINT PK_Coupon PRIMARY KEY CLUSTERED 
	(
		CouponID
	),
	CONSTRAINT FK_Coupon_PaymentType FOREIGN KEY 
	(
		PaymentTypeIDF
	) REFERENCES dbo.PaymentType (
		PaymentTypeID
	)
)
Go
Create Table CouponCustomer (
	CustomerIDF int NOT NULL,
	CouponIDF int NOT NULL,
	
	CONSTRAINT FK_Customer_Customer_Coupon FOREIGN KEY 
	(
		CustomerIDF
	) REFERENCES dbo.Customer (
		CustomerID
	),
	CONSTRAINT FK_Coupon_Coupon_Customer FOREIGN KEY 
	(
		CouponIDF
	) REFERENCES dbo.Coupon (
		CouponID
	)
)
Go
Create Table Orders (
	OrderID int identity (1, 1) NOT NULL,
	OrderDate datetime NULL,
	TotalPrice money NULL ,
	IsDelivered bit NULL,
	CustomerIDF int NULL ,
	RestaurantIDF int NULL ,
	AddressIDF int NULL ,
	StatusIDF int NULL ,
	PaymentTypeIDF int NULL ,
	CONSTRAINT PK_ActiveOrder PRIMARY KEY CLUSTERED 
	(
		OrderID
	),
	CONSTRAINT FK_ActiveOrder_Restaurant FOREIGN KEY 
	(
		RestaurantIDF
	) REFERENCES dbo.Restaurant (
		RestaurantID
	),
	CONSTRAINT FK_ActiveOrder_Address FOREIGN KEY 
	(
		AddressIDF
	) REFERENCES dbo.Address (
		AddressID
	),
	CONSTRAINT FK_ActiveOrder_Customer FOREIGN KEY 
	(
		CustomerIDF
	) REFERENCES dbo.Customer (
		CustomerID
	),
	CONSTRAINT FK_ActiveOrder_Status FOREIGN KEY 
	(
		StatusIDF
	) REFERENCES dbo.OrderStatus (
		StatusID
	),
	CONSTRAINT FK_ActiveOrder_PaymentType FOREIGN KEY 
	(
		PaymentTypeIDF
	) REFERENCES dbo.PaymentType (
		PaymentTypeID
	)
)
Go
Create Table OldOrder (
	OrderID int NOT NULL,
	OrderDate datetime NULL,
	IsRated bit NULL,
	TotalPrice money NULL ,
	DeliveryDate datetime,
	CustomerIDF int NULL ,
	RestaurantIDF int NULL ,
	AddressIDF int NULL ,
	StatusIDF int NULL ,
	PaymentTypeIDF int NULL ,
	ReviewIDF int NULL,
	CONSTRAINT PK_OldOrder PRIMARY KEY CLUSTERED 
	(
		OrderID
	),
	CONSTRAINT FK_OldOrder_Restaurant FOREIGN KEY 
	(
		RestaurantIDF
	) REFERENCES dbo.Restaurant (
		RestaurantID
	),
	CONSTRAINT FK_OldOrder_Address FOREIGN KEY 
	(
		AddressIDF
	) REFERENCES dbo.Address (
		AddressID
	),
	CONSTRAINT FK_OldOrder_Customer FOREIGN KEY 
	(
		CustomerIDF
	) REFERENCES dbo.Customer (
		CustomerID
	),
	CONSTRAINT FK_OldOrder_Status FOREIGN KEY 
	(
		StatusIDF
	) REFERENCES dbo.OrderStatus (
		StatusID
	),
	CONSTRAINT FK_OldOrder_PaymentType FOREIGN KEY 
	(
		PaymentTypeIDF
	) REFERENCES dbo.PaymentType (
		PaymentTypeID
	),
	CONSTRAINT FK_OldOrder_Review FOREIGN KEY 
	(
		ReviewIDF
	) REFERENCES dbo.Review (
		ReviewID
	)
)
Go
Create Table BasketFood (
	BasketIDF int NOT NULL,
	FoodIDF int NOT NULL,
	Quantity float,
	Price money,
	Amount money
	
	CONSTRAINT FK_Basket_Food FOREIGN KEY 
	(
		BasketIDF
	) REFERENCES dbo.Basket (
		BasketID
	),
	CONSTRAINT FK_Food_Basket FOREIGN KEY 
	(
		FoodIDF
	) REFERENCES dbo.Food (
		FoodID
	)
)
Go
Create Table OrderFood (
	OrderIDF int NOT NULL,
	FoodIDF int NOT NULL,
	Quantity float,
	Price money,
	Amount money
	
	CONSTRAINT FK_Order_Food FOREIGN KEY 
	(
		OrderIDF
	) REFERENCES dbo.Orders (
		OrderID
	),
	CONSTRAINT FK_Food_Order FOREIGN KEY 
	(
		FoodIDF
	) REFERENCES dbo.Food (
		FoodID
	)
)
Go*/