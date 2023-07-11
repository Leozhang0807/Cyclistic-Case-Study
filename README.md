# Cyclistic-Case-Study

Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

## Introduction
In this case study I am working for a fictional company called Cyclistic by performing as a real-world junior data analyst. in order to solve critical business questions. Follow the analysis process: [Ask](#ask), 
[Prepare](#prepare-data), [Process](#process-data), [Analyze](#data-analyze-and-share), [Share](#data-analyze-and-share), and Act.	


## About Company

### Cyclistic

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that
are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and
returned to any other station in the system at any time.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments.
One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes,
and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers
who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the
pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will
be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a
very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic
program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to
do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why
casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are
interested in analyzing the Cyclistic historical bike trip data to identify trends.

### Scenario
I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director
of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore,
your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,
your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives
must approve your recommendations, so they must be backed up with compelling data insights and professional data.
visualizations.

## Ask
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

### My task
I have been assigned the first question to answer which is "How do annual members and casual riders use Cyclistic bikes differently?" by Lily Moreno The director of marketing and my manager. 

## Prepare Data
I downloaded 12 months of Cyclistic trip data from May 2022 to April 2023 from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) The datasets have a different name because Cyclistic is a fictional company. For the purposes of this case study, the datasets are appropriate and will enable you to answer the business questions. The data has been made available by
Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement).)

Each file contains one month of Bike rental information such as ride id, bike type, start rental time, end rental time, start rental station name and location, end rental station name and location, and the customer membership type on each rental.

## Process Data
Before I process the data in SQL. In Excel, I create a column called day_of_week to calculate the day of the week that each ride started using the WEEKDAY command (example: =WEEKDAY(C2,1)). Formatted as a NUMBER without decimal. And 1-7 represents Sunday to Saturday.

I used Big Quary to process data. Before I upload the data in Big Quary since the datasets are so large, I created a bucket in Google Cloud Storage to upload all 12 months' datasets after I transfer data from the 
Google Cloud Storage to Big Quary I deleted all the files in  Google Cloud Storage to save the budget.

### Data Combination
I combine 12 months of datasets into one data named 2022_2023tripdata_combin.\
SQL Code: [Data Combination Code](https://github.com/Leozhang0807/Cyclistic-Case-Study/blob/main/Data%20Combination.sql)

### Data Exploration
Before cleaning the  data I take an investigation on the dataset after I combine it.

Observations
  1. Below table shows all column name and their data types in the dataset.

     ![data_type](https://user-images.githubusercontent.com/35789579/252071793-f87ec101-89b0-4b06-a860-b43624dc9ba5.PNG)

  2. After checking each column, there have seven columns containing the null value which are ride_id, start_station_name, start_station_id,
     end_station_name, end_station_id, end_lat, and end_lng.

  3. There have 13 duplicate rows under ride_id.

     ![duplicate_ride_id](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/102e02db-0fdb-4849-b315-7367629cbe7f)

  4. There have 140515 rental trips less than 1 minute. Those rows need to remove when cleaning the data.

     ![less_minute](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/09142b0a-3d06-4371-ada4-5adb65edc9e3)

     
### Data Cleaning
After investigation, It's time to do the data cleaning.
SQL Code: [Data Cleaning Code](https://github.com/Leozhang0807/Cyclistic-Case-Study/blob/main/Data%20Cleaning.sql)

  1. Create a column named weekday used to convert the day of the week from Number to String.

  2. Removed all the null data rows in the dataset.

  3. Only keep the trip duration that more than one minute.

After data cleaning there have 4,443,766 rows left and there have 1,415,295 been removed.

## Data Analyze and Share
SQL Code: [Data Analyst Code](https://github.com/Leozhang0807/Cyclistic-Case-Study/blob/main/Data%20Analyst.sql)\
Data Visualization Tool: [Tableau](https://public.tableau.com/app/profile/linus.zhang/viz/CyclisticDataAnalyst_16883473163880/end_station#1)


First of all, based on the Bike Type Proportion Pie Chart shows that Over 58% of customers choose classic bikes instead of electric bikes
only 4.04% of casual riders choose docked bikes and there are over 60% of customers have a membership.

![Bike_type_Proportion](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/3bf03ab8-36fd-427c-a979-8e34a7fb8aef)


Next, analyze the relationship between the number of trips by time(month, day, hour).

![Trip_per_month](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/52a3ec4c-8d80-4392-b692-cac9239a489a)

   Month: The amount of rental by casual riders and members is comparable between May and September, as May through September is the most comfortable time to ride in Chicago, and bike rentals increase rapidly to peak during this time. Beginning in October, bike usage began to decline, especially for casual users, who account for nearly only 20% of total usage. From October to April, there is a significant gap between member usage and casual usage. Due to the weather, only a few members will stick to biking during the winter.

![Trip_per_day](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/b0942c11-a8f8-4e40-9df2-7e40eacfb0dd)

  Day: From Monday through Thursday, member usage dominates the day with more than 60% of total trips. Starting on Fridays it drops below 60%, and on weekends, member rider and casual rider usage are comparable. On Saturdays in particular, the total number of rentals by the casual rider exceeds the total number of rentals by members. In comparison, member riders are more likely to rent bikes for commuting during the week, but most casual riders choose to rent bikes on weekends.

![Trip_per_hour](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/61d9784b-ca7f-4ad4-b2d1-2fbaefdf692e)

  Hour: From the graph, it is clear that the peak hours for member riders are between 6 am and 8 am and 4 pm and 6 pm daily, mainly during commuting hours. However, the bicycle usage of casual riders steadily increases from 8 am and gradually decreases from 5 pm which is consistent with the average person's travel pattern.

From our previous observations, we can conclude that members use the bikes more during commuting hours, while casual riders choose to ride more during mild seasons and on weekends.


Next, we have a look at the differences between the two groups of users in terms of average rental duration by month, day, and hour.
![average_trip](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/da6f93fa-1a93-4ccd-8ae6-f53cc8b6580a)

From the three graphs, we can clearly see that the total rental time of casual riders is higher than that of member riders. Especially from April to September every year and on weekends. Conversely, the average rental time for members is regionally stable.


From the foregoing, it may be concluded that the average rental time of the casual riders will be much higher than that of the member riders, and the rental time at some given time will be more than twice that of the member user, especially in mild weather and on weekends, when more casual riders choose to take a bike to travel and tour. However, the number of rentals made by member riders is higher than the number of rentals made by casual riders, and they will rent bikes more often for commuting.


Next, we compare the difference in the distribution of member and casual riders starting and ending station.

![start_station](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/042a44b9-02b4-42cb-86c4-b60e2dba3c94)

Members' starting points are more evenly distributed than those of regular users, with a higher concentration near downtown office buildings and transportation hubs. Casual riders' origins are concentrated near beaches, parks, and museums.

![end_station](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/e75e8dc5-c0cc-432d-9281-b3c17611829f)

It's more obvious when you look at the destination map. Most of the destinations for member riders are near office buildings, schools, while most of the places where casual riders return their bikes are near beaches, parks. This also supports our earlier assumption that members are more likely to use bikes for commuting - this segment includes office workers and students. Casual riders, prefer to rent bikes for pleasure, so they are more concentrated around attractions.


### Summary:
##### Member: 
##### 1. Member riders typically rent bikes for their daily commute, with peak use from 6:00 a.m. to 9:00 p.m. They rent twice as many bikes as casual riders, but for shorter periods of time.
##### 2. They rent more often than daily riders, but for shorter periods of time than daily riders.
##### 3. They are mainly students and commuters, located in the city center near office buildings and schools.
##### 4. They are affected by the seasons, with the peak period from May to September.

##### Casual:
##### 1. The primary rental time for daily riders is on weekends.
##### 2. Their rental time is much longer than that of members.
##### 3. Daily riders' primary purpose is recreation, so they are more likely to congregate at beaches, attractions, parks and museums.
##### 4. Their peak usage period is May through September.





  















