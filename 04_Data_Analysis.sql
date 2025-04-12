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
