-- View Creation 1 --- See Especific Stock Detail

CREATE VIEW dd.SpecificStock
AS
SELECT 
    Ticker, 
    CompanyName, 
    Market, 
    Sector
FROM dd.Stocks AS st
INNER JOIN dd.Sector AS se
ON st.ToSectorID = se.ID
WHERE Ticker = 'SAEX'
;
GO

-- Running View
--DROP VIEW dd.SpecificStock;
SELECT * FROM dd.SpecificStock;
GO

-- View Creation 2 --- Transactions by Stock

CREATE VIEW dd.TransactionsByStock
AS
SELECT 
    Ticker, 
    COUNT (*) Total
FROM dd.Stocks AS sr
    INNER JOIN dd.StockTransactions AS st
    ON sr.ID = st.ToStockID
    GROUP BY Ticker;
GO

-- Running View
--DROP VIEW dd.TransactionsByStock;
SELECT * FROM dd.TransactionsByStock;
GO


-- View Creation 3 --- Earnings by Transaction

CREATE VIEW dd.EarningByTransaction
AS
SELECT 
    Ticker, PriceBuy - PriceSell Earning
    
FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID
GO

-- Running View
--DROP VIEW dd.EarningByTransaction;
SELECT * FROM dd.EarningByTransaction;
GO

-- View Creation 4 --- Earnings by Stock

CREATE VIEW ev.EarningByStock
AS
SELECT 
    Ticker, SUM (PriceBuy - PriceSell) Earning
FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID
    GROUP BY Ticker;
GO

-- Running View
--DROP VIEW dd.EarningByStock;
SELECT * FROM ev.EarningByStock;
GO


-- View Creation 5 --- EvaluationAveragebyTransaction

CREATE VIEW ev.EvaluationAveragebyTransaction
AS
SELECT 
    pe.ID, sto.Ticker, pe.EvaluationAt, AVG(Points) AVGPoints
FROM ev.Evaluations AS ev
    INNER JOIN ev.Performance AS pe
    ON pe.ID = ev.ToPerformaceID
    INNER JOIN dd.StockTransactions AS Stt
    ON pe.ToStockTransactionID = Stt.ID
    INNER JOIN dd.Stocks AS Sto
    ON Stt.ToStockID = Sto.ID
    GROUP BY pe.ID, pe.EvaluationAt, sto.Ticker;
GO

-- Running View
-- DROP VIEW ev.EvaluationAveragebyTransaction;
SELECT * FROM ev.EvaluationAveragebyTransaction;
GO

-- View Creation 6 --- ScordCardByTransaction

CREATE VIEW ev.ScordCardByTransaction
AS
SELECT 
    pe.ID, sto.Ticker, pe.EvaluationAt, Criterion, Points
FROM ev.Evaluations AS ev
    INNER JOIN ev.Performance AS pe
    ON pe.ID = ev.ToPerformaceID
    INNER JOIN dd.StockTransactions AS Stt
    ON pe.ToStockTransactionID = Stt.ID
    INNER JOIN dd.Stocks AS Sto
    ON Stt.ToStockID = Sto.ID
    INNER JOIN ev.Criteria AS cr
    ON ev.ToCriteriaID = cr.ID
    WHERE pe.ID = 'faf73ba8-9bf9-4caa-b16a-5933ea98b14d'
GO

-- Running View
-- DROP VIEW ev.ScordCardByTransaction;
SELECT * FROM ev.ScordCardByTransaction;
GO


-- View Creation 7 --- Negative Earning Transactions

CREATE VIEW ev.NegativeEarningsTransactions
AS
SELECT 
    Ticker, PriceBuy - PriceSell Earning
    
FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID
    GROUP BY Ticker, PriceSell, PriceBuy
    HAVING (PriceBuy - PriceSell) < 0;
GO

-- Running View
-- DROP VIEW ev.NegativeEarningsTransactions;
SELECT * FROM ev.NegativeEarningsTransactions;
GO


