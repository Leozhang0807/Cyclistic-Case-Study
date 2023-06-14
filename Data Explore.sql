

SELECT  COUNT(ride_id) -  COUNT(DISTINCT ride_id) as ride_id FROM `cyclistic-case-study-389200.Tripdata.2022_23tripdata_combin` 
--Checking there have 13 duplicate rows under ride_id
