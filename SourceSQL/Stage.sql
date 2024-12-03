CREATE DATABASE Stage_AIR
GO

USE Stage_AIR
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
GO
USE MASTER
DROP Stage_AIR
GO

-- DROP TABLE
GO
USE MASTER
DROP TABLE [Counties_STAGE]
DROP TABLE [Air_Quality_STAGE]
*/ 

CREATE TABLE [dbo].[Counties_STAGE](
	[county] [nvarchar](50),
	[county_ascii] [nvarchar](50),
	[county_full] [nvarchar](50),
	[county_fips] [int],
	[state_id] [nvarchar](50),
	[state_name] [nvarchar](50),
	[lat] [float],
	[lng] [float],
	[population] [int],
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Air_Quality_STAGE](
	[State_Name] [nvarchar](50),
	[county_Name] [nvarchar](50),
	[State_Code] [int],
	[County_Code] [int],
	[Date] [date],
	[AQI] [int],
	[Category] [nvarchar](50),
	[Defining_Parameter] [nvarchar](50),
	[Defining_Site] [nvarchar](50),
	[Number_of_Sites_Reporting] [int],
	[Created] [datetime],
	[Last_Updated] [datetime],
	[SourceID] [int] NULL,
) ON [PRIMARY]
GO
TRUNCATE TABLE Counties_STAGE
TRUNCATE TABLE Air_Quality_STAGE

SELECT * FROM [Counties_STAGE]

SELECT * FROM [Air_Quality_STAGE]
WHERE Date =  '2021-01-01' and SourceID = 1 and [county_Name] = 'Clark'

SELECT DISTINCT State_Name, State_Code
FROM Air_Quality_STAGE