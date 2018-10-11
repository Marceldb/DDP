# script for DDP w4, final project 

# loading packages
library(ggplot2)
library(dplyr)

# set random seed for reproducibility
set.seed(151)

# simulate age and income distributions
N=100 # sample n
SD=20 # standard dev

age <- runif(n = N, 
           min = 16, 
           max = 75)
summary(age)
income <- age + rnorm(n=N, 30, SD)

# create a dataframe for ggplot
mydf<- data.frame(age,income)

# Chart
mydf %>% ggplot(aes(x=age, y=income))+
  geom_point()+
  geom_smooth()+
  labs(title="Age and Income distributions simulator", 
       subtitle="Choose sample n")

# summaries
summary(age); summary(income)
cor(age,income)