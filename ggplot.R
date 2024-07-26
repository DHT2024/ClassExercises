library(ggplot2)

irs <- iris
# plots immediately
ggplot(irs, mapping = aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point()

# save a plot object

gg1 <- ggplot(irs, mapping = aes(x=Sepal.Length, y=Sepal.Width))
gg2 <- gg1 + geom_point()
# color by species
gg3 <- gg1 + geom_point(aes(col=Species))
# add smoother lines
gg4 <- gg3 + geom_smooth()
# add smoother by species
gg5 <- gg3 + geom_smooth(aes(col=Species))
# makes smoothers smoother
gg6 <- gg3 + geom_smooth(aes(col=Species), method = "lm")
