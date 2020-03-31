if(!require(shiny)) {
  install.packages("shiny")
  library(shiny)
}

if (!require(shinydashboard)) {
  install.packages("shinydashboard")
  library(shinydashboard)
}
dashboardPage(
  #three portions of dashboard: header, sidebar, body
  dashboardHeader(title = "Basic dashboard"),
  
  dashboardSidebar(
    #add content to sidebar
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),
  dashboardBody(
    #all tab items
    tabItems(
      #individual tabs, tabName to be same as in sidebar
      #tab 1
      tabItem(tabName = "dashboard",
        # boxes need to be put in a row (or column)
        fluidRow(
          box(plotOutput("plot1", height = 250)),
          
          box(
            title = "Controls",
            sliderInput("slider", "Number of observations:", 1, 100, 50)
          )
        )
      ),
      
      #tab 2
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)
