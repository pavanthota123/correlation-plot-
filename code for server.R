library(shiny)
library(corrplot)
shinyServer(function(input, output,session) {
  selectedData <- reactive({
    project[, c(input$xcol, input$ycol)]
  })
  output$plot1 <- renderPlot({
    plot(selectedData(),col=brewer.pal(n='8',name = "Paired"))
  })
  output$correlation<-renderPrint({
    cor(project[input$xcol],project[input$ycol])
  })
  output$corplot<-renderPlot({
    M<-data.frame(project$Project.ID,project$Est..GM.,project$Rev..GM..,project$PO.Value,project$Del.Hit.Ratio,project$X..Client.Reported.Issues,project$X..Pending.HP.Issues,project$EE,project$AE)
    corrplot(cor(M),method="color")
  })
})
