library(shiny)

# Define server logic required to calculate salary increases using amounts and percentage
shinyServer(function(input, output) {
  
  # You can access the value of the widget with input$num, e.g.
  output$sal <- renderPrint({ input$sal })
  output$adjramt <- renderPrint({ input$adj })
  output$perc <- renderPrint({ input$perc })
  
  # calculated salaries and summaries    
  output$newsaladj <- renderPrint({ input$sal + input$adj })
  output$newsalmer <- renderPrint({ input$sal + input$mer })
  output$newsaladjmer <- renderPrint({ input$sal + input$adj + input$mer})
  output$newsaltotal <- renderPrint({ input$sal + input$adj + input$mer + input$bon})

  # create a reactive variable containing slider input for desired percentage salary increase
  sliderValue <- reactive({ input$percent }) # Get slider input
  
  # display slider input
  output$slidervalue <- renderPrint(sliderValue())
  
  # calculated salary based on desired percentage
  output$newsalperc <- renderPrint({ input$sal* (1+({input$percent}/100))})
    
  # calculated total earnings
  output$percbon <- renderPrint( ({ input$adj + input$mer + input$bon}/ { input$sal + input$adj + input$mer + input$bon }) *100)
  output$perc <- renderPrint( ({ input$adj + input$mer}/ { input$sal + input$adj + input$mer }) *100)
  
})