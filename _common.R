library(crimeutils)
library(dplyr)
library(readr)
library(DT)
library(scales)
library(ggplot2)

make_frequency_table_year <- function(data, column, col_names) {
  temp <- unique(data[, column])
  temp <- temp[!is.na(temp)]
  temp_df <- data.frame(col1 = temp,
                        first_year = NA,
                        number   = NA) 
  
  for (i in 1:nrow(temp_df)) {
    loop_value <- temp_df$col1[i]
    storage <- data[data[, column] %in% loop_value, ]
    temp_df$number[i] <- nrow(storage)
    temp_df$first_year[i] <- min(storage$year)
  }
  temp_df <-
    temp_df %>%
    mutate(percent = number / sum(number)) %>%
    arrange(desc(number),
            desc(first_year)) %>%
    mutate(col1 = crimeutils::capitalize_words(col1))
  names(temp_df) <- col_names
  return(temp_df)
}



make_frequency_table <- function(data, column, col_names) {
  temp <- unique(data[, column])
  temp <- temp[!is.na(temp)]
  temp_df <- data.frame(col1 = temp,
                        number   = NA) 
  
  for (i in 1:nrow(temp_df)) {
    loop_value <- temp_df$col1[i]
    storage <- data[data[, column] %in% loop_value, ]
    temp_df$number[i] <- nrow(storage)
  }
  temp_df <-
    temp_df %>%
    mutate(percent = number / sum(number)) %>%
    arrange(desc(number)) %>%
    mutate(col1 = crimeutils::capitalize_words(col1))
  names(temp_df) <- col_names
  return(temp_df)
}