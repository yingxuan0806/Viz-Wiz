rm(list=ls())
setwd("~/Documents/SUTD/Term 5/ESA/Project/Viz-Wiz/Final")

if(!require(shiny)) {
  install.packages("shiny")
  library(shiny)
}

if(!require(shinydashboard)) {
  install.packages("shinydashboard")
  library(shinydashboard)
}

if(!require(DT)) {
  install.packages("DT")
  library(DT)
}

if(!require(readxl)) {
  install.packages("readxl")
  library(readxl)
}

if(!require(dplyr)) {
  install.packages("dplyr")
  library(dplyr)
}

if(!require(rAmCharts)) {
  install.packages("rAmCharts")
  library(rAmCharts)
}

# name_list <- c("A", "B", "C")
name_list <- c("Amy", "Bonnie", "Emma", "Jack", "James", "Lina", "Wayne")
# aname_list <- c(unique(df["Name"]))
# aname_list <- as.vector(unlist(aname_list))
# name_list <- unlist(name_list, use.names = FALSE)

df <- read_xlsx("Dataset.xlsx")
df[9] <- round(df[9], digits = 2)
single_df <- df[df$`Mode of Play` == "Single",]
multi_df <- df[df$`Mode of Play` == "Multiplayer",]

single_beg1_df <- single_df[single_df$`Difficulty Level` == "Beginner 1",]
single_beg2_df <- single_df[single_df$`Difficulty Level` == "Beginner 2",]
single_novice_df <- single_df[single_df$`Difficulty Level` == "Novice",]
single_expert_df <- single_df[single_df$`Difficulty Level` == "Expert",]

multi_beg1_df <- multi_df[multi_df$`Difficulty Level` == "Beginner 1",]
multi_beg2_df <- multi_df[multi_df$`Difficulty Level` == "Beginner 2",]
multi_novice_df <- multi_df[multi_df$`Difficulty Level` == "Novice",]
multi_expert_df <- multi_df[multi_df$`Difficulty Level` == "Expert",]


charts_df <- read_xlsx("amcharts.xlsx")
charts_df[5] <- round(charts_df[5], digits = 2)
single_charts_df <- charts_df[charts_df$`Mode of Play` == "Single",]
multi_charts_df <- charts_df[charts_df$`Mode of Play` == "Multiplayer",]

single_beg1_charts_df <- single_charts_df[single_charts_df$`Difficulty Level` == "Beginner 1",]
single_beg2_charts_df <- single_charts_df[single_charts_df$`Difficulty Level` == "Beginner 2",]
single_novice_charts_df <- single_charts_df[single_charts_df$`Difficulty Level` == "Novice",]
single_expert_charts_df <- single_charts_df[single_charts_df$`Difficulty Level` == "Expert",]

multi_beg1_charts_df <- multi_charts_df[multi_charts_df$`Difficulty Level` == "Beginner 1",]
multi_beg2_charts_df <- multi_charts_df[multi_charts_df$`Difficulty Level` == "Beginner 2",]
multi_novice_charts_df <- multi_charts_df[multi_charts_df$`Difficulty Level` == "Novice",]
multi_expert_charts_df <- multi_charts_df[multi_charts_df$`Difficulty Level` == "Expert",]

min(charts_df$Age) # 3
max(charts_df$Age) # 80
age_3_12 <- 0
age_13_18 <- 0
age_19_29 <- 0
age_30_50 <- 0
age_51_80 <- 0
for (i in 1:nrow(charts_df)) {
  if (charts_df[i, 1] >= 3 && charts_df[i, 1] <= 12) {
    age_3_12 = age_3_12 + 1
  } else if (charts_df[i, 1] >= 13 && charts_df[i, 1] <= 18) {
    age_13_18 = age_13_18 + 1
  } else if (charts_df[i, 1] >= 19 && charts_df[i, 1] <= 29) {
    age_19_29 = age_19_29 + 1
  } else if (charts_df[i, 1] >= 30 && charts_df[i, 1] <= 50) {
    age_30_50 = age_30_50 + 1
  } else if (charts_df[i, 1] >= 51 && charts_df[i, 1] <= 80) {
    age_51_80 = age_51_80 + 1
  }
}



ui <- dashboardPage(
  source(file.path("ui", "header.R"), local = TRUE)$value,
  source(file.path("ui", "sidebar.R"), local = TRUE)$value,
  source(file.path("ui", "body.R"), local = TRUE)$value
)

server <- function(input, output) {
  source(file.path("server", "single_beg_1.R"), local = TRUE)$value
  source(file.path("server", "single_beg_2.R"), local = TRUE)$value
  source(file.path("server", "single_novice.R"), local = TRUE)$value
  source(file.path("server", "single_expert.R"), local = TRUE)$value
  source(file.path("server", "multi_beg_1.R"), local = TRUE)$value
  source(file.path("server", "multi_beg_2.R"), local = TRUE)$value
  source(file.path("server", "multi_novice.R"), local = TRUE)$value
  source(file.path("server", "multi_expert.R"), local = TRUE)$value
  source(file.path("server", "dashboard.R"),  local = TRUE)$value
}  
  


shinyApp(ui = ui, server = server)