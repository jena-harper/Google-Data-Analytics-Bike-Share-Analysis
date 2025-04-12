-- created a new table named cleaned_combined_trips

CREATE OR REPLACE TABLE `bike-share-user-analysis.bike_trips.cleaned_combined_trips` AS
WITH deduped_data AS (
  SELECT *
  FROM (
    SELECT *,
           TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,
           ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY started_at) AS rn
    FROM `bike-share-user-analysis.bike_trips.combined_trips`
  )
  WHERE rn = 1
)
SELECT *
FROM deduped_data
WHERE
  start_station_name IS NOT NULL AND
  end_station_name IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL AND
  ride_length > 1 AND ride_length < 1440;
