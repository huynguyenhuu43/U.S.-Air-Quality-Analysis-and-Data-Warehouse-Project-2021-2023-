--create database NDS_AIR
--use NDS_AIR

CREATE TABLE NDS_States (
    StateSK INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key với IDENTITY
    StateCode VARCHAR(10) UNIQUE NOT NULL, -- Natural Key
    StateName VARCHAR(255) NOT NULL
);

CREATE TABLE NDS_Counties (
    CountySK INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key với IDENTITY
    CountyCode VARCHAR(10) UNIQUE NOT NULL, -- Natural Key
    CountyName VARCHAR(255) NOT NULL,
    StateSK INT NOT NULL,                   -- Liên kết với States
    FOREIGN KEY (StateSK) REFERENCES States(StateSK)
);


CREATE TABLE NDS_AirData (
    ReadingSK INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key với IDENTITY
    CountySK INT NOT NULL,                   -- Liên kết với Counties
    Date DATE NOT NULL,                      -- Natural Key
    AQI INT NOT NULL,
    Category VARCHAR(255) NOT NULL,
    DefiningParameter VARCHAR(255),
    DefiningSite VARCHAR(255),
    NumberOfSitesReporting INT,
    Created DATETIME DEFAULT GETDATE(),      -- Mặc định là thời gian hiện tại
    LastUpdated DATETIME DEFAULT GETDATE(),  -- Cập nhật khi chỉnh sửa
    FOREIGN KEY (CountySK) REFERENCES Counties(CountySK),
    UNIQUE (CountySK, Date) -- Khóa tự nhiên để tránh trùng lặp
);



CREATE TABLE TempAirQuality (
    StateName NVARCHAR(255),
    CountyName NVARCHAR(255),
    StateCode NVARCHAR(10),
    CountyCode NVARCHAR(10),
    Date DATE,
    AQI INT,
    Category NVARCHAR(255),
    DefiningParameter NVARCHAR(255),
    DefiningSite NVARCHAR(255),
    NumberOfSitesReporting INT,
    Created DATETIME,
    LastUpdated DATETIME
);

