# # FIRST ROW



output$multi_beg_1_high_score <- renderInfoBox({
  infoBox(
    "High Score", "777", icon = icon("star"), color = "red", fill = TRUE, width = 3
  )
})

output$multi_beg_1_fastest_time <- renderInfoBox({
  infoBox("Fastest Time Taken", "omg", icon = icon("clock"), color = "purple", fill = TRUE, width = 3
  )
})

output$multi_beg_1_most_rounds <- renderInfoBox({
  infoBox(
    "Most Rounds Completed", "666", icon = icon("check-square"), color = "yellow", fill = TRUE, width = 3
  )
})


# SECOND ROW
output$multi_beg_1_average_score <- renderInfoBox({
  infoBox(
    "Average Score", "234", icon = icon("balance-scale"), color = "blue", fill = TRUE
  )
})


output$multi_beg_1_average_time <- renderInfoBox({
  infoBox("Average Time Taken", "idk yet", icon = icon("hourglass-half"), color = "olive", fill = TRUE
  )
})


output$multi_beg_1_average_rounds <- renderInfoBox({
  infoBox(
    "Average Rounds Completed", "43", icon = icon("gamepad"), color = "maroon", fill = TRUE
  )
})

# THIRD ROW
output$multi_beg_1_best_accuracy <- renderInfoBox({
  infoBox(
    "Best Accuracy", "100%", icon = icon("bullseye"), color = "navy", fill = TRUE
  )
})

output$multi_beg_1_average_accuracy <- renderInfoBox({
  infoBox(
    "Average Accuracy", "75%", icon = icon("dot-circle"), color = "navy", fill = TRUE
  )
})

# download data
output$multi_beg_1_download_data <- renderInfoBox({
  infoBox(
    "Download Data", downloadButton("multi_beg_1_download", "Download"), icon = icon("database"), color = "navy", fill = TRUE
  )
})
# download handler
output$multi_beg_1_download <- downloadHandler(
  filename = function() {
    paste("data-", Sys.Date(), ".csv", sep = " ")
  },
  content = function(file) {
    write.csv(df, file)
  }
)

# TABLE
output$multi_beg_1_table <- DT::renderDataTable(multi_beg1_df)



