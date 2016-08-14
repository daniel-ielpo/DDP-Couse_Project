shinyUI(fluidPage(
  # Application title
  titlePanel("Summer Olympics Medal Ranking from 1896 - 2008"),tags$img(src='logo.png', width = "75px", height = "50px"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "yearEdition",
        "Summer Olympics Year:",
        min = 1896,
        max = 2008,
        value = 2008,
        step = 4
      ),
      
      selectInput("gender", "Event Gender", choices = c("All", "Women", "Men")),
      
      radioButtons(
        "topCountries",
        "Top Countries",
        choices = c(10, 20, 30, "All"),
        selected = 20,
        inline = TRUE
      )
      
    ),
    
    # Show a plot of the selected data
    mainPanel(tabsetPanel(
      #First tab with de plot data
      tabPanel("Plot", 
               textOutput("errorMessage"),
               plotOutput("plot")),
      #Second tab with information about the project
      tabPanel(
        "About",
        h2("Developing Data Products - Course Project"),
        p(
          "This is my submission for Developing Data Products Course Project. It's a basic shiny app."
        ),
        p(
          "As the 2016 Summer Olympics Games are happening in my city, Rio de Janeiro, I searched the web for some datasets to use in this project."
        ),
        p(
          "In the Tableau Public Sample Data Sets I found an Excel file with all medallists from 1896 to 2008 Summer Olympics. This dataset was published by The Guardian."
        ),
        p("The download link is below:"),
        a(
          "https://public.tableau.com/s/sites/default/files/media/Resources/Summer_Olympic_medallists_1896-2008.xlsx"
        ),
        p("In this app you can select data from the dataset and see the countries that have won more medals. They are ranked by total medals won."),
        h4("Using the App"),
        p(
          "On the side panel you can change the variables that are injected to the plot (from ggplot2 library)."
        ),
        p(
          "You can select the year edition, and you can also filter the gender and the top ranked countries to show."
        ),
        strong("About the plot"),
        p(
          "The plot has a column for each type of medal, bronze, silver and gold."
        )
      )
      
      
      
    ))
  )
))
