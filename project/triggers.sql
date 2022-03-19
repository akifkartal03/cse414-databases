--triggers
--171044098

Use YemekSepeti
Go
-- wallet log triggeri(çalışıyor sıkıntı yok)
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
-- food delete triggeri(çalışıyor sıkıntı yok)
Create Trigger trg_LogFood
on Food
after delete
as
declare @foodName nvarchar(50),@foodDetail nvarchar(MAX), @foodPrice money
Select @foodName = FoodName, @foodDetail = FoodDetails, @foodPrice = Price from deleted 
declare @resName nvarchar(50) = (select RestaurantName from Restaurant where RestaurantID = (select RestaurantIDF from deleted)) 
Insert FoodLog values(GETDATE(),@foodName,@foodDetail,@foodPrice,@resName)
Go
-- review yapıldığında average score güncellemesi(çalışıyor sıkıntı yok)
Create Trigger trg_ReviewAverage
on Review
after insert
as
declare @avgScore float, @resID int,@orderID int,@rewID int
set @resID = (select RestaurantIDF from inserted)
set @orderID = (select OrderID from inserted)
set @rewID = (select ReviewID from inserted)
Select @avgScore = ((Service+Speed+Taste) / 3) from inserted 
declare @totalAvg float = (select AverageScore from Restaurant where RestaurantID = @resID)
declare @newAvg float = ((@totalAvg + @avgScore) / ((select Count(*) from Review where RestaurantIDF = @resID)))
update Restaurant set AverageScore = @newAvg where RestaurantID = @resID
update Orders set ReviewIDF = @rewID where OrderID = @orderID
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
--(çalışıyor sıkıntı yok)
Create Trigger trg_OrderFood
on Orders
after insert
as
declare @customerID int = (select CustomerIDF from inserted)
declare @orderID int = (select OrderID from inserted)
declare @basketID int = (select BasketIDF from Customer where CustomerID = @customerID)
insert into OrderFood (OrderIDF,FoodIDF,Quantity,Price,Amount)
     SELECT @orderID,FoodIDF,Quantity,Price,Amount
     FROM BasketFood where BasketIDF = @basketID
delete from BasketFood where BasketIDF = @basketID
update Basket set TotalCost = 0, IsEmpty = 1 where BasketID = @basketID
