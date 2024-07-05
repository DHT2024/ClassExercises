library(dplyr)
# filter(df, …)
# select()
# arrange()
# mutate()
# count()
# group_by(), ungroup()
# summarise()
mydata <- datasets::CO2

mydata %>%
  # sort
  arrange(conc) %>%
  # take a slice
  head(n=7) %>%
  # count :)
  count()
