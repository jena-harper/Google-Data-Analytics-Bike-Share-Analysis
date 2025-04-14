-- TOP 20 START AND END STATIONS BY RIDER TYPE --

WITH ranked_start AS (
  SELECT
    start_station_name AS station_name,
    start_lat AS lat,
    start_lng AS lon,
    COUNT(*) AS total_rides,
    'Start' AS station_type,
    member_casual,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(*) DESC) AS rank
  FROM `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
  GROUP BY station_name, lat, lon, member_casual
),

ranked_end AS (
  SELECT
    end_station_name AS station_name,
    end_lat AS lat,
    end_lng AS lon,
    COUNT(*) AS total_rides,
    'End' AS station_type,
    member_casual,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(*) DESC) AS rank
  FROM `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
  GROUP BY station_name, lat, lon, member_casual
)

-- Combine Top 20 Start and End Stations per Rider Type
SELECT * FROM ranked_start WHERE rank <= 20
UNION ALL
SELECT * FROM ranked_end WHERE rank <= 20;

-- OVERLAPPING STATIONS --

-- Top 20 Start Stations by Member --
WITH top_member AS (
  SELECT
    start_station_name,
    COUNT(*) AS total_rides
  FROM
    `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
  WHERE
    member_casual = 'member'
    AND start_station_name IS NOT NULL
  GROUP BY
    start_station_name
  ORDER BY
    total_rides DESC
  LIMIT 20
),

 -- Top 20 Start Stations by Casual --
top_casual AS (
  SELECT
    start_station_name,
    COUNT(*) AS total_rides
  FROM
    `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
  WHERE
    member_casual = 'casual'
    AND start_station_name IS NOT NULL
  GROUP BY
    start_station_name
  ORDER BY
    total_rides DESC
  LIMIT 20
)

-- Find overlapping stations
SELECT
  m.start_station_name AS overlapping_station
FROM
  top_member m
JOIN
  top_casual c
ON
  m.start_station_name = c.start_station_name;

-- BIKE PREFERENCE BY RIDER TYPE --

SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides
FROM `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
GROUP BY
  member_casual, rideable_type
ORDER BY
  member_casual, total_rides DESC;

-- NUMBER OF TRIPS BY MONTH --

SELECT source_month, COUNT(*) AS trips
FROM `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
GROUP BY source_month
ORDER BY source_month;

--TRIP DURATION BY RIDER BY MONTH --

SELECT
  member_casual,
  EXTRACT(MONTH FROM started_at) AS month,
  ROUND(AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)), 2) AS avg_trip_duration_minutes,
  COUNT(*) AS total_trips
FROM `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
GROUP BY member_casual, month
ORDER BY member_casual, month;

-- TRIPS TAKEN WEEKENDS VS WEEKDAYS --

SELECT
  member_casual,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM started_at) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  COUNT(*) AS total_rides
FROM
   `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
GROUP BY
  member_casual, day_type
ORDER BY
  member_casual, day_type;
