# save a plot object
# This time color code by species as default
gg1 <- ggplot(irs, 
              mapping = aes(x=Sepal.Length, y=Sepal.Width,
              col = Species))
gg2 <- gg1 + geom_point()
# color by species
#gg3 <- gg1 + geom_point(aes(col=Species))
# add smoother lines
gg4 <- gg2 + geom_smooth()
# add smoother by species
#gg5 <- gg3 + geom_smooth(aes(col=Species))
# makes smoothers smoother
gg6 <- gg2 + geom_smooth(method = "lm")

# Add scales
ggplot(irs, aes(x = Sepal.Length, y = Sepal.Width, col=Species)) +
  geom_point()+
  geom_smooth(method="lm")+
  scale_colour_brewer()

# Plot by group
ggplot(irs, aes(x = Sepal.Length, y = Sepal.Width, col=Species)) +
  geom_point()+
  geom_smooth(method="lm")+
  scale_colour_brewer() +
  facet_wrap(~Species, nrow=2)

# Change coordinate system
ggfinal <- ggplot(irs, aes(x = Sepal.Length, y = Sepal.Width, col=Species)) +
  geom_point()+
  geom_smooth(method="lm")+
  scale_colour_brewer() +
  facet_wrap(~Species, nrow=2) +
  coord_polar() +
# Add a theme 
  theme_dark()
