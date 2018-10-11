#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

# set random seed for reproducibility
set.seed(151)
N=100
SD=20 # standard dev
age <- runif(n = N, 
             min = 16, 
             max = 75)
income <- age + rnorm(n=N, 30, SD)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
        # generates age and income distributions, based on 
    # input$bsample from ui.R
    N=100
    N = input$sample
    SD=20 # standard dev
    SD= input$sd
    
    age <- runif(n = N, 
                 min = 16, 
                 max = 75)
    income <- age + rnorm(n=N, 30, SD)
    
    # create the dataframe for ggplot
    mydf<- data.frame(age,income)
    mycor<-cor(age,income)
    mycaption<-substitute(paste("Sample n=", N, 
                                 " ; Standard Deviation=", SD, " ; Pearson Correlation coeff.: ", mycor))
      
    # draw the histogram with the specified number of bins
    mydf %>% ggplot(aes(x=age, y=income))+
    geom_point()+
      geom_smooth()+
      labs(title="Age and Income distributions simulator", 
           caption=mycaption)+
      theme_classic()
    })
})
