#Script to estimate the model parameters using a linear approximation

install.packages("dplyr") #data manipulation package
library(dplyr)

growth_data <- read.csv("/cloud/project/experiment3.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N)) #1000 chosen as this is in the exponential growth rate phase

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

# The output from this code run shows an intercept (and so starting population size) of 8.512e+00
# The rate of change with respec to t is 5.007e-03

#Case 2. N(t) = K (is at carrying capacity)

data_subset2 <- growth_data %>% filter(t>4500) #this is a point at which the population N = K

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

# the output of this model shows that the carrying capacity of this population model is 5.000e+09


