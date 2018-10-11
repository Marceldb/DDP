#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Age vs. Income simulator"),
  
  # Sidebar with a slider input for sample n 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sample",
                   "Number of observations in sample:",
                   min = 10,
                   max = 500,
                   value = 100),
    
    # Input: Decimal interval with step value ----
    sliderInput("sd", "Standard Deviation:",
                min = 15, max = 25,
                value = 20, step = 1)
    
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
     )
  )
))
