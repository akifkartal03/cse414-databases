--create tables
-- 171044098

Use master
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