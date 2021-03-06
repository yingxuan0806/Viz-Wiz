sb2_high_score <- max(single_beg2_df["High Score"], na.rm = TRUE)
sb2_fastest_time <- min(single_beg2_df["Average Time Taken per Round (sec)"], na.rm = TRUE)
sb2_most_rounds <- max(single_beg2_df["Number of Rounds Completed"], na.rm = TRUE)
sb2_average_score <- round(mean(single_beg2_df$`Average Score`, na.rm = TRUE), digits = 2)
sb2_average_time <- round(mean(single_beg2_df$`Average Time Taken per Round (sec)`, na.rm = TRUE), digits = 2)
sb2_average_rounds <- round(mean(single_beg2_df$`Number of Rounds Completed`, na.rm = TRUE), digits = 2)
sb2_best_accuracy <- max(single_beg2_df$`Accuracy Percentage`, na.rm = TRUE)
sb2_average_accuracy <- round(mean(single_beg2_df$`Accuracy Percentage`, na.rm = TRUE), digits = 2)





# FIRST ROW
output$single_beg_2_high_score <- renderInfoBox({
  infoBox(
    "High Score", sb2_high_score, icon = icon("star"), color = "red", fill = TRUE, width = 3
  )
})

output$single_beg_2_fastest_time <- renderInfoBox({
  infoBox("Fastest Time Taken", paste(as.character(sb2_fastest_time), "s"), icon = icon("clock"), color = "purple", fill = TRUE, width = 3
  )
})

output$single_beg_2_most_rounds <- renderInfoBox({
  infoBox(
    "Most Rounds Completed", sb2_most_rounds, icon = icon("check-square"), color = "yellow", fill = TRUE, width = 3
  )
})


# SECOND ROW
output$single_beg_2_average_score <- renderInfoBox({
  infoBox(
    "Average Score", sb2_average_score, icon = icon("balance-scale"), color = "blue", fill = TRUE
  )
})


output$single_beg_2_average_time <- renderInfoBox({
  infoBox("Average Time Taken", paste(as.character(sb2_average_time), "s"), icon = icon("hourglass-half"), color = "olive", fill = TRUE
  )
})


output$single_beg_2_average_rounds <- renderInfoBox({
  infoBox(
    "Average Rounds Completed", sb2_average_rounds, icon = icon("gamepad"), color = "maroon", fill = TRUE
  )
})

# THIRD ROW
output$single_beg_2_best_accuracy <- renderInfoBox({
  infoBox(
    "Best Accuracy", paste(as.character(sb2_best_accuracy), "%"), icon = icon("bullseye"), color = "navy", fill = TRUE
  )
})

output$single_beg_2_average_accuracy <- renderInfoBox({
  infoBox(
    "Average Accuracy", paste(as.character(sb2_average_accuracy), "%"), icon = icon("dot-circle"), color = "navy", fill = TRUE
  )
})

# download data
output$single_beg_2_download_data <- renderInfoBox({
  infoBox(
    "Download Data", downloadButton("single_beg_2_download", "Download"), icon = icon("database"), color = "navy", fill = TRUE
  )
})
# download handler
output$single_beg_2_download <- downloadHandler(
  filename = function() {
    paste("Data - Single Beginner II", Sys.Date(), ".csv", sep = " ")
  },
  content = function(file) {
    write.csv(single_beg2_df, file)
  }
)


# TABLE
sb2_table_shown <- single_beg2_df[, c(1, 2, 3, 7, 11, 10, 6, 8, 9)]
sb2_table_shown <- sb2_table_shown %>% arrange(desc(single_beg2_df$`High Score`), desc(single_beg2_df$`Accuracy Percentage`), single_beg2_df$`Average Time Taken per Round (sec)`, desc(single_beg2_df$`Number of Rounds Completed`), desc(single_beg2_df$`Score (cumulative)`), desc(single_beg2_df$`Average Score`), single_beg2_df$Date)

output$single_beg_2_table <- DT::renderDataTable(sb2_table_shown)

# GRAPH

min(single_beg2_charts_df$Age) # 3
max(single_beg2_charts_df$Age) # 80

sb2_age_3_12 <- 0
sb2_age_13_18 <- 0
sb2_age_19_29 <- 0
sb2_age_30_50 <- 0
sb2_age_51_80 <- 0

index_sb2_age_3_12 <- c()
index_sb2_age_13_18 <- c()
index_sb2_age_19_29 <- c()
index_sb2_age_30_50 <- c()
index_sb2_age_51_80 <- c()



for (i in 1:nrow(single_beg1_charts_df)) {
  if (single_beg2_charts_df[i, 1] >= 3 && single_beg2_charts_df[i, 1] <= 12) {
    sb2_age_3_12 = sb2_age_3_12 + 1
    index_sb2_age_3_12 <- c(index_sb2_age_3_12, i)
  } else if (single_beg2_charts_df[i, 1] >= 13 && single_beg2_charts_df[i, 1] <= 18) {
    sb2_age_13_18 = sb2_age_13_18 + 1
    index_sb2_age_13_18 <- c(index_sb2_age_13_18, i)
  } else if (single_beg2_charts_df[i, 1] >= 19 && single_beg2_charts_df[i, 1] <= 29) {
    sb2_age_19_29 = sb2_age_19_29 + 1
    index_sb2_age_19_29 <- c(index_sb2_age_19_29, i)
  } else if (single_beg2_charts_df[i, 1] >= 30 && single_beg2_charts_df[i, 1] <= 50) {
    sb2_age_30_50 = sb2_age_30_50 + 1
    index_sb2_age_30_50 <- c(index_sb2_age_30_50, i)
  } else if (single_beg2_charts_df[i, 1] >= 51 && single_beg2_charts_df[i, 1] <= 80) {
    sb2_age_51_80 = sb2_age_51_80 + 1
    index_sb2_age_51_80 <- c(index_sb2_age_51_80, i)
  }
}


single_beg2_age_3_12_df <- data.frame(single_beg2_charts_df[index_sb2_age_3_12,])
single_beg2_age_13_18_df <- data.frame(single_beg2_charts_df[index_sb2_age_13_18,])
single_beg2_age_19_29_df <- data.frame(single_beg2_charts_df[index_sb2_age_19_29,])
single_beg2_age_30_50_df <- data.frame(single_beg2_charts_df[index_sb2_age_30_50,])
single_beg2_age_51_80_df <- data.frame(single_beg2_charts_df[index_sb2_age_51_80,])

sb2_age_3_12_ave_score <- mean(single_beg2_age_3_12_df$Average.Score, na.rm = TRUE)
sb2_age_13_18_ave_score <- mean(single_beg2_age_13_18_df$Average.Score, na.rm = TRUE)
sb2_age_19_29_ave_score <- mean(single_beg2_age_19_29_df$Average.Score, na.rm = TRUE)
sb2_age_30_50_ave_score <- mean(single_beg2_age_30_50_df$Average.Score, na.rm = TRUE)
sb2_age_51_80_ave_score <- mean(single_beg2_age_51_80_df$Average.Score, na.rm = TRUE)

sb2_age_3_12_ave_accuracy <- mean(single_beg2_age_3_12_df$Average.Accuracy, na.rm = TRUE)
sb2_age_13_18_ave_accuracy <- mean(single_beg2_age_13_18_df$Average.Accuracy, na.rm = TRUE)
sb2_age_19_29_ave_accuracy <- mean(single_beg2_age_19_29_df$Average.Accuracy, na.rm = TRUE)
sb2_age_30_50_ave_accuracy <- mean(single_beg2_age_30_50_df$Average.Accuracy, na.rm = TRUE)
sb2_age_51_80_ave_accuracy <- mean(single_beg2_age_51_80_df$Average.Accuracy, na.rm = TRUE)


sb2_age_bar_names <- c("3 - 12 Y/O", "13 - 18 Y/O", "19 - 29 Y/O", "30 - 50 Y/O", "51 - 80 Y/O")

sb2_ave_score <- c(sb2_age_3_12_ave_score, sb2_age_13_18_ave_score, sb1_age_19_29_ave_score, sb2_age_30_50_ave_score, sb2_age_51_80_ave_score)
sb2_ave_accuracy <- c(sb2_age_3_12_ave_accuracy, sb2_age_13_18_ave_accuracy, sb2_age_19_29_ave_accuracy, sb2_age_30_50_ave_accuracy, sb2_age_51_80_ave_accuracy)
sb2_ave_score_df <- data.frame(label = sb2_age_bar_names, Average_Score = sb2_ave_score)
sb2_ave_accuracy_df <- data.frame(label = sb2_age_bar_names, Average_Accuracy = sb2_ave_accuracy)

sb2_age_bar_df <- data.frame(sb2_age_group = sb2_age_bar_names, sb2_age_group_counter = c(sb2_age_3_12, sb2_age_13_18, sb2_age_19_29, sb2_age_30_50, sb2_age_51_80))


output$single_beg_2_ave_score <- renderAmCharts({
  amRadar(data = sb2_ave_score_df, backTransparency = 0.9, type = "circles", col = c("#f5c542")) %>%
    amOptions(main = "Average Score across Age Groups", creditsPosition = "bottom-right", export = TRUE)
})

output$single_beg_2_ave_accuracy <- renderAmCharts({
  amRadar(data = sb2_ave_accuracy_df, backTransparency = 0.9, type = "circles", col = c("#a0d63c")) %>%
    amOptions(main = "Average Accuracy across Age Groups", creditsPosition = "bottom-right", export = TRUE)
})

output$single_beg_2_age_bar <- renderAmCharts({
  amBarplot(x = "sb2_age_group", y = "sb2_age_group_counter", data = sb2_age_bar_df, depth = 15, 
            xlab = "Age Group", ylab = "Number of Players") %>%
    amOptions(main = "Age Group vs Number of Players", zoom = TRUE, scrollbar = TRUE, creditsPosition = "bottom-right", export = TRUE)
  
})
