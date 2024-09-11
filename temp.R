offenses_known_yearly$last_month_any <- 0
offenses_known_yearly$last_month_any[!offenses_known_yearly$last_month_reported %in% "no months reported"] <- 1

offenses_known_yearly$months_missing_any <- 0
offenses_known_yearly$months_missing_any[!offenses_known_yearly$number_of_months_missing %in% 12] <- 1


offenses_known_yearly$last_month_full <- 0
offenses_known_yearly$last_month_full[offenses_known_yearly$last_month_reported %in% "december"] <- 1

offenses_known_yearly$months_missing_full <- 0
offenses_known_yearly$months_missing_full[offenses_known_yearly$number_of_months_missing %in% 0] <- 1


offense_12_months <-
  offense %>%
  group_by(year) %>%
  summarize(last_month_full = sum(last_month_full),
            months_missing_full = sum(months_missing_full)) %>%
  ungroup()
  

offense %>%
  group_by(year) %>%
  summarize(last_month_any = sum(last_month_any),
            months_missing_any = sum(months_missing_any)) %>%
  ungroup() %>%
  ggplot(aes(x = year, y = last_month_any)) +
  geom_line(aes(color = "Last Reported; >= 1 month"), size = 1.05) +
  geom_line(aes(y = months_missing_any, color = "Months Missing; >=1 month"), size = 1.05) +
  geom_line(data = offense_12_months, aes(y = last_month_full, color = "Last Reported; 12 months"), size = 1.05) +
  geom_line(data = offense_12_months, aes(y = months_missing_full, color = "Months Missing; 12 months"), size = 1.05) +
  xlab("Year") +
  ylab("# of Agencies") +
  theme_crim() +
  scale_color_manual(values = c("Last Reported; >= 1 month" = "#1b9e77",
                                "Months Missing; >=1 month" = "#d95f02",
                                "Last Reported; 12 months" = "#7570b3",
                                "Months Missing; 12 months" = "black")) +
  scale_y_continuous(labels = scales::comma) +
  labs(color = "") +
  expand_limits(y = 0)
