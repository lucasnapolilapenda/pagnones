-- View Creation 1 --- See Especific Stock Detail

CREATE VIEW dd.SpecificStock
AS
SELECT Ticker, CompanyName, Market, Sector
FROM dd.Stocks AS st
INNER JOIN dd.Sector AS se
ON st.ToSectorID = se.ID
WHERE Ticker = 'SAEX'
;
GO

-- Running View
--DROP VIEW dd.SpecificStock;
SELECT * FROM dd.SpecificStock;


-- View Creation 2 --- Transactions by Stock

CREATE VIEW dd.TransactionsByStock
AS
SELECT Ticker, COUNT (*) Total
FROM dd.Stocks AS sr
INNER JOIN dd.StockTransactions AS st
ON sr.ID = st.ToStockID
GROUP BY Ticker;
GO

-- Running View
--DROP VIEW dd.TransactionsByStock;
SELECT * FROM dd.TransactionsByStock;

