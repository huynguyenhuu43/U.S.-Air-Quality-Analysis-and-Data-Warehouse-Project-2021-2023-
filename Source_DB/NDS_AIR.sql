--create database NDS_AIR
--use NDS_AIR

CREATE TABLE States (
    StateSK INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key
    StateCode VARCHAR(10) UNIQUE NOT NULL, -- State ID (Natural Key)
    StateName NVARCHAR(255) NOT NULL       -- Tên của bang
);


CREATE TABLE Counties (
    CountySK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    CountyCode VARCHAR(10) UNIQUE NOT NULL, -- County FIPS (Natural Key)
    CountyName NVARCHAR(255) NOT NULL,      -- Tên quận
    CountyASCII NVARCHAR(255),              -- Tên quận ASCII 
    CountyFull NVARCHAR(255),               -- Tên đầy đủ của quận
    Latitude FLOAT,                         -- Vĩ độ
    Longitude FLOAT,                        -- Kinh độ
    Population INT,                         -- Dân số
    StateSK INT NOT NULL,                   -- FK tới bảng States
    FOREIGN KEY (StateSK) REFERENCES States(StateSK)
);

CREATE TABLE NDS_AirData (
    ReadingSK INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key
    CountySK INT NOT NULL,                   -- FK tới bảng Counties
    Date DATE NOT NULL,                      -- Ngày đo
    AQI INT NOT NULL,                        -- Chỉ số chất lượng không khí
    Category NVARCHAR(255) NOT NULL,         -- Phân loại chất lượng không khí
    DefiningParameter NVARCHAR(255),         -- Tham số xác định
    DefiningSite NVARCHAR(255),              -- Mã địa điểm
    NumberOfSitesReporting INT,              -- Số địa điểm báo cáo
    Created DATETIME DEFAULT GETDATE(),      -- Thời gian tạo
    LastUpdated DATETIME DEFAULT GETDATE(),  -- Thời gian cập nhật
    FOREIGN KEY (CountySK) REFERENCES Counties(CountySK),
    UNIQUE (CountySK, Date) -- Khóa tự nhiên để tránh trùng lặp
);

