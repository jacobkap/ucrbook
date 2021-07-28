library(crimeutils)
library(dplyr)
library(readr)
library(kableExtra)
library(knitr)
library(scales)
library(tidyr)
library(ggplot2)
library(readr)
library(mapproj)
library(lubridate)
library(gridExtra)
#devtools::install_github("wmurphyrd/fiftystater")
library(fiftystater) 
library(blscrapeR)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  out.width = "90%",
  fig.align = 'center',
  fig.width = 15.33333,
  fig.asp = (1 / 1.618033988749895),  # 1 / phi
  fig.show = "hold",
  error = TRUE
)

get_replace_single_month <- function(data, crime_col, crime) {
  
  data <- data[match(data$month, month.name), ]
  data$imputed_if_missing <- NA
  data <- data.frame(data)
  for (i in 1:nrow(data)) {
    rows <- 1:12
    rows <- rows[!rows %in% i]
    data$imputed_if_missing[i] <- sum(data[, crime_col][rows]) * (12/11)
  }
  data$imputed_if_missing <- round(data$imputed_if_missing, 2)
  data$actual_crimes <- data[, crime_col]
  data$annual_crimes <- sum(data$actual_crimes)

  data <- 
    data %>%
    select(month, actual_crimes, annual_crimes, imputed_if_missing)
  data$percent_change <- get_percent_change(data$imputed_if_missing, sum(data$actual_crimes))
  data <-
    data %>%
    mutate_if(is.numeric, formatC, format = "d", big.mark = ",")
  
  
  data$actual_crimes <- as.character(data$actual_crimes)
  crime_percent <- parse_number(data$actual_crimes) / sum(parse_number(data$actual_crimes)) * 100
  crime_percent <- round(crime_percent, 2)
  crime_percent <- pad_decimals(crime_percent, 2)
  crime_percent <- paste0("(", crime_percent, "%)")
  data$actual_crimes <- paste(data$actual_crimes, crime_percent)
  
  
  
  names(data) <- c("Month",
                   paste(crime, "That Month"),
                   paste("Actual Annual", crime),
                   paste("Imputed Annual", crime),
                   "Percent Change")
  
  return(data)
  
}




get_percent_change <- function(new_value,
                               old_value) {
  
  final <- new_value - old_value
  final <- final / old_value * 100
  final <- round(final, 2)
  final <- pad_decimals(final, 2)
  final[-grep("-", final)] <- paste0("+", final[-grep("-", final)])
  
  return(final)
}

get_murder_gun_assaults_by_pop_group <- function(data) {
  
  final <- data.frame(agency_size = c("city under 2,500",
                                      "city 2,500 thru 9,999",
                                      "city 10,000 thru 24,999",
                                      "city 25,000 thru 49,999",
                                      "city 50,000 thru 99,999",
                                      "city 100,000 thru 249,999",
                                      "city 250,000+",
                                      "msa counties and msa state police",
                                      "non-msa counties and non-msa state police"),
                      mean_murder_or_gun_ass = NA,
                      median_murder_or_gun_ass = NA,
                      min_murder_or_gun_ass = NA,
                      max_murder_or_gun_ass = NA)
  
  data$murder_gun_assaults <- data$actual_murder + data$actual_assault_with_a_gun
  
  for (i in 1:nrow(final)) {
    temp <- data[data$population_group %in% final$agency_size[i], ]
    final$mean_murder_or_gun_ass[i]   <- mean(temp$murder_gun_assaults)
    final$median_murder_or_gun_ass[i] <- median(temp$murder_gun_assaults)
    final$min_murder_or_gun_ass[i]    <- min(temp$murder_gun_assaults)
    final$max_murder_or_gun_ass[i]    <- max(temp$murder_gun_assaults)
    
  }
  final <-
    final %>%
    mutate_if(is.numeric, round, 1) %>%
    mutate_if(is.numeric, formatC, format = "d", big.mark = ",") %>%
    mutate(agency_size = capitalize_words(agency_size))
  
  final$mean_murder_or_gun_ass[final$mean_murder_or_gun_ass == "NA"]     <- "-"
  final$median_murder_or_gun_ass[final$median_murder_or_gun_ass == "NA"] <- "-"
  final$min_murder_or_gun_ass[final$min_murder_or_gun_ass == "NA"]       <- "-"
  final$max_murder_or_gun_ass[final$max_murder_or_gun_ass == "NA"]       <- "-"
  
  final$agency_size <- gsub(" thru ", "-", final$agency_size, ignore.case = TRUE)
  final$agency_size <- gsub("msa", "MSA", final$agency_size, ignore.case = TRUE)
  
  names(final) <- c("Population Group",
                    "Mean Murder + Gun Assault",
                    "Median Murder + Gun Assault", 
                    "Minimum Murder + Gun Assault",
                    "Max Murder + Gun Assault")
  
  return(final)
}


make_frequency_table_year <- function(data, column, col_names) {
  temp <- unique(data[, column])
  temp <- temp[!is.na(temp)]
  temp_df <- data.frame(col1       = temp,
                        first_year = NA,
                        number     = NA) 
  
  for (i in 1:nrow(temp_df)) {
    loop_value <- temp_df$col1[i]
    storage <- data[data[, column] %in% loop_value, ]
    temp_df$number[i] <- nrow(storage)
    temp_df$first_year[i] <- min(storage$year)
  }
  temp_df <-
    temp_df %>%
    mutate(percent = number / sum(number)) %>%
    arrange(desc(first_year),
            desc(number)) %>%
    mutate(col1 = crimeutils::capitalize_words(col1))
  temp_df$percent <- temp_df$percent * 100
  temp_df$percent <- round(temp_df$percent, 2)
  temp_df$percent <- pad_decimals(temp_df$percent, 2)
  temp_df$percent <- paste0(temp_df$percent, "\\%")
  total <- data.frame(col1 = "Total", number = sum(temp_df$number), percent = "100\\%")
  temp_df <- bind_rows(temp_df, total)
  
  temp_df$number <- formatC(temp_df$number, format = "d", big.mark = ",")
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
  
  temp_df$percent <- temp_df$percent * 100
  temp_df$percent <- round(temp_df$percent, 2)
  temp_df$percent <- pad_decimals(temp_df$percent, 2)
  temp_df$percent <- paste0(temp_df$percent, "\\%")
  total <- data.frame(col1 = "Total", number = sum(temp_df$number), percent = "100\\%")
  temp_df <- bind_rows(temp_df, total)
  
  temp_df$number <- formatC(temp_df$number, format = "d", big.mark = ",")
  
  names(temp_df) <- col_names
  return(temp_df)
}