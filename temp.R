```{r nibrsVictimResidentStatusOfficer, fig.cap="The share of victims by resident status in the reporting agency's jurisdiction for law enforcement officer victims, 1991-2022."}
nibrs_victim_summary  %>%
  ggplot(aes(x = year)) +
  geom_line(aes(y = percent_resident_status_resident_officer, color = "Resident"), size = 1.05) +
  geom_line(aes(y = percent_resident_status_nonresident_officer , color = "Nonresident"), size = 1.05) +
  geom_line(aes(y = percent_resident_status_unknown_officer, color = "Unknown resident"), size = 1.05) +
  xlab("Year") +
  ylab("% of Victims") +
  theme_crim() +
  scale_y_continuous(labels = scales::percent) +
  labs(color = "") +
  expand_limits(y = 0) +
  scale_color_manual(values = c("Resident" = "#1b9e77",
                                "Nonresident" = "#d95f02",
                                "Unknown resident" = "#7570b3"))
```