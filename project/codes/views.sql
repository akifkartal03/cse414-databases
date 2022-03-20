--views
--171044098

Use YemekSepeti
Go
--örnek view kullanımı
-- BurgerKing restoranı için yapılan tüm yorumları view kullanarak getir
select AVG(OrtalamaPuan) as Score from vm_Comment where YorumYapılanRestoran = 'BurgerKing'

-- adı akif olan müşteriyi view kullanarak getir
select * from vm_Customer where Adı='Akif' 

/*
-- detaylı müsteri bilgisi getirme view'i
Create View vm_Customer
as
Select c.FirstName as Adı, c.LastName as Soyadı, YEAR(c.BirthDate) as DoğumTarihi,
e.MailAddress as MailAdresi, b.TotalCost as SepetTutarı, d.MaximumLimit as CüzdanMaximumLimit,
c.RecorDate as KayıtTarihi, (select Count(*) from Orders o where o.CustomerIDF = c.CustomerID) as SiparişSayısı, 
(select Count(*) from Review r where r.CustomerIDF = c.CustomerID) as ToplamYorumSayısı,
(select Count(*) from CouponCustomer co where co.CustomerIDF = c.CustomerID) as KuponSayısı,
(select Count(*) from FavouriteRestaurant fa where fa.CustomerIDF = c.CustomerID) as FavoriRestoranSayısı
from Customer c 
inner join Email e on c.EmailIDF = e.MailID
inner join Basket b on b.BasketID = c.BasketIDF
inner join DigitalWallet d on d.WalletID = c.WalletIDF

Go
-- detaylı siparis bilgisi(SonBilgiGirişZamanı değiştir)
Create View vm_Order
as
Select o.OrderID as OrderNumarası,o.OrderDate as SiparişTarihi,o.TotalPrice as Fiyat, 
(Select Count(*) from OrderFood o_f where o_f.OrderIDF = o.OrderID) as YemekAdedi,
c.FirstName+' '+c.LastName as SiparişiVerenKişi,a.AdressDetail as SiparişAdresi,
r.RestaurantName as RestorantAdı,p.PaymentTypeName as ÖdemeTipi,o.IsDelivered as TeslimEdildimi,
o.DeliveryDate as SonBilgiGirişZamanı, (CASE 
		WHEN o.ReviewIDF is null THEN 'Yorum Yapılmadı!'
        ELSE (select Comment from Review s where s.ReviewID = o.ReviewIDF) end) as SiparişYorumu
from Orders o 
inner join Customer c on c.CustomerID = o.CustomerIDF
inner join Restaurant r on r.RestaurantID = o.RestaurantIDF
inner join Address a on a.AddressID= o.AddressIDF
inner join PaymentType p on p.PaymentTypeID = o.PaymentTypeIDF

Go

-- detaylı restoran bilgisi
Create View vm_Restaurant
as
Select r.RestaurantName as RestoranAdı,r.AverageScore as RestoranPuanı,
r.MinDeliveryTime+' '+'dk.' as ServisSüresi, r.MinDeliveryPrice as MinTutar,r.IsOpen as RestoranAçıkmı,
w.HoursDetail as ÇalışmaSaatleri, t.CountryCode + ' ' +t.PhoneNumber as TelefonNumarası, a.AdressDetail as Adresi,
(select Count(*) from Food f where f.RestaurantIDF = r.RestaurantID) as ToplamYemekSayısı,
(select Count(*) from Review re where re.RestaurantIDF = r.RestaurantID) as ToplamYorumSayısı,
(select Count(*) from FavouriteRestaurant fa where fa.RestaurantIDF = r.RestaurantID) as FavoriSeçilmeSayısı,
(select Count(*) from PaymentRestaurant py where py.RestaurantIDF = r.RestaurantID) as ToplamÖdemeTipiSayısı
from Restaurant r 
inner join WorkingHours w on w.HourID = r.WorkingHoursIDF
inner join TelephoneNumber t on t.NumberID = r.PhoneNumberIDF
inner join Address a on a.AddressID= r.AddressIDF

Go 

-- 40 TL altındaki yemeklerin detaylı listesi
Create View vm_Max40Food
as
Select f.FoodName as YemekAdı,f.FoodDetails as YemekDetayı, f.Price as Fiyatı,
c.CategoryName as YemekTürü, r.RestaurantName as RestoranAdı,
r.MinDeliveryTime+' '+'dk.' as ServisSüresi from Food f 
inner join Category c on c.CategoryID = f.CategoryIDF
inner join Restaurant r on r.RestaurantID = f.RestaurantIDF
where f.Price < 40 


Go
-- detaylı tüm restoran yorumları
Create View vm_Comment
as
Select r.Comment as Yorum,c.FirstName+' '+c.LastName as YorumuYapanKişi,
re.RestaurantName as YorumYapılanRestoran, r.ReviewDate as YorumTarihi,
r.Speed as HızPuanı,r.Service as ServisPuanı, r.Taste as LezzetPuanı,
r.ScoreAverage as OrtalamaPuan, o.OrderDate as SiparişTarihi
from Review r
inner join Customer c on c.CustomerID = r.CustomerIDF
inner join Restaurant re on re.RestaurantID = r.RestaurantIDF
inner join Orders o on o.OrderID = r.OrderID
*/