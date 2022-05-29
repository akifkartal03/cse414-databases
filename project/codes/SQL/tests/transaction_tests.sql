
--transaction testleri

exec sp_insertCustomerTransaction 'Selin','Özdemir','1999-07-27','test1234',4,4,7
Select * from Customer

exec sp_insertReviewTransaction 'Selin','Özdemir','1999-07-27','test1234',4,4,7