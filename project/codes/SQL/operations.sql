update DigitalWallet set Balance = 150 where WalletID = 1


delete from Food where FoodID = 3

insert Review(CustomerIDF,
RestaurantIDF,
Comment,
ReviewDate,
Speed,
Service,
Taste,
ScoreAverage,
OrderID
) Values(1,1,'nice to have2',getDAte(),5,5,5,5,1)

insert Review(CustomerIDF,
RestaurantIDF,
Comment,
ReviewDate,
Speed,
Service,
Taste,
ScoreAverage,
OrderID
) Values(2,2,'nice to have3',getDAte(),9,9,9,9,2)

insert BasketFood(BasketIDF,
FoodIDF,
Quantity,
Price,
Amount
) Values(1,2,1,70,70)

insert Orders(CustomerIDF,
RestaurantIDF,
AddressIDF,
PaymentTypeIDF,
StatusIDF,
OrderDate,
TotalPrice,
IsDelivered,
IsRated,
DeliveryDate,
ReviewIDF) Values(1,1,1,1,1,getdate(),130,0,0,null,null)