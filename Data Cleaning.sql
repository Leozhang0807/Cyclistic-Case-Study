DROP TABLE IF EXISTS `Tripdata.2022_2023tripdata_combian_cleaned`;

CREATE TABLE IF NOT EXISTS `Tripdata.2022_2023tripdata_combian_cleaned` AS (

  SELECT T1.ride_id, rideable_type, started_at, ended_at, day_of_week, 
         start_station_name, start_station_id, end_station_name, end_station_id, 
         start_lat, start_lng, member_casual, (
    CASE WHEN day_of_week = 1 THEN 'SUNDAY'
         WHEN day_of_week = 2 THEN 'MONDAY'
         WHEN day_of_week = 3 THEN 'TUESDAY'
         WHEN day_of_week = 4 THEN 'WEDNESDAY'
         WHEN day_of_week = 5 THEN 'THURSDAY'
         WHEN day_of_week = 6 THEN 'FRIDAY'
         WHEN day_of_week = 7 THEN 'SATURDAY'
      END
  ) as weekday                                  -- Notice the day of week in the table through Sunday to Saturday
  FROM `Tripdata.2022_23tripdata_combin` AS T1
  LEFT JOIN(
    SELECT ride_id, (
      EXTRACT(HOUR FROM ended_at - started_at) * 3600 +
      EXTRACT(MINUTE FROM ended_at - started_at) * 60 +
      EXTRACT(SECOND FROM ended_at - started_at)
    ) as ride_duration 
    FROM `Tripdata.2022_23tripdata_combin`
    
  ) AS T2
    ON T1.ride_id = T2.ride_id
    WHERE 
      start_station_name IS NOT NULL
      AND
      end_station_name IS NOT NULL
      AND
      ride_duration > 60
      AND
      end_lat IS NOT NULL
      AND
      start_lat IS NOT NULL
)  
-- Data cleaning remove all null value in the table and rental duration less than 1 minute. 

select count(*) from `Tripdata.2022_23tripdata_combin`
-- 4,443,766 rows after data cleaning
