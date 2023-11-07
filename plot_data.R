#Script to plot the logistic growth data

growth_data <- read.csv("/cloud/project/experiment3.csv")
install.packages("ggplot2")
library(ggplot2) #load data to the script and install ggplot2 package

ggplot(aes(t,N), data = growth_data) +
  geom_point() +
  xlab("t") +
  ylab("y") +
  theme_bw() 

ggplot(aes(t,N), data = growth_data) +
  geom_point() +
  xlab("t") +
  ylab("y") +
  scale_y_continuous(trans='log10')

# This produces both the sigmoidal logistic graph,
# and also the log transformation of this
