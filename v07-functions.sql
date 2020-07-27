
/* Function to see the total earnings by Stock */
IF OBJECT_ID ('ev.TotalEarningsbyStock') IS NOT NULL  
    DROP FUNCTION ev.TotalEarningsbyStock;  
GO 
CREATE FUNCTION ev.TotalEarningsbyStock (@Stock VARCHAR(50))  
RETURNS int   
AS   
-- Returns the tota earnings by Stock (passing the Stock) 
BEGIN  
    DECLARE @ret int;  
    SELECT   @ret = (PriceSell-PriceBuy)
    FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID 
    WHERE Sto.Ticker = @Stock
    IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END; 
GO

-- Testing Function
SELECT ev.TotalEarningsbyStock('SAEX') AS Total


/* Function to see the total Maximun Earnings*/
IF OBJECT_ID ('ev.MaximunEarnings') IS NOT NULL  
    DROP FUNCTION ev.MaximunEarnings;  
GO 
CREATE FUNCTION ev.MaximunEarnings ()  
RETURNS int   
AS   
-- Returns the maximun Earnings 
BEGIN  
    DECLARE @ret int;  
    SELECT   @ret = MAX (PriceSell-PriceBuy)
    FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID 
    IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END; 
GO

-- Testing Function
SELECT ev.MaximunEarnings() AS Maximun;
GO


/* Function to see the total Minimium Earnings*/
IF OBJECT_ID ('ev.MinimunEarnings') IS NOT NULL  
    DROP FUNCTION ev.MinimunEarnings;  
GO 
CREATE FUNCTION ev.MinimunEarnings ()  
RETURNS int   
AS   
-- Returns the maximun Earnings 
BEGIN  
    DECLARE @ret int;  
    SELECT   @ret = MIN (PriceSell-PriceBuy)
    FROM ev.Performance AS pe
    INNER JOIN dd.StockTransactions AS st
    ON pe.ToStockTransactionID = st.ID
    INNER JOIN dd.Stocks AS Sto
    ON st.ToStockID = Sto.ID 
    IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END; 
GO

-- Testing Function
SELECT ev.MinimunEarnings() AS Minimuns;
GO





