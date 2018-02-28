library(shiny)
shinyServer(function(input, output) {
  # Design a linear regression model with Savings Rate as a function of the
  # Population proportion under the age of 15 & over 75, the per-capita
  # disposable income & the rate of growth of the per-capita disposable
  # income
  model <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)
  helpContent <- "This application estimates & displays Savings Ratio
                  (Aggregate Personal Saving divided by disposable income)
                  using the 4 input values entered by the user : Percentage
                  of population under 15 years, Percentage of population over
                  75 years, Per-capita disposable income & the rate of change
                  of Per-capita disposable income. The estimation is performed
                  using a linear regression model developed from the 'LifeCycleSavings'
                  dataset in R with the Savings Ratio as a function of the above 4
                  variables. User has to enter the required input values in the 4
                  input fields and then hit the Submit button to see the result in
                  the 'Result' tab. The values entered for the input variables should
                  be within the allowable limits of each field as set by the dropdown box."
  
  # The 'modelpred' function gets the 4 predictor variables as input entries
  # from the user and uses the predict function to get the fitted value of
  # Savings Rate for the input variables. 
    modelpred <- reactive({
    numPop15Input <- input$numPop15
    numPop75Input <- input$numPop75
    numDpiInput <- input$numDpi
    numDdpiInput <- input$numDdpi
    predict(model, newdata = data.frame(pop15 = numPop15Input, 
                                        pop75 = numPop75Input, 
                                        dpi = numDpiInput,
                                        ddpi = numDdpiInput))
  })

  output$pred <- renderText({
    modelpred()
  })
  output$help <- renderText({
    helpContent
  })
  
})