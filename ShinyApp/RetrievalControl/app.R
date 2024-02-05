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
  setwd("~/GitDir/MemoryControlEyeMovements/ShinyApp/RetrievalControl/")
}

# Define UI for application that draws a histogram
ui <- fluidPage(
  #Read in CSS
  includeCSS('www/customstylesheet.css'),
  includeCSS('https://fonts.googleapis.com/icon?family=Material+Icons'),
  title = "Memory Control",
  dashboardPage(
    dashboardHeader(title=""),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Background", tabName= "background", icon=tags$i(class = "material-icons", "article", style = "font-size:inherit;")),
        menuItem("The Study", tabName= "study", icon=tags$i(class = "material-icons", "bar_chart", style = "font-size:inherit;")),
        menuItem("Conclusion", tabName= "conclusion", icon=tags$i(class = "material-icons", "bar_chart", style = "font-size:inherit;")),
        menuItem("Related Material", tabName= "materials", icon=tags$i(class = "material-icons", "link", style = "font-size:inherit;"))
      ) #Closes sidebarMenu
    ), #Closes dashboardSidebar
    dashboardBody(
      tags$head(tags$style(rel = "stylesheet", 
                           type = "text/css", href = "customstylesheet.css")),
      tags$head(tags$style(rel = "stylesheet", 
                           type = "text/css", href = "https://fonts.googleapis.com/icon?family=Material+Icons")),
      
      tabItems(
        ########## Background ##########
        tabItem(tabName = "background",
                fluidRow(
                  box(width = 12,
                      title = "What is the goal of the study?"
                  ), #Close goal box
                  box(width = 12,
                      title = "Why should we care?",
                      p("Although the ability to remember past events is essential for daily living, it is not always beneficial."),
                      p("Imagine someone who has experienced a traumatic event such as getting mugged in a park. In the future, a walk the park may remind them of the traumatic experience of being mugged - which is not pleasant."),
                      p("WHY SUPPRESS?"),
                      img(src = "PatternCompletion.gif", width = "50%", height = "50%", offset = 0, style='padding:0px;'),
                      p("In fact, such 'flashes' of memory is a common feature of conditions such as Post Traumatic Stress Disorder (PTSD) or Major Depressive Disorder.")
                  ), #Close importance box
                  box(width = 12,
                      title = "How can we control our memories?",
                      p("Studies have suggested that we can use two strategies to control memory retrieval."),
                      h4("Retrieval Suppression"),
                      p("This involves pushing the retrieved information out of your awareness."),
                      img(src = "Suppress.gif", width = "50%", height = "50%", offset = 0, style='padding:0px;'),
                      h4("Thought Substitution"),
                      p("This involves calling to mind alternate information instead of the retrieved memory."),
                      img(src = "Substitute.gif", width = "50%", height = "50%", offset = 0, style='padding:0px;')
                  ) #Close strategies box
                ) #Close fluidRow
        ), #Close background tabItem
        ########## Study ##########
        tabItem(tabName = "study",
                fluidRow(
                  box(width = 12,
                      title = "The Experiment",
                      p("ENCODING TEXT"),
                      img(src = "Encoding.gif", width = "25%", height = "25%", offset = 0, style='padding:0px;'),
                      p("SEARCH TEXT"),
                      img(src = "Search.gif", width = "25%", height = "25%", offset = 0, style='padding:0px;'),
                      p("POST TEST TEXT"),
                      img(src = "Posttest.gif", width = "25%", height = "25%", offset = 0, style='padding:0px;')
                  ), #Close procedure box
                  box(width = 12,
                      title = "The Results",
                      p("Post-test Memory"),
                      img(src = "PosttestAccuracy.png", width = "50%", height = "50%", offset = 0, style='padding:0px;'),
                      p("Associate Viewing"),
                      img(src = "AssociateViewing.png", width = "50%", height = "50%", offset = 0, style='padding:0px;')
                  ) #Close results box
                ) #Close fluidRow
        ), #Close study tabItem
        ########## Conclusion ##########
        tabItem(tabName = "conclusion",
                fluidRow(
                  box(width = 12,
                      title = "What do the results mean?"
                  ) #Close discussion box
                ) #Close fluidRow
        ), #Close conclusion tabItem
        ########## Related Materials ##########
        tabItem(tabName = "materials",
                fluidRow(
                  box(width = 12,
                      title = "Links to Related Reading",
                      tags$ul(
                        tags$li(tags$a(href="https://psycnet.apa.org/record/2024-38477-001", "Link to the published article")),
                        tags$li(tags$a(href="https://osf.io/preprints/psyarxiv/q4fvs", "Link to open-access full text")),
                        tags$li(tags$a(href="https://osf.io/preprints/psyarxiv/q4fvs", "Link to open-access full text")))
                  ) #Close discussion box
                ) #Close fluidRow
        ) #Close conclusion tabItem
      ) #Close tabItems
    ) #Close dashboardBody
  ) #Close dashboardPage
)


# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
