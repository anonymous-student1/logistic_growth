#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment3.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
} # this sets up the parameters of the logistic growth model as seen in the handout

N0 <- exp(8.512e+00) # see page 6 of the handout to show why this ln function is needed
  
r <- 5.007e-03
  
K <- 5.000e+09 # these are the values that have been extracted from the fit_linear_model.R code for this experiment 

ggplot(aes(t,N), data = growth_data) + #this establishes the model to compare the function of the experiment to
  
  geom_function(fun=logistic_fun, colour="red") + #this puts in the model of the experiment, using the given parameters
  
  geom_point()

  #scale_y_continuous(trans='log10')


### COMMIT AND PUSH THE CHANGES TO GITHUB REPO ###

sink(file = "package-versions.txt")
sessionInfo()
sink() 





