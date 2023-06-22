---Total trip by different member type and rides type

SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM 
  `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
  member_casual, rideable_type
ORDER BY 
  member_casual, total_trips ASC

---Number of the ride per month by different member type and ride type
  
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

---Number of the ride per hour by different member type and ride type

SELECT EXTRACT(hour FROM started_at) as hour_of_day, member_casual, rideable_type, COUNT(*) AS total_trips
FROM `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
  hour_of_day, member_casual, rideable_type
ORDER BY 
  member_casual, hour_of_day;




