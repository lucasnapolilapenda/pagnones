/* Scheme Creation: Due Diligence (dd), Evaluation (ev), Roles (ro)*/

-- DueDiligence Schema
IF OBJECT_ID ('dd') IS NOT NULL  
    DROP SCHEMA dd;  
GO 

CREATE SCHEMA dd authorization dbo
;
go
-- Evaluation Schema
IF OBJECT_ID ('ev') IS NOT NULL  
    DROP SCHEMA ev;  
GO 

CREATE SCHEMA ev authorization dbo
;
GO

-- Roles Schema
IF OBJECT_ID ('ro') IS NOT NULL  
    DROP SCHEMA ro;  
GO

CREATE SCHEMA ro authorization dbo
;
GO