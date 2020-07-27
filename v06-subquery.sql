/***** Table to store all the evaluations < 9 *****/ 

IF OBJECT_ID ('ev.EvaluationsToBeReviewed') IS NOT NULL  
    DROP TABLE ev.EvaluationsToBeReviewed;  
GO


CREATE TABLE ev.EvaluationsToBeReviewed
(
    ID uniqueidentifier NOT NULL,
    Points integer NOT NULL,
    ToCriteriaID uniqueidentifier NULL,
    ToPerformaceID uniqueidentifier NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	CreatedAt datetime NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_EvaluationsToBeReviewed PRIMARY KEY (ID)
)
;
GO

-- Subquery to store in a Table Evaluation < 9 points
INSERT INTO ev.EvaluationsToBeReviewed
SELECT * FROM  ev.Evaluations WHERE Points < 9;
GO

-- Checking the Table
SELECT * FROM ev.EvaluationsToBeReviewed;
GO


-- Subquery to change Values < 9 to Points -1
UPDATE ev.EvaluationsToBeReviewed
SET Points=Points-1
WHERE Points IN(
SELECT Points FROM ev.EvaluationsToBeReviewed
);

-- Checking the Table
SELECT * FROM ev.EvaluationsToBeReviewed;
GO
