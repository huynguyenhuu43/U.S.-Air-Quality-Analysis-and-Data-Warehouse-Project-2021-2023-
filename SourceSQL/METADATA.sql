﻿CREATE DATABASE METADATA
GO

USE METADATA
GO 

/*
GO
USE MASTER
DROP DATABASE METADATA
GO

-- DROP TABLE
DROP TABLE Data_Flow
*/

CREATE TABLE Data_Flow(
	ID INT NOT NULL IDENTITY(1,1),
	TableName VARCHAR(20) NOT NULL,
	LSET DATETIME,
	CET DATETIME,
	CONSTRAINT PK_Data_Flow PRIMARY KEY CLUSTERED (ID)
)
go

SELECT * FROM Data_Flow
/*CREATE TRIGGER insert_dataflow on DATA_FLOW AFTER INSERT AS
BEGIN
	UPDATE DATA_FLOW
	SET LSET = GETDATE(), CET = GETDATE()
	WHERE ID IN (SELECT DISTINCT ID FROM INSERTED)
END
go*/

-- stage
INSERT Data_Flow (TableName, LSET, CET) VALUES ('Counties', GETDATE(), GETDATE())
INSERT Data_Flow (TableName, LSET, CET) VALUES ('Air_Quality', GETDATE(), GETDATE())
INSERT Data_Flow (TableName, LSET, CET) VALUES ('DIM_Parameter', GETDATE(), GETDATE())
INSERT Data_Flow (TableName, LSET, CET) VALUES ('DIM_States', GETDATE(), GETDATE())
INSERT Data_Flow (TableName, LSET, CET) VALUES ('DIM_Counties', GETDATE(), GETDATE())
INSERT Data_Flow (TableName, LSET, CET) VALUES ('DIM_Date', GETDATE(), GETDATE())
INSERT Data_Flow (TableName, LSET, CET) VALUES ('FACT_AirQuality', GETDATE(), GETDATE())


DELETE FROM Data_Flow
WHERE TableName = 'Dim_Counties'

UPDATE Data_Flow
SET LSET = DATEADD(DAY, -1, GETDATE()), 
    CET = DATEADD(DAY, -1, GETDATE())
WHERE TableName IN ('Counties', 'Air_Quality', 'DIM_Parameter', 'DIM_States', 'DIM_Counties', 'DIM_Date', 'FACT_AirQuality');

UPDATE Data_Flow
SET 
    LSET = DATEADD(YEAR, -4, LSET),  -- Giảm 4 năm để đưa về 2020
    CET = DATEADD(YEAR, -4, CET)   -- Giảm 4 năm để đưa về 2020
WHERE TableName IN ('Counties', 'Air_Quality', 'DIM_Parameter', 'DIM_States', 'DIM_Counties', 'DIM_Date', 'FACT_AirQuality');


SELECT * FROM Data_Flow
go