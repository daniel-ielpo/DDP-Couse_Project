shinyServer(function(input, output) {
  
  #Creating reactive dataset to plot
  appData <- reactive({
    require("readxl")
    require("plyr")
    
    #Loading the xlsx data
    medallists <-
      read_excel("Summer_Olympic_medallists_1896-2008.xlsx", sheet = "ALL MEDALISTS")
    
    #Subsetting the Year from the slider input
    medallists <-
      subset(medallists, Edition == input$yearEdition)
    
    #Subsetting the Gender from the select input
    if (input$gender != "All") {
      medallists <- subset(medallists, Gender == input$gender)
    }
    
    groupedData <-
      count(medallists, c("Edition", "NOC", "Medal"))
    
    groupedData <- rename(groupedData, c("freq" = "Total"))
    
    #Setting the Medals as factor so the plot columns be ordered
    groupedData$Medal = factor(groupedData$Medal, levels = c('Bronze', 'Silver', 'Gold'))
    
    #Now I rank the countries by Total Medals
    topCountries <- count(medallists, c("NOC"))
    topCountries <-
      topCountries[order(topCountries$freq, decreasing = TRUE), ]
    
    #subsetting the quantity of the top contries selected in the radio buttons
    if (input$topCountries != "All") {
      topTenCountries <- topCountries[1:input$topCountries, ]
      groupedData <-
        subset(groupedData, NOC %in% topTenCountries$NOC)
    }
    
    
    #If the dataset is not empty return the data
    if (nrow(groupedData) != 0) {
      return(groupedData)
    }
    #If there is no data return null
    else{
      return(NULL)
    }
    
  })
  
  #If the dataset is null return a message
  output$errorMessage <- renderText({
    if (is.null(appData())) {
      "There is no data available for the selected filter. :("
    }
    
  })
  
  output$plot <- renderPlot({
    require("ggplot2")
    
    #If the dataset is null return null to not show a error message
    if (is.null(appData())) {
      return(NULL)
    }
    #Do the plot
    else{
      plot1 <-
        ggplot(appData(), aes(
          x = Total,
          y = reorder(NOC, Total),
          colour = Medal
        )) +
        geom_point() +
        facet_grid(. ~ Medal) +
        xlab("Total of Medals") +
        ylab("Country") +
        ggtitle("Summer Olympics Medal Ranking") +
        scale_colour_manual(values = c("#CC6600", "#999999", "#FFCC33", "#000000"))
      
      return(print(plot1))
    }
  })
  
})
