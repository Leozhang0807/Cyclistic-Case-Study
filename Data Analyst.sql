---Total trip by different member type and rides type

SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM 
  `Tripdata.2022_2023tripdata_combine_cleaned`
GROUP BY 
  member_casual, rideable_type
ORDER BY 
  member_casual, total_trips ASC


