
--transaction testleri

exec sp_insertCustomerTransaction 'Selin','�zdemir','1999-07-27','test1234',4,4,7
Select * from Customer

exec sp_insertReviewTransaction 'Selin','�zdemir','1999-07-27','test1234',4,4,7