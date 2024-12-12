select * from dbo.DIM_Counties
select * from dbo.DIM_States
select * from dbo.DIM_Date
select * from dbo.DIM_Parameter
select * from dbo.FACT_AirQuality

ALTER TABLE [DDS_AIR_5].[dbo].[DIM_Date]
ADD DayLightSaving bit;

-- Cập nhật giá trị cho DayLightSaving
UPDATE [DDS_AIR_5].[dbo].[DIM_Date]
SET DayLightSaving = 
    CASE 
        WHEN (Year = 2023 AND Month = 3 AND Day >= 12) OR
             (Year = 2023 AND Month > 3 AND Month < 11) OR
             (Year = 2023 AND Month = 11 AND Day <= 5)
        THEN 1  -- True
        ELSE 0  -- False
    END;