-- R script used to inspect headers of .csv files before SQL combining


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
