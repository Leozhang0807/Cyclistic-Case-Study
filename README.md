# Cyclistic-Case-Study

Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

## Introduction
In this case study I am working for a fictional company called Cyclistic by performing as a real-world junior data analyst. in order to solve critical business questions. Follow the analysis process: [Ask](#ask), 
[Prepare](#prepare), [Process](#process), Analyze, Share, and Act.	


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
I used Big Quary to process data. Before I upload the data in Big Quary since the datasets are so large, I created a bucket in Google Cloud Storage to upload all 12 months' datasets after I transfer data from the 
Google Cloud Storage to Big Quary I deleted all the files in  Google Cloud Storage to save the budget.

### Data Combination
I combine 12 months of datasets into one data named 2022_2023tripdata_combin.\
SQL Code: [Data Combination Code](https://github.com/Leozhang0807/Cyclistic-Case-Study/blob/main/Data%20Combination.sql)

### Data Exploration
Before I clean data I take a peep dataset after I combine it.

Observations
  1. Below table shows all column name and their data types in the dataset.

     ![data_type](https://github.com/Leozhang0807/Cyclistic-Case-Study/assets/35789579/9c6b844c-8db6-4207-9233-6a147f17828c)

  2. After checking each column, there have six columns containing the null value which are start_station_name, start_station_id,
     end_station_name, end_station_id, end_lat, and end_lng.

  















