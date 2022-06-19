-- transactionlar için örnekler

--1 ) sipariş verirken müşsterinin dijial cüzdanından restoranın dijitial cüzdanına aktarım yapma

-- 2) müşteri insert edilirken daha önce kullanılan bir sepet, email ve dijital cüzdan verilemez.

-- 3) review yaparken  daha önce review yapılan bir siparişe review yapılamaz.
	

create procedure sp_orderTransaction
(
	@senderWalletId int,
	@receiverWalletId int,
	@amount money
)
as
Begin Transaction OrderPayment
declare @senderBalance money
Select @senderBalance = Balance from DigitalWallet where WalletID = @senderWalletId 
If @amount > @senderBalance
Begin
	print 'Bakiye Yetersiz!'
	RollBack
End
Else
Begin
	Update DigitalWallet set Balance = Balance - @amount where WalletID = @senderWalletId 
	Update DigitalWallet set Balance = Balance + @amount, LastLoadDate = GETDATE() where WalletID = @receiverWalletId
	Commit
End



create procedure sp_insertCustomerTransaction
(
	@FirstName nvarchar (50),
	@LastName nvarchar (50),
	@BirthDate date NULL ,
	@Password nvarchar (MAX) NULL ,
	@EmailIDF int NULL ,
	@BasketIDF int NULL ,
	@WalletIDF int NULL 
)
as
Begin Transaction insertCustomer
declare @tempWalletId int = 0 , @tempEmailId int = 0, @tempBasketId int = 0
Select @tempWalletId = WalletIDF from Customer where WalletIDF = @WalletIDF
Select @tempWalletId = WalletIDF from Restaurant where WalletIDF = @WalletIDF
Select @tempBasketId = BasketIDF from Customer where BasketIDF = @BasketIDF
Select @tempEmailId = EmailIDF from Customer where EmailIDF = @EmailIDF
If @tempBasketId > 0 or @tempEmailId > 0 or @tempWalletId > 0
Begin
	print 'Daha önce kullanılmış email, hesap cüzdanı ve sepet bilgileri ile yeni müşteri oluşturulamaz!'
	RollBack
End
Else
Begin
	insert Customer Values(@FirstName,@LastName,@BirthDate,@Password,getdate(),@EmailIDF,@BasketIDF,@WalletIDF)
	Commit
End




create procedure sp_insertReviewTransaction
(
	@CustomerIDF int,
	@RestaurantIDF int,
	@OrderIDF int,
	@ReviewDate datetime, 
	@Comment nvarchar (MAX),
	@Speed float,
	@Service float,
	@Taste float
)
as
Begin Transaction insertReview
declare @tempId int = 0
Select @tempId = OrderIDF from Review where OrderIDF = @OrderIDF
If @tempId > 0
Begin
	print 'Daha önce review yapılmış bir sipariş için tekrar review yapılamaz!'
	RollBack
End
Else
Begin
	insert Review Values(@CustomerIDF,@RestaurantIDF,@OrderIDF,@ReviewDate,@Comment,@Speed,@Service,@Taste)
	Commit
End





