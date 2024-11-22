USE [BI2425]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2Buscounties_STAGE](
	[county] [nvarchar](50) NOT NULL,
	[county_ascii] [nvarchar](50) NOT NULL,
	[county_full] [nvarchar](50) NOT NULL,
	[county_fips] [int] NOT NULL,
	[state_id] [nvarchar](50) NOT NULL,
	[state_name] [nvarchar](50) NOT NULL,
	[lat] [float] NOT NULL,
	[lng] [float] NOT NULL,
	[population] [int] NOT NULL,
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aqi_2021_STAGE](
	[State_Name] [nvarchar](50) NOT NULL,
	[county_Name] [nvarchar](50) NOT NULL,
	[State_Code] [int] NOT NULL,
	[County_Code] [int] NOT NULL,
	[Date] [date] NULL,
	[AQI] [int] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Defining_Parameter] [nvarchar](50) NOT NULL,
	[Defining_Site] [nvarchar](50) NOT NULL,
	[Number_of_Sites_Reporting] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Last_Updated] [datetime] NOT NULL,
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aqi_2022_STAGE](
	[State_Name] [nvarchar](50) NOT NULL,
	[county_Name] [nvarchar](50) NOT NULL,
	[State_Code] [int] NOT NULL,
	[County_Code] [int] NOT NULL,
	[Date] [date] NULL,
	[AQI] [int] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Defining_Parameter] [nvarchar](50) NOT NULL,
	[Defining_Site] [nvarchar](50) NOT NULL,
	[Number_of_Sites_Reporting] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Last_Updated] [datetime] NOT NULL,
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aqi_2023_STAGE](
	[State_Name] [nvarchar](50) NOT NULL,
	[county_Name] [nvarchar](50) NOT NULL,
	[State_Code] [int] NOT NULL,
	[County_Code] [int] NOT NULL,
	[Date] [date] NULL,
	[AQI] [int] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Defining_Parameter] [nvarchar](50) NOT NULL,
	[Defining_Site] [nvarchar](50) NOT NULL,
	[Number_of_Sites_Reporting] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Last_Updated] [datetime] NOT NULL,
) ON [PRIMARY]
GO

