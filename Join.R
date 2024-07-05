# Join example
athlete <- read.csv("../olympic_events.csv")

athlete <- rename(athlete, Country=NOC)

gap <- gapminder::gapminder_unfiltered

# Join athlete to gap

bigdata <- athlete %>%
  left_join(gap, by=c("Team" = "country"))

# Exercise in class notes pg 12
betterdata <- athlete %>%
  left_join(gap, by=c("Team" = "country", "Year" = "year")) %>%
  group_by(Team) %>%
  summarize(AvgHeight=mean(Height, na.rm = T),
            AvgGDP=mean(gdpPercap, na.rm = T))

# Plot avg hgt versus avg gdp
plot(x = betterdata$AvgHeight, y = betterdata$AvgGDP, "l")
