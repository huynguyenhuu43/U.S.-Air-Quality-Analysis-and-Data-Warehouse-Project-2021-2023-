USE [BI2425]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2Buscounties_STAGE](
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
CREATE TABLE [dbo].[aqi_state_STAGE](
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
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aqi_state_STAGE](
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
) ON [PRIMARY]
GO