
DROP TABLE IF EXISTS `Tripdata.2022_23tripdata_combin_cleaned`;

CREATE TABLE IF NOT EXISTS `Tripdata.2022_23tripdata_combin_cleaned` AS (
  SELECT T1.ride_id, rideable_type, started_at, ended_at, 
  start_station_name, end_station_name, start_lat, start_lng, 
   end_lat, end_lng, member_casual
  (CASE WHEN day_of_week = 1 THEN 'SUNDAY'
      WHEN day_of_week = 2 THEN 'MON'
      WHEN day_of_week = 3 THEN 'TUES'
      WHEN day_of_week = 4 THEN 'WED'
      WHEN day_of_week = 5 THEN 'THURS'
      WHEN day_of_week = 6 THEN 'FRI'
      WHEN day_of_week = 7 THEN 'SAT' 
END )AS weekday
  FROM `Tripdata.2022_23tripdata_combin` AS T1
  JOIN (
    SELECT ride_id, 
  (EXTRACT(HOUR FROM (ended_at - started_at)) * 3600 +
  EXTRACT(MINUTE FROM (ended_at - started_at))* 60 +
  EXTRACT(SECOND FROM (ended_at - started_at)))
  as ride_duration 
  FROM `Tripdata.2022_23tripdata_combin` 
  ) AS T2 ON T1.ride_id = T2.ride_id

  WHERE 
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_duration > 60

)
