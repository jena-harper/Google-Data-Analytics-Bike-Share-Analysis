-- R script used to inspect headers of .csv files before SQL combining --


# Set working directory (adjust if needed)
setwd("/cloud/project/Bike Trip Analysis")

# Step 1: List all CSV files in the folder
csv_files <- list.files(pattern = "\\.csv$", full.names = TRUE)

# Step 2: Read just the headers from each file
column_headers <- lapply(csv_files, function(file) {
  names(read.csv(file, nrows = 1, check.names = FALSE))
})

# Step 3: Name each list element by file name
names(column_headers) <- basename(csv_files)

# Step 4: Print headers for each file to inspect
for (name in names(column_headers)) {
  cat("\n📄 File:", name, "\n")
  print(column_headers[[name]])
}
-- count of null values in combined dataset --

SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
 FROM
  `bike-share-user-analysis.bike_trips.combined_trips`
