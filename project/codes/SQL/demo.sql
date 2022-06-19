insert Food
Values(3,2,75,'Demo Yemek','Demo Yemek Detayları')

select * from Food

select * from Email

select * from Basket 

select * from DigitalWallet where WalletID = 7

select * from Customer

update DigitalWallet set Balance = 80, LastLoadDate =GETDATE() where WalletID = 7

insert Email
Values('test9@gmail.com'),
('test10@gmail.com'),
('test11@gmail.com'),
('test12@gmail.com')

delete from Email where MailID = 7