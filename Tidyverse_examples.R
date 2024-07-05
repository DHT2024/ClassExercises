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

mynewdata <- mydata %>%
  # order by conc desc
  arrange(desc(conc))

mydata %>% 
  arrange(Plant, desc(conc))

mynewdata <- mydata %>%
  # add a new column that's 10% increased uptake
  mutate(madeup=uptake*1.1)

# madeup=1.1uptake only for c hilled samples
mynewdata <- mydata %>%
  mutate(madeup=uptake) %>%
  filter(Treatment == "chilled") %>%
  # add a new column that's 10% increased uptake
  mutate(madeup=uptake*1.1)

# try again ...
newdata <- mydata %>%
  mutate(madeup= case_when(
    Treatment == "chilled" ~ uptake * 1.1,
    .default = uptake
  ))

# Summary statistics
newdata %>%
  group_by(Type) %>%
  summarise(NoOfSamples=n(), StdDev=sd(madeup))

# Summary statistics on two column
newdata %>%
  group_by(Type, Treatment) %>%
  summarise(NoOfSamples=n(), StdDev=sd(madeup))

# Add stddev columns calculated by groups 
newdata <- newdata %>%
  # create 'buckets'
  group_by(Type, Treatment) %>%
  # calculate stddev for each bucket
  mutate(StdDev=sd(madeup)) %>%
  # ungroup so that biuckets are destroyed
  ungroup()

# Selecting columns and renaming
newdata %>%
  select(Treatment,
         Type,
         Plant,
         MagicNumber=StdDev)
  

  