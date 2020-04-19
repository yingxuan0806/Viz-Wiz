overall_df <- df
amy_df <- df[df$Name == "Amy",]
bonnie_df <- df[df$Name == "Bonnie",]
emma_df <- df[df$Name == "Emma",]
jack_df <- df[df$Name == "Jack",]
james_df <- df[df$Name == "James",]
lina_df <- df[df$Name == "Lina",]
wayne_df <- df[df$Name == "Wayne",]

# total_games_func <- function(value) {
#   
#   
#   total_games_value <- nrow()
# }

# updateSelectInput(session, "names", choices = name_list)
# 
# output$total_games <- renderValueBox({
#   total_games_value <- nrow(df)
#   if (input$names != "Overall") {
#     # name <- tolower(input$names)
#     # df_name <- paste(name, "_df", sep = "")
#     # total_games_value <- nrow(df_name)
#     
#     total_games_value <- nrow(df %>% filter(df, Name == input$names))
#   }
#   total_games_value
#   valueBox(
#     # df <- filter()
#     
#     input$names,
#     # value = nrow(df %>% filter(df, Name == input$names)),
#     value = total_games_value,
#     subtitle = "Games Played", color = "aqua")
# })



# 
# total_games_value <- reactive(nrow(df))
# 
# observeEvent(input$names, {
# 
#   new_total_games_value <- nrow(paste(tolower(input$names), "_df", sep = ""))
#   total_games_value(new_total_games_value)
# })
# 
# output$total_games <- renderValueBox({
#   valueBox(value = total_games_value, subtitle = "Games Played", color = "aqua")
# })


# output$total_games <- renderValueBox({
#   if (input$names == "Overall") {
#     total_games_value <- nrow(df)
#   } else if (input$names == "Amy") {
#     total_games_value <- nrow(amy_df)
#   } else if (input$names == "Bonnie") {
#     total_games_value <- nrow(bonnie_df)
#   } else if (input$names == "Emma") {
#     total_games_value <- nrow(emma_df)
#   } else if (input$names == "Jack") {
#     total_games_value <- nrow(jack_df)
#   } else if (input$names == "James") {
#     total_games_value <- nrow(james_df)
#   } else if (input$names == "Lina") {
#     total_games_value <- nrow(lina_df)
#   } else if (input$names == "Wayne") {
#     total_games_value <- nrow(wayne_df)
#   }
# 
#   if (input$game_mode == "Overall")
# 
#   name <- tolower(input$names)
#   df_name <- paste(name, "_df", sep = "")
# 
#   if (input$game_mode == "Overall") {
# 
#   } else if (input$game_mode == "Single") {
#     total_games_value <- nrow(paste(df_name, "[", df_name, "$`Mode of Play` == 'Single', ]", sep = ""))
#   }
#   valueBox(value = total_games_value, subtitle = "Games Played", color = "aqua")
# })


# output$total_games <- renderValueBox({
#   if (input$names == "Overall") {
#     total_games_value <- nrow(df)
#     if (input$game_mode == "Single") {
#       total_games_value <- nrow(df[df$`Mode of Play` == "Single",])
#     } else if (input$game_mode == "Multiplayer") {
#       total_games_value <- nrow(df[df$`Mode of Play` == "Multiplayer",])
#     }
#   }
#   valueBox(value = total_games_value, subtitle = "hi2")
# })


output$total_games <- renderValueBox({
  total_games_value <- nrow(df)
  if (input$names != "Overall") {
    name_df <- df[df$Name == input$names,]
    total_games_value <- nrow(name_df) # name given
    
    if (input$game_mode != "Overall") {
      mode_df <- name_df[name_df$`Mode of Play` == input$game_mode,]
      total_games_value <- nrow(mode_df) # name and game mode given
    } else if (input$game_mode == "Overall") {
      mode_df <- name_df
      total_games_value <- nrow(mode_df) # name given
    }
    
    if (input$difficulty_level != "Overall") {
      total_games_value <- nrow(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,]) # name, mode and difficulty given
    } else if (input$difficulty_level == "Overall") { 
      total_games_value <- nrow(mode_df) #name given
    }
  }
  
  if (input$names == "Overall") {
    # name_df <- df
    total_games_value <- nrow(df)
    
    if (input$game_mode != "Overall") {
      mode_df <- df[df$`Mode of Play` == input$game_mode,]
      total_games_value <- nrow(mode_df)
    } else if (input$game_mode == "Overall") {
      mode_df <- df
      total_games_value <- nrow(mode_df)
    }
    
    if (input$difficulty_level != "Overall") {
      total_games_value <- nrow(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,])
    } else if (input$difficulty_level == "Overall") {
      total_games_value <- nrow(mode_df)
    }
  }

  valueBox(value = total_games_value, subtitle = 'Games Played')
})


output$high_score <- renderValueBox({
  high_score_value <- max(df$`High Score`, na.rm = TRUE)
  if (input$names != "Overall") {
    name_df <- df[df$Name == input$names,]
    high_score_value <- max(name_df$`High Score`, na.rm = TRUE)

    if (input$game_mode != "Overall") {
      mode_df <- name_df[name_df$`Mode of Play` == input$game_mode, ]
      high_score_value <- max(mode_df$`High Score`, na.rm = TRUE)
    } else if (input$game_mode == "Overall") {
      mode_df <- name_df
      high_score_value <- max(mode_df$`High Score`, na.rm = TRUE)
    }

    if (input$difficulty_level != "Overall") {
      # high_score_value <- mode_df[mode_df$`Difficulty Level` == input$difficulty_level, ]
      high_score_value <- max(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,]$`High Score`, na.rm = TRUE)
    } else if (input$difficulty_level == "Overall") {
      high_score_value <- max(mode_df$`High Score`, na.rm = TRUE)
    }
  }

  if (input$names == "Overall") {
    high_score_value <- max(df$`High Score`, na.rm = TRUE)
    
    if (input$game_mode != "Overall") {
      mode_df <- df[df$`Mode of Play` == input$game_mode, ]
      high_score_value <- max(mode_df$`High Score`, na.rm = TRUE)
    } else if (input$game_mode == "Overall") {
      mode_df <- df
      high_score_value <- max(mode_df$`High Score`, na.rm = TRUE)
    }
    
    if (input$difficulty_level != "Overall") {
      high_score_value <- max(mode_df[mode_df$`Difficulty Level` == input$difficulty_level, ]$`High Score`, na.rm = TRUE)
    } else if (input$difficulty_level == "Overall") {
      high_score_value <- max(mode_df$`High Score`, na.rm = TRUE)
    }
  }
  
  valueBox(value = high_score_value, subtitle = "High Score", color = "aqua")

})


output$best_accuracy <- renderValueBox({
  best_accuracy_value <- max(df$`Accuracy Percentage`, na.rm = TRUE)
  if (input$names != "Overall") {
    name_df <- df[df$Name == input$names,]
    best_accuracy_value <- max(name_df$`Accuracy Percentage`, na.rm = TRUE)
    
    if (input$game_mode != "Overall") {
      mode_df <- name_df[name_df$`Mode of Play` == input$game_mode, ]
      best_accuracy_value <- max(mode_df$`Accuracy Percentage`, na.rm = TRUE)
    } else if (input$game_mode == "Overall") {
      mode_df <- name_df
      best_accuracy_value <- max(mode_df$`Accuracy Percentage`, na.rm = TRUE)
    }
    
    if (input$difficulty_level != "Overall") {
      best_accuracy_value <- max(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,]$`Accuracy Percentage`, na.rm = TRUE)
    } else if (input$difficulty_level == "Overall") {
      best_accuracy_value <- max(mode_df$`Accuracy Percentage`, na.rm = TRUE)
    }
  }
  
  if (input$names == "Overall") {
    best_accuracy_value <- max(df$`Accuracy Percentage`, na.rm = TRUE)
    
    if (input$game_mode != "Overall") {
      mode_df <- df[df$`Mode of Play` == input$game_mode, ]
      best_accuracy_value <- max(mode_df$`Accuracy Percentage`, na.rm = TRUE)
    } else if (input$game_mode == "Overall") {
      mode_df <- df
      best_accuracy_value <- max(mode_df$`Accuracy Percentage`, na.rm = TRUE)
    }
    
    if (input$difficulty_level != "Overall") {
      best_accuracy_value <- max(mode_df[mode_df$`Difficulty Level` == input$difficulty_level, ]$`Accuracy Percentage`, na.rm = TRUE)
    } else if (input$difficulty_level == "Overall") {
      best_accuracy_value <- max(mode_df$`Accuracy Percentage`, na.rm = TRUE)
    }
  }
  
  valueBox(value = paste(best_accuracy_value, "%", sep = ""), subtitle = "Best Accuracy", color = "aqua")
  
})


output$best_time <- renderValueBox({
  best_time_value <- min(df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
  if (input$names != "Overall") {
    name_df <- df[df$Name == input$names,]
    best_time_value <- min(name_df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    
    if (input$game_mode != "Overall") {
      mode_df <- name_df[name_df$`Mode of Play` == input$game_mode, ]
      best_time_value <- min(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    } else if (input$game_mode == "Overall") {
      mode_df <- name_df
      best_time_value <- min(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    }
    
    if (input$difficulty_level != "Overall") {
      best_time_value <- min(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,]$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    } else if (input$difficulty_level == "Overall") {
      best_time_value <- min(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    }
  }
  
  if (input$names == "Overall") {
    best_time_value <- min(df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    
    if (input$game_mode != "Overall") {
      mode_df <- df[df$`Mode of Play` == input$game_mode, ]
      best_time_value <- min(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    } else if (input$game_mode == "Overall") {
      mode_df <- df
      best_time_value <- min(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    }
    
    if (input$difficulty_level != "Overall") {
      best_time_value <- min(mode_df[mode_df$`Difficulty Level` == input$difficulty_level, ]$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    } else if (input$difficulty_level == "Overall") {
      best_time_value <- min(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
    }
  }
  
  valueBox(value = paste(best_time_value, "s", sep = ""), subtitle = "Best Time per Round", color = "aqua")
  
})

output$total_rounds <- renderValueBox({
  total_rounds_value <- sum(df$`Number of Rounds Completed`)
  if (input$names != "Overall") {
    name_df <- df[df$Name == input$names,]
    total_rounds_value <- sum(name_df$`Number of Rounds Completed`)
    
    if (input$game_mode != "Overall") {
      mode_df <- name_df[name_df$`Mode of Play` == input$game_mode, ]
      total_rounds_value <- sum(mode_df$`Number of Rounds Completed`)
    } else if (input$game_mode == "Overall") {
      mode_df <- name_df
      total_rounds_value <- sum(mode_df$`Number of Rounds Completed`)
    }
    
    if (input$difficulty_level != "Overall") {
      total_rounds_value <- sum(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,]$`Number of Rounds Completed`)
    } else if (input$difficulty_level == "Overall") {
      total_rounds_value <- sum(mode_df$`Number of Rounds Completed`)
    }
  }
  
  if (input$names == "Overall") {
    total_rounds_value <- sum(df$`Number of Rounds Completed`)
    
    if (input$game_mode != "Overall") {
      mode_df <- df[df$`Mode of Play` == input$game_mode, ]
      total_rounds_value <- sum(mode_df$`Number of Rounds Completed`)
    } else if (input$game_mode == "Overall") {
      mode_df <- df
      total_rounds_value <- sum(mode_df$`Number of Rounds Completed`)
    }
    
    if (input$difficulty_level != "Overall") {
      total_rounds_value <- sum(mode_df[mode_df$`Difficulty Level` == input$difficulty_level, ]$`Number of Rounds Completed`)
    } else if (input$difficulty_level == "Overall") {
      total_rounds_value <- sum(mode_df$`Number of Rounds Completed`)
    }
  }
  
  valueBox(value = total_rounds_value, subtitle = "Rounds Completed", color = "aqua")
  
})

output$average_score <- renderValueBox({
  average_score_value <- round(mean(df$`Average Score`, na.rm = TRUE), digits = 2)
  if (input$names != "Overall") {
    name_df <- df[df$Name == input$names,]
    average_score_value <- round(mean(name_df$`Average Score`, na.rm = TRUE), digits = 2)
    
    if (input$game_mode != "Overall") {
      mode_df <- name_df[name_df$`Mode of Play` == input$game_mode, ]
      average_score_value <- round(mean(mode_df$`Average Score`, na.rm = TRUE), digits = 2)
    } else if (input$game_mode == "Overall") {
      mode_df <- name_df
      average_score_value <- round(mean(mode_df$`Average Score`, na.rm = TRUE), digits = 2)
    }
    
    if (input$difficulty_level != "Overall") {
      average_score_value <- round(mean(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,]$`Average Score`, na.rm = TRUE), digits = 2)
    } else if (input$difficulty_level == "Overall") {
      average_score_value <- round(mean(mode_df$`Average Score`, na.rm = TRUE), digits = 2)
    }
  }
  
  if (input$names == "Overall") {
    average_score_value <- round(mean(df$`Average Score`, na.rm = TRUE), digits = 2)
    
    if (input$game_mode != "Overall") {
      mode_df <- df[df$`Mode of Play` == input$game_mode, ]
      average_score_value <- round(mean(mode_df$`Average Score`, na.rm = TRUE), digits = 2)
    } else if (input$game_mode == "Overall") {
      mode_df <- df
      average_score_value <- round(mean(mode_df$`Average Score`, na.rm = TRUE), digits = 2)
    }
    
    if (input$difficulty_level != "Overall") {
      average_score_value <- round(mean(mode_df[mode_df$`Difficulty Level` == input$difficulty_level, ]$`Average Score`, na.rm = TRUE), digits = 2)
    } else if (input$difficulty_level == "Overall") {
      average_score_value <- round(mean(mode_df$`Average Score`, na.rm = TRUE), digits = 2)
    }
  }
  
  valueBox(value = average_score_value, subtitle = "Average Score", color = "aqua")
})

output$average_accuracy <- renderValueBox({
  average_accuracy_value <- round(mean(df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
  if (input$names != "Overall") {
    name_df <- df[df$Name == input$names,]
    average_accuracy_value <- round(mean(name_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    
    if (input$game_mode != "Overall") {
      mode_df <- name_df[name_df$`Mode of Play` == input$game_mode, ]
      average_accuracy_value <- round(mean(mode_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    } else if (input$game_mode == "Overall") {
      mode_df <- name_df
      average_accuracy_value <- round(mean(mode_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    }
    
    if (input$difficulty_level != "Overall") {
      average_accuracy_value <- round(mean(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,]$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    } else if (input$difficulty_level == "Overall") {
      average_accuracy_value <- round(mean(mode_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    }
  }
  
  if (input$names == "Overall") {
    average_accuracy_value <- round(mean(df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    
    if (input$game_mode != "Overall") {
      mode_df <- df[df$`Mode of Play` == input$game_mode, ]
      average_accuracy_value <- round(mean(mode_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    } else if (input$game_mode == "Overall") {
      mode_df <- df
      average_accuracy_value <- round(mean(mode_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    }
    
    if (input$difficulty_level != "Overall") {
      average_accuracy_value <- round(mean(mode_df[mode_df$`Difficulty Level` == input$difficulty_level, ]$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    } else if (input$difficulty_level == "Overall") {
      average_accuracy_value <- round(mean(mode_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
    }
  }
  
  valueBox(value = paste(average_accuracy_value, "%", sep = ""), subtitle = "Average Accuracy", color = "aqua")
})

output$average_time <- renderValueBox({
  average_time_value <- round(mean(df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
  if (input$names != "Overall") {
    name_df <- df[df$Name == input$names,]
    average_time_value <- round(mean(name_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    
    if (input$game_mode != "Overall") {
      mode_df <- name_df[name_df$`Mode of Play` == input$game_mode, ]
      average_time_value <- round(mean(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    } else if (input$game_mode == "Overall") {
      mode_df <- name_df
      average_time_value <- round(mean(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    }
    
    if (input$difficulty_level != "Overall") {
      average_time_value <- round(mean(mode_df[mode_df$`Difficulty Level` == input$difficulty_level,]$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    } else if (input$difficulty_level == "Overall") {
      average_time_value <- round(mean(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    }
  }
  
  if (input$names == "Overall") {
    average_time_value <- round(mean(df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    
    if (input$game_mode != "Overall") {
      mode_df <- df[df$`Mode of Play` == input$game_mode, ]
      average_time_value <- round(mean(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    } else if (input$game_mode == "Overall") {
      mode_df <- df
      average_time_value <- round(mean(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    }
    
    if (input$difficulty_level != "Overall") {
      average_time_value <- round(mean(mode_df[mode_df$`Difficulty Level` == input$difficulty_level, ]$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    } else if (input$difficulty_level == "Overall") {
      average_time_value <- round(mean(mode_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
    }
  }
  valueBox(value = paste(average_time_value, "s", sep = ""), subtitle = "Average Time per Round", color = "aqua")
})

output$dash_download_data <- renderValueBox({
  valueBox(value = downloadButton("dash_download", "Download"), subtitle = "Download Data", color = "aqua")
})

output$dash_download <- downloadHandler(
  filename = function() {
    paste("Raw Data", Sys.Date(), ".csv", sep = " ")
  },
  content = function(file) {
    download_df <- df
    
    if (input$names != "Overall") {
      download_df <- df[df$Name == input$names, ]
      
      if (input$game_mode != "Overall")  {
        download_df <- download_df[download_df$`Mode of Play` == input$game_mode, ]
      } 
      # else if (input$game_mode == "Overall") {
      #   download_df <- download_df
      # }
      
      if (input$difficulty_level != "Overall") {
        download_df <- download_df[download_df$`Difficulty Level` == input$difficulty_level, ]
      }
    }
    
    if (input$names == "Overall") {
      download_df <- df
      if (input$game_mode != "Overall") {
        download_df <- download_df[download_df$`Mode of Play` == input$game_mode, ]
      }
      if (input$difficulty_level != "Overall") {
        download_df <- download_df[download_df$`Difficulty Level` == input$difficulty_level,]
      }
    }
    
    write.csv(download_df, file)
  }
)


output$name_table_shown <- DT::renderDataTable(DT::datatable({
  name_table_shown <- df[, c(1, 2, 3, 4, 5, 7, 11, 10, 6, 8, 9)]
  name_table_shown <- name_table_shown %>% 
    arrange(desc(df$`High Score`), desc(df$`Accuracy Percentage`), desc(df$`Average Time Taken per Round (sec)`), desc(df$`Number of Rounds Completed`), desc(df$`Score (cumulative)`), desc(df$`Average Score`), df$Date)  
  
  if (input$names != "Overall") {
    name_table_shown <- name_table_shown[name_table_shown$Name == input$names,]
  }
  
  if (input$game_mode != "Overall") {
    name_table_shown <- name_table_shown[name_table_shown$`Mode of Play` == input$game_mode,]
  }
  
  if (input$difficulty_level != "Overall") {
    name_table_shown <- name_table_shown[name_table_shown$`Difficulty Level` == input$difficulty_level,]
  }
  name_table_shown
}))


game_df <- df[ , c(1, 2, 4, 5, 6)]
date_list <- unique(game_df$Date)
score_df <- df[ , c(1, 2, 4, 5, 7, 9)]
accuracy_df <- df[ , c(1, 2, 4, 5, 11)]
time_df <- df[ , c(1, 2, 4, 5, 10)]

counter <- c()
for (i in 1:length(date_list)) {
  number <- nrow(df[df$Date == date_list[i],])
  counter <- c(counter, number)
}

# Overall
games_total_ts <- c()
rounds_total_ts <- c()
high_score_ts <- c()
average_score_ts <- c()
best_accuracy_ts <- c()
average_accuracy_ts <- c()
best_time_ts <- c()
average_time_ts <- c()

for (i in 1:length(date_list)) {
  games_one_day_df <- game_df[game_df$Date == date_list[i], ]
  one_day_games <- nrow(games_one_day_df)
  games_total_ts <- c(games_total_ts, one_day_games)
  one_day_rounds <- sum(games_one_day_df$`Number of Rounds Completed`)
  rounds_total_ts <- c(rounds_total_ts, one_day_rounds)
  
  score_one_day_df <- score_df[score_df$Date == date_list[i], ]
  one_day_high_score <- max(score_one_day_df$`High Score`, na.rm = TRUE)
  high_score_ts <- c(high_score_ts, one_day_high_score)
  one_day_average_score <- round(mean(score_one_day_df$`Average Score`, na.rm = TRUE), digits = 2)
  average_score_ts <- c(average_score_ts, one_day_average_score)
  
  accuracy_one_day_df <- accuracy_df[accuracy_df$Date == date_list[i], ]
  one_day_best_accurarcy <- max(accuracy_one_day_df$`Accuracy Percentage`, na.rm = TRUE)
  best_accuracy_ts <- c(best_accuracy_ts, one_day_best_accurarcy)
  one_day_average_accuracy <- round(mean(accuracy_one_day_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)
  average_accuracy_ts <- c(average_accuracy_ts, one_day_average_accuracy)
  
  time_one_day_df <- time_df[time_df$Date == date_list[i], ]
  one_day_best_time <- min(time_one_day_df$`Average Time Taken per Round (sec)`, na.rm = TRUE)
  best_time_ts <- c(best_time_ts, one_day_best_time)
  one_day_average_time <- round(mean(time_one_day_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
  average_time_ts <- c(average_time_ts, one_day_average_time)
}


games_df_global_shown <- data.frame(date = as.POSIXct(date_list), `Games_Played` = games_total_ts, `Rounds_Completed` = rounds_total_ts)

output$games_time_series <- renderAmCharts({
  
  amTimeSeries(data = games_df_global_shown, col_date = "date", col_series = c("Games_Played", "Rounds_Completed"),
               color = c("#e8854f", "#e8cc4f"),
               bullet = "round", linetype = 0, linewidth = c(2, 2),
               main = "Games Played & Rounds Completed",
               # ylab = "Games Played/Rounds Completed",
               creditsPosition = "bottom-right", export = TRUE,
               scrollbar = TRUE, scrollbarPosition = "bottom")
  
})


accuracy_df_global_shown <- data.frame(date = as.POSIXct(date_list), `Best_Accuracy` = best_accuracy_ts, `Average_Accuracy` = average_accuracy_ts)

output$accuracy_time_series <- renderAmCharts({
  amTimeSeries(data = accuracy_df_global_shown, col_date = "date", col_series = c("Best_Accuracy", "Average_Accuracy"),
               color = c("#4f96e8", "#49bf6e"),
               bullet = "round", linetype = 0, linewidth = c(2, 2),
               main = "Best and Average Accuracies (%)",
               # ylab = "Games Played/Rounds Completed",
               creditsPosition = "bottom-right", export = TRUE,
               scrollbar = TRUE, scrollbarPosition = "bottom")
})


score_df_global_shown <- data.frame(date = as.POSIXct(date_list), `High_Score` = high_score_ts, `Average_Score` = average_score_ts)

output$score_time_series <- renderAmCharts({
  amTimeSeries(data = score_df_global_shown, col_date = "date", col_series = c("High_Score", "Average_Score"),
               color = c("#4f96e8", "#49bf6e"),
               bullet = "round", linetype = 0, linewidth = c(2, 2),
               main = "High and Average Scores",
               creditsPosition = "bottom-right", export = TRUE,
               scrollbar = TRUE, scrollbarPosition = "bottom")
})


time_df_global_shown <- data.frame(date = as.POSIXct(date_list), Best_Time = best_time_ts, Average_Time = average_time_ts)

output$time_taken_time_series <- renderAmCharts(
  amTimeSeries(data = time_df_global_shown, col_date = "date", col_series = c("Best_Time", "Average_Time"),
               color = c("#e8854f", "#e8cc4f"),
               bullet = "round", linetype = 0, linewidth = c(2, 2),
               main = "Best and Average Time Taken per Round (s)",
               creditsPosition = "bottom-right", export = TRUE,
               scrollbar = TRUE, scrollbarPosition = "bottom")
)






