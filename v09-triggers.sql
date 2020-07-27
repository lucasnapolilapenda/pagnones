/* Trigger to create a notification message 
in a message table when a StockTransaction is created */

IF OBJECT_ID ('dd.MessageCreator') IS NOT NULL  
    DROP TRIGGER dd.MessageCreator;  
GO 

CREATE TRIGGER dd.MessageCreator
ON dd.StockTransactions
AFTER INSERT
AS
BEGIN
    IF OBJECT_ID ('dd.Messages') IS NULL  
    CREATE TABLE dd.Messages
(
	CountID  int IDENTITY(1,1) PRIMARY KEY,
	Messages VARCHAR (100) NOT NULL,
)
    SET IDENTITY_INSERT dd.StockTransaction ON
    INSERT INTO dd.Messages (Messages)
VALUES ('Your transaction has been loaded');
END
;
GO


/* Trigger to comunicate how many Stock are manage in the portfolio when 
a new Stock is loaded */

IF OBJECT_ID ('dd.StocksCounter') IS NOT NULL  
    DROP TRIGGER dd.StockCounter;  
GO 

CREATE TRIGGER dd.StockCounter
ON dd.Stocks
AFTER INSERT
AS
BEGIN
SELECT * FROM dd.Stocks
END
;
GO


