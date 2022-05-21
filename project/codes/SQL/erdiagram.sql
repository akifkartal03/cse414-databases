Use master
Go

Create Database ERDiagram
Go
Use ERDiagram
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
	Balance money default 0,
	BillingAdressIDF int NULL ,
	BillingMailIDF int NULL ,
	MaximumLimit money default 5000 ,
	LastLoadDate datetime NULL ,

	CONSTRAINT PK_DigitalWallet PRIMARY KEY CLUSTERED 
	(
		WalletID
	)
)
Go
Create Table Customer (
	CustomerID int identity (1, 1) NOT NULL,
	FirstName nvarchar (50),
	LastName nvarchar (50),
	BirthDate date NULL ,
	Password nvarchar (MAX) NULL ,
	RecordDate datetime NULL ,
	EmailIDF int NULL ,
	BasketIDF int NULL ,
	WalletIDF int NULL ,
	CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED 
	(
		CustomerID
	)
)
Go

Create Table CustomerAdress (
	CustomerIDF int NOT NULL,
	AddressIDF int NOT NULL,
	
	
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
	AverageScore decimal(8,2) NULL ,
	AddressIDF int NULL ,
	PhoneNumberIDF int NULL ,
	WorkingHoursIDF int NULL ,
	CONSTRAINT PK_Restaurant PRIMARY KEY CLUSTERED 
	(
		RestaurantID
	)
)
Go
Create Table FavouriteRestaurant (
	CustomerIDF int NOT NULL,
	RestaurantIDF int NOT NULL,
	
	
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
Create Table Food (
	FoodID int identity (1, 1) NOT NULL,
	CategoryIDF int,
	RestaurantIDF int,
	Price money,
	FoodName nvarchar (50), 
	FoodDetails nvarchar (MAX),
	
	CONSTRAINT PK_Food PRIMARY KEY CLUSTERED 
	(
		FoodID
	)
)
Go
Create Table Orders (
	OrderID int identity (1, 1) NOT NULL,
	OrderDate datetime NULL,
	TotalPrice money NULL,
	DeliveryDate datetime NULL,
	IsDelivered as (case when DeliveryDate is null then 0
				else 1 end),
	IsRated bit NULL,
	StatusDetails nvarchar(MAX) NULL,
	LastUpdateTime datetime NULL,
	CustomerIDF int NULL,
	RestaurantIDF int NULL,
	AddressIDF int NULL,
	PaymentTypeIDF int NULL,
	CONSTRAINT PK_Order PRIMARY KEY CLUSTERED 
	(
		OrderID
	)
)
Go
Create Table Review (
	ReviewID int identity (1, 1) NOT NULL,
	CustomerIDF int,
	RestaurantIDF int,
	OrderIDF int,
	ReviewDate datetime, 
	Comment nvarchar (MAX),
	Speed float,
	Service float,
	Taste float,
	ScoreAverage as CAST((Speed + Service +Taste) / 3 AS DECIMAL(10,2)),
	
	CONSTRAINT PK_Review PRIMARY KEY CLUSTERED 
	(
		ReviewID
	)
)
Go
Create Table Offer (
	ID int identity (1, 1) NOT NULL,
	Name  nvarchar (50),
	Details nvarchar (MAX), 
	StartDate datetime,
	FinishDate datetime,
	IsActive as (case when FinishDate < getdate() then 0
				else 1 end),

	CONSTRAINT PK_Offer PRIMARY KEY CLUSTERED 
	(
		ID
	)
)
Go
Create Table Campaign (
	IDF int NULL,
	CampaignImage nvarchar (MAX),
	RestaurantIDF int NULL,

)
Go
Create Table Coupon (
	IDF int NULL,
	CouponCode uniqueidentifier ,
	DiscountAmount money,
	MinBasketPrice money,
	PaymentTypeIDF int,

	
)
Go
Create Table CouponCustomer (
	CustomerIDF int NOT NULL,
	CouponIDF int NOT NULL,
	
)
Go

Create Table BasketFood (
	BasketIDF int NOT NULL,
	FoodIDF int NOT NULL,
	Quantity float,
	Price money,
	Amount as cast(Quantity * Price as money),
	
	
)
Go
Create Table OrderFood (
	OrderIDF int NOT NULL,
	FoodIDF int NOT NULL,
	Quantity float,
	Price money,
	Amount as cast(Quantity * Price as money),
	

)
Go
Create Table FoodLog (
	LogID int identity (1, 1) NOT NULL,
	DeletedTime datetime NULL,
	FoodName nvarchar(50) NULL,
	FoodDetail nvarchar(MAX) NULL,
	Price money NULL,
	RestaurantName nvarchar(50) NULL,
	
	CONSTRAINT PK_FoodLog PRIMARY KEY CLUSTERED 
	(
		LogID
	)
)
Go
Create Table WalletLog (
	LogID int identity (1, 1) NOT NULL,
	LogTime datetime NULL,
	OperationDetails nvarchar(MAX) NULL ,
	OldBalance money NULL,
	NewBalance money NULL,
	WalletIDF int NULL,
	
	CONSTRAINT PK_WalletLog PRIMARY KEY CLUSTERED 
	(
		LogID
	)
)