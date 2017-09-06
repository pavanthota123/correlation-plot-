#ui.R
library(shiny)
library(RColorBrewer)
shinyUI(fluidPage(
  titlePanel("Projects Dataset"),
  sidebarLayout(
    sidebarPanel(
      selectInput('xcol', 'X Variable', names(project)),
      selectInput('ycol', 'Y Variable', names(project),
                  selected=names(project)[[2]])
      
      
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot",plotOutput("plot1")),
        tabPanel("Correlation",verbatimTextOutput("correlation")),
        tabPanel("CorPlot",plotOutput(("corplot")))
      )
      
    )
  )
))



