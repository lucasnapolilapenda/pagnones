/* 1. Between dd.Stocks and dd.Sector*/

ALTER TABLE dd.Stocks
DROP CONSTRAINT fk_Stock_Sector;  
GO 

ALTER TABLE dd.Stocks
	add constraint fk_Stock_Sector foreign key (ToSectorID)
	references dd.Sector (ID)
;
GO

/* 2. Between dd.CatalizerTypes and dd.CatalyzerTransactions*/

ALTER TABLE dd.CatalizerTransactions
DROP CONSTRAINT fk_CatTras_CatType;  
GO 

ALTER TABLE dd.CatalizerTransactions
	add constraint fk_CatTras_CatType foreign key (ToCatalizerTypeID)
	references dd.CatalizerType (ID)
;
GO

/* 3. Between dd.CashTypes and dd.CashTransactions*/

ALTER TABLE dd.CashTransactions
DROP CONSTRAINT fk_CashTras_CashTypes;  
GO 

ALTER TABLE dd.CashTransactions
	add constraint fk_CashTras_CashType foreign key (ToCashTypeID)
	references dd.CashTypes (ID)
;
GO

/* 4. Between dd.CashTypes and dd.CashTransactions*/

ALTER TABLE dd.Cash
DROP CONSTRAINT fk_Cash_CashTran;  
GO 

ALTER TABLE dd.Cash
	add constraint fk_Cash_CashTran foreign key (ToCashTransactionsID)
	references dd.CashTransactions (ID)
;
GO

/* 5. Between dd.HistoryChartTypes and dd.HistoryChartTransactions*/

ALTER TABLE dd.HistoryChartTransactions
DROP CONSTRAINT fk_HistoryChartTras_HistoryChartType;  
GO 

ALTER TABLE dd.HistoryChartTransactions
	add constraint fk_HistoryChartTras_HistoryChartType foreign key (ToHistoryChartTypeID)
	references dd.HistoryChartTypes (ID)
;
GO

/* 6. Between dd.HistoryChartTypes and dd.HistoryChartTransactions*/

ALTER TABLE dd.HistoryChart
DROP CONSTRAINT fk_HistoryChart_HistoryChartTran;  
GO 

ALTER TABLE dd.HistoryChart
	add constraint fk_HistoryChart_HistoryChartTran foreign key (ToHistoryChartTransactionsID)
	references dd.HistoryChartTransactions (ID)
;
GO

/* 7. Between dd.KeyLevelsTypes and dd.KeyLevelsTransactions*/

ALTER TABLE dd.KeyLevelsTransactions
DROP CONSTRAINT fk_KeyLevelsTras_KeyLevelsType;  
GO 

ALTER TABLE dd.KeyLevelsTransactions
	add constraint fk_KeyLevelsTras_KeyLevelsType foreign key (ToKeyLevelsTypeID)
	references dd.KeyLevelsTypes (ID)
;
GO

/* 8. Between dd.KeyLevelsTypes and dd.KeyLevelsTransactions*/

ALTER TABLE dd.KeyLevels
DROP CONSTRAINT fk_KeyLevels_KeyLevelsTran;  
GO 

ALTER TABLE dd.KeyLevels
	add constraint fk_KeyLevels_KeyLevelsTran foreign key (ToKeyLevelsTransactionsID)
	references dd.KeyLevelsTransactions (ID)
;
GO

/* 9. Between dd.PriceTypes and dd.PriceTransactions*/

ALTER TABLE dd.PriceTransactions
DROP CONSTRAINT fk_PriceTras_PriceType;  
GO 

ALTER TABLE dd.PriceTransactions
	add constraint fk_PriceTras_PriceType foreign key (ToPriceTypesID)
	references dd.PriceTypes (ID)
;
GO

/* 10. Between dd.PriceTypes and dd.PriceTransactions*/

ALTER TABLE dd.Price
DROP CONSTRAINT fk_Price_PriceTran;  
GO 

ALTER TABLE dd.Price
	add constraint fk_Price_PriceTran foreign key (ToPriceTransactionsID)
	references dd.PriceTransactions (ID)
;
GO

/* 11. Between dd.VolumeTypes and dd.VolumeTransactions*/

ALTER TABLE dd.VolumeTransactions
DROP CONSTRAINT fk_VolumeTras_VolumeType;  
GO 

ALTER TABLE dd.VolumeTransactions
	add constraint fk_VolumeTras_VolumeType foreign key (ToVolumeTypesID)
	references dd.VolumeTypes (ID)
;
GO

/* 12. Between dd.VolumeTypes and dd.VolumeTransactions*/

ALTER TABLE dd.Volume
DROP CONSTRAINT fk_Volume_VolumeTran;  
GO 

ALTER TABLE dd.Volume
	add constraint fk_Volume_VolumeTran foreign key (ToVolumeTransactionsID)
	references dd.VolumeTransactions (ID)
;
GO


/* 13. Between dd.StockTransactions and Stock, Volume, Price, HistoryChart,
Catalizer, Cash, KeyLevels */

ALTER TABLE dd.StockTransactions
DROP CONSTRAINT fk_Stocks, fk_Volume, fk_Price, fk_HistoryChart, fk_Catalizer,
fk_Cash, fk_KeyLevels;
GO 


ALTER TABLE dd.StockTransactions
	add constraint fk_Stocks foreign key (ToStockID)
	references dd.Stocks (ID)
;
GO

ALTER TABLE dd.StockTransactions
	add constraint fk_Volume foreign key (ToVolumeID)
	references dd.Volume (ID)
;
GO

ALTER TABLE dd.StockTransactions
	add constraint fk_Price foreign key (ToPriceID)
	references dd.Price (ID)
;
GO

ALTER TABLE dd.StockTransactions
	add constraint fk_HistoryChart foreign key (ToHistoryChartID)
	references dd.HistoryChart (ID)
;
GO

ALTER TABLE dd.StockTransactions
	add constraint fk_Catalizer foreign key (ToCatalizerID)
	references dd.CatalizerTransactions (ID)
;
GO

ALTER TABLE dd.StockTransactions
	add constraint fk_Cash foreign key (ToCashID)
	references dd.Cash (ID)
;
GO

ALTER TABLE dd.StockTransactions
	add constraint fk_KeyLevels foreign key (ToKeyLevelsID)
	references dd.KeyLevels (ID)
;
GO


/* 14. Between ev.Evaluation and ev.Criteria*/

ALTER TABLE ev.Evaluations
DROP CONSTRAINT fk_Eval_Criteria;
GO 

ALTER TABLE ev.Evaluations
	add constraint fk_Eval_Criteria foreign key (ToCriteriaID)
	references ev.Criteria (ID)
;
GO

/* 15. Between ev.Evaluation and ev.Criteria*/

ALTER TABLE ev.Performance
DROP CONSTRAINT fk_Evaluation, fk_Stock;
GO 

ALTER TABLE ev.Performance
	add constraint fk_Evaluation foreign key (ToEvaluationID)
	references ev.Evaluations (ID)
;
GO

ALTER TABLE ev.Performance
	add constraint fk_Stock foreign key (ToStockTransactionID)
	references dd.StockTransactions (ID)
;
GO

/* 16. Roles Relationships*/





