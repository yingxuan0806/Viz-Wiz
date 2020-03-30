if(!require(shiny)) {
  install.packages("shiny")
  library(shiny)
}

if (!require(shinydashboard)) {
  install.packages("shinydashboard")
  library(shinydashboard)
}

dashboardPage(
  dashboardHeader(title = "Basic dasboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),
  dashboardBody(
    # boxes need to be put in a row (or column)
    fluidRow(
      box(plotOutput("plot1", height = 250)),
      
      box(
        title = "Controls",
        sliderInput("slider", "Number of observations:", 1, 100, 50)
      )
    )
  )
)
