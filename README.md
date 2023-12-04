---
output:
  pdf_document: default
  html_document: default
---

# ANSWERS TO QUESTIONS 1, 2 and 3

The answers for these questions will use the data from experiment3.csv, along with the R scripts: fit_linear_model.R, plot_data.R and plot_data_and_model.R for modelling and plotting.

## Question 1

The focus of this analysis is a repeat of an experiment looking at the growth rates of an *Escherichia coli* isolate in a 1mL nutrient growth media.

Bacteria growth rates can be divided into a lag phase, a growth phase, in which population growth rates increase exponentially, and a stationary phase, at which point exponential growth rates are no longer observed as the population is at carrying capacity. The growth phase of the bacterial culture represents an opportunity to determine the population growth parameters of the population discussed below.

The logistic growth rate equation: $\frac{dN}{dt}$ = Nr(1-$\frac{N}{K}$), where:\
- dN/dt is the population size.\
- N~t~ is the current size of the population at any time, t.\
- r is the population growth rate.\
- K is the carrying capacity of the population.

can be used to find out the rate of population size change with respect the the population growth rate and the carrying capacity.

This equation can be manipulated to find out the population size at any given time (t), such that: N(t) = KN~0~e^rt^ / (K - N~0~ + N~0~e^rt^).\
This equation can be applied to the dataset found in the experiment3.csv file to calculate the parameters of N~0~, r and K for this population.

An important consideration of this equation is that when K and t are both small, this can be simplified:\
- K will be significantly larger than N~0~, and by extension e^rt^ (as this is an increase on a very small population), thus the denominator can be simplified to just K.\
- The values of K of this can also be cancelled out to leave the population size at time t to equal: N(t) = N~0~e^rt^.\
- Taking the natural logarithm of these forms the equation: ln(N) = ln(N~0~) + rt

These equations can be used to calculate the values of N~0~, r and K for the population in exponential growth.

The plots of the data can be found in plot_data.R of this repo

These plots of the experiment3 data shows that exponential growth for this population is observed between t=0 and t=2500, therefore any time between these can be used when estimating the population growth parameters.

Using a log transformation of the data, a linear model can be fitted to estimate the starting population size and growth rate with respect to t. This code can also be found in the fit_linear_model.R of this repo.

The output of this model shows that the intercept of this linear model is 8.512e+00. This can be used to find the value of the initial population size at time 0 (N~0~), which is exp(8.512e+00). This transformation is necessary as a natural logarithm is previously taken to produce this linear model, and so the starting population size **N~0~ = exp(8.512e+00) = 4974.101** here

This also includes the output for the growth rate r of the population, which is valued at **r = 5.007e-03**

The value of K can also be found using a subset of the data at which point the population growth rate is 0 (such that the population size N is the same as the carrying capacity K). The code for this can be found in the fit_linear_model.R script of this repo

The output of model2 has one intercept value to represent the carrying capacity, and estimates **K = 5.000e+09**

## Question 2

```{r calculating N at t=4980}
growth_data <- read.csv("/cloud/project/experiment3.csv")
  
  N0<-exp(8.512e+00)
  r<-5.007e-03 
  t<-4980 
  
  N<-(N0*K*exp(r*t))/(K-N0+N0*exp(r*t))    
  print(N)
```

The output of this prediction is 4999925502, which matches the prediction of the logisitc growth prediction very closely (this had an output of 5e+09).\
It is likely that this has not quite reached the predicted value of the carrying capacity due to the diminishing population growth rate as the population increases - once N is very close to K, the population growth rate begins to fall dramatically (as N/k tends to 1, this causes reciprocal decrease in population growth rate when $\frac{dN}{dt}$ = Nr(1-$\frac{N}{K}$), and so this is likely why the population hasn't reached 5e+09 exactly, however, as t tends to infinity, this would then be reached)

## Question 3

The graph can be viewed here: <https://43906eef146446af8dce0f87d5432674.app.posit.cloud/graphics/fb9881dc-f6f1-4386-80d0-b0a15087cbca.png>

Produced using this code:

```{r comparing logistic and exponential growth curves}
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
      # this arranges the two plots so they are side by side in 2 columns
```
sink(file = "package-versions.txt")
sessionInfo()
sink() 