sbn_high_score <- max(single_novice_df["High Score"], na.rm = TRUE)
sbn_fastest_time <- min(single_novice_df["Average Time Taken per Round (sec)"], na.rm = TRUE)
sbn_most_rounds <- max(single_novice_df["Number of Rounds Completed"], na.rm = TRUE)
sbn_average_score <- round(mean(single_novice_df$`Average Score`, na.rm = TRUE), digits = 2)
sbn_average_time <- round(mean(single_novice_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
sbn_average_rounds <- round(mean(single_novice_df$`Number of Rounds Completed`, na.rm = TRUE), digits = 2)
sbn_best_accuracy <- max(single_novice_df$`Accuracy Percentage`, na.rm = TRUE)
sbn_average_accuracy <- round(mean(single_novice_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)





# FIRST ROW
output$single_novice_high_score <- renderInfoBox({
  infoBox(
    "High Score", sbn_high_score, icon = icon("star"), color = "red", fill = TRUE, width = 3
  )
})

output$single_novice_fastest_time <- renderInfoBox({
  infoBox("Fastest Time Taken", paste(as.character(sbn_fastest_time), "s"), icon = icon("clock"), color = "purple", fill = TRUE, width = 3
  )
})

output$single_novice_most_rounds <- renderInfoBox({
  infoBox(
    "Most Rounds Completed", sbn_most_rounds, icon = icon("check-square"), color = "yellow", fill = TRUE, width = 3
  )
})


# SECOND ROW
output$single_novice_average_score <- renderInfoBox({
  infoBox(
    "Average Score", sbn_average_score, icon = icon("balance-scale"), color = "blue", fill = TRUE
  )
})


output$single_novice_average_time <- renderInfoBox({
  infoBox("Average Time Taken", paste(as.character(sbn_average_time), "s"), icon = icon("hourglass-half"), color = "olive", fill = TRUE
  )
})


output$single_novice_average_rounds <- renderInfoBox({
  infoBox(
    "Average Rounds Completed", sbn_average_rounds, icon = icon("gamepad"), color = "maroon", fill = TRUE
  )
})

# THIRD ROW
output$single_novice_best_accuracy <- renderInfoBox({
  infoBox(
    "Best Accuracy", paste(as.character(sbn_best_accuracy), "%"), icon = icon("bullseye"), color = "navy", fill = TRUE
  )
})

output$single_novice_average_accuracy <- renderInfoBox({
  infoBox(
    "Average Accuracy", paste(as.character(sbn_average_accuracy), "%"), icon = icon("dot-circle"), color = "navy", fill = TRUE
  )
})

# download data
output$single_novice_download_data <- renderInfoBox({
  infoBox(
    "Download Data", downloadButton("single_novice_download", "Download"), icon = icon("database"), color = "navy", fill = TRUE
  )
})
# download handler
output$single_novice_download <- downloadHandler(
  filename = function() {
    paste("Data - Single Novice", Sys.Date(), ".csv", sep = " ")
  },
  content = function(file) {
    write.csv(single_novice_df, file)
  }
)



# TABLE
sbn_table_shown <- single_novice_df[, c(1, 2, 3, 7, 11, 10, 6, 8, 9)]
sbn_table_shown <- sbn_table_shown %>% arrange(desc(single_novice_df$`High Score`), desc(single_novice_df$`Accuracy Percentage`), single_novice_df$`Average Time Taken per Round (sec)`, desc(single_novice_df$`Number of Rounds Completed`), desc(single_novice_df$`Score (cumulative)`), desc(single_novice_df$`Average Score`), single_novice_df$Date)

output$single_novice_table <- DT::renderDataTable(sbn_table_shown)


# GRAPH

min(single_novice_charts_df$Age) # 3
max(single_novice_charts_df$Age) # 80

sbn_age_3_12 <- 0
sbn_age_13_18 <- 0
sbn_age_19_29 <- 0
sbn_age_30_50 <- 0
sbn_age_51_80 <- 0

index_sbn_age_3_12 <- c()
index_sbn_age_13_18 <- c()
index_sbn_age_19_29 <- c()
index_sbn_age_30_50 <- c()
index_sbn_age_51_80 <- c()



for (i in 1:nrow(single_novice_charts_df)) {
  if (single_novice_charts_df[i, 1] >= 3 && single_novice_charts_df[i, 1] <= 12) {
    sbn_age_3_12 = sbn_age_3_12 + 1
    index_sbn_age_3_12 <- c(index_sbn_age_3_12, i)
  } else if (single_novice_charts_df[i, 1] >= 13 && single_novice_charts_df[i, 1] <= 18) {
    sbn_age_13_18 = sbn_age_13_18 + 1
    index_sbn_age_13_18 <- c(index_sbn_age_13_18, i)
  } else if (single_novice_charts_df[i, 1] >= 19 && single_novice_charts_df[i, 1] <= 29) {
    sbn_age_19_29 = sbn_age_19_29 + 1
    index_sbn_age_19_29 <- c(index_sbn_age_19_29, i)
  } else if (single_novice_charts_df[i, 1] >= 30 && single_novice_charts_df[i, 1] <= 50) {
    sbn_age_30_50 = sbn_age_30_50 + 1
    index_sbn_age_30_50 <- c(index_sbn_age_30_50, i)
  } else if (single_novice_charts_df[i, 1] >= 51 && single_novice_charts_df[i, 1] <= 80) {
    sbn_age_51_80 = sbn_age_51_80 + 1
    index_sbn_age_51_80 <- c(index_sbn_age_51_80, i)
  }
}


single_novice_age_3_12_df <- data.frame(single_novice_charts_df[index_sbn_age_3_12,])
single_novice_age_13_18_df <- data.frame(single_novice_charts_df[index_sbn_age_13_18,])
single_novice_age_19_29_df <- data.frame(single_novice_charts_df[index_sbn_age_19_29,])
single_novice_age_30_50_df <- data.frame(single_novice_charts_df[index_sbn_age_30_50,])
single_novice_age_51_80_df <- data.frame(single_novice_charts_df[index_sbn_age_51_80,])

sbn_age_3_12_ave_score <- mean(single_novice_age_3_12_df$Average.Score, na.rm = TRUE)
sbn_age_13_18_ave_score <- mean(single_novice_age_13_18_df$Average.Score, na.rm = TRUE)
sbn_age_19_29_ave_score <- mean(single_novice_age_19_29_df$Average.Score, na.rm = TRUE)
sbn_age_30_50_ave_score <- mean(single_novice_age_30_50_df$Average.Score, na.rm = TRUE)
sbn_age_51_80_ave_score <- mean(single_novice_age_51_80_df$Average.Score, na.rm = TRUE)

sbn_age_3_12_ave_accuracy <- mean(single_novice_age_3_12_df$Average.Accuracy, na.rm = TRUE)
sbn_age_13_18_ave_accuracy <- mean(single_novice_age_13_18_df$Average.Accuracy, na.rm = TRUE)
sbn_age_19_29_ave_accuracy <- mean(single_novice_age_19_29_df$Average.Accuracy, na.rm = TRUE)
sbn_age_30_50_ave_accuracy <- mean(single_novice_age_30_50_df$Average.Accuracy, na.rm = TRUE)
sbn_age_51_80_ave_accuracy <- mean(single_novice_age_51_80_df$Average.Accuracy, na.rm = TRUE)


sbn_age_bar_names <- c("3 - 12 Y/O", "13 - 18 Y/O", "19 - 29 Y/O", "30 - 50 Y/O", "51 - 80 Y/O")

sbn_ave_score <- c(sbn_age_3_12_ave_score, sbn_age_13_18_ave_score, sb1_age_19_29_ave_score, sbn_age_30_50_ave_score, sbn_age_51_80_ave_score)
sbn_ave_accuracy <- c(sbn_age_3_12_ave_accuracy, sbn_age_13_18_ave_accuracy, sbn_age_19_29_ave_accuracy, sbn_age_30_50_ave_accuracy, sbn_age_51_80_ave_accuracy)
sbn_ave_score_df <- data.frame(label = sbn_age_bar_names, Average_Score = sbn_ave_score)
sbn_ave_accuracy_df <- data.frame(label = sbn_age_bar_names, Average_Accuracy = sbn_ave_accuracy)

sbn_age_bar_df <- data.frame(sbn_age_group = sbn_age_bar_names, sbn_age_group_counter = c(sbn_age_3_12, sbn_age_13_18, sbn_age_19_29, sbn_age_30_50, sbn_age_51_80))


output$single_novice_ave_score <- renderAmCharts({
  amRadar(data = sbn_ave_score_df, backTransparency = 0.9, type = "circles", col = c("#f5c542")) %>%
    amOptions(main = "Average Score across Age Groups", creditsPosition = "bottom-right", export = TRUE)
})

output$single_novice_ave_accuracy <- renderAmCharts({
  amRadar(data = sbn_ave_accuracy_df, backTransparency = 0.9, type = "circles", col = c("#a0d63c")) %>%
    amOptions(main = "Average Accuracy across Age Groups", creditsPosition = "bottom-right", export = TRUE)
})

output$single_novice_age_bar <- renderAmCharts({
  amBarplot(x = "sbn_age_group", y = "sbn_age_group_counter", data = sbn_age_bar_df, depth = 15, 
            xlab = "Age Group", ylab = "Number of Players") %>%
    amOptions(main = "Age Group vs Number of Players", zoom = TRUE, scrollbar = TRUE, creditsPosition = "bottom-right", export = TRUE)
  
})

