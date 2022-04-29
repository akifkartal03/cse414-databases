--insert data
--171044098

Use YemekSepeti
Go

--add phone number
insert TelephoneNumber Values('90','5555555555'),
('90','5554443333'),
('90','5437776669'),
('90','2164445555'),
('90','2163335555')


Go

--add AddressType

insert AddressType 
Values('Ev'),
('İş'),
('Okul'),
('Diğer')
Go

--add Address

insert Address 
Values(1,1,'Ev Adresi','İstanbul','Sancaktepe','Yunus Emre Mah, Malazgirt Cd. No:31 D:3 Sancaktepe/İstanbul'),
(3,1,'Okul Adresi','Kocaeli','Gebze','Cumhuriyet, 2254. Sk. No:2, 41400 Gebze/Kocaeli'),
(2,1,'İş Adresi','Ankara','Çankaya','Test mah. test cad no.1 ankara/çankaya'),
(4,1,'Şube Adresi','İstanbul','Çekmeköy','Cumhuriyet Mah. Şile Otoyolu Adnan Menderes Cad. No: 18 Alkan Plaza İş Merkezi, 34788 Çekmeköy/İstanbul')

Go

--add email

insert Email
Values('test1@gmail.com'),
('test2@gmail.com'),
('test3@gmail.com'),
('test4@gmail.com')

Go

--add baskets
insert Basket
Values('1',0),
('1',0),
('1',0),
('1',0)
Go

--add digital wallets

insert DigitalWallet
Values(150,1,1,3000,getdate()),
(250,2,2,3000,getdate()),
(500,3,3,3000,getdate())

Go

--add customers

insert Customer
Values('Akif','Kartal','1997-07-25','test123',GETDATE(),1,1,1),
('Ayşe','Çınar','1992-09-13','test234',GETDATE(),2,2,2),
('Deniz','Kaya','1985-11-11','test356',GETDATE(),3,3,3)

Go

--add customeradress

insert CustomerAdress
Values(1,1),
(1,2),
(1,3),
(2,1),
(3,1)
Go

--add working hours

insert WorkingHours
Values('08:00 - 17:00 arası',9,'08:00','17:00'),
('09:00 - 23:00 arası',14,'09:00','23:00'),
('11:00 - 00:00 arası',13,'11:00','00:00')

Go

--add restaurant

insert Restaurant
Values('Burger King','https://burgerking.gif',30,50,1,0,4,4,1),
('Dominos','https://dominos.gif',40,60,1,0,4,4,2),
('KFC','https://kfc.gif',50,40,1,0,4,4,3)

Go

--add FavouriteRestaurant

insert FavouriteRestaurant
Values(1,1),
(1,2),
(2,1),
(3,3),
(3,2),
(2,2)

Go

--add PaymentType

insert PaymentType
Values('MetropolCard',0),
('Online Credit/Debit Card ',1),
('Multinet',0),
('Cash',0),
('Credit Card',0),
('Pay with Maximum Mobil',1)
Go

--add PaymentRestaurant

insert PaymentRestaurant
Values(1,1),
(1,2),
(1,3),
(2,2),
(2,3),
(3,2)

Go

--add category
insert Category
Values('Döner'),
('Burger'),
('Pizza'),
('Tantuni'),
('Tatlı'),
('Lahmacun'),
('Pide'),
('Pasta'),
('Börek'),
('Çiğ Köfte')

Go

--add food

insert Food
Values(2,1,60,'Whopper Menü','Whopper Menü + Büyük Boy Patates + Kutu İçecek'),
(3,2,80,'Seçilmiş Menü (Orta Boy Pizza)','Orta Boy Pizza + Seçeceğiniz Yan Ürün + Coca-Cola (33 cl.) Cazip pizzalar için geçerlidir.'),
(2,3,60,'KFC TAVUK BURGER KUTU','KFC Tavuk Burger, 2 Kanat, 4 Hot Shots, Orta Boy Patates, İçecek (330 ml.), Ketçap & Mayonez'),
(2,1,60,'Chicken Royale Menü','Chicken Royale + Büyük Boy Patates + Kutu İçecek')

Go
-- add foods to baskets
insert BasketFood Values (1,2,1,80)
insert BasketFood Values(2,1,1,60)
insert BasketFood Values (3,3,2,60)
Go

-- add order
insert Orders Values('2022-03-19 18:47:39.370',80,NULL,1,'Hazırlanıyor','2022-03-19 18:50:39.370',1,1,1,1)
insert Orders Values('2022-04-19 13:55:39.370',60,'2022-04-19 14:15:39.370',1,'Teslim Edildi','2022-03-19 18:50:39.370',2,2,2,2)
insert Orders Values('2022-05-19 14:35:39.370',120,'2022-05-19 14:55:39.370',1,'Teslim Edildi','2022-03-19 18:50:39.370',3,3,3,3)

Go

--add review
insert Review Values(1,1,1,GETDATE(),'Burger hastasıyım kötü yapanı görmedim. Piyasadaki en uygun fiyata burger king veriyor. Teşekkürler umarım siz de diğerleri gibi fiyatları iki katına çıkarmazsınız.',9,9,10)
insert Review Values(2,2,2,GETDATE(),'Teşekkürler. Uzun zaman sonra eksiksiz bir sipariş geldi.',5,5,5)
insert Review Values(3,3,3,GETDATE(),'Burger hastasıyım kötü yapanı görmedim. Piyasadaki en uygun fiyata burger king veriyor. Teşekkürler umarım siz de diğerleri gibi fiyatları iki katına çıkarmazsınız.',8,8,8)

