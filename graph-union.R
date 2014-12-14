library(ggplot2)
union <- read.csv("union.csv")
union$year <- as.Date(union$year)

ggplot(union, aes(year, union,colour=segment)) + 
  geom_line() + 
  scale_x_date() +
  geom_point() +
  geom_smooth(se=TRUE) +
  ylab ("Percent of Employees in a Union") +
  xlab("")