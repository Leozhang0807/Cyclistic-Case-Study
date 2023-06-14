

SELECT  COUNT(ride_id) -  COUNT(DISTINCT ride_id) as ride_id
  FROM `2022_23tripdata_combin` 
--Checking there have 13 duplicate rows under ride_id.

SELECT  
  COUNT(DISTINCT ride_id) as null_start_station,     
  FROM `Tripdata.2022_23tripdata_combin` 
  WHERE     
  start_station_name is NULL
--Checking there have 832009 rows null start station name in the table.

SELECT  
  COUNT(DISTINCT ride_id) as null_end_station
  FROM `Tripdata.2022_23tripdata_combin` 
  WHERE end_station_name is NULL
--Checking there have 889661 rows null end station name in the table.

SELECT  
  count(*) as ride_duration 
   FROM 
  `cyclistic-case-study-389200.Tripdata.2022_23tripdata_combin` 
  WHERE 
  EXTRACT(HOUR FROM (ended_at - started_at)) * 3600 +
  EXTRACT(MINUTE FROM (ended_at - started_at))* 60 +
  EXTRACT(SECOND FROM (ended_at - started_at)) < 60
-- Checking there have 140515 trips less than 1 minute
