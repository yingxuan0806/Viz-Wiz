rm(list=ls())
setwd("~/Documents/SUTD/Term 5/ESA/Project/Viz-Wiz/R-Shiny")

if (!require(shiny)) {
  install.packages("shiny")
  library(shiny)
}

if (!require(shinydasboard)) {
  install.packages("shinydashboard")
  library(shinydashboard)
}

runApp("Leaderboard")
