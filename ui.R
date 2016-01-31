library(shiny)

# Define UI for application that calculates salary increases using amounts and percentage
shinyUI(fluidPage(
  
  titlePanel(h1(strong("Calculate your new salary"), align='center')),
  
  hr(),
  
  sidebarPanel(h3(strong("Enter your salary factors"), align='center'),
    hr(),
    # User input box for current annual salary
    numericInput("sal", label = h4("Current annual salary"), value = '100000'),
               
    # Percent interval with step value
    sliderInput('percent', "Salary increase percentage:",
              min = 0, max = 100, value = '3', step= 1),
    br(),
    # Input boxes for various increase amounts to salary
    numericInput("adj", label = h4("Cost of living adjustment amount"), value = '1000'),
    numericInput("mer", label = h4("Merit increase amount"), value = '2000'),
    numericInput("bon", label = h4("Bonus"), value = '5000'),
  

  
    # Submit button to calculate salary
    submitButton("Calculate salary")),

  mainPanel(h3(strong("Results"), align='center'),
    hr(),
    fluidRow(h4("New salary"),
      column(4, helpText("based on desired salary percentage increase only"), verbatimTextOutput('newsalperc')),
      column(2, helpText("cost of living increase only"), verbatimTextOutput('newsaladj')),
      column(2, helpText("merit increase only"), verbatimTextOutput('newsalmer')),
      column(3, helpText("both cost of living and merit increases"), verbatimTextOutput('newsaladjmer'))
      ),

    br(),
    fluidRow(h4("Total earnings"),
      column(3, helpText("2016: cost of living, merit, and bonus"), verbatimTextOutput('newsaltotal'))
      ),
  
    br(),
    fluidRow(h4("Year-to-year percent increase"),
      column(4, helpText("Excluding bonus"), verbatimTextOutput('perc')),
      column(4, helpText("Including bonus"), verbatimTextOutput('percbon'))
      )
  )
))