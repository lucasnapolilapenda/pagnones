/* Total Earning by Year */
IF OBJECT_ID ('ev.TotalEarningsbyYear') IS NOT NULL  
    DROP PROCEDURE ev.TotalEarningsbyYear;  
GO 
CREATE PROCEDURE ev.TotalEarningsbyYear
AS
    SELECT SUM (PriceSell-PriceBuy) Earnings
    FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID
    WHERE pe.EvaluationAt LIKE '%2020%'
    GROUP BY pe.EvaluationAt;
;
GO

-- Testing Procedure
EXECUTE ev.TotalEarningsbyYear;
GO


/* % of transacions with lost */
IF OBJECT_ID ('ev.PlostTransactions') IS NOT NULL  
    DROP PROCEDURE ev.PlostTransactions;  
GO 
CREATE PROCEDURE ev.PlostTransactions
AS
    SELECT SUM(CASE WHEN (PriceSell-PriceBuy)<0 THEN 1 ELSE 0 END)*100 / SUM(CASE WHEN (PriceSell-PriceBuy)!=0 THEN 1 ELSE 0 END) EarningsPercentageLost
    FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID
    GROUP BY pe.EvaluationAt;
;
GO

-- Testing Procedure;
EXECUTE ev.PlostTransactions;
GO