source("_common.R")


# Offender ----------------------------------------------------------------
offender_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "offender.*rds$",
  full.names = TRUE
)
offender_files

offender_final <- data.frame(
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
  offender_temp <- readRDS(file)
  offender_temp$age_of_offender[offender_temp$age_of_offender %in% "unknown"] <- NA
  offender_temp$age_of_offender[offender_temp$age_of_offender %in% "over 98 years old"] <- 99
  offender_temp$age_of_offender <- as.numeric(offender_temp$age_of_offender)
  offender_temp$sex_of_offender[is.na(offender_temp$sex_of_offender)] <- "unknown"
  offender_temp$race_of_offender[is.na(offender_temp$race_of_offender)] <- "unknown"
  offender_temp$ethnicity_of_offender[is.na(offender_temp$ethnicity_of_offender)] <- "unknown"

  offender_final$number_of_agencies[offender_final$year %in% unique(offender_temp$year)] <- length(unique(offender_temp$ori))

  # Age
  offender_final$median_age[offender_final$year %in% unique(offender_temp$year)] <- median(offender_temp$age_of_offender, na.rm = TRUE)
  offender_final$mean_age[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$age_of_offender, na.rm = TRUE)
  offender_final$percent_unknown_age[offender_final$year %in% unique(offender_temp$year)] <- mean(is.na(offender_temp$age_of_offender))
  # Sex
  offender_final$percent_male[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$sex_of_offender %in% "male")
  offender_final$percent_female[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$sex_of_offender %in% "female")
  offender_final$percent_unknown_sex[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$sex_of_offender %in% "unknown")
  # Race
  offender_final$percent_unknown_race[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$race_of_offender %in% "unknown")
  offender_final$percent_asian[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$race_of_offender %in% "asian")
  offender_final$percent_black[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$race_of_offender %in% "black")
  offender_final$percent_american_indian[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$race_of_offender %in% "american indian/alaskan native")
  offender_final$percent_white[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$race_of_offender %in% "white")
  offender_final$percent_native_hawaiian[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$race_of_offender %in% "native hawaiian or other pacific islander")
  # Ethnicity
  offender_final$percent_hispanic[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$ethnicity_of_offender %in% "hispanic origin")
  offender_final$percent_not_hispanic[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$ethnicity_of_offender %in% "not of hispanic origin")
  offender_final$percent_ethnicity_unknown[offender_final$year %in% unique(offender_temp$year)] <- mean(offender_temp$ethnicity_of_offender %in% "unknown")

  message(file)
  message("Age")
  print(sort(unique(offender_temp$age_of_offender)))
  message("Sex")
  print(sort(unique(offender_temp$sex_of_offender)))
  message("Race")
  print(sort(unique(offender_temp$race_of_offender)))
  message("Ethnicity")
  print(sort(unique(offender_temp$ethnicity_of_offender)))
  message("\n\n\n")
}
offender_final
saveRDS(offender_final, "data/nibrs_summary_stats/nibrs_offender_summary_stats.rds")



# Offense -----------------------------------------------------------------
offense_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "offense.*rds$",
  full.names = TRUE
)
offense_files

offense_final <- data.frame(
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

offense_first_year <- data.frame()
location_first_year <- data.frame()

for (file in offense_files) {
  offense_temp <- readRDS(file) %>% distinct(unique_incident_id,
    ucr_offense_code,
    .keep_all = TRUE
  )

  offense_final$number_of_agencies[offense_final$year %in% unique(offense_temp$year)] <- length(unique(offense_temp$ori))
  offense_final$number_of_offenses[offense_final$year %in% unique(offense_temp$year)] <- nrow(offense_temp)
  offense_final$number_murders[offense_final$year %in% unique(offense_temp$year)] <-
    nrow(offense_temp[offense_temp$ucr_offense_code %in% "murder/nonnegligent manslaughter", ])

  offense_final$percent_offense_completed[offense_final$year %in% unique(offense_temp$year)] <- mean(offense_temp$offense_attempted_or_completed %in% "completed")
  offense_final$percent_burglary_force[offense_final$year %in% unique(offense_temp$year)] <- mean(offense_temp$method_of_entry[offense_temp$ucr_offense_code %in% "burglary/breaking and entering"] %in% "force")
  offense_final$percent_burglary_no_force[offense_final$year %in% unique(offense_temp$year)] <- mean(offense_temp$method_of_entry[offense_temp$ucr_offense_code %in% "burglary/breaking and entering"] %in% "no force")
  offense_final$percent_with_bias[offense_final$year %in% unique(offense_temp$year)] <-
    mean(offense_temp$bias_motivation %in% c(
      c(
        "anti-lesbian, gay, bisexual, or transgender (mixed group)",
        "anti-other christian",
        "anti-white",
        "anti-multi-racial group",
        "anti-other race/ethnicity/national origin",
        "anti-physical disability",
        "anti-gay (male)",
        "anti-black",
        "anti-mormon",
        "anti-native hawaiian or other pacific islander",
        "anti-transgender",
        "anti-sikh",
        "anti-protestant",
        "anti-multi-religious group",
        "anti-buddhist",
        "anti-gender non-conforming",
        "anti-heterosexual",
        "anti-bisexual",
        "anti-eastern orthodox (greek, russian, etc.)",
        "anti-mental disability",
        "anti-hispanic",
        "anti-arab",
        "anti-islamic (muslim)",
        "anti-female",
        "anti-jewish",
        "anti-american indian or alaskan native",
        "anti-asian",
        "anti-lesbian (female)",
        "anti-other religion",
        "anti-catholic",
        "anti-male",
        "anti-jehovahs witness",
        "anti-hindu",
        "anti-atheism/agnosticism"
      )
    ))
  offense_final$percent_at_home[offense_final$year %in% unique(offense_temp$year)] <-
    mean(offense_temp$location_type %in% "residence/home")
  # Weapon
  offense_final$percent_murders_gun[offense_final$year %in% unique(offense_temp$year)] <-
    mean(offense_temp$type_weapon_force_involved_1[offense_temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c(
        "rifle",
        "handgun",
        "shotgun",
        "firearm (type not stated)",
        "other firearm"
      ))
  offense_final$percent_murders_handgun[offense_final$year %in% unique(offense_temp$year)] <-
    mean(offense_temp$type_weapon_force_involved_1[offense_temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c("handgun"))
  offense_final$percent_murders_unarmed[offense_final$year %in% unique(offense_temp$year)] <-
    mean(offense_temp$type_weapon_force_involved_1[offense_temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c("personal weapons (hands, feet, teeth, etc.)"))
  offense_final$percent_murders_knife[offense_final$year %in% unique(offense_temp$year)] <-
    mean(offense_temp$type_weapon_force_involved_1[offense_temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c("knife/cutting instrument (ice pick, screwdriver, ax, etc.)"))
  offense_final$percent_murders_other_weapon[offense_final$year %in% unique(offense_temp$year)] <-
    mean(!offense_temp$type_weapon_force_involved_1[offense_temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c(
        "knife/cutting instrument (ice pick, screwdriver, ax, etc.)",
        "personal weapons (hands, feet, teeth, etc.)",
        "rifle",
        "handgun",
        "shotgun",
        "firearm (type not stated)",
        "other firearm"
      ))

  # Get first year offense is reported
  offenses_offense_temp <- offense_temp %>%
    distinct(ucr_offense_code) %>%
    mutate(year = unique(offense_temp$year)) %>%
    filter(!ucr_offense_code %in% offense_first_year$ucr_offense_code)
  offense_first_year <-
    offense_first_year %>%
    bind_rows(offenses_offense_temp) %>%
    arrange(
      year,
      ucr_offense_code
    )
  # Get first year location is reported
  locations_offense_temp <- offense_temp %>%
    distinct(location_type) %>%
    mutate(year = unique(offense_temp$year)) %>%
    filter(!location_type %in% location_first_year$location_type)
  location_first_year <-
    location_first_year %>%
    bind_rows(locations_offense_temp) %>%
    arrange(
      year,
      location_type
    )



  message(file)
  # message("Bias")
  # print(sort(unique(offense_temp$bias_motivation)))
  # message("Location")
  # print(sort(unique(offense_temp$location_type)))
  # message("Offense completed")
  # print(sort(unique(offense_temp$offense_atoffense_tempted_or_completed)))
  # message("Crimes")
  # print(sort(unique(offense_temp$ucr_offense_code)))
  # message("Burglary entry type")
  # print(sort(unique(offense_temp$method_of_entry[offense_temp$ucr_offense_code %in% "burglary/breaking and entering"])))
  # message("Murder weapon")
  # print(sort(unique(offense_temp$type_weapon_force_involved_1[offense_temp$ucr_offense_code %in% "murder/nonnegligent manslaughter"])))
  # message("\n\n\n")
  # Sys.sleep(10)
}
offense_final
offense_first_year
location_first_year
saveRDS(offense_final, "data/nibrs_summary_stats/nibrs_offense_summary_stats.rds")
saveRDS(offense_first_year, "data/nibrs_summary_stats/nibrs_offense_first_year.rds")
saveRDS(location_first_year, "data/nibrs_summary_stats/nibrs_location_first_year.rds")


# Victim ----------------------------------------------------------------
victim_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "victim.*rds$",
  full.names = TRUE
)
victim_files

officer_victim_offense_first_year <- data.frame()
victim_type_first_year <- data.frame()
victim_offense_first_year <- data.frame()
victim_relationship_first_year <- data.frame()
victim_agg_assault_circumstance_first_year <- data.frame()
officer_victim_relationship_first_year <- data.frame()

victim_final <- data.frame(
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
  percent_resident_status_resident_officer = NA,
  percent_resident_status_nonresident_officer = NA,
  percent_resident_status_unknown_officer = NA,
  percent_assault_no_injury = NA,
  percent_assault_minor_injury = NA,
  percent_assault_major_injury = NA,
  percent_assault_spouse = NA,
  number_murders_first_offense = NA,
  number_murders_all_offenses = NA,
  number_sex_offenses_first_offense = NA,
  number_sex_offenses_all_offenses = NA,
  number_motor_vehicle_theft_first_offense = NA,
  number_motor_vehicle_theft_all_offenses = NA,
  number_vandalism_first_offense = NA,
  number_vandalism_all_offenses = NA
)
for (file in victim_files) {
  victim_temp <- readRDS(file)
  victim_temp$age_of_victim[victim_temp$age_of_victim %in% "unknown"] <- NA
  victim_temp$age_of_victim[victim_temp$age_of_victim %in% "over 98 years old"] <- 99
  victim_temp$age_of_victim[victim_temp$age_of_victim %in% c(
    "7-364 days old",
    "under 24 hours (neonate)",
    "1-6 days old"
  )] <- 0
  victim_temp$age_of_victim <- as.numeric(victim_temp$age_of_victim)
  victim_temp$sex_of_victim[is.na(victim_temp$sex_of_victim)] <- "unknown"
  victim_temp$race_of_victim[is.na(victim_temp$race_of_victim)] <- "unknown"
  victim_temp$ethnicity_of_victim[is.na(victim_temp$ethnicity_of_victim)] <- "unknown"
  victim_temp$resident_status_of_victim[is.na(victim_temp$resident_status_of_victim)] <- "unknown"
  victim_temp$type_of_injury_1[is.na(victim_temp$type_of_injury_1)] <- "unknown"

  victim_final$number_of_agencies[victim_final$year %in% unique(victim_temp$year)] <- length(unique(victim_temp$ori))

  # Age
  victim_final$median_age[victim_final$year %in% unique(victim_temp$year)] <-
    median(victim_temp$age_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")], na.rm = TRUE)
  victim_final$mean_age[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$age_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")], na.rm = TRUE)
  victim_final$percent_unknown_age[victim_final$year %in% unique(victim_temp$year)] <-
    mean(is.na(victim_temp$age_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")]))
  # Sex
  victim_final$percent_male[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$sex_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "male")
  victim_final$percent_female[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$sex_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "female")
  victim_final$percent_unknown_sex[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$sex_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "unknown")
  # Race
  victim_final$percent_unknown_race[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$race_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "unknown")
  victim_final$percent_asian[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$race_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "asian")
  victim_final$percent_black[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$race_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "black")
  victim_final$percent_american_indian[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$race_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "american indian/alaskan native")
  victim_final$percent_white[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$race_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "white")
  victim_final$percent_native_hawaiian[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$race_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "native hawaiian or other pacific islander")
  # Ethnicity
  victim_final$percent_hispanic[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$ethnicity_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "hispanic origin")
  victim_final$percent_not_hispanic[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$ethnicity_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "not of hispanic origin")
  victim_final$percent_ethnicity_unknown[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$ethnicity_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "unknown")
  # Victim type
  victim_final$percent_victim_officer[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$type_of_victim %in% "law enforcement officer")
  victim_final$number_victim_officer[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$type_of_victim %in% "law enforcement officer")
  victim_final$percent_victim_individual[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$type_of_victim %in% "individual")
  victim_final$percent_victim_business[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$type_of_victim %in% "business")
  # Resident status
  victim_final$percent_resident_status_resident[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$resident_status_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "resident")
  victim_final$percent_resident_status_nonresident[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$resident_status_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "nonresident")
  victim_final$percent_resident_status_unknown[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$resident_status_of_victim[victim_temp$type_of_victim %in% c("individual", "law enforcement officer")] %in% "unknown")


  # Resident status officer
  victim_final$percent_resident_status_resident_officer[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$resident_status_of_victim[victim_temp$type_of_victim %in% "law enforcement officer"] %in% "resident")
  victim_final$percent_resident_status_nonresident_officer[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$resident_status_of_victim[victim_temp$type_of_victim %in% "law enforcement officer"] %in% "nonresident")
  victim_final$percent_resident_status_unknown_officer[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$resident_status_of_victim[victim_temp$type_of_victim %in% "law enforcement officer"] %in% "unknown")
  victim_final$percent_resident_status_resident_officer[is.nan(victim_final$percent_resident_status_resident_officer)] <- 0
  victim_final$percent_resident_status_nonresident_officer[is.nan(victim_final$percent_resident_status_nonresident_officer)] <- 0
  victim_final$percent_resident_status_unknown_officer[is.nan(victim_final$percent_resident_status_unknown_officer)] <- 0

  # Assault injury
  victim_final$percent_assault_no_injury[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$type_of_injury_1[victim_temp$ucr_offense_code_1 %in%
      c(
        "assault offenses - aggravated assault",
        "assault offenses - simple assault"
      )] %in% "none")
  victim_final$percent_assault_minor_injury[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$type_of_injury_1[victim_temp$ucr_offense_code_1 %in%
      c(
        "assault offenses - aggravated assault",
        "assault offenses - simple assault"
      )] %in% "apparent minor injuries")
  victim_final$percent_assault_major_injury[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$type_of_injury_1[victim_temp$ucr_offense_code_1 %in%
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
  victim_final$percent_assault_spouse[victim_final$year %in% unique(victim_temp$year)] <-
    mean(victim_temp$relation_of_vict_to_offender1[victim_temp$ucr_offense_code_1 %in%
      c(
        "assault offenses - aggravated assault",
        "assault offenses - simple assault"
      )] %in%
      c(
        "victim was boyfriend/girlfriend",
        "victim was spouse",
        "victim was ex-relationship (ex-boyfriend/ex-girlfriend)",
        "victim was common-law spouse",
        "victim was ex-spouse",
        "victim was in a homosexual relationship with the offender"
      ))
  # Number murders
  victim_final$number_murders_first_offense[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$ucr_offense_code_1 %in% "murder/nonnegligent manslaughter")
  victim_final$number_murders_all_offenses[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$ucr_offense_code_1 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_2 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_3 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_4 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_5 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_6 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_7 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_8 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_9 %in% "murder/nonnegligent manslaughter" |
      victim_temp$ucr_offense_code_10 %in% "murder/nonnegligent manslaughter")
  # Number rapes
  sex_offenses <- c(
    "sex offenses - fondling (incident liberties/child molest)",
    "sex offenses - incest",
    "sex offenses - rape",
    "sex offenses - sexual assault with an object",
    "sex offenses - sodomy",
    "sex offenses - statutory rape"
  )
  victim_final$number_sex_offenses_first_offense[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$ucr_offense_code_1 %in% sex_offenses)
  victim_final$number_sex_offenses_all_offenses[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$ucr_offense_code_1 %in% sex_offenses |
      victim_temp$ucr_offense_code_2 %in% sex_offenses |
      victim_temp$ucr_offense_code_3 %in% sex_offenses |
      victim_temp$ucr_offense_code_4 %in% sex_offenses |
      victim_temp$ucr_offense_code_5 %in% sex_offenses |
      victim_temp$ucr_offense_code_6 %in% sex_offenses |
      victim_temp$ucr_offense_code_7 %in% sex_offenses |
      victim_temp$ucr_offense_code_8 %in% sex_offenses |
      victim_temp$ucr_offense_code_9 %in% sex_offenses |
      victim_temp$ucr_offense_code_10 %in% sex_offenses)


  # Number motor vehicle theft
  victim_final$number_motor_vehicle_theft_first_offense[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$ucr_offense_code_1 %in% "motor vehicle theft")
  victim_final$number_motor_vehicle_theft_all_offenses[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$ucr_offense_code_1 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_2 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_3 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_4 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_5 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_6 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_7 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_8 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_9 %in% "motor vehicle theft" |
      victim_temp$ucr_offense_code_10 %in% "motor vehicle theft")

  # Number vandalism
  victim_final$number_vandalism_first_offense[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$ucr_offense_code_1 %in% "destruction/damage/vandalism of property")
  victim_final$number_vandalism_all_offenses[victim_final$year %in% unique(victim_temp$year)] <-
    sum(victim_temp$ucr_offense_code_1 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_2 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_3 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_4 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_5 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_6 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_7 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_8 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_9 %in% "destruction/damage/vandalism of property" |
      victim_temp$ucr_offense_code_10 %in% "destruction/damage/vandalism of property")

  # Get first year victim type is reported
  victim_type_victim_temp <- victim_temp %>%
    distinct(type_of_victim) %>%
    mutate(year = unique(victim_temp$year)) %>%
    filter(!type_of_victim %in% victim_type_first_year$type_of_victim)
  victim_type_first_year <-
    victim_type_first_year %>%
    bind_rows(victim_type_victim_temp) %>%
    arrange(
      year,
      type_of_victim
    )

  # Get first year offense is reported for officer victims
  officer_victim_offense_victim_temp <- victim_temp %>%
    filter(type_of_victim %in% "law enforcement officer") %>%
    count(ucr_offense_code_1) %>%
    rename(number_of_victims = n) %>%
    mutate(year = unique(victim_temp$year)) %>%
    filter(!ucr_offense_code_1 %in% officer_victim_offense_first_year$ucr_offense_code_1)
  officer_victim_offense_first_year <-
    officer_victim_offense_first_year %>%
    bind_rows(officer_victim_offense_victim_temp) %>%
    arrange(
      year,
      ucr_offense_code_1
    )

  # Get first year offense is reported
  victim_offense_victim_temp <- victim_temp %>%
    count(ucr_offense_code_1) %>%
    rename(number_of_victims = n) %>%
    mutate(year = unique(victim_temp$year)) %>%
    filter(!ucr_offense_code_1 %in% victim_offense_first_year$ucr_offense_code_1)
  victim_offense_first_year <-
    victim_offense_first_year %>%
    bind_rows(victim_offense_victim_temp) %>%
    arrange(
      year,
      ucr_offense_code_1
    )

  # Get first year relationship is reported
  victim_relationship_first_year_temp <- victim_temp %>%
    count(relation_of_vict_to_offender1) %>%
    rename(number_of_victims = n) %>%
    mutate(year = unique(victim_temp$year)) %>%
    filter(!relation_of_vict_to_offender1 %in% victim_relationship_first_year$relation_of_vict_to_offender1)
  victim_relationship_first_year <-
    victim_relationship_first_year %>%
    bind_rows(victim_relationship_first_year_temp) %>%
    arrange(
      year,
      relation_of_vict_to_offender1
    )

  # Get first year relationship is reported for officers
  officer_victim_relationship_first_year_temp <- victim_temp %>%
    filter(type_of_victim %in% "law enforcement officer") %>%
    count(relation_of_vict_to_offender1) %>%
    rename(number_of_victims = n) %>%
    mutate(year = unique(victim_temp$year)) %>%
    filter(!relation_of_vict_to_offender1 %in% officer_victim_relationship_first_year$relation_of_vict_to_offender1)
  officer_victim_relationship_first_year <-
    officer_victim_relationship_first_year %>%
    bind_rows(officer_victim_relationship_first_year_temp) %>%
    arrange(
      year,
      relation_of_vict_to_offender1
    )

  # Get first year agg-assault circumstance is reported
  victim_agg_assault_circumstance_first_year_temp <- victim_temp %>%
    filter(!is.na(agg_assault_homicide_circumsta1)) %>%
    count(agg_assault_homicide_circumsta1) %>%
    rename(number_of_victims = n) %>%
    mutate(year = unique(victim_temp$year)) %>%
    filter(!agg_assault_homicide_circumsta1 %in% victim_agg_assault_circumstance_first_year$agg_assault_homicide_circumsta1)
  victim_agg_assault_circumstance_first_year <-
    victim_agg_assault_circumstance_first_year %>%
    bind_rows(victim_agg_assault_circumstance_first_year_temp) %>%
    arrange(
      year,
      agg_assault_homicide_circumsta1
    )



  message(file)
  message("Age")
  print(sort(unique(victim_temp$age_of_victim)))
  message("Sex")
  print(sort(unique(victim_temp$sex_of_victim)))
  message("Race")
  print(sort(unique(victim_temp$race_of_victim)))
  message("Ethnicity")
  print(sort(unique(victim_temp$ethnicity_of_victim)))
  message("Resident status")
  print(sort(unique(victim_temp$resident_status_of_victim)))
  message("Injury")
  print(sort(unique(victim_temp$type_of_injury_1)))
  message("Type of victim")
  print(sort(unique(victim_temp$type_of_victim)))
  message("Offenses")
  print(sort(unique(victim_temp$ucr_offense_code_1)))
  Sys.sleep(10)
  message("\n\n\n")
}
victim_final
victim_type_first_year
officer_victim_offense_first_year
victim_offense_first_year
victim_relationship_first_year
victim_agg_assault_circumstance_first_year
officer_victim_relationship_first_year
saveRDS(victim_type_first_year, "data/nibrs_summary_stats/victim_type_first_year.rds")
saveRDS(officer_victim_offense_first_year, "data/nibrs_summary_stats/officer_victim_offense_first_year.rds")
saveRDS(victim_offense_first_year, "data/nibrs_summary_stats/victim_offense_first_year.rds")
saveRDS(victim_relationship_first_year, "data/nibrs_summary_stats/victim_relationship_first_year.rds")
saveRDS(victim_agg_assault_circumstance_first_year, "data/nibrs_summary_stats/victim_agg_assault_circumstance_first_year.rds")
saveRDS(officer_victim_relationship_first_year, "data/nibrs_summary_stats/officer_victim_relationship_first_year.rds")

saveRDS(victim_final, "data/nibrs_summary_stats/nibrs_victim_summary_stats.rds")


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
  if (unique(temp$year) %in% 2000) {
    temp$population <-
      as.numeric(temp$last_population_1) +
      as.numeric(temp$last_population_2) +
      as.numeric(temp$last_population_3) +
      as.numeric(temp$last_population_4) +
      as.numeric(temp$last_population_5)
  }
  batch_header <-
    batch_header %>%
    bind_rows(temp)
  message(file)
}
saveRDS(batch_header, "data/nibrs_summary_stats/batch_header_all_years.rds")


# Administrative ----------------------------------------------------------------
administrative_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "administrative.*rds$",
  full.names = TRUE
)
administrative_files


administrative_final <- data.frame(
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
  percent_hour_midnight = NA,
  percent_hour_noon = NA,
  percent_hour_unknown = NA
)
for (file in administrative_files) {
  administrative_temp <- readRDS(file)

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
  administrative_temp$incident_date_hour[administrative_temp$incident_date_hour %in% c("1-", "2-")] <- NA
  administrative_temp$hour <- administrative_temp$incident_date_hour
  administrative_temp$hour <- stringr::str_replace_all(administrative_temp$hour, hour_fix)
  administrative_temp$hour <- as.numeric(administrative_temp$hour)

  administrative_final$number_of_agencies[administrative_final$year %in% unique(administrative_temp$year)] <- length(unique(administrative_temp$ori))

  # Exceptionally cleared
  administrative_final$percent_cleared_exceptionally[administrative_final$year %in% unique(administrative_temp$year)] <-
    mean(!administrative_temp$cleared_exceptionally %in% "not applicable")
  # With arrest
  administrative_final$percent_with_arrest[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$total_arrestee_segments > 0)
  administrative_final$percent_with_arrest_or_cleared_exceptionally[administrative_final$year %in% unique(administrative_temp$year)] <-
    mean(administrative_temp$total_arrestee_segments > 0 |
      !administrative_temp$cleared_exceptionally %in% "not applicable")
  # Offense segments
  administrative_final$mean_number_offense_segments[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$total_offense_segments)
  administrative_final$median_number_offense_segments[administrative_final$year %in% unique(administrative_temp$year)] <- median(administrative_temp$total_offense_segments)
  # Victim segments
  administrative_final$mean_number_victim_segments[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$total_victim_segments)
  administrative_final$median_number_victim_segments[administrative_final$year %in% unique(administrative_temp$year)] <- median(administrative_temp$total_victim_segments)
  # Offender segments
  administrative_final$mean_number_offender_segments[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$total_offender_segments)
  administrative_final$median_number_offender_segments[administrative_final$year %in% unique(administrative_temp$year)] <- median(administrative_temp$total_offender_segments)
  # Arrestee segments
  administrative_final$mean_number_arrestee_segments[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$total_arrestee_segments)
  administrative_final$median_number_arrestee_segments[administrative_final$year %in% unique(administrative_temp$year)] <- median(administrative_temp$total_arrestee_segments)

  # Hours
  ordered_hours <- sort(table(administrative_temp$incident_date_hour))
  ordered_hours_excluding_midnight <- sort(table(administrative_temp$incident_date_hour[!administrative_temp$incident_date_hour %in%
    "on or between midnight and 00:59"]))
  ordered_hours_excluding_midnight_and_noon <-
    sort(table(administrative_temp$incident_date_hour[!administrative_temp$incident_date_hour %in%
      c(
        "on or between midnight and 00:59",
        "on or between 12:00 and 12:59"
      )]))
  administrative_final$mean_hour[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$hour, na.rm = TRUE)
  administrative_final$mean_hour_excluding_midnight[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$hour[!administrative_temp$hour %in% 0],
    na.rm = TRUE
  )

  administrative_final$most_common_hour[administrative_final$year %in% unique(administrative_temp$year)] <- names(ordered_hours[length(ordered_hours)])
  administrative_final$most_common_hour_excluding_midnight[administrative_final$year %in% unique(administrative_temp$year)] <-
    names(ordered_hours_excluding_midnight[length(ordered_hours_excluding_midnight)])
  administrative_final$most_common_hour_excluding_midnight_and_noon[administrative_final$year %in% unique(administrative_temp$year)] <-
    names(ordered_hours_excluding_midnight_and_noon[length(ordered_hours_excluding_midnight_and_noon)])
  administrative_final$least_common_hour[administrative_final$year %in% unique(administrative_temp$year)] <- names(ordered_hours[1])

  administrative_final$percent_hour_midnight[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$hour %in% 0)
  administrative_final$percent_hour_noon[administrative_final$year %in% unique(administrative_temp$year)] <- mean(administrative_temp$hour %in% 12)
  administrative_final$percent_hour_unknown[administrative_final$year %in% unique(administrative_temp$year)] <- mean(is.na(administrative_temp$hour))


  message(file)
}
administrative_final
saveRDS(administrative_final, "data/nibrs_summary_stats/nibrs_administrative_summary_stats.rds")


# Arrestee ----------------------------------------------------------------
arrestee_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "nibrs_arrestee.*rds$",
  full.names = TRUE
)
arrestee_files
group_b_arrestee_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "nibrs_group_b_arrest.*rds$",
  full.names = TRUE
)
group_b_arrestee_files

arrestee_offense_first_year <- data.frame()

arrestee_final <- data.frame(
  year = 1991:2022,
  number_of_agencies = NA,
  percent_unknown_age = NA,
  median_age = NA,
  mean_age = NA,
  percent_male = NA,
  percent_female = NA,
  percent_unknown_race = NA,
  percent_asian = NA,
  percent_black = NA,
  percent_american_indian = NA,
  percent_white = NA,
  percent_native_hawaiian = NA,
  percent_hispanic = NA,
  percent_not_hispanic = NA,
  percent_ethnicity_unknown = NA,
  percent_resident_status_resident = NA,
  percent_resident_status_nonresident = NA,
  percent_resident_status_unknown = NA,
  percent_murders_gun = NA,
  percent_murders_handgun = NA,
  percent_murders_unarmed = NA,
  percent_murders_knife = NA,
  percent_murders_club_blackjack = NA,
  percent_arrest_type_on_view = NA,
  percent_arrest_type_summoned_cited = NA,
  percent_arrest_type_taken_into_custody = NA,
  percent_murder_arrest_type_on_view = NA,
  percent_murder_arrest_type_summoned_cited = NA,
  percent_murder_arrest_type_taken_into_custody = NA,
  percent_dui_arrest_type_on_view = NA,
  percent_dui_arrest_type_summoned_cited = NA,
  percent_dui_arrest_type_taken_into_custody = NA
)
for (file in arrestee_files) {
  arrestee_temp <- readRDS(file)
  group_b_arrestee_temp <- readRDS(group_b_arrestee_files[grep(parse_number(file), group_b_arrestee_files)]) %>%
    mutate(
      automatic_weapon_indicator_1 = as.character(automatic_weapon_indicator_1),
      automatic_weapon_indicator_2 = as.character(automatic_weapon_indicator_2),
      arrestee_weapon_2 = as.character(arrestee_weapon_2)
    )
  arrestee_temp <-
    arrestee_temp %>%
    mutate(automatic_weapon_indicator_2 = as.character(automatic_weapon_indicator_2)) %>%
    bind_rows(group_b_arrestee_temp)

  arrestee_temp$age_of_arrestee[arrestee_temp$age_of_arrestee %in% "unknown"] <- NA
  arrestee_temp$age_of_arrestee[arrestee_temp$age_of_arrestee %in% "over 98 years old"] <- 99
  arrestee_temp$age_of_arrestee <- as.numeric(arrestee_temp$age_of_arrestee)
  arrestee_temp$sex_of_arrestee[is.na(arrestee_temp$sex_of_arrestee)] <- "unknown"
  arrestee_temp$race_of_arrestee[is.na(arrestee_temp$race_of_arrestee)] <- "unknown"
  arrestee_temp$ethnicity_of_arrestee[is.na(arrestee_temp$ethnicity_of_arrestee)] <- "unknown"
  arrestee_temp$resident_status_of_arrestee[is.na(arrestee_temp$resident_status_of_arrestee)] <- "unknown"

  arrestee_final$number_of_agencies[arrestee_final$year %in% unique(arrestee_temp$year)] <- length(unique(arrestee_temp$ori))

  # Age
  arrestee_final$median_age[arrestee_final$year %in% unique(arrestee_temp$year)] <- median(arrestee_temp$age_of_arrestee, na.rm = TRUE)
  arrestee_final$mean_age[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$age_of_arrestee, na.rm = TRUE)
  arrestee_final$percent_unknown_age[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(is.na(arrestee_temp$age_of_arrestee))
  # Sex
  arrestee_final$percent_male[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$sex_of_arrestee %in% "male")
  arrestee_final$percent_female[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$sex_of_arrestee %in% "female")
  # Race
  arrestee_final$percent_unknown_race[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$race_of_arrestee %in% "unknown")
  arrestee_final$percent_asian[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$race_of_arrestee %in% "asian")
  arrestee_final$percent_black[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$race_of_arrestee %in% "black")
  arrestee_final$percent_american_indian[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$race_of_arrestee %in% "american indian/alaskan native")
  arrestee_final$percent_white[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$race_of_arrestee %in% "white")
  arrestee_final$percent_native_hawaiian[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$race_of_arrestee %in% "native hawaiian or other pacific islander")
  # Ethnicity
  arrestee_final$percent_hispanic[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$ethnicity_of_arrestee %in% "hispanic origin")
  arrestee_final$percent_not_hispanic[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$ethnicity_of_arrestee %in% "not of hispanic origin")
  arrestee_final$percent_ethnicity_unknown[arrestee_final$year %in% unique(arrestee_temp$year)] <- mean(arrestee_temp$ethnicity_of_arrestee %in% "unknown")
  # Resident status
  arrestee_final$percent_resident_status_resident[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$resident_status_of_arrestee %in% "resident")
  arrestee_final$percent_resident_status_nonresident[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$resident_status_of_arrestee %in% "nonresident")
  arrestee_final$percent_resident_status_unknown[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$resident_status_of_arrestee %in% "unknown")
  # Weapon
  arrestee_final$percent_murders_gun[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$arrestee_weapon_1[arrestee_temp$ucr_arrest_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      c(
        "rifle",
        "handgun",
        "shotgun",
        "firearm (type not stated)",
        "other firearm"
      ))
  arrestee_final$percent_murders_handgun[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$arrestee_weapon_1[arrestee_temp$ucr_arrest_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      "handgun")
  arrestee_final$percent_murders_unarmed[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$arrestee_weapon_1[arrestee_temp$ucr_arrest_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      "unarmed")
  arrestee_final$percent_murders_knife[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$arrestee_weapon_1[arrestee_temp$ucr_arrest_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      "lethal cutting instrument (e.g. switchblade knife, etc.)")
  arrestee_final$percent_murders_club_blackjack[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$arrestee_weapon_1[arrestee_temp$ucr_arrest_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      "club/blackjack/brass knuckles")
  # Arrest type
  arrestee_final$percent_arrest_type_on_view[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest %in%
      "on-view arrest (taken into custody without a warrant or previous incident report)")
  arrestee_final$percent_arrest_type_summoned_cited[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest %in%
      "summoned/cited (not taken into custody)")
  arrestee_final$percent_arrest_type_taken_into_custody[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest %in%
      "taken into custody (based on warrant and/or previous incident report)")

  # Murder
  arrestee_final$percent_murder_arrest_type_on_view[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest[arrestee_temp$ucr_arrest_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      "on-view arrest (taken into custody without a warrant or previous incident report)")
  arrestee_final$percent_murder_arrest_type_summoned_cited[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest[arrestee_temp$ucr_arrest_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      "summoned/cited (not taken into custody)")
  arrestee_final$percent_murder_arrest_type_taken_into_custody[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest[arrestee_temp$ucr_arrest_offense_code %in% "murder/nonnegligent manslaughter"] %in%
      "taken into custody (based on warrant and/or previous incident report)")
  # DUI
  arrestee_final$percent_dui_arrest_type_on_view[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest[arrestee_temp$ucr_arrest_offense_code %in% "driving under the influence"] %in%
      "on-view arrest (taken into custody without a warrant or previous incident report)")
  arrestee_final$percent_dui_arrest_type_summoned_cited[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest[arrestee_temp$ucr_arrest_offense_code %in% "driving under the influence"] %in%
      "summoned/cited (not taken into custody)")
  arrestee_final$percent_dui_arrest_type_taken_into_custody[arrestee_final$year %in% unique(arrestee_temp$year)] <-
    mean(arrestee_temp$type_of_arrest[arrestee_temp$ucr_arrest_offense_code %in% "driving under the influence"] %in%
      "taken into custody (based on warrant and/or previous incident report)")

  # Get first year offense is reported
  arrestee_offenses_arrestee_temp <- arrestee_temp %>%
    distinct(ucr_arrest_offense_code) %>%
    mutate(year = unique(arrestee_temp$year)) %>%
    filter(!ucr_arrest_offense_code %in% arrestee_offense_first_year$ucr_arrest_offense_code)
  arrestee_offense_first_year <-
    arrestee_offense_first_year %>%
    bind_rows(arrestee_offenses_arrestee_temp) %>%
    arrange(
      year,
      ucr_arrest_offense_code
    )

  message(file)
  message("Age")
  print(sort(unique(arrestee_temp$age_of_arrestee)))
  message("Sex")
  print(sort(unique(arrestee_temp$sex_of_arrestee)))
  message("Race")
  print(sort(unique(arrestee_temp$race_of_arrestee)))
  message("Ethnicity")
  print(sort(unique(arrestee_temp$ethnicity_of_arrestee)))
  message("Arrest type")
  print(sort(unique(arrestee_temp$type_of_arrest)))
  message("Weapon")
  print(sort(unique(arrestee_temp$arrestee_weapon_1)))
  message("Resident status")
  print(sort(unique(arrestee_temp$resident_status_of_arrestee)))
  message("\n\n\n")
}

arrestee_offense_first_year
arrestee_final
saveRDS(arrestee_offense_first_year, "data/nibrs_summary_stats/arrestee_offense_first_year.rds")
saveRDS(arrestee_final, "data/nibrs_summary_stats/nibrs_arrestee_summary_stats.rds")


# Property ----------------------------------------------------------------
property_files <- list.files("F:/ucr_data_storage/clean_data/NIBRS",
  pattern = "nibrs_property.*rds$",
  full.names = TRUE
)
property_files

property_final <- data.frame(
  year = 1991:2022,
  number_of_agencies = NA,
  mean_value_stolen = NA,
  median_value_stolen = NA,
  max_value_stolen = NA,
  percent_stolen_max_value = NA,
  mean_value_recovered = NA,
  median_value_recovered = NA,
  max_value_recovered = NA,
  number_of_seizures = NA,
  percent_marijuana_hashish = NA,
  percent_cocaine_crack = NA,
  percent_meth = NA,
  percent_heroin_opium = NA,
  percent_other_drug = NA,
  percent_unknown_drug = NA
)

property_first_year <- data.frame()
drug_first_year <- data.frame()

for (file in property_files) {
  property_temp <- readRDS(file)
  property_temp$value_of_property[property_temp$value_of_property %in% c("unknown", "#########")] <- NA
  property_temp$value_of_property <- as.numeric(property_temp$value_of_property)
  property_final$number_of_agencies[property_final$year %in% unique(property_temp$year)] <- length(unique(property_temp$ori))
  property_temp$property_description[is.na(property_temp$property_description)] <- "unknown"

  # Stolen
  property_final$mean_value_stolen[property_final$year %in% unique(property_temp$year)] <-
    mean(
      property_temp$value_of_property[property_temp$type_of_property_loss %in%
        "stolen/etc. (includes bribed, defrauded, embezzled, extorted, ransomed, robbed, etc.)"],
      na.rm = TRUE
    )
  property_final$median_value_stolen[property_final$year %in% unique(property_temp$year)] <-
    median(
      property_temp$value_of_property[property_temp$type_of_property_loss %in%
        "stolen/etc. (includes bribed, defrauded, embezzled, extorted, ransomed, robbed, etc.)"],
      na.rm = TRUE
    )
  property_final$max_value_stolen[property_final$year %in% unique(property_temp$year)] <-
    max(
      property_temp$value_of_property[property_temp$type_of_property_loss %in%
        "stolen/etc. (includes bribed, defrauded, embezzled, extorted, ransomed, robbed, etc.)"],
      na.rm = TRUE
    )
  # Find percent of stolen value that is caused by the maximum value
  max_stolen_value <- max(
    property_temp$value_of_property[property_temp$type_of_property_loss %in%
      "stolen/etc. (includes bribed, defrauded, embezzled, extorted, ransomed, robbed, etc.)"],
    na.rm = TRUE
  )
  total_stolen_value_at_max <- sum(property_temp$value_of_property[property_temp$type_of_property_loss %in%
    "stolen/etc. (includes bribed, defrauded, embezzled, extorted, ransomed, robbed, etc.)" & property_temp$value_of_property %in% max_stolen_value])
  all_stolen_value <- sum(property_temp$value_of_property[property_temp$type_of_property_loss %in%
    "stolen/etc. (includes bribed, defrauded, embezzled, extorted, ransomed, robbed, etc.)"], na.rm = TRUE)
  property_final$percent_stolen_max_value[property_final$year %in% unique(property_temp$year)] <-
    total_stolen_value_at_max / all_stolen_value

  # Recovered
  property_final$mean_value_recovered[property_final$year %in% unique(property_temp$year)] <-
    mean(
      property_temp$value_of_property[property_temp$type_of_property_loss %in%
        "recovered"],
      na.rm = TRUE
    )
  property_final$median_value_recovered[property_final$year %in% unique(property_temp$year)] <-
    median(
      property_temp$value_of_property[property_temp$type_of_property_loss %in%
        "recovered"],
      na.rm = TRUE
    )
  property_final$max_value_recovered[property_final$year %in% unique(property_temp$year)] <-
    max(
      property_temp$value_of_property[property_temp$type_of_property_loss %in%
        "recovered"],
      na.rm = TRUE
    )
  # Drugs
  property_temp_distinct_drugs <- property_temp %>%
    distinct(unique_incident_id, suspected_drug_type_1, .keep_all = TRUE)
  property_final$number_of_seizures[property_final$year %in% unique(property_temp_distinct_drugs$year)] <-
    nrow(property_temp_distinct_drugs[property_temp_distinct_drugs$type_of_property_loss %in% "seized", ])
  property_final$percent_marijuana_hashish[property_final$year %in% unique(property_temp_distinct_drugs$year)] <-
    mean(property_temp_distinct_drugs$suspected_drug_type_1[!is.na(property_temp_distinct_drugs$suspected_drug_type_1)] %in%
      c(
        "marijuana",
        "hashish"
      ))
  property_final$percent_cocaine_crack[property_final$year %in% unique(property_temp_distinct_drugs$year)] <-
    mean(property_temp_distinct_drugs$suspected_drug_type_1[!is.na(property_temp_distinct_drugs$suspected_drug_type_1)] %in%
      c(
        "cocaine (all forms except crack)",
        "crack cocaine"
      ))
  property_final$percent_meth[property_final$year %in% unique(property_temp_distinct_drugs$year)] <-
    mean(property_temp_distinct_drugs$suspected_drug_type_1[!is.na(property_temp_distinct_drugs$suspected_drug_type_1)] %in%
      "amphetamines/methamphetamines")
  property_final$percent_heroin_opium[property_final$year %in% unique(property_temp_distinct_drugs$year)] <-
    mean(property_temp_distinct_drugs$suspected_drug_type_1[!is.na(property_temp_distinct_drugs$suspected_drug_type_1)] %in%
      c(
        "heroin",
        "opium"
      ))
  property_final$percent_other_drug[property_final$year %in% unique(property_temp_distinct_drugs$year)] <-
    mean(!property_temp_distinct_drugs$suspected_drug_type_1[!is.na(property_temp_distinct_drugs$suspected_drug_type_1)] %in%
      c(
        "marijuana",
        "hashish",
        "cocaine (all forms except crack)",
        "crack cocaine",
        "amphetamines/methamphetamines",
        "heroin",
        "opium",
        "unknown type drug"
      ))
  property_final$percent_unknown_drug[property_final$year %in% unique(property_temp_distinct_drugs$year)] <-
    mean(property_temp_distinct_drugs$suspected_drug_type_1[!is.na(property_temp_distinct_drugs$suspected_drug_type_1)] %in%
      "unknown type drug")


  # Get first year property is reported
  property_property_temp <- property_temp %>%
    distinct(property_description) %>%
    mutate(year = unique(property_temp$year)) %>%
    filter(!property_description %in% property_first_year$property_description)
  property_first_year <-
    property_first_year %>%
    bind_rows(property_property_temp) %>%
    arrange(
      year,
      property_description
    )

  # Get first year drug is reported
  drug_property_temp <- property_temp %>%
    distinct(suspected_drug_type_1) %>%
    mutate(year = unique(property_temp$year)) %>%
    filter(!suspected_drug_type_1 %in% drug_first_year$suspected_drug_type_1)
  drug_first_year <-
    drug_first_year %>%
    bind_rows(drug_property_temp) %>%
    arrange(
      year,
      suspected_drug_type_1
    )

  message(file)
  message("Type of propeperty loss")
  print(sort(unique(property_temp$type_of_property_loss)))
  message("Drugs")
  print(sort(unique(property_temp$suspected_drug_type_1)))
  message("Property")
  print(sort(unique(property_temp$property_description)))
  message("\n\n\n")
}

property_first_year
drug_first_year
property_final
saveRDS(property_first_year, "data/nibrs_summary_stats/property_first_year.rds")
saveRDS(drug_first_year, "data/nibrs_summary_stats/drug_first_year.rds")
saveRDS(property_final, "data/nibrs_summary_stats/nibrs_property_summary_stats.rds")
