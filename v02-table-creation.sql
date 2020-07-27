
/********************* DUE DILIGENCE TABLES *****/ 
/***** Table Sector *****/ 

IF OBJECT_ID ('dd.Sector') IS NOT NULL  
    DROP TABLE dd.Sector;  
GO


CREATE TABLE dd.Sector
(
    ID uniqueidentifier NOT NULL,
    Sector varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_Sector PRIMARY KEY (ID)
)
;
GO

/***** Table Stocks *****/
IF OBJECT_ID ('dd.Stocks') IS NOT NULL  
    DROP TABLE dd.Stocks;  
GO

CREATE TABLE dd.Stocks
(
    ID uniqueidentifier NOT NULL,
    Ticker varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CompanyName varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Market varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    ToSectorID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_Stocks PRIMARY KEY (ID)
)
;
GO

--ALTER TABLE dd.Stocks ALTER COLUMN Ticker VARCHAR (50);




/***** Catalizer Tables *****/ 

-- Catalizer Type
IF OBJECT_ID ('dd.CatalizerType') IS NOT NULL  
    DROP TABLE dd.CatalizerType;  
GO

CREATE TABLE dd.CatalizerType
(
    ID uniqueidentifier NOT NULL,
    CatalizerTypes varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_CatalizerType PRIMARY KEY (ID)
)
;
GO


-- Catalizer Transaction 
IF OBJECT_ID ('dd.CatalizerTransactions') IS NOT NULL  
    DROP TABLE dd.CatalizerTransactions;  
GO

CREATE TABLE dd.CatalizerTransactions
(
    ID uniqueidentifier NOT NULL,
    CatalizerValue DECIMAL (10,2) NOT NULL,
    ToCatalizerTypeID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_CatalizerTransactions PRIMARY KEY (ID)
)
;
GO

/*****  Cash Tables *****/ 

-- Cash Types
IF OBJECT_ID ('dd.CashTypes') IS NOT NULL  
    DROP TABLE dd.CashTypes;  
GO

CREATE TABLE dd.CashTypes
(
    ID uniqueidentifier NOT NULL,
    CashTypes varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_CashTypes PRIMARY KEY (ID)
)
;
GO

-- Cash Transactions
IF OBJECT_ID ('dd.CashTransactions') IS NOT NULL  
    DROP TABLE dd.CashTransactions;  
GO

CREATE TABLE dd.CashTransactions
(
    ID UNIQUEIDENTIFIER  NOT NULL,
    CashValue DECIMAL (10,2) NOT NULL,
    ToCashTypeID uniqueidentifier NULL,
    ToCashID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_CashTransactions PRIMARY KEY (ID)
)
;
GO


-- Cash 
IF OBJECT_ID ('dd.Cash') IS NOT NULL  
    DROP TABLE dd.Cash;  
GO

CREATE TABLE dd.Cash
(
    ID uniqueidentifier NOT NULL,
    CONSTRAINT PK_Cash PRIMARY KEY (ID)
)
;
GO


/*****  History Tables *****/ 

-- HistoryChart Types
IF OBJECT_ID ('dd.HistoryChartTypes') IS NOT NULL  
    DROP TABLE dd.HistoryChartTypes;  
GO

CREATE TABLE dd.HistoryChartTypes
(
    ID uniqueidentifier NOT NULL,
    HistoryChartTypes varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_HistoryChartTypes PRIMARY KEY (ID)
)
;
GO

-- HistoryChart Transactions
IF OBJECT_ID ('dd.HistoryChartTransactions') IS NOT NULL  
    DROP TABLE dd.HistoryChartTransactions;  
GO

CREATE TABLE dd.HistoryChartTransactions
(
    ID uniqueidentifier NOT NULL,
    HistoryChartTransactionsValue DECIMAL (10,2) NOT NULL,
    ToHistoryChartTypeID uniqueidentifier NULL,
    ToHistoryChartID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_HistoryChartTransactions PRIMARY KEY (ID)
)
;
GO


-- HistoryChart
IF OBJECT_ID ('dd.HistoryChart') IS NOT NULL  
    DROP TABLE dd.HistoryChart;  
GO

CREATE TABLE dd.HistoryChart
(
    ID uniqueidentifier NOT NULL,
    CONSTRAINT PK_HistoryChart PRIMARY KEY (ID)
)
;
GO


/*****  Price Tables *****/ 

-- Price Types
IF OBJECT_ID ('dd.PriceTypes') IS NOT NULL  
    DROP TABLE dd.PriceTypes;  
GO

CREATE TABLE dd.PriceTypes
(
    ID uniqueidentifier NOT NULL,
    PriceTypes varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_PriceTypes PRIMARY KEY (ID)
)
;
GO

-- Price Transactions
IF OBJECT_ID ('dd.PriceTransactions') IS NOT NULL  
    DROP TABLE dd.PriceTransactions;  
GO

CREATE TABLE dd.PriceTransactions
(
    ID uniqueidentifier NOT NULL,
    PriceValue DECIMAL (10,2) NOT NULL,
    ToPriceTypesID uniqueidentifier NULL,
    ToPriceID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_PriceTransactions PRIMARY KEY (ID)
)
;
GO


-- HistoryChart
IF OBJECT_ID ('dd.Price') IS NOT NULL  
    DROP TABLE dd.Price;  
GO

CREATE TABLE dd.Price
(
    ID uniqueidentifier NOT NULL,
    CONSTRAINT PK_Price PRIMARY KEY (ID)
)
;
GO

/*****  Volume Tables *****/ 

-- Volume Types
IF OBJECT_ID ('dd.VolumeTypes') IS NOT NULL  
    DROP TABLE dd.VolumeTypes;  
GO

CREATE TABLE dd.VolumeTypes
(
    ID uniqueidentifier NOT NULL,
    ToVolumeTypes varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_VolumeTypes PRIMARY KEY (ID)
)
;
GO

-- Volume Transactions
IF OBJECT_ID ('dd.VolumeTransactions') IS NOT NULL  
    DROP TABLE dd.VolumeTransactions;  
GO

CREATE TABLE dd.VolumeTransactions
(
    ID uniqueidentifier NOT NULL,
    VolumeValue DECIMAL (10,2) NOT NULL,
    ToVolumeTypesID uniqueidentifier NOT NULL,
    ToVolumeID uniqueidentifier NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_VolumeTransactions PRIMARY KEY (ID)
)
;
GO


-- Volume
IF OBJECT_ID ('dd.Volume') IS NOT NULL  
    DROP TABLE dd.Volume;  
GO

CREATE TABLE dd.Volume
(
    ID uniqueidentifier NOT NULL,
    CONSTRAINT PK_Volume PRIMARY KEY (ID)
)
;
GO


/*****  KeyLevels Tables *****/ 

-- KeyLevels Types
IF OBJECT_ID ('dd.KeyLevelsTypes') IS NOT NULL  
    DROP TABLE dd.KeyLevelsTypes;  
GO

CREATE TABLE dd.KeyLevelsTypes
(
    ID uniqueidentifier NOT NULL,
    KeyLevelsTypes varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_KeyLevelsTypes PRIMARY KEY (ID)
)
;
GO

-- KeyLevels Transactions
IF OBJECT_ID ('dd.KeyLevelsTransactions') IS NOT NULL  
    DROP TABLE dd.KeyLevelsTransactions;  
GO

CREATE TABLE dd.KeyLevelsTransactions
(
    ID uniqueidentifier NOT NULL,
    KeyLevelsTransactionsValue DECIMAL (10,2) NOT NULL,
    ToKeylevelsTypeID uniqueidentifier NULL,
    ToKeylevelsID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_KeyLevelsTransactions PRIMARY KEY (ID)
)
;
GO


-- KeyLevels
IF OBJECT_ID ('dd.KeyLevels') IS NOT NULL  
    DROP TABLE dd.KeyLevels;  
GO

CREATE TABLE dd.KeyLevels
(
    ID uniqueidentifier NOT NULL,
    CONSTRAINT PK_KeyLevels PRIMARY KEY (ID)
)
;
GO


/*****  Stock Transactions (Due Diligence) *****/

-- Stock Transactions (Due Diligence)

IF OBJECT_ID ('dd.StockTransactions') IS NOT NULL  
    DROP TABLE dd.StockTransactions;  
GO


CREATE TABLE dd.StockTransactions
(
    ID uniqueidentifier NOT NULL,
    FloatValue DECIMAL (10,2) NOT NULL,
    DueDiligenceAt datetime NOT NULL,
    ToCatalizerID uniqueidentifier NULL,
    ToCashID uniqueidentifier NULL,
    ToHistoryChartID uniqueidentifier NULL,
    ToPriceID uniqueidentifier NULL,
    ToVolumeID uniqueidentifier NULL,
    ToKeyLevelsID uniqueidentifier NULL,
    ToStockID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_StockTransactions PRIMARY KEY (ID)
)
;
GO


/********************* EVALUATION TABLES *****/ 

/***** Table Criteria *****/ 

IF OBJECT_ID ('ev.Criteria') IS NOT NULL  
    DROP TABLE ev.Criteria;  
GO


CREATE TABLE ev.Criteria
(
    ID uniqueidentifier NOT NULL,
    Criterion varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    MaxPoint integer NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_Criteria PRIMARY KEY (ID)
)
;
GO

/***** Table Evaluations *****/ 

IF OBJECT_ID ('ev.Evaluations') IS NOT NULL  
    DROP TABLE ev.Evaluations;  
GO


CREATE TABLE ev.Evaluations
(
    ID uniqueidentifier NOT NULL,
    Points integer NOT NULL CHECK (Points<=15),
    ToCriteriaID uniqueidentifier NULL,
    ToPerformaceID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_Evaluations PRIMARY KEY (ID)
)
;
GO

/***** Table Performance *****/ 

IF OBJECT_ID ('ev.Performance') IS NOT NULL  
    DROP TABLE ev.Performance;  
GO


CREATE TABLE ev.Performance
(
    ID uniqueidentifier NOT NULL,
    PriceBuy DECIMAL (10,2) NOT NULL,
    PriceSell DECIMAL (10,2) NOT NULL,
    ShortLong bit NOT NULL DEFAULT 0,
    EvaluationAt datetime NOT NULL,
    Conclusion varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    ToStockTransactionID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_Performance PRIMARY KEY (ID)
)
;
GO

ALTER TABLE ev.Performance DROP COLUMN ToEvaluationID;

/********************* ROLES TABLES *****/ 

/***** Table Users *****/

IF OBJECT_ID ('ro.Users') IS NOT NULL  
    DROP TABLE ro.Users;  
GO

CREATE TABLE ro.Users (
	ID uniqueidentifier NOT NULL,
	IsActive bit NOT NULL,
	IsDeleted bit NOT NULL,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	UpdatedAt datetime NOT NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	UserPassword varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Email varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ToRoleID uniqueidentifier NOT NULL,
	ExpiresIn bigint NOT NULL,
	AccessLevel int NOT NULL,
	Username varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PicturePath varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_User PRIMARY KEY (ID),
	CONSTRAINT FK_User_Role FOREIGN KEY (ID) REFERENCES ro.Roles(ID)
)
; 
GO



/***** Table RolePermissions *****/

IF OBJECT_ID ('ro.RolePermissions') IS NOT NULL  
    DROP TABLE ro.RolePermissions;  
GO

CREATE TABLE ro.RolePermissions (
	ID uniqueidentifier NOT NULL,
	IsActive bit NOT NULL,
	IsDeleted bit NOT NULL,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	UpdatedAt datetime NOT NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	RoleID uniqueidentifier NOT NULL,
	PermissionID uniqueidentifier NOT NULL,
	CONSTRAINT PK_RolePermission PRIMARY KEY (ID),
	CONSTRAINT FK_RolePermission_Permission FOREIGN KEY (PermissionID) REFERENCES ro.Permission(ID),
	CONSTRAINT FK_RolePermission_Role FOREIGN KEY (RoleID) REFERENCES ro.Roles(ID)
) 
;
GO

/***** Table Permissions *****/

IF OBJECT_ID ('ro.Permission') IS NOT NULL  
    DROP TABLE ro.Permission;  
GO


CREATE TABLE ro.Permission (
	ID uniqueidentifier NOT NULL,
	SysActionID uniqueidentifier NOT NULL,
	SysEntityID uniqueidentifier NOT NULL,
	CONSTRAINT PK_Permission PRIMARY KEY (ID),
	CONSTRAINT FK_Permission_SysAction FOREIGN KEY (SysActionID) REFERENCES ro.SysAction(ID),
	CONSTRAINT FK_Permission_SysEntity FOREIGN KEY (SysEntityID) REFERENCES ro.SysEntity(ID)
) 
;
GO


/***** Table Roles *****/

IF OBJECT_ID ('ro.Roles') IS NOT NULL  
    DROP TABLE ro.Roles;  
GO


CREATE TABLE ro.Roles (
	ID uniqueidentifier NOT NULL,
	IsActive bit NOT NULL,
	IsDeleted bit NOT NULL,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	UpdatedAt datetime NOT NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Description varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Role PRIMARY KEY (ID)
)
; 
GO





/***** Table SysAction *****/

IF OBJECT_ID ('ro.SysAction') IS NOT NULL  
    DROP TABLE ro.SysAction;  
GO

CREATE TABLE ro.SysAction (
	ID uniqueidentifier NOT NULL,
	ActionName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_SysAction PRIMARY KEY (ID)
) 
;
GO


/***** Table SysEntity *****/

IF OBJECT_ID ('ro.SysEntity') IS NOT NULL  
    DROP TABLE ro.SysEntity;  
GO

CREATE TABLE ro.SysEntity (
	ID uniqueidentifier NOT NULL,
	EntityName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_SysEntity PRIMARY KEY (ID)
) 
;
GO






