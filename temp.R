offenses_with_weapons <-
  c("assault offenses - simple assault",
    "assault offenses - aggravated assault",
    "weapon law violations - weapon law violations",
    "sex offenses - sexual assault with an object",
    "sex offenses - rape",
    "robbery",
    "sex offenses - sodomy",
    "murder/nonnegligent manslaughter",
    "kidnapping/abduction",
    "sex offenses - fondling (indecent liberties/child molest)",
    "human trafficking - commercial sex acts",
    "negligent manslaughter",
    "extortion/blackmail",
    "justifiable homicide - not a crime",
    "human trafficking - involuntary servitude",
    "weapon law violations - explosives",
    "weapon law violations - violation of national firearm act of 1934")


final <- data.frame()
offense$type_weapon_force_involved_1[is.na(offense$type_weapon_force_involved_1)] <- "Unknown"
offense$type_weapon_force_involved_1[offense$type_weapon_force_involved_1 %in% 16:17] <- "Unknown"
for (crime in offenses_with_weapons) {
  temp <-
    offense %>% filter(ucr_offense_code %in% crime)
  if (nrow(temp) > 0) {
  temp <- make_frequency_table(temp,
                               "type_weapon_force_involved_1",
                               c("Weapon",
                                 "\\# of Offenses",
                                 "\\% of Offenses")) %>%
    mutate(Crime = capitalize_words(crime)) %>%
    select(`Crime`,
           `Weapon`,
           "\\# of Offenses",
           "\\% of Offenses")
  final <-
    final %>%
    bind_rows(temp)
  }
}

kableExtra::kbl(final, 
                # format = "html",
                digits = 2, 
                align = c("l", "l", "r", "r"),
                #booktabs = TRUE, 
                longtable = TRUE,
                label = "offenseWeapon",
                escape = TRUE,
                caption = "The weapon used by an offender, by offense, 2023. The use means that it was part of the crime though may not have been physically discharged. For example, pointing a gun at someone even without firing the gun is still using it.") %>%
  kable_styling(bootstrap_options = "striped", full_width = FALSE, latex_options = c("hold_position", "repeat_header"))