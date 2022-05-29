select * from WalletLog
Go
update DigitalWallet set Balance = Balance + 100 where WalletID = 1
Go
update DigitalWallet set Balance = Balance + 50 where WalletID = 1
Go
select * from WalletLog