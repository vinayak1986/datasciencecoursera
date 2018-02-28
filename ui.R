library(shiny)
shinyUI(fluidPage(
  # Design the title panel with the app. description
  titlePanel("Predict Savings Ratio from Demographic & Economic Indicators"),
  sidebarLayout(
    sidebarPanel(
      # Get the proportion of the population under the age of 15
      numericInput("numPop15", "What is the proportion of population under 15?", 
                    min = 22, max = 47, 
                    value = 30, step = 1),
      # Get the proportion of the population over the age of 75
      numericInput("numPop75", "What is the proportion of population over 75?", 
                    min = 0.56, max = 4.70, 
                    value = 1, step = 0.10),
      # Get the per-capita disposable income
      numericInput("numDpi", "What is the per-capita disposable income?", 
                    min = 90, max = 4000, 
                    value = 1000, step = 200),
      # Get the rate of growth of per-capita disposable income
      numericInput("numDdpi", "What is the rate of growth of per-capita disposable income?", 
                    min = 0.22, max = 16.70, 
                    value = 8, step = 1),
      # Include a Submit button to have the server logic executed only when the
      # user presses it.
      submitButton("Submit")
      ),
    mainPanel(
      # Get the result of the regression model executed by server.R in a text output.
      # Show the help page for the app in a separate tab.
      tabsetPanel(type = "tabs",
                  tabPanel("Result", br(), 
                           h4("Predicted Savings Ratio by the Regression Model:"),
                           textOutput("pred")),
                  tabPanel("App Help", br(), textOutput("help")))
    )
  )
))