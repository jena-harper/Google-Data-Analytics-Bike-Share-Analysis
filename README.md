# Cyclistic Bike Share Case Study

##  Introduction
Welcome to the **Cyclistic Bike Share Analysis Case Study**! In this project, I will follow the data analysis process taught in the Google Data Analytics Professional Certificate program: **Ask, Prepare, Process, Analyze, Share, and Act**.

This case study focuses on understanding how **casual riders and annual members use Cyclistic bikes differently**. These insights will inform a marketing strategy aimed at converting casual riders into annual members.

---

##  Scenario
I am a junior data analyst working on the marketing team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company's future success depends on maximizing the number of annual memberships. My task is to uncover how different types of riders use the service, which will inform strategic marketing decisions.

---

##  About the Company
Cyclistic launched a successful bike-share program in **2016**, now with:
- **5,824 geotracked bicycles**
- **692 docking stations** across Chicago

Cyclistic offers:
- **Single-ride passes**
- **Full-day passes**
- **Annual memberships**

Casual riders use single-ride or day passes; annual members purchase memberships. Finance analysts have shown that **annual members are more profitable**, so the team is focused on converting casual riders into members.

---

##  ASK
### Business Task
Answer the first of three key business questions:
> **How do annual members and casual riders use Cyclistic bikes differently?**

---

##  PREPARE
###  Data Source
- **12 CSV files** containing monthly trip data from **March 2024 to February 2025**
- Source: [Divvy Bike Share](https://divvybikes.com/system-data)
- License: Motivate International Inc. under [this license](https://ride.divvybikes.com/data-license-agreement)

###  Data Summary
- Total trips: **4,012,709**
- Columns per file: **13**
- File naming convention: `YYYYMM-divvy-tripdata.csv`

---

##  PROCESS
### Tools Used
- **RStudio** for initial inspection, checking column headers and ensuring structures matched
- **SQL (BigQuery)** for exploration, cleaning, and analysis
- **Tableau** for data visualization

### SQL Scripts
1. [`01_Data_Exploration.sql`](01_Data_Exploration.sql)
2. [`02_Data_Combining.sql`](02_Data_Combining.sql)
3. [`03_Data_Cleaning.sql`](03_Data_Cleaning.sql)
4. [`04_Data_Analysis.sql`](04_Data_Analysis.sql)

### Cleaning Steps
- Removed null values for station names and coordinates
- Filtered trips under 1 minute or over 24 hours
- Removed duplicate ride IDs
- Standardized station names and IDs

---

##  ANALYZE
Key insights include:
- **Member rides**: 2,541,561
- **Casual rides**: 1,471,148

### Behavioral Patterns:
- **Members**:
  - Ride more during **weekday commute hours** (7-9 AM, 4-6 PM)
  - Shorter, more consistent trip durations (~10-14 mins year-round)
- **Casual Riders**:
  - Ride more on **weekends and warmer months**
  - Take longer trips, peaking in summer months (~25-30 mins)

### Bike Type Preferences:
- There is no notable difference in bike type preferences between the two groups

### Station Usage:
- Top 20 stations dominated by downtown and lakeside locations
- Casual users favor scenic and tourist-heavy stations

---

##  SHARE
### Tableau Dashboard Highlights
- [ ] Average Trip Duration by Month
- [ ] Rides by Hour of Day
- [ ] Station Popularity Map
- [ ] Bike Preference by Rider Type
- [ ] Weekday vs Weekend Usage

View the full visualization on Tableau Public [here](https://public.tableau.com/views/Capstone-BikeShareAnalysis/Dashboard3?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[Read the full write-up on Medium](https://medium.com/@jen_26965/placeholder-for-capstone-466f004b4219)

---

##  ACT
### Recommendation
Focus marketing campaigns on **casual riders who ride on weekends and in the summer**, highlighting:
- Benefits of becoming a member (e.g. cost savings, convenience)
- Promotions targeted at converting repeat casual users

Next steps may include:
- Sending email campaigns to casual riders
- Promoting discounted trial memberships
- Creating commuter-focused promotions

---

##  Files in This Repository
- `01_Data_Exploration.sql`
- `02_Data_Combining.sql`
- `03_Data_Cleaning.sql`
- `04_Data_Analysis.sql`
- `README.md`

---

##  License
Data used in this case study is provided by [Motivate International Inc.](https://ride.divvybikes.com/data-license-agreement) and is for educational purposes only.

