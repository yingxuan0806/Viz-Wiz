dashboardBody(
  #all tab items
  tabItems(
    #individual tabs, tabName to be same as in sidebar
    
    tabItem(
      tabName = "home",
      h4("home page")
    ),
    
    tabItem(
      tabName = "single",
      h4("test test test")
      ),
    
    tabItem(
      tabName = "multi_beginner",
      h4("multi beginner")
    ),
    
    tabItem(
      tabName = "multi_novice",
      h4("multi novice")
    ),
    
    tabItem(
      tabName = "multi_expert",
      h4("multi expert")
    ),
    
    tabItem(
      tabName = "dashboard",
      # boxes need to be put in a row (or column)
      # for column: fluidRow(
#                     column(
#                       width = 4,
          #             box(
          # )))

      fluidRow(
        #static info box
        # infoBox("Total Games Played", 10 * 2, icon = icon("credit-card")),
        
        #dynamic info box
        infoBoxOutput("total_gamesBox"),
        infoBoxOutput("average_scoreBox"),
        # infoBoxOutput("progressBox"),
        infoBoxOutput("high_scoreBox")
      ),

      fluidRow(
        box(
          title = "Histogram",
          solidHeader = TRUE,
          status = "warning",
          collapsible = TRUE,
          plotOutput("plot1", height = 250)
        ),
        
        box(
          title = "Controls",
          # width is specified by 12-wide bootstrap gride
          width = 4,
          # height is specified in pixels
          solidHeader = TRUE,
          status = "primary",
          collapsible = TRUE,
          sliderInput("slider", "Number of observations:", 1, 100, 50)
        )
      ),
    ),
    
    tabItem(
      tabName = "vizwiz",
      h2("about the game")
    ),
    
    tabItem(
      tabName = "team",
      h2("team info"),
      
    )
  )
)