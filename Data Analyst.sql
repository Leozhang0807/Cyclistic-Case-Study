
----------------------------
-- Start and End location --
---------------------------
  
I.--- Start station location by different member type
 
SELECT start_station_name, member_casual, 
  AVG(start_lat) as start_latitude, 
  AVG(start_lng) as start_longitude,
  COUNT(*) as total_rides
FROM `Tripdata.2022_2023tripdata_combine_cleaned`

GROUP BY start_station_name, member_casual

II.--- End station location by different member type
  
SELECT end_station_name, member_casual, 
  AVG(end_lat) as end_latitude, 
  AVG(end_lng) as end_longitude,
  COUNT(*) as total_rides
FROM `Tripdata.2022_2023tripdata_combine_cleaned`

GROUP BY end_station_name, member_casual

------------------------------------
-- Total trips by different types --
------------------------------------

III.---Total trip by different member type and rides type

SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM 
  `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
  member_casual, rideable_type
ORDER BY 
  member_casual, total_trips ASC
  
  
IV.---Number of the ride per month by different member type and ride type
  
SELECT CASE 
  EXTRACT(month FROM started_at) 
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
      END as month, member_casual, rideable_type, COUNT(*) AS total_trips
FROM `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
  month, member_casual, rideable_type
ORDER BY 
  member_casual, month;

V.---Number of the ride per day by different member type and ride type

SELECT weekday , member_casual, rideable_type, COUNT(*) AS total_trips
FROM `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
  weekday, member_casual, rideable_type
ORDER BY 
  weekday, member_casual;


VI---Number of the ride per hour by different member type and ride type

SELECT EXTRACT(hour FROM started_at) as hour_of_day, member_casual, rideable_type, COUNT(*) AS total_trips
FROM `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
  hour_of_day, member_casual, rideable_type
ORDER BY 
  member_casual, hour_of_day;

--------------------------------------
-- Average trips by different types --
--------------------------------------

VII--- Average ride duration by different member types

SELECT member_casual, AVG(ride_duration) as avg_per_hour
FROM `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
    member_casual
ORDER BY 
    member_casual;


VIII-- Average ride duration per month by different member types

SELECT CASE
    EXTRACT(month FROM started_at) 
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
      END as month, member_casual, AVG(ride_duration) as avg_per_month
FROM `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
   month, member_casual
ORDER BY 
   month, member_casual;

IX--- Average ride duration per day by different member types

SELECT weekday, member_casual, AVG(ride_duration) as avg_per_day
FROM `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
   weekday, member_casual
ORDER BY 
   weekday, member_casual;

X--- Average ride duration per hour by different member types

SELECT EXTRACT(HOUR FROM started_at ) as hour, 
  member_casual, AVG(ride_duration) as avg_per_hour
FROM `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
   hour, member_casual
ORDER BY 
   hour, member_casual;




