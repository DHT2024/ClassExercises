# Jittering
# this
ggplot(mpg, aes(cty, hwy)) + 	
  geom_point() +   
  labs(y="hwy", x="cty",
  title="Scatterplot with overlapping points")
#versus this
ggplot(mpg, aes(cty, hwy)) +
  geom_jitter(width = .5, size=1) +
  labs(y="hwy",
       x="cty",
       title="Jittered Points")

# Size as information
ggplot(mpg, aes(cty, hwy)) +
  geom_count(col="tomato3", show.legend=F) +
  labs(y="hwy", x="cty", title="Counts Plot")

# Bubbles - best for 4 pieces of info
ggplot(mpg, aes(displ, cty)) +
  geom_jitter(aes(col=manufacturer, size=hwy)) +
  labs(title="Bubble chart")
