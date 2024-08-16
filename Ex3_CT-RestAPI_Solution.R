# U.S. National library of Medicine
# Clinical Trials Search API

# Please refer to to the API documentation on
# https://clinicaltrials.gov/api/gui

# Accessing the RestAPI programmatically
# Useful for using ANY REST API!

#Load necessary libraries
library(httr)
library(jsonlite)

# We build the query to the specifications of the API
base <- "https://clinicaltrials.gov/api/v2"
# Endpoint and format preferences
endpoint <- "/studies?format=json&markupFormat=legacy&"

# The following part of the query extracts 10 records, starting from the beginning (0)
# and includes nct_id, Condition, BriefTitle and overall status
# where search expression is 'lung cancer' and output format is JSON
query <- "query.cond=lung+cancer&fields=NCTId,BriefTitle,OverallStatus,HasResults,Phase&countTotal=true"

# Bring the whole URL call together using paste0()
call1 <- paste0(base, endpoint, query)

#Print the call to the screen
call1

# Send the query to the API using GET()
get_trials <- GET(call1)

# Check the class of get_trials using class()
class(get_trials)

# Check the type of get_trials using typeof()
typeof(get_trials)

# Check the status code
get_trials$status_code

# Save the response content as="text" from the API call using content()
get_trials_text <- content(get_trials, "text")

# Parse the JSON output from the API call using fromJSON(). Specify flatten = TRUE
get_trials_json <- fromJSON(get_trials_text, flatten = T)

# Study the elements of the list. 
# Print the total number of trials available
get_trials_json$totalCount

# Extract the studies data frame for analysis
get_trials_df <- get_trials_json$studies

# Examine the class of get_trials_df
class(get_trials_df)

# Examine the contents of get_trials_df
get_trials_df

