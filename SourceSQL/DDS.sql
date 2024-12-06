create database [DDS_AIR]
go
USE [DDS_AIR]
GO

/*-- DROP TABLE
GO
USE MASTER
DROP TABLE [dbo].[DIM_States]
DROP TABLE [dbo].[DIM_Counties]
DROP TABLE [dbo].[FACT_AirQuality]
DROP TABLE DIM_Parameter
DROP TABLE [dbo].[DIM_Date]
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_States](
	[StateSK] [int] NOT NULL,
	[StateCode] [int] NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[Created] [DATETIME] NULL,
	[LastUpdated] [DATETIME] NULL,
	[Status] [bit] null,
 CONSTRAINT [PK_DIM_States] PRIMARY KEY CLUSTERED 
(
	[StateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Counties](
	[CountySK] [int] NOT NULL,
	[CountyName] [NVARCHAR](50) NULL,
	[CountyASCII] [NVARCHAR](50) NULL,
	[CountyFull] [NVARCHAR](50) NULL,
	[CountyFips] [int] NULL,
	[Population] [int] NULL,
	[Created] [DATETIME] NULL,
	[LastUpdated] [DATETIME] NULL,
	[StateSK] [int] NOT NULL,
	[Status] [bit] null,
 CONSTRAINT [PK_DIM_Counties] PRIMARY KEY CLUSTERED 
(
	[CountySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DIM_Counties] WITH CHECK ADD  CONSTRAINT [FK_DIM_Counties_DIM_States] FOREIGN KEY([StateSK])
REFERENCES [dbo].[DIM_States] ([StateSK])

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Date](
	[DateSK] [int] IDENTITY(1,1),
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Quarter] [int] NULL,
	[Year] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_DIM_NGAYTHANG] PRIMARY KEY CLUSTERED 
(
	[DateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].DIM_Parameter (
	[ParameterSK] [int] IDENTITY(1,1),
	[DefiningParameter] [NVARCHAR](50),
    [Created] [DATETIME] NULL,
    [LastUpdated] [DATETIME] NULL,
 CONSTRAINT [PK_DIM_Parameter] PRIMARY KEY CLUSTERED 
(
    [ParameterSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_AirQuality](
	[AirDataSK] [int] NOT NULL,
	[DateSK] [int] NOT NULL,
	[StateSK] [int] NOT NULL,
	[CountySK] [int] NOT NULL,
	[ParameterSK] [int] NOT NULL,
	[AQI] [int] NULL,
	[Category] [NVARCHAR](50) NULL,
	[DefiningSite] [NVARCHAR](50) NULL,
	[NumberOfSitesReporting] [int] NULL,
	[Created] [DATETIME] NULL,
	[LastUpdated] [DATETIME] NULL,
 CONSTRAINT [PK_FACT_AirQuality] PRIMARY KEY CLUSTERED 
(
	[AirDataSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FACT_AirQuality]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AirQuality_DIM_Date] FOREIGN KEY([DateSK])
REFERENCES [dbo].[DIM_Date] ([DateSK])
GO

ALTER TABLE [dbo].[FACT_AirQuality]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AirQuality_DIM_States] FOREIGN KEY([StateSK])
REFERENCES [dbo].[DIM_States] ([StateSK])
GO

ALTER TABLE [dbo].[FACT_AirQuality]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AirQuality_DIM_Counties] FOREIGN KEY([CountySK])
REFERENCES [dbo].[DIM_Counties] ([CountySK])
GO

ALTER TABLE [dbo].[FACT_AirQuality]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AirQuality_DIM_Parameter] FOREIGN KEY([ParameterSK])
REFERENCES [dbo].[DIM_Parameter] ([ParameterSK]);
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE add_date_to_DIM_Date
AS
BEGIN
    DECLARE @req_start_date DATETIME,
            @req_end_date DATETIME;

    -- Lấy ngày bắt đầu và ngày kết thúc từ bảng NDS_AirData
    SELECT @req_start_date = MIN(Date), @req_end_date = MAX(Date)
    FROM [NDS_AIR].[dbo].[NDS_AirData];

    ;WITH DateSequence AS 
    (
        SELECT @req_start_date AS DateValue
        UNION ALL
        SELECT DATEADD(DAY, 1, DateValue)
        FROM DateSequence
        WHERE DateValue < @req_end_date
    )
    INSERT INTO [dbo].[DIM_Date] ([Day], [Month], [Quarter], [Year], [Date])
    SELECT DATEPART(DAY, DateValue), 
           DATEPART(MONTH, DateValue), 
           DATEPART(QUARTER, DateValue), 
           DATEPART(YEAR, DateValue), 
           CAST(DateValue AS DATE)
    FROM DateSequence
    OPTION (MAXRECURSION 0);
END
GO

EXEC add_date_to_DIM_Date
GO 

SELECT * FROM [dbo].[DIM_States]
SELECT * FROM [dbo].[DIM_Counties]
SELECT * FROM [dbo].[DIM_Parameter]
SELECT * FROM [DIM_Date]
SELECT * FROM FACT_AirQuality
GO

SELECT * 
FROM [NDS_AIR].[dbo].[NDS_AirData]
ORDER BY Date
GO

SELECT MIN(Date), MAX(Date)
FROM [NDS_AIR].[dbo].[NDS_AirData];


DELETE FROM [dbo].[DIM_Date]
WHERE [Year] BETWEEN 1906 AND 2020;

