source("_common.R")


# Offender ----------------------------------------------------------------
offender_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "offender.*rds$",
  full.names = TRUE
)
offender_files

final <- data.frame(
  year = 1991:2022,
  number_of_agencies = NA,
  percent_unknown_age = NA,
  median_age = NA,
  mean_age = NA,
  percent_male = NA,
  percent_female = NA,
  percent_unknown_sex = NA,
  percent_unknown_race = NA,
  percent_asian = NA,
  percent_black = NA,
  percent_american_indian = NA,
  percent_white = NA,
  percent_native_hawaiian = NA,
  percent_hispanic = NA,
  percent_not_hispanic = NA,
  percent_ethnicity_unknown = NA
)
for (file in offender_files) {
  temp <- readRDS(file)
  temp$age_of_offender[temp$age_of_offender %in% "unknown"] <- NA
  temp$age_of_offender[temp$age_of_offender %in% "over 98 years old"] <- 99
  temp$age_of_offender <- as.numeric(temp$age_of_offender)
  temp$sex_of_offender[is.na(temp$sex_of_offender)] <- "unknown"
  temp$race_of_offender[is.na(temp$race_of_offender)] <- "unknown"
  temp$ethnicity_of_offender[is.na(temp$ethnicity_of_offender)] <- "unknown"

  final$number_of_agencies[final$year %in% unique(temp$year)] <- length(unique(temp$ori))

  # Age
  final$median_age[final$year %in% unique(temp$year)] <- median(temp$age_of_offender, na.rm = TRUE)
  final$mean_age[final$year %in% unique(temp$year)] <- mean(temp$age_of_offender, na.rm = TRUE)
  final$percent_unknown_age[final$year %in% unique(temp$year)] <- mean(is.na(temp$age_of_offender))
  # Sex
  final$percent_male[final$year %in% unique(temp$year)] <- mean(temp$sex_of_offender %in% "male")
  final$percent_female[final$year %in% unique(temp$year)] <- mean(temp$sex_of_offender %in% "female")
  final$percent_unknown_sex[final$year %in% unique(temp$year)] <- mean(temp$sex_of_offender %in% "unknown")
  # Race
  final$percent_unknown_race[final$year %in% unique(temp$year)] <- mean(temp$race_of_offender %in% "unknown")
  final$percent_asian[final$year %in% unique(temp$year)] <- mean(temp$race_of_offender %in% "asian")
  final$percent_black[final$year %in% unique(temp$year)] <- mean(temp$race_of_offender %in% "black")
  final$percent_american_indian[final$year %in% unique(temp$year)] <- mean(temp$race_of_offender %in% "american indian/alaskan native")
  final$percent_white[final$year %in% unique(temp$year)] <- mean(temp$race_of_offender %in% "white")
  final$percent_native_hawaiian[final$year %in% unique(temp$year)] <- mean(temp$race_of_offender %in% "native hawaiian or other pacific islander")
  # Ethnicity
  final$percent_hispanic[final$year %in% unique(temp$year)] <- mean(temp$ethnicity_of_offender %in% "hispanic origin")
  final$percent_not_hispanic[final$year %in% unique(temp$year)] <- mean(temp$ethnicity_of_offender %in% "not of hispanic origin")
  final$percent_ethnicity_unknown[final$year %in% unique(temp$year)] <- mean(temp$ethnicity_of_offender %in% "unknown")

  message(file)
}
final
saveRDS(final, "data/nibrs_offender_summary_stats.rds")



# Offense -----------------------------------------------------------------
offense_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "offense.*rds$",
  full.names = TRUE
)
offense_files
final <- data.frame(
  year = 1991:2022,
  number_of_agencies = NA,
  number_of_offenses = NA,
  number_murders = NA,
  percent_offense_completed = NA,
  percent_burglary_force = NA,
  percent_burglary_no_force = NA,
  percent_with_bias = NA,
  percent_at_home = NA,
  percent_murders_gun = NA,
  percent_murders_handgun = NA,
  percent_murders_unarmed = NA,
  percent_murders_knife = NA,
  percent_murders_other_weapon = NA
)

for (file in offense_files) {
  temp <- readRDS(file)

  final$number_of_agencies[final$year %in% unique(temp$year)] <- length(unique(temp$ori))
  final$number_of_offenses[final$year %in% unique(temp$year)] <- nrow(temp)
  final$number_murders[final$year %in% unique(temp$year)] <- nrow(temp_murder)
  final$percent_offense_completed[final$year %in% unique(temp$year)] <- mean(temp$offense_attempted_or_completed %in% "completed")
  final$percent_burglary_force[final$year %in% unique(temp$year)] <- mean(temp$method_of_entry[temp$ucr_offense_code %in% "burglary/breaking and entering"] %in% "force")
  final$percent_burglary_no_force[final$year %in% unique(temp$year)] <- mean(temp$method_of_entry[temp$ucr_offense_code %in% "burglary/breaking and entering"] %in% "no force")
  final$percent_with_bias[final$year %in% unique(temp$year)] <-
    mean(!temp$bias_motivation %in% c(
      "no bias motivation",
      "unknown bias motivation"
    ))
  final$percent_at_home[final$year %in% unique(temp$year)] <-
    mean(temp$location_type %in% "residence/home")
  final$percent_murders_gun[final$year %in% unique(temp$year)] <-
    mean(temp$type_weapon_force_involved_1[temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c(
        "rifle",
        "handgun",
        "shotgun",
        "firearm (type not stated)",
        "other firearm"
      ))
  final$percent_murders_handgun[final$year %in% unique(temp$year)] <-
    mean(temp$type_weapon_force_involved_1[temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c("handgun"))
  final$percent_murders_unarmed[final$year %in% unique(temp$year)] <-
    mean(temp$type_weapon_force_involved_1[temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c("personal weapons (hands, feet, teeth, etc.)"))
  final$percent_murders_knife[final$year %in% unique(temp$year)] <-
    mean(temp$type_weapon_force_involved_1[temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c("knife/cutting instrument (ice pick, screwdriver, ax, etc.)"))
  final$percent_murders_other_weapon[final$year %in% unique(temp$year)] <-
    mean(!temp$type_weapon_force_involved_1[temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c(
        "knife/cutting instrument (ice pick, screwdriver, ax, etc.)",
        "personal weapons (hands, feet, teeth, etc.)",
        "rifle",
        "handgun",
        "shotgun",
        "firearm (type not stated)",
        "other firearm"
      ))

  message(file)
}
final
saveRDS(final, "data/nibrs_offense_summary_stats.rds")



# Victim ----------------------------------------------------------------
victim_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "victim.*rds$",
  full.names = TRUE
)
victim_files

final <- data.frame(
  year = 1991:2022,
  number_of_agencies = NA,
  percent_unknown_age = NA,
  median_age = NA,
  mean_age = NA,
  percent_male = NA,
  percent_female = NA,
  percent_unknown_sex = NA,
  percent_unknown_race = NA,
  percent_asian = NA,
  percent_black = NA,
  percent_american_indian = NA,
  percent_white = NA,
  percent_native_hawaiian = NA,
  percent_hispanic = NA,
  percent_not_hispanic = NA,
  percent_ethnicity_unknown = NA,
  percent_victim_officer = NA,
  number_victim_officer = NA,
  percent_victim_individual = NA,
  percent_victim_business = NA,
  percent_resident_status_resident = NA,
  percent_resident_status_nonresident = NA,
  percent_resident_status_unknown = NA,
  percent_assault_no_injury = NA,
  percent_assault_minor_injury = NA,
  percent_assault_major_injury = NA,
  percent_assault_spouse = NA,
  number_murders_first_offense = NA,
  number_murders_all_offenses = NA,
  number_sex_offenses_first_offense = NA,
  number_sex_offenses_all_offenses = NA
)
for (file in victim_files) {
  temp <- readRDS(file)
  temp$age_of_victim[temp$age_of_victim %in% "unknown"] <- NA
  temp$age_of_victim[temp$age_of_victim %in% "over 98 years old"] <- 99
  temp$age_of_victim[temp$age_of_victim %in% c(
    "7-364 days old",
    "under 24 hours (neonate)",
    "1-6 days old"
  )] <- 0
  temp$age_of_victim <- as.numeric(temp$age_of_victim)
  temp$sex_of_victim[is.na(temp$sex_of_victim)] <- "unknown"
  temp$race_of_victim[is.na(temp$race_of_victim)] <- "unknown"
  temp$ethnicity_of_victim[is.na(temp$ethnicity_of_victim)] <- "unknown"

  temp$resident_status_of_victim[is.na(temp$resident_status_of_victim)] <- "unknown"
  temp$type_of_injury_1[is.na(temp$type_of_injury_1)] <- "unknown"

  final$number_of_agencies[final$year %in% unique(temp$year)] <- length(unique(temp$ori))

  # Age
  final$median_age[final$year %in% unique(temp$year)] <- median(temp$age_of_victim, na.rm = TRUE)
  final$mean_age[final$year %in% unique(temp$year)] <- mean(temp$age_of_victim, na.rm = TRUE)
  final$percent_unknown_age[final$year %in% unique(temp$year)] <- mean(is.na(temp$age_of_victim))
  # Sex
  final$percent_male[final$year %in% unique(temp$year)] <- mean(temp$sex_of_victim %in% "male")
  final$percent_female[final$year %in% unique(temp$year)] <- mean(temp$sex_of_victim %in% "female")
  final$percent_unknown_sex[final$year %in% unique(temp$year)] <- mean(temp$sex_of_victim %in% "unknown")
  # Race
  final$percent_unknown_race[final$year %in% unique(temp$year)] <- mean(temp$race_of_victim %in% "unknown")
  final$percent_asian[final$year %in% unique(temp$year)] <- mean(temp$race_of_victim %in% "asian")
  final$percent_black[final$year %in% unique(temp$year)] <- mean(temp$race_of_victim %in% "black")
  final$percent_american_indian[final$year %in% unique(temp$year)] <- mean(temp$race_of_victim %in% "american indian/alaskan native")
  final$percent_white[final$year %in% unique(temp$year)] <- mean(temp$race_of_victim %in% "white")
  final$percent_native_hawaiian[final$year %in% unique(temp$year)] <- mean(temp$race_of_victim %in% "native hawaiian or other pacific islander")
  # Ethnicity
  final$percent_hispanic[final$year %in% unique(temp$year)] <- mean(temp$ethnicity_of_victim %in% "hispanic origin")
  final$percent_not_hispanic[final$year %in% unique(temp$year)] <- mean(temp$ethnicity_of_victim %in% "not of hispanic origin")
  final$percent_ethnicity_unknown[final$year %in% unique(temp$year)] <- mean(temp$ethnicity_of_victim %in% "unknown")
  # Victim type
  final$percent_victim_officer[final$year %in% unique(temp$year)] <- mean(temp$type_of_victim %in% "law enforcement officer")
  final$number_victim_officer[final$year %in% unique(temp$year)] <- sum(temp$type_of_victim %in% "law enforcement officer")
  final$percent_victim_individual[final$year %in% unique(temp$year)] <- mean(temp$type_of_victim %in% "individual")
  final$percent_victim_business[final$year %in% unique(temp$year)] <- mean(temp$type_of_victim %in% "business")
  # Resident status
  final$percent_resident_status_resident[final$year %in% unique(temp$year)] <-
    mean(temp$resident_status_of_victim %in% "resident")
  final$percent_resident_status_nonresident[final$year %in% unique(temp$year)] <-
    mean(temp$resident_status_of_victim %in% "nonresident")
  final$percent_resident_status_unknown[final$year %in% unique(temp$year)] <-
    mean(temp$resident_status_of_victim %in% "unknown")

  # Assault injury
  final$percent_assault_no_injury[final$year %in% unique(temp$year)] <-
    mean(temp$type_of_injury_1[temp$ucr_offense_code_1 %in%
      c(
        "assault offenses - aggravated assault",
        "assault offenses - simple assault"
      )] %in% "none")
  final$percent_assault_minor_injury[final$year %in% unique(temp$year)] <-
    mean(temp$type_of_injury_1[temp$ucr_offense_code_1 %in%
      c(
        "assault offenses - aggravated assault",
        "assault offenses - simple assault"
      )] %in% "apparent minor injuries")
  final$percent_assault_major_injury[final$year %in% unique(temp$year)] <-
    mean(temp$type_of_injury_1[temp$ucr_offense_code_1 %in%
      c(
        "assault offenses - aggravated assault",
        "assault offenses - simple assault"
      )] %in% c(
      "apparent broken bones",
      "severe laceration",
      "possible internal injury",
      "other major injury",
      "loss of teeth",
      "unconsciousness"
    ))
  # Assault family
  final$percent_assault_spouse[final$year %in% unique(temp$year)] <-
    mean(temp$relation_of_vict_to_offender1[temp$ucr_offense_code_1 %in%
      c(
        "assault offenses - aggravated assault",
        "assault offenses - simple assault"
      )] %in%
      c(
        "victim was boyfriend/girlfriend",
        "victim was spouse",
        "victim was ex-relationship (ex-boyfriend/ex-girlfriend)",
        "victim was common-law spouse",
        "victim was ex-spouse"
      ))
  # Number murders
  final$number_murders_first_offense[final$year %in% unique(temp$year)] <-
    sum(temp$ucr_offense_code_1 %in% "murder/nonnegligent manslaughter")
  final$number_murders_all_offenses[final$year %in% unique(temp$year)] <-
    sum(temp$ucr_offense_code_1 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_2 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_3 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_4 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_5 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_6 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_7 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_8 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_9 %in% "murder/nonnegligent manslaughter" |
      temp$ucr_offense_code_10 %in% "murder/nonnegligent manslaughter")
  # Number rapes
  sex_offenses <- c(
    "sex offenses - fondling (incident liberties/child molest)",
    "sex offenses - incest",
    "sex offenses - rape",
    "sex offenses - sexual assault with an object",
    "sex offenses - sodomy",
    "sex offenses - statutory rape"
  )
  final$number_sex_offenses_first_offense[final$year %in% unique(temp$year)] <- sum(temp$ucr_offense_code_1 %in% sex_offenses)
  final$number_sex_offenses_all_offenses[final$year %in% unique(temp$year)] <- sum(temp$ucr_offense_code_1 %in% sex_offenses |
    temp$ucr_offense_code_2 %in% sex_offenses |
    temp$ucr_offense_code_3 %in% sex_offenses |
    temp$ucr_offense_code_4 %in% sex_offenses |
    temp$ucr_offense_code_5 %in% sex_offenses |
    temp$ucr_offense_code_6 %in% sex_offenses |
    temp$ucr_offense_code_7 %in% sex_offenses |
    temp$ucr_offense_code_8 %in% sex_offenses |
    temp$ucr_offense_code_9 %in% sex_offenses |
    temp$ucr_offense_code_10 %in% sex_offenses)
  message(file)
}
final
saveRDS(final, "data/nibrs_victim_summary_stats.rds")


# Batch Header ----------------------------------------------------------------
batch_header_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
                                 pattern = "batch.*rds$",
                                 full.names = TRUE
)
batch_header_files

batch_header <- data.frame()
for (file in batch_header_files) {
  temp <- readRDS(file) %>%
    mutate_if(is.character, tolower)
  batch_header <- 
    batch_header %>%
    bind_rows(temp)
  message(file)
}
saveRDS(final, "data/batch_header_all_years.rds")


# Administrative ----------------------------------------------------------------
administrative_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
                                   pattern = "administrative.*rds$",
                                   full.names = TRUE
)
administrative_files


final <- data.frame(
  year = 1991:2022,
  number_of_agencies = NA,
  percent_cleared_exceptionally = NA,
  percent_with_arrest = NA,
  percent_with_arrest_or_cleared_exceptionally = NA,
  mean_number_offense_segments = NA,
  median_number_offense_segments = NA,
  mean_number_victim_segments = NA,
  median_number_victim_segments = NA,
  mean_number_offender_segments = NA,
  median_number_offender_segments = NA,
  mean_number_arrestee_segments = NA,
  median_number_arrestee_segments = NA,
  most_common_hour = NA,
  most_common_hour_excluding_midnight = NA,
  most_common_hour_excluding_midnight_and_noon = NA,
  least_common_hour = NA,
  mean_hour = NA,
  mean_hour_excluding_midnight = NA,
  percent_hour_midnight = NA,
  percent_hour_unknown = NA
)
for (file in administrative_files) {
  temp <- readRDS(file)
  
  hour_fix <- c(
    "^on or between midnight and 00:59$" = "0",
    "^on or between 01:00 and 01:59$" = "1",
    "^on or between 02:00 and 02:59$" = "2",
    "^on or between 03:00 and 03:59$" = "3",
    "^on or between 04:00 and 04:59$" = "4",
    "^on or between 05:00 and 05:59$" = "5",
    "^on or between 06:00 and 06:59$" = "6",
    "^on or between 07:00 and 07:59$" = "7",
    "^on or between 08:00 and 08:59$" = "8",
    "^on or between 09:00 and 09:59$" = "9",
    "^on or between 10:00 and 10:59$" = "10",
    "^on or between 11:00 and 11:59$" = "11",
    "^on or between 12:00 and 12:59$" = "12",
    "^on or between 13:00 and 13:59$" = "13",
    "^on or between 14:00 and 14:59$" = "14",
    "^on or between 15:00 and 15:59$" = "15",
    "^on or between 16:00 and 16:59$" = "16",
    "^on or between 17:00 and 17:59$" = "17",
    "^on or between 18:00 and 18:59$" = "18",
    "^on or between 19:00 and 19:59$" = "19",
    "^on or between 20:00 and 20:59$" = "20",
    "^on or between 21:00 and 21:59$" = "21",
    "^on or between 22:00 and 22:59$" = "22",
    "^on or between 23:00 and 23:59$" = "23"
  )
  temp$incident_date_hour[temp$incident_date_hour %in% c("1-", "2-")] <- NA
  temp$hour <- temp$incident_date_hour
  temp$hour <- stringr::str_replace_all(temp$hour, hour_fix)
  temp$hour <- as.numeric(temp$hour)
  
  final$number_of_agencies[final$year %in% unique(temp$year)] <- length(unique(temp$ori))
  
  # Exceptionally cleared
  final$percent_cleared_exceptionally[final$year %in% unique(temp$year)] <-
    mean(!temp$cleared_exceptionally %in% "not applicable")
  # With arrest
  final$percent_with_arrest[final$year %in% unique(temp$year)] <- mean(temp$total_arrestee_segments > 0)
  final$percent_with_arrest_or_cleared_exceptionally[final$year %in% unique(temp$year)] <-
    mean(temp$total_arrestee_segments > 0 |
           !temp$cleared_exceptionally %in% "not applicable")
  # Offense segments
  final$mean_number_offense_segments[final$year %in% unique(temp$year)] <- mean(temp$total_offense_segments)
  final$median_number_offense_segments[final$year %in% unique(temp$year)] <- median(temp$total_offense_segments)
  # Victim segments
  final$mean_number_victim_segments[final$year %in% unique(temp$year)] <- mean(temp$total_victim_segments)
  final$median_number_victim_segments[final$year %in% unique(temp$year)] <- median(temp$total_victim_segments)
  # Offender segments
  final$mean_number_offender_segments[final$year %in% unique(temp$year)] <- mean(temp$total_offender_segments)
  final$median_number_offender_segments[final$year %in% unique(temp$year)] <- median(temp$total_offender_segments)
  # Arrestee segments
  final$mean_number_arrestee_segments[final$year %in% unique(temp$year)] <- mean(temp$total_arrestee_segments)
  final$median_number_arrestee_segments[final$year %in% unique(temp$year)] <- median(temp$total_arrestee_segments)
  
  # Hours
  ordered_hours <- sort(table(temp$incident_date_hour))
  ordered_hours_excluding_midnight <- sort(table(temp$incident_date_hour[!temp$incident_date_hour %in%
                                                                           "on or between midnight and 00:59"]))
  ordered_hours_excluding_midnight_and_noon <- 
    sort(table(temp$incident_date_hour[!temp$incident_date_hour %in%
                                         c("on or between midnight and 00:59",
                                           "on or between 12:00 and 12:59")                                  
    ]))
  final$mean_hour[final$year %in% unique(temp$year)] <- mean(temp$hour, na.rm = TRUE)
  final$mean_hour_excluding_midnight[final$year %in% unique(temp$year)] <- mean(temp$hour[!temp$hour %in% 0],
                                                                                na.rm = TRUE)
  
  final$most_common_hour[final$year %in% unique(temp$year)] <- names(ordered_hours[length(ordered_hours)])
  final$most_common_hour_excluding_midnight[final$year %in% unique(temp$year)] <-
    names(ordered_hours_excluding_midnight[length(ordered_hours_excluding_midnight)])
  final$most_common_hour_excluding_midnight_and_noon[final$year %in% unique(temp$year)] <-
    names(ordered_hours_excluding_midnight_and_noon[length(ordered_hours_excluding_midnight_and_noon)])
  final$least_common_hour[final$year %in% unique(temp$year)] <- names(ordered_hours[1])
  
  final$percent_hour_midnight[final$year %in% unique(temp$year)] <- mean(temp$hour %in% 0)
  final$percent_hour_unknown[final$year %in% unique(temp$year)] <- mean(is.na(temp$hour))
  
  
  message(file)
}
final
saveRDS(final, "data/nibrs_administrative_summary_stats.rds")
