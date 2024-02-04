#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(DT)
library(shinymanager)

library(ggplot2)

#First setup some paths etc.
if(grepl("*[M|m]rinmayi*", Sys.info()['nodename'])){
  setwd("~/GitDir/ConcealMemory/ShinyApp/RetrievalControl/")
}

# Define UI for application that draws a histogram
ui <- fluidPage(
  #Read in CSS
  includeCSS('www/customstylesheet.css'),
  includeCSS('https://fonts.googleapis.com/icon?family=Material+Icons'),
  title = "Memory Control",
  
  dashboardPage(
    dashboardHeader(title="Memory Control"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Introduction", tabName= "introduction", icon=tags$i(class = "material-icons", "people", style = "font-size:inherit;")),
        menuItem("Method", tabName= "method", icon=tags$i(class = "material-icons", "construction", style = "font-size:inherit;")),
        menuItem("Results", tabName= "results", icon=tags$i(class = "material-icons", "bar_chart", style = "font-size:inherit;"))
      ) #Closes sidebarMenu
    ), #Closes dashboardSidebar
    dashboardBody(
      tags$head(tags$style(rel = "stylesheet", 
                           type = "text/css", href = "customstylesheet.css")),
      tags$head(tags$style(rel = "stylesheet", 
                           type = "text/css", href = "https://fonts.googleapis.com/icon?family=Material+Icons")),
      
      tabItems(
        ########## Method ##########
        tabItem(tabName = "introduction",
                fluidRow(
                  box(width = 12,
                      title = "What is the goal of the study?"
                  ), #Close goal box
                  box(width = 12,
                      title = "Why should we care?",
                      p("Although the ability to remember past events is essential for daily living, it is not always beneficial."),
                      p("Imagine someone who has experienced a traumatic event such as getting mugged in a park. In the future, a walk the park may remind them of the traumatic experience of being mugged - which is not pleasant."),
                      p("In fact, such 'flashes' of memory is a common feature of conditions such as Post Traumatic Stress Disorder (PTSD) or Major Depressive Disorder.")
                  ), #Close importance box
                  box(width = 12,
                      title = "How can we control our memories?",
                      p("Studies have suggested that we can use two strategies to control memory retrieval."),
                      h4("Retrieval Suppression"),
                      p("This involves pushing the retrieved information out of your awareness."),
                      h4("Thought Substitution"),
                      p("This involves calling to mind alternate information instead of the retrieved memory.")
                  ) #Close strategies box
                ) #Close fluidRow
        ), #Close tabName
        tabItem(tabName = "method",
                fluidRow(
                  box(width = 12,
                      title = "Procedure of the experiment"
                  ), #Close procedure box
                  box(width = 12,
                      title = "What do we expect?"
                      )
                ) #Close fluidRow
        )
      ) #Close tabItems
    ) #Close dashboardBody
  ) #Close dashboardPage
)


# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
