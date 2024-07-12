#' The dataset "weather.rds"used in this demo came from this excellent course 
#' in data cleaning hosted on Datacamp (https://www.datacamp.com/courses/cleaning-data-in-r)
#' Downloaded in May 2021

library("dplyr")
library('tidyr')

# Load weather.rds
weather <- readRDS("../../DHT24-Practice/weather.rds")

# Verify that weather is a data.frame
class(weather)

# Check the dimensions of the data set
dim(weather)

# View the column names
names(weather)

# View the structure of the data
str(weather)

# Look at the structure using dplyr's glimpse()
glimpse(weather)

# View a summary of the data
summary(weather)

# Take a closer look at the data by viewing the top and bottom rows
head(weather)
tail(weather)

#' This weather dataset suffers from one of the five most common 
#' symptoms of messy data: column names are values. 
#' Column names X1-X31 represent days of the month. 
#' They should be values of a variable called day.
#' pivot_longer() the columns X1:X31 as day

w2 <- pivot_longer(weather, X1:X31, names_to = "day", values_to = "value")
#Remove X's from day column
w2$day <- stringr::str_replace(w2$day, "X","")

#' Another common symptom of messy data: values are variable names. 
#' Values in the measure column should be variables (column names) 
#' in our dataset. pivot_wider() the measure column
w3 <- pivot_wider(w2, year:day, names_from = measure, values_from = value)

# Check to see if I can safely remove rows where temp is null
# checking to see if only invalid dates had null temperatures
print(w3 %>% filter(is.na(Max.TemperatureF)), n=40)

# Remove the ^
w4 <- w3 %>% filter(!is.na(Max.TemperatureF))

#Unite the year, month and day columns 
# equivalent to paste all three into a new column and
# drop the old columns
w5 <- unite(w4, obs_date, year, month, day, sep = "-")

# Convert obs_date into date
w5$obs_date <- lubridate::ymd(w5$obs_date)

# I am thinking about imputing some value for T(race) amounts
# of precipitation. Let's see what the range looks like first
summary(w5)
# Didn't work with strings! Let,s try to see the unique vales
w5 %>% select(PrecipitationIn) %>% unique()
w5 <- w5 %>% arrange(PrecipitationIn)
head(w5$PrecipitationIn)
tail(w5$PrecipitationIn)

# Trace amounts should be between 0.00 and 0.01
# having no experts around, ı arbitrarily pick 0.001
w6 <- w5 %>%
  mutate(PrecipitationIn = case_when(
    PrecipitationIn == 'T' ~ "0.001",
    .default = PrecipitationIn))
# Alternatively can use str_replace because it is a string column!
# w5$PrecipitationIn <- stringr::str_replace(w5$PrecipitationIn, "T", "0.001")


# Convert character columns into numeric
w7 <- mutate_each(w6, funs(as.numeric), Max.TemperatureF:CloudCover)
