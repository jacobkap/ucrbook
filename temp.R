nibrs_arrestee_summary  %>%
  ggplot(aes(x = year)) +
  geom_line(aes(y = percent_rifle_automatic, color = "Rifle"), linewidth = 1.05) +
  geom_line(aes(y = percent_shotgun_automatic , color = "Shotgun"), linewidth = 1.05) +
  geom_line(aes(y = percent_handgun_automatic , color = "Handgun"), linewidth = 1.05) +
  geom_line(aes(y = percent_firearm_type_not_stated_automatic , color = "Firearm (type not stated)"), linewidth = 1.05) +
  geom_line(aes(y = percent_other_firearm_automatic , color = "Other Firearm"), linewidth = 1.05) +
  xlab("Year") +
  ylab("% Automatic Weapon") +
  theme_crim() +
  scale_y_continuous(labels = scales::percent, expand = c(0, 0), limits = c(0, NA)) +
  labs(color = "") +
  expand_limits(y = 0) +
  scale_color_manual(values = c("Rifle" = "#1b9e77",
                                "Shotgun" = "#d95f02",
                                "Handgun" = "#7570b3",
                                "Firearm (type not stated)" = "#1f78b4",
                                "Other Firearm" = "black")) +
  scale_x_continuous(breaks = time_series_x_axis_year_breaks)