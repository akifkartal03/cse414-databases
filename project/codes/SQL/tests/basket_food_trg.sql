select * from Basket where BasketID = 1
Go
insert BasketFood(BasketIDF,FoodIDF,Quantity,Price) Values(1,2,1,80)
Go
insert BasketFood(BasketIDF,FoodIDF,Quantity,Price) Values(1,1,1,60)
Go
select * from Basket where BasketID = 1