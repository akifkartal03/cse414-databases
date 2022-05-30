
--transaction testleri

exec sp_insertCustomerTransaction 'Ahmet','Yılmaz','1998-07-27','test1',3,3,7
Select * from Customer


insert BasketFood Values (4,2,1,80)

update DigitalWallet set Balance = 80, LastLoadDate = GETDATE() where WalletID = 7

insert Orders Values('2022-05-19 14:35:39.370',80,'2022-05-19 14:55:39.370',0,'Teslim Edildi','2022-03-19 18:50:39.370',4,1,1,1)

exec sp_insertReviewTransaction 4,1,4,'Burger hastasıyım teşekkürler umarım siz de diğerleri gibi fiyatları iki katına çıkarmazsınız.',9,8,7

select * from WalletLog

select * from Restaurant

exec sp_orderTransaction 4, 1, 100
select * from Orders


select * from Customer c Left Outer Join Email e on c.EmailIDF = e.MailID
select * from Customer c Right Outer Join Email e on c.EmailIDF = e.MailID
select * from Customer c Full Outer Join Email e on c.EmailIDF = e.MailID
