-- Index to look by Stock
CREATE NONCLUSTERED INDEX I_STOCKS_TICKER
    ON dd.Stocks (Ticker)
;   
GO  

-- Index to look by CatalizerValue
CREATE NONCLUSTERED INDEX I_CATALIZER_VALUE
    ON dd.CatalizerTransactions (CatalizerValue)
;   
GO  

-- Index to look by CriterionValue
CREATE NONCLUSTERED INDEX I_CRITERIA_VALUE
    ON ev.Evaluations (ToCriteriaID)
;   
GO  


