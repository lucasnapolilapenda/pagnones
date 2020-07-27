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

-- View Creation 8 --- Positive Earning Transactions

CREATE VIEW ev.PositiveEarningsTransactions
AS
SELECT 
    Ticker, PriceBuy - PriceSell Earning
    
FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID
    GROUP BY Ticker, PriceSell, PriceBuy
    HAVING (PriceBuy - PriceSell) > 0;
GO

-- Running View
-- DROP VIEW ev.PositiveEarningsTransactions;
SELECT * FROM ev.PositiveEarningsTransactions;
GO

-- View Creation 9 --- Catalizer Detail By Transaction

CREATE VIEW dd.CatalizerDetailbyTransaction
AS
SELECT 
    Ticker, st.CreatedAt, cty.CatalizerTypes, ct.CatalizerValue
    
FROM dd.StockTransactions AS st
    INNER JOIN dd.CatalizerTransactions AS ct
    ON ct.ID = st.ToCatalizerID
    INNER JOIN dd.CatalizerType AS cty
    ON ct.ToCatalizerTypeID = cty.ID
    INNER JOIN dd.Stocks AS sto
    ON st.ToStockID = sto.ID
GO

-- Running View
-- DROP VIEW dd.CatalizerDetailbyTransaction;
SELECT * FROM dd.CatalizerDetailbyTransaction;
GO


-- Running View
-- DROP VIEW ev.PositiveEarningsTransactions;
SELECT * FROM ev.PositiveEarningsTransactions;
GO

-- View Creation 10 --- Specific KeyLevel

CREATE VIEW dd.KeyLevelUp
AS
SELECT 
    Ticker, st.CreatedAt, cty.CatalizerTypes, ct.CatalizerValue, klty.KeyLevelsTypes, klt.KeyLevelsTransactionsValue
    
FROM dd.StockTransactions AS st
    INNER JOIN dd.CatalizerTransactions AS ct
    ON ct.ID = st.ToCatalizerID
    INNER JOIN dd.CatalizerType AS cty
    ON ct.ToCatalizerTypeID = cty.ID
    INNER JOIN dd.Stocks AS sto
    ON st.ToStockID = sto.ID
    INNER JOIN dd.KeyLevels AS kl
    ON st.ToKeyLevelsID = kl.ID
    INNER JOIN dd.KeyLevelsTransactions AS klt
    ON kl.ID = klt.ToKeyLevelsID
    INNER JOIN dd.KeyLevelsTypes AS klty 
    ON klt.ToKeylevelsTypeID = klty.ID
    GROUP BY Ticker, st.CreatedAt, cty.CatalizerTypes, ct.CatalizerValue, klty.KeyLevelsTypes, klt.KeyLevelsTransactionsValue
    HAVING klt.KeyLevelsTransactionsValue > 2.5;
GO

-- Running View
DROP VIEW dd.KeyLevelUp;
SELECT * FROM dd.KeyLevelUp;
GO




