library(groundhog)

# devtools::install_github("wmurphyrd/fiftystater")
library(fiftystater)


packages <- c(
  "crimeutils",
  "dplyr",
  "readr",
  "kableExtra",
  "knitr",
  "scales",
  "tidyr",
  "ggplot2",
  "mapproj",
  "lubridate",
  "gridExtra",
  "priceR",
  "blscrapeR",
  "janitor",
 # "quantmod",
  "ggh4x",
  "sf",
  "tigris",
 "stringr",
 "tidycensus",
 "patchwork"
)

groundhog.library(packages, "2024-08-27")
#library(priceR)
#library(quantmod)

# For agencies with a covered by ORI value, assign the last month reported 
# variable to the value the covering agency has

# 
# offenses_known_yearly <- readRDS("data/offenses_known_yearly_1960_2022.rds")
# offenses_known_yearly$covered_by_ori <- toupper(offenses_known_yearly$covered_by_ori)
# 
# offenses_known_yearly$ori_year <- paste(offenses_known_yearly$ori,
#                                         offenses_known_yearly$year)
# offenses_known_yearly_covered_by <-
#   offenses_known_yearly %>%
#   filter(!is.na(covered_by_ori))
# 
# offenses_known_yearly_covering <-
#   offenses_known_yearly %>%
#   filter(paste(ori, year) %in% paste(offenses_known_yearly_covered_by$covered_by_ori,
#                                      offenses_known_yearly_covered_by$year))
# 
# offenses_known_yearly_covered_by$last_month_reported_old <-
#   offenses_known_yearly_covered_by$last_month_reported
# offenses_known_yearly_covered_by$number_of_months_missing_old <-
#   offenses_known_yearly_covered_by$number_of_months_missing
# pb <- progress_bar$new(
#   format = " [:bar] :current/:total :percent eta: :eta",
#   total = nrow(offenses_known_yearly_covered_by), clear = FALSE, width= 60)
# table(offenses_known_yearly_covered_by$last_month_reported)
# table(offenses_known_yearly_covered_by$number_of_months_missing)
# for (i in 1:nrow(offenses_known_yearly_covered_by)) {
#   temp <-
#     offenses_known_yearly_covering %>%
#     filter(ori %in% offenses_known_yearly_covered_by$covered_by_ori[i],
#            year %in% offenses_known_yearly_covered_by$year[i])
#   if (nrow(temp) > 0) {
#     offenses_known_yearly_covered_by$last_month_reported[i] <- temp$last_month_reported
#     offenses_known_yearly_covered_by$number_of_months_missing[i] <- temp$number_of_months_missing
#   }
#   pb$tick()
#   
# }
# table(offenses_known_yearly_covered_by$last_month_reported)
# table(offenses_known_yearly_covered_by$number_of_months_missing)
# 
# offenses_known_yearly <-
#   offenses_known_yearly %>%
#   filter(!ori_year %in% offenses_known_yearly_covered_by$ori_year) %>%
#   bind_rows(offenses_known_yearly_covered_by)
# 
# saveRDS(offenses_known_yearly, "data/offenses_known_yearly_with_covered_by_last_month_reported.rds")

options(tidygeocoder.quiet = TRUE)
options(tidygeocoder.verbose =  FALSE)
options(readr.show_col_types = FALSE) 


# 
# knitr::opts_chunk$set(
#   comment = "#>",
#   collapse = TRUE,
#   out.width = "90%",
#   fig.align = "center",
#   fig.width = 18.33333,
#   fig.height = 13,
#  # fig.asp = (1 / 1.618033988749895), # 1 / phi
#   fig.show = "hold",
#   error = TRUE
# )


library(formatR)
knitr::opts_chunk$set(
  comment = "#",
 # collapse = TRUE,
  fig.align = 'center',
  fig.width = 12,
  fig.asp =  0.618,
  fig.show = "hold",
  #error = TRUE,
 # fig.pos = "!H",
  out.extra = "",
  tidy = "styler",
  out.width = "100%",
  out.height= "100%"
)

get_replace_single_month <- function(data, crime_col, crime) {
  data <- data[match(data$month, month.name), ]
  data$imputed_if_missing <- NA
  data <- data.frame(data)
  for (i in 1:nrow(data)) {
    rows <- 1:12
    rows <- rows[!rows %in% i]
    data$imputed_if_missing[i] <- sum(data[, crime_col][rows]) * (12 / 11)
  }
  data$imputed_if_missing <- round(data$imputed_if_missing, 0)
  data$actual_crimes <- data[, crime_col]
  data$annual_crimes <- sum(data$actual_crimes)

  data <-
    data %>%
    select(month, actual_crimes, annual_crimes, imputed_if_missing)
  data$percent_change <- get_percent_change(sum(data$actual_crimes), data$imputed_if_missing)
  data <-
    data %>%
    mutate_if(is.numeric, formatC, format = "d", big.mark = ",")


  data$actual_crimes <- as.character(data$actual_crimes)
  crime_percent <- parse_number(data$actual_crimes) / sum(parse_number(data$actual_crimes)) * 100
  crime_percent <- round(crime_percent, 2)
  crime_percent <- pad_decimals(crime_percent, 2)
  crime_percent <- paste0("(", crime_percent, "%)")
  data$actual_crimes <- paste(data$actual_crimes, crime_percent)



  names(data) <- c(
    "Month",
    paste(crime, "That Month"),
    paste("Actual Annual", crime),
    paste("Imputed Annual", crime),
    "Percent Change"
  )

  return(data)
}

get_average_months_missing_simulation <- function(data, variable) {
  results_of_months_missing <- data.frame(months_missing = 1:9,
                                          mean = NA,
                                          median = NA,
                                          min = NA,
                                          max = NA)
  
  data$variable <- data[, variable]
  actual_value <- data.frame(months_missing = 0,
                             mean = sum(data$variable),
                             median = sum(data$variable),
                             min = sum(data$variable),
                             max = sum(data$variable))
  for (n in 1:9) {
    months_missing <- n
    final <- vector(mode = "logical", length = 10000)
    set.seed(19104)
    for (i in 1:10000) {
      temp <- data[-sample(1:12, months_missing, replace = FALSE), ]
      final[i] <- sum(temp$variable) * 12 / (12 - months_missing)
    }
    results_of_months_missing$mean[n] <- mean(final)
    results_of_months_missing$median[n] <- median(final)
    results_of_months_missing$min[n] <- min(final)
    results_of_months_missing$max[n] <- max(final)
  }
  results_of_months_missing <-
    results_of_months_missing %>%
    bind_rows(actual_value) %>%
    arrange(months_missing) %>%
    mutate_if(is.numeric, round, 2)
  results_of_months_missing$months_missing[1] <- "Full data"
  results_of_months_missing$months_missing[2] <- "1 month"
  
  results_of_months_missing <-
    results_of_months_missing %>%
    rename(`# of Months Missing` = months_missing,
           `Mean Imputed Value` = mean,
           `Median Imputed Value` = median,
           `Minimum Imputed Value` = min,
           `Maximum Imputed Value` = max,
    )
  return(results_of_months_missing)
}


get_percent_change <- function(number1,
                               number2) {
  final <- number2 - number1
  final <- final / abs(number1) * 100
  final <- round(final, 2)
  final <- pad_decimals(final, 2)
  final[-grep("-", final)] <- paste0("+", final[-grep("-", final)])

  return(final)
}

get_murder_by_pop_group <- function(data) {
  data$population_group[data$population_group %in% c("city 1,000,000+",
                                                     "city 250,000 thru 499,999",
                                                     "city 500,000 thru  999,999")] <- "city 250,000+"
  data$population_group[data$population_group %in% "Non-MSA Counties/non-MSA State Police"] <- "msa counties and msa state police"
  data$population_group[data$population_group %in% "MSA Counties/MSA State Police"] <- "non-msa counties and non-msa state police"
  
  final <- data.frame(
    agency_size = c(
      "city under 2,500",
      "city 2,500 thru 9,999",
      "city 10,000 thru 24,999",
      "city 25,000 thru 49,999",
      "city 50,000 thru 99,999",
      "city 100,000 thru 249,999",
      "city 250,000+",
      "msa counties and msa state police",
      "non-msa counties and non-msa state police"
    ),
    mean_murder = NA,
    median_murder = NA,
    percentile_90 = NA,
    min_murder = NA,
    max_murder = NA
  )


  for (i in 1:nrow(final)) {
    temp <- data[data$population_group %in% final$agency_size[i], ]
    if (nrow(temp) > 0) {
    final$mean_murder[i] <- mean(temp$actual_murder)
    final$median_murder[i] <- median(temp$actual_murder)
    final$min_murder[i] <- min(temp$actual_murder)
    final$percentile_90[i] <- as.numeric(quantile(temp$actual_murder, 0.90))
    final$max_murder[i] <- max(temp$actual_murder)
    }
  }
  final <-
    final %>%
    mutate_if(is.numeric, round, 1) %>%
    mutate_if(is.numeric, formatC, format = "d", big.mark = ",") %>%
    mutate(agency_size = capitalize_words(agency_size))

  final$mean_murder[final$mean_murder == "NA"] <- "-"
  final$median_murder[final$median_murder == "NA"] <- "-"
  final$min_murder[final$min_murder == "NA"] <- "-"
  final$percentile_90[final$percentile_90 == "NA"] <- "-"
  final$max_murder[final$max_murder == "NA"] <- "-"

  final$agency_size <- gsub(" thru ", "-", final$agency_size, ignore.case = TRUE)
  final$agency_size <- gsub("msa", "MSA", final$agency_size, ignore.case = TRUE)
  final$agency_size <- gsub("And", "and", final$agency_size, ignore.case = TRUE)
  
  

  names(final) <- c(
    "Population Group",
    "Mean Murder",
    "Median Murder",
    "90th Percentile Murder",
    "Minimum Murder",
    "Max Murder"
  )

  return(final)
}


make_frequency_table_year <- function(data, column, col_names) {
  temp <- unique(data[, column])
  temp <- temp[!is.na(temp)]
  temp_df <- data.frame(
    col1 = temp,
    first_year = NA,
    number = NA
  )

  for (i in 1:nrow(temp_df)) {
    loop_value <- temp_df$col1[i]
    storage <- data[data[, column] %in% loop_value, ]
    temp_df$number[i] <- nrow(storage)
    temp_df$first_year[i] <- min(storage$year)
  }
  temp_df <-
    temp_df %>%
    mutate(percent = number / sum(number)) %>%
    arrange(
      desc(first_year),
      desc(number)
    ) %>%
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
  temp_df <- data.frame(
    col1 = temp,
    number = NA
  )

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
