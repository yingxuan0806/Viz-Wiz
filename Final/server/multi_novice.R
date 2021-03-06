mbn_high_score <- max(multi_novice_df["High Score"], na.rm = TRUE)
mbn_fastest_time <- min(multi_novice_df["Average Time Taken per Round (sec)"], na.rm = TRUE)
mbn_most_rounds <- max(multi_novice_df["Number of Rounds Completed"], na.rm = TRUE)
mbn_average_score <- round(mean(multi_novice_df$`Average Score`, na.rm = TRUE), digits = 2)
mbn_average_time <- round(mean(multi_novice_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
mbn_average_rounds <- round(mean(multi_novice_df$`Number of Rounds Completed`, na.rm = TRUE), digits = 2)
mbn_best_accuracy <- max(multi_novice_df$`Accuracy Percentage`, na.rm = TRUE)
mbn_average_accuracy <- round(mean(multi_novice_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)


# FIRST ROW
output$multi_novice_high_score <- renderInfoBox({
  infoBox(
    "High Score", mbn_high_score, icon = icon("star"), color = "red", fill = TRUE
  )
})

output$multi_novice_fastest_time <- renderInfoBox({
  infoBox("Fastest Time Taken", paste(as.character(mbn_fastest_time), "s"), icon = icon("clock"), color = "purple", fill = TRUE
  )
})

output$multi_novice_most_rounds <- renderInfoBox({
  infoBox(
    "Most Rounds Completed", mbn_most_rounds, icon = icon("check-square"), color = "yellow", fill = TRUE
  )
})

# SECOND ROW
output$multi_novice_average_score <- renderInfoBox({
  infoBox(
    "Average Score", mbn_average_score, icon = icon("balance-scale"), color = "blue", fill = TRUE
  )
})


output$multi_novice_average_time <- renderInfoBox({
  infoBox("Average Time Taken", paste(as.character(mbn_average_time), "s"), icon = icon("hourglass-half"), color = "olive", fill = TRUE
  )
})


output$multi_novice_average_rounds <- renderInfoBox({
  infoBox(
    "Average Rounds Completed", mbn_average_rounds, icon = icon("gamepad"), color = "maroon", fill = TRUE
  )
})

# THIRD ROW
output$multi_novice_best_accuracy <- renderInfoBox({
  infoBox(
    "Best Accuracy", paste(as.character(mbn_best_accuracy), "%"), icon = icon("bullseye"), color = "navy", fill = TRUE
  )
})

output$multi_novice_average_accuracy <- renderInfoBox({
  infoBox(
    "Average Accuracy", paste(as.character(mbn_average_accuracy), "%"), icon = icon("dot-circle"), color = "navy", fill = TRUE
  )
})

# download data
output$multi_novice_download_data <- renderInfoBox({
  infoBox(
    "Download Data", downloadButton("multi_novice_download", "Download"), icon = icon("database"), color = "navy", fill = TRUE
  )
})
# download handler
output$multi_novice_download <- downloadHandler(
  filename = function() {
    paste("Data - Multi Novice", Sys.Date(), ".csv", sep = " ")
  },
  content = function(file) {
    write.csv(multi_novice_df, file)
  }
)

# TABLE
mbn_table_shown <- multi_novice_df[, c(1, 2, 3, 7, 11, 10, 6, 8, 9)]
mbn_table_shown <- mbn_table_shown %>% arrange(desc(multi_novice_df$`High Score`), desc(multi_novice_df$`Accuracy Percentage`), multi_novice_df$`Average Time Taken per Round (sec)`, desc(multi_novice_df$`Number of Rounds Completed`), desc(multi_novice_df$`Score (cumulative)`), desc(multi_novice_df$`Average Score`), multi_novice_df$Date)

output$multi_novice_table <- DT::renderDataTable(mbn_table_shown)

# GRAPH

min(multi_novice_charts_df$Age) # 3
max(multi_novice_charts_df$Age) # 80

mbn_age_3_12 <- 0
mbn_age_13_18 <- 0
mbn_age_19_29 <- 0
mbn_age_30_50 <- 0
mbn_age_51_80 <- 0

index_mbn_age_3_12 <- c()
index_mbn_age_13_18 <- c()
index_mbn_age_19_29 <- c()
index_mbn_age_30_50 <- c()
index_mbn_age_51_80 <- c()



for (i in 1:nrow(multi_novice_charts_df)) {
  if (multi_novice_charts_df[i, 1] >= 3 && multi_novice_charts_df[i, 1] <= 12) {
    mbn_age_3_12 = mbn_age_3_12 + 1
    index_mbn_age_3_12 <- c(index_mbn_age_3_12, i)
  } else if (multi_novice_charts_df[i, 1] >= 13 && multi_novice_charts_df[i, 1] <= 18) {
    mbn_age_13_18 = mbn_age_13_18 + 1
    index_mbn_age_13_18 <- c(index_mbn_age_13_18, i)
  } else if (multi_novice_charts_df[i, 1] >= 19 && multi_novice_charts_df[i, 1] <= 29) {
    mbn_age_19_29 = mbn_age_19_29 + 1
    index_mbn_age_19_29 <- c(index_mbn_age_19_29, i)
  } else if (multi_novice_charts_df[i, 1] >= 30 && multi_novice_charts_df[i, 1] <= 50) {
    mbn_age_30_50 = mbn_age_30_50 + 1
    index_mbn_age_30_50 <- c(index_mbn_age_30_50, i)
  } else if (multi_novice_charts_df[i, 1] >= 51 && multi_novice_charts_df[i, 1] <= 80) {
    mbn_age_51_80 = mbn_age_51_80 + 1
    index_mbn_age_51_80 <- c(index_mbn_age_51_80, i)
  }
}


multi_novice_age_3_12_df <- data.frame(multi_novice_charts_df[index_mbn_age_3_12,])
multi_novice_age_13_18_df <- data.frame(multi_novice_charts_df[index_mbn_age_13_18,])
multi_novice_age_19_29_df <- data.frame(multi_novice_charts_df[index_mbn_age_19_29,])
multi_novice_age_30_50_df <- data.frame(multi_novice_charts_df[index_mbn_age_30_50,])
multi_novice_age_51_80_df <- data.frame(multi_novice_charts_df[index_mbn_age_51_80,])

mbn_age_3_12_ave_score <- mean(multi_novice_age_3_12_df$Average.Score, na.rm = TRUE)
mbn_age_13_18_ave_score <- mean(multi_novice_age_13_18_df$Average.Score, na.rm = TRUE)
mbn_age_19_29_ave_score <- mean(multi_novice_age_19_29_df$Average.Score, na.rm = TRUE)
mbn_age_30_50_ave_score <- mean(multi_novice_age_30_50_df$Average.Score, na.rm = TRUE)
mbn_age_51_80_ave_score <- mean(multi_novice_age_51_80_df$Average.Score, na.rm = TRUE)

mbn_age_3_12_ave_accuracy <- mean(multi_novice_age_3_12_df$Average.Accuracy, na.rm = TRUE)
mbn_age_13_18_ave_accuracy <- mean(multi_novice_age_13_18_df$Average.Accuracy, na.rm = TRUE)
mbn_age_19_29_ave_accuracy <- mean(multi_novice_age_19_29_df$Average.Accuracy, na.rm = TRUE)
mbn_age_30_50_ave_accuracy <- mean(multi_novice_age_30_50_df$Average.Accuracy, na.rm = TRUE)
mbn_age_51_80_ave_accuracy <- mean(multi_novice_age_51_80_df$Average.Accuracy, na.rm = TRUE)


mbn_age_bar_names <- c("3 - 12 Y/O", "13 - 18 Y/O", "19 - 29 Y/O", "30 - 50 Y/O", "51 - 80 Y/O")

mbn_ave_score <- c(mbn_age_3_12_ave_score, mbn_age_13_18_ave_score, sb1_age_19_29_ave_score, mbn_age_30_50_ave_score, mbn_age_51_80_ave_score)
mbn_ave_accuracy <- c(mbn_age_3_12_ave_accuracy, mbn_age_13_18_ave_accuracy, mbn_age_19_29_ave_accuracy, mbn_age_30_50_ave_accuracy, mbn_age_51_80_ave_accuracy)
mbn_ave_score_df <- data.frame(label = mbn_age_bar_names, Average_Score = mbn_ave_score)
mbn_ave_accuracy_df <- data.frame(label = mbn_age_bar_names, Average_Accuracy = mbn_ave_accuracy)

mbn_age_bar_df <- data.frame(mbn_age_group = mbn_age_bar_names, mbn_age_group_counter = c(mbn_age_3_12, mbn_age_13_18, mbn_age_19_29, mbn_age_30_50, mbn_age_51_80))


output$multi_novice_ave_score <- renderAmCharts({
  amRadar(data = mbn_ave_score_df, backTransparency = 0.9, type = "circles", col = c("#f5c542")) %>%
    amOptions(main = "Average Score across Age Groups", creditsPosition = "bottom-right", export = TRUE)
})

output$multi_novice_ave_accuracy <- renderAmCharts({
  amRadar(data = mbn_ave_accuracy_df, backTransparency = 0.9, type = "circles", col = c("#a0d63c")) %>%
    amOptions(main = "Average Accuracy across Age Groups", creditsPosition = "bottom-right", export = TRUE)
})

output$multi_novice_age_bar <- renderAmCharts({
  amBarplot(x = "mbn_age_group", y = "mbn_age_group_counter", data = mbn_age_bar_df, depth = 15, 
            xlab = "Age Group", ylab = "Number of Players") %>%
    amOptions(main = "Age Group vs Number of Players", zoom = TRUE, scrollbar = TRUE, creditsPosition = "bottom-right", export = TRUE)
  
})


