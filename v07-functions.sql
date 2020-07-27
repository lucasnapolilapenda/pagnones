
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

SELECT ev.TotalEarningsbyStock('SAEX') AS Total





