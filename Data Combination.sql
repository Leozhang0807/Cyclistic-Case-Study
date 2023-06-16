--Data Combination Process

-- Combining all 12 months through 2022/05-2023/04 in one table named 2022_23tripdata_combin

DROP TABLE IF EXISTS `cyclistic-case-study-389200.Tripdata.2022_23tripdata_combin`;

CREATE TABLE IF NOT EXISTS `cyclistic-case-study-389200.Tripdata.2022_23tripdata_combin` AS (
  SELECT * FROM `Tripdata.202205`
  UNION ALL
  SELECT * FROM `Tripdata.202206`
  UNION ALL
  SELECT * FROM `Tripdata.202207`
  UNION ALL
  SELECT * FROM `Tripdata.202208`
  UNION ALL
  SELECT * FROM `Tripdata.202209`
  UNION ALL
  SELECT * FROM `Tripdata.202210`
  UNION ALL
  SELECT * FROM `Tripdata.202211`
  UNION ALL
  SELECT * FROM `Tripdata.202212`
  UNION ALL
  SELECT * FROM `Tripdata.202301`
  UNION ALL
  SELECT * FROM `Tripdata.202302`
  UNION ALL
  SELECT * FROM `Tripdata.202303`
  UNION ALL
  SELECT * FROM `Tripdata.202304`
  
);



