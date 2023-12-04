file.choose()
growth_data <- read.csv("/cloud/project/experiment3.csv")
install.packages("ggplot2")
install.packages("gridBase")
install.packages("gridExtra")
library(ggplot2) 
library(grid)
library(gridExtra)
# this downloads and installs the required packages

logistic_graph <- ggplot(aes(t,N), data = growth_data) +
  geom_line(data = growth_data, aes(t, N), colour = "red") +
  geom_point(size = 0.8) +
  xlab("Time, t") +
  ggtitle(expression(underline("Logistic Growth Curve"))) +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Population size")
# plot the logistic growth curve

exponential_graph <- ggplot(aes(t,N), data = growth_data) +
  geom_line(data = growth_data, aes(t, N), colour = "purple") +
  geom_point(size = 0.8) +
  xlab("Time, t") +
  ylab("Population size") + 
  ggtitle(expression(underline("Exponential Growth Curve"))) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(trans='log10')
# plot the exponential growth curve

plot1 <- logistic_graph
plot2 <- exponential_graph
grid.arrange(plot1, plot2, ncol=2)
# arrange the two plots so they are side by side in 2 columns