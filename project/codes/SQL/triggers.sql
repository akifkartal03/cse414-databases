--triggers
--171044098

Use YemekSepeti
Go
-- wallet log triggeri
Create Trigger trg_LogWallet
on DigitalWallet
after update
as
declare @newBalance money,@oldBalance money, @walletID int
Select @newBalance = Balance,@walletID = WalletID from inserted 
Select @oldBalance = Balance from deleted 
declare @operation nvarchar(max) = (CASE 
		WHEN @newBalance < @oldBalance THEN 'Para Çekme İşlemi Yapıldı.'
		WHEN @newBalance > @oldBalance THEN 'Para Yükleme İşlemi Yapıldı.'
        ELSE 'Bakiye Değişmedi' end)
Insert WalletLog values(GETDATE(),@operation,@oldBalance,@newBalance,@walletID)

Go
-- food delete triggeri
Create Trigger trg_LogFood
on Food
after delete
as
declare @foodName nvarchar(50),@foodDetail nvarchar(MAX), @foodPrice money
Select @foodName = FoodName, @foodDetail = FoodDetails, @foodPrice = Price from deleted 
declare @resName nvarchar(50) = (select RestaurantName from Restaurant where RestaurantID = (select RestaurantIDF from deleted)) 
Insert FoodLog values(GETDATE(),@foodName,@foodDetail,@foodPrice,@resName)
Go
-- review yapıldığında average score güncellemesi
Create Trigger trg_ReviewAverage
on Review
after insert
as
declare @avgScore float, @resID int,@orderID int,@rewID int
set @resID = (select RestaurantIDF from inserted)
set @orderID = (select OrderIDF from inserted)
set @rewID = (select ReviewID from inserted)
Select @avgScore = ((Service+Speed+Taste) / 3) from inserted 
declare @totalAvg float = (select AverageScore from Restaurant where RestaurantID = @resID)
declare @totalCount int = (select Count(*) from Review where RestaurantIDF = @resID)
declare @newAvg float = ((@totalAvg + @avgScore) / (case when  @totalCount = 0 then 1 else @totalCount end))
update Restaurant set AverageScore = @newAvg where RestaurantID = @resID
update Orders set IsRated = 1 where OrderID = @orderID
Go
-- sepete yemek eklediğinde sepetin fiyatını güncelleme
Create Trigger trg_BasketPriceUpdate
on BasketFood
after insert
as
declare @amount money = (select Amount from inserted)
declare @basketID int = (select BasketIDF from inserted)
update Basket set TotalCost = TotalCost + @amount, IsEmpty = 0 where BasketID = @basketID
Go
-- sipariş verildikten sonra sepetteki yemeklerin sipariş yemek tablosuna kaydedilmesi 
-- ve yemeklerin sepetten silinmesi
Create Trigger trg_OrderFood
on Orders
after insert
as
declare @customerID int = (select CustomerIDF from inserted)
declare @orderID int = (select OrderID from inserted)
declare @restID int = (select RestaurantIDF from inserted)
declare @basketID int = (select BasketIDF from Customer where CustomerID = @customerID)
declare @total int = (select TotalPrice from inserted)
declare @sender int = (select WalletIDF from Customer where CustomerID = @customerID)
declare @reciever int = (select WalletIDF from Restaurant where RestaurantID = @restID )
insert into OrderFood (OrderIDF,FoodIDF,Quantity,Price)
     SELECT @orderID,FoodIDF,Quantity,Price
     FROM BasketFood where BasketIDF = @basketID
delete from BasketFood where BasketIDF = @basketID
update Basket set TotalCost = 0, IsEmpty = 1 where BasketID = @basketID
--insert sp here
exec sp_orderTransaction @sender, @reciever, @total
