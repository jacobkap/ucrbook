shr %>% sample_n(3)


shr_final <- data.frame(
  year = 1976:2023,
  mean_number_victims = NA,
  median_number_victims = NA,
  mean_number_offenders = NA,
  median_number_offenders = NA,
  percent_unknown_age = NA,
  median_victim_age = NA,
  mean_victim_age = NA,
  median_offender_age = NA,
  mean_offender_age = NA,
  percent_victim_male = NA,
  percent_victim_female = NA,
  percent_victim_unknown_sex = NA,
  percent_victim_unknown_race = NA,
  percent_victim_asian = NA,
  percent_victim_black = NA,
  percent_victim_american_indian = NA,
  percent_victim_white = NA,
  percent_victim_native_hawaiian = NA,
  percent_victim_hispanic = NA,
  percent_victim_not_hispanic = NA,
  percent_victim_ethnicity_unknown = NA,
  percent_offender_male = NA,
  percent_offender_female = NA,
  percent_offender_unknown_sex = NA,
  percent_offender_unknown_race = NA,
  percent_offender_asian = NA,
  percent_offender_black = NA,
  percent_offender_american_indian = NA,
  percent_offender_white = NA,
  percent_offender_native_hawaiian = NA,
  percent_offender_hispanic = NA,
  percent_offender_not_hispanic = NA,
  percent_offender_ethnicity_unknown = NA,
  
)

for (year_temp in 1976:2023) {
  temp <-
    shr %>%
    filter(year %in% year_temp)
  
  temp$victim_1_age[victim_1_age  %in% c("between 6 days and 1 year old (baby)",
                           "under 24 hours (neonate)",
                           "1 to 6 days old (newborn)")] <- 0
  temp$victim_1_age[temp$victim_1_age %in% "over 98 years old"] <- 99
  temp$victim_1_age[temp$victim_1_age %in% "unknown"] <- NA
  temp$offender_1_age[offender_1_age  %in% c("between 6 days and 1 year old (baby)",
                                         "under 24 hours (neonate)",
                                         "1 to 6 days old (newborn)")] <- 0
  temp$offender_1_age[temp$offender_1_age %in% "over 98 years old"] <- 99
  temp$offender_1_age[temp$offender_1_age %in% "unknown"] <- NA
  
  temp$victim_1_sex[is.na(temp$victim_1_sex)] <- "unknown"
  temp$offender_1_sex[is.na(temp$offender_1_sex)] <- "unknown"
  
  temp$victim_1_race[is.na(temp$victim_1_race)] <- "unknown"
  temp$offender_1_race[is.na(temp$offender_1_race)] <- "unknown"
  
  temp$victim_1_ethnic_origin[is.na(temp$victim_1_ethnic_origin)] <- "unknown"
  temp$offender_1_ethnic_origin[is.na(temp$offender_1_ethnic_origin)] <- "unknown"
  
  
  shr_final$percent_victim_male[shr_final$year %in% unique(temp$year)] <-
    mean(temp$victim_1_sex %in% "male")

  
  
}