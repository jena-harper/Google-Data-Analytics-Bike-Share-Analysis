-- Top 20 Start and End Stations Combined
WITH top_start AS (
  SELECT
    start_station_name AS station_name,
    start_lat AS lat,
    start_lng AS lon,
    COUNT(*) AS total_rides,
    'Start' AS station_type
  FROM
    `bike-share-user-analysis.bike_trips.cleaned_combined_trips`

  GROUP BY
    station_name, lat, lon
  ORDER BY
    total_rides DESC
  LIMIT 20
),

top_end AS (
  SELECT
    end_station_name AS station_name,
    end_lat AS lat,
    end_lng AS lon,
    COUNT(*) AS total_rides,
    'End' AS station_type
  FROM
    `bike-share-user-analysis.bike_trips.cleaned_combined_trips`

  GROUP BY
    station_name, lat, lon
  ORDER BY
    total_rides DESC
  LIMIT 20
)

SELECT * FROM top_start
UNION ALL
SELECT * FROM top_end;

-- bike preference by rider type

SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides
FROM `bike-share-user-analysis.bike_trips.cleaned_combined_trips`


GROUP BY
  member_casual, rideable_type
ORDER BY
  member_casual, total_rides DESC;

-- number of trips by month

SELECT source_month, COUNT(*) AS trips
FROM `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
GROUP BY source_month
ORDER BY source_month;

--trip duration by rider per month

SELECT
  member_casual,
  EXTRACT(MONTH FROM started_at) AS month,
  ROUND(AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)), 2) AS avg_trip_duration_minutes,
  COUNT(*) AS total_trips
FROM `bike-share-user-analysis.bike_trips.cleaned_combined_trips`
GROUP BY member_casual, month
ORDER BY member_casual, month;

-- trips taken weekends vs weekdays

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
