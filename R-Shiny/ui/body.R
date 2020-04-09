dashboardBody(
  #all tab items
  tabItems(
    #individual tabs, tabName to be same as in sidebar
    
    tabItem(
      tabName = "home",
      h2("Welcome to Viz-Wiz Leaderboards and Personal Progress Tracker!"),
      h4("To begin, select a tab on the navigation bar located on the left."),
      p("Please maximise the app screen for the best view.")
      # img(src = 'home.jpg', align = "middle", height = 600, width = 600)
      # , align = "middle", alt = " ", height = "80%", width = "auto"
    ),
    
    tabItem(
      tabName = "single",
      h2("Single Player Leaderboard"),
      
      fluidRow(
        infoBoxOutput("single_high_score"),
        infoBoxOutput("single_fastest_time"),
        infoBoxOutput("single_most_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("single_average_score"),
        infoBoxOutput("single_average_time"),
        infoBoxOutput("single_average_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("single_best_accuracy"),
        infoBoxOutput("single_average_accuracy"),
        infoBoxOutput("download_data")
      ),
      
      dataTableOutput("test_table")
      
    ),

    tabItem(
      tabName = "multi_beginner_1",
      h2("Multiplayer - Beginner I Leaderboard"),
      
      fluidRow(
        infoBoxOutput("beg_1_high_score"),
        infoBoxOutput("beg_1_fastest_time"),
        infoBoxOutput("beg_1_most_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("beg_1_average_score"),
        infoBoxOutput("beg_1_average_time"),
        infoBoxOutput("beg_1_average_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("beg_1_best_accuracy"),
        infoBoxOutput("beg_1_average_accuracy")
      )
    ),

    tabItem(
      tabName = "multi_beginner_2",
      h2("Multiplayer - Beginner II Leaderboard"),
      
      fluidRow(
        infoBoxOutput("beg_2_high_score"),
        infoBoxOutput("beg_2_fastest_time"),
        infoBoxOutput("beg_2_most_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("beg_2_average_score"),
        infoBoxOutput("beg_2_average_time"),
        infoBoxOutput("beg_2_average_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("beg_2_best_accuracy"),
        infoBoxOutput("beg_2_average_accuracy")
      )
    ),
    
    tabItem(
      tabName = "multi_novice",
      h2("Multiplayer - Novice Leaderboard"),
      
      fluidRow(
        infoBoxOutput("novice_high_score"),
        infoBoxOutput("novice_fastest_time"),
        infoBoxOutput("novice_most_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("novice_average_score"),
        infoBoxOutput("novice_average_time"),
        infoBoxOutput("novice_average_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("novice_best_accuracy"),
        infoBoxOutput("novice_average_accuracy")
      )
    ),

    tabItem(
      tabName = "multi_expert",
      h2("Multiplayer - Expert Leaderboard"),
      
      fluidRow(
        infoBoxOutput("expert_high_score"),
        infoBoxOutput("expert_fastest_time"),
        infoBoxOutput("expert_most_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("expert_average_score"),
        infoBoxOutput("expert_average_time"),
        infoBoxOutput("expert_average_rounds")
      ),
      
      fluidRow(
        infoBoxOutput("expert_best_accuracy"),
        infoBoxOutput("expert_average_accuracy")
      )
    ),

    tabItem(
      tabName = "dashboard",
      # boxes need to be put in a row (or column)
      # for column: fluidRow(
#                     column(
#                       width = 4,
          #             box(
          # )))
      selectInput(
        inputId = "names",
        label = "Names",
        choices = name_list,
        selected = NULL,
        selectize = FALSE
      ),

      fluidRow(
        #static info box
        # infoBox("Total Games Played", 10 * 2, icon = icon("credit-card")),
        
        #dynamic info box
        infoBoxOutput("dash_total_gamesBox"),
        # infoBoxOutput("progressBox"),
        infoBoxOutput("dash_high_scoreBox"),
        infoBoxOutput("dash_average_scoreBox"),
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
      h2("About Viz-Wiz"),
      p("Viz-Wiz aims to enhance visual proficiency and spatial reasoning of users.
        With various difficulty levels (Beginning I, Beginner II, Novice, and Extreme) incorporated,
        this game is suited for all age groups. Viz-Wiz can be played both individually and against other players." )
    ),
    
    tabItem(
      tabName = "team",
      h2("Introducing Team Viz-Wiz"),
      h4("Singapore University of Technology and Design (SUTD) Engineering Systems and Design (ESD) Pillar"),
      h4("40.014 Engineering Systems Architecture"),
      h4("Spring 2020"),
      p("Yeo Ying Xuan"),
      p("Ang Jia Ying"),
      p("Chi Ziheng"),
      p("Xie Peining")
      
    )
  )
)