assault_type <- leoka %>%
  filter(ori %in% "CA01942") %>%
  mutate(dummy = 1,
         assaults_total_assaults = assaults_with_injury_total + assaults_no_injury_total) %>%
  select(dummy,
         "assaults_total_assaults",
         "assaults_with_injury_gun",
         "assaults_with_injury_knife",
         "assaults_with_injury_oth_weap",
         "assaults_with_injury_unarmed",
         "assaults_with_injury_total",
         "assaults_no_injury_gun",
         "assaults_no_injury_knife",
         "assaults_no_injury_oth_weap",
         "assaults_no_injury_unarmed",
         "assaults_no_injury_total") %>%
  group_by(dummy) %>%
  summarize_all(sum)

assault_type$dummy <- NULL
assault_type <- t(assault_type)
assault_type <- data.frame(assault_type)
assault_type$type <- rownames(assault_type)
rownames(assault_type) <- NULL
assault_type$type <- gsub("assaults_", "", assault_type$type)
names(assault_type)[1] <- "assaults"
assault_type$type <- gsub("_", " ", assault_type$type)
assault_type$type <- capitalize_words(assault_type$type)
assault_type <- assault_type %>% arrange(desc(assaults))
assault_type$type <- gsub("Injury", "Injury - ", assault_type$type)
assault_type$type <- gsub("Oth Weap", "Other Weapon", assault_type$type)
assault_type$type <- factor(assault_type$type, levels = rev(assault_type$type))


assault_type$category <- assault_type$type
assault_type$category <- gsub(".*- +", "", assault_type$category)
assault_type$category <- gsub("^Total$", "Total Assaults", assault_type$category)
assault_type$type <- gsub(" -.*", "", assault_type$type)


assault_type_ordering <-
  assault_type %>%
  group_by(category) %>%
  summarize(assaults = sum(assaults)) %>%
  ungroup() %>%
  arrange(desc(assaults))

assault_type$category <- factor(assault_type$category,
                                levels = assault_type_ordering$category)

# ggplot(assault_type, aes(x = assaults, y = type)) +
#   geom_col(width    = 0.5,    
#            position = position_dodge(0.5)) +
#   xlab("# of Assaults") +
#   ylab("Assault Type") +
#   expand_limits(x = 0) + 
#   theme_crim() +
#   scale_x_continuous(labels = scales::comma)


ggplot(assault_type %>% filter(type != "Total Assaults"),
       aes(x = assaults, y = type)) +
  geom_col(width    = 0.5,    
           position = position_dodge(0.5)) +
  xlab("") +
  ylab("") +
  expand_limits(x = 0) + 
  theme_crim() +
  scale_x_continuous(labels = scales::comma) +
  facet_wrap(~category, scales = "free", ncol = 1) 
