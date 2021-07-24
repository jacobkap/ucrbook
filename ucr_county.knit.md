# County-Level UCR Data


```r
load("data/offenses_known_yearly_1960_2018.rda")

philly <- read_csv("data/jacobdkaplan.com_offenses_count_Philadelphia Police Department_Pennsylvania.csv")
#> 
#> -- Column specification --------------------------------------------------------
#> cols(
#>   .default = col_double(),
#>   agency = col_character(),
#>   year = col_date(format = ""),
#>   state = col_character(),
#>   ORI = col_character()
#> )
#> i Use `spec()` for the full column specifications.
danville <- read_csv("data/jacobdkaplan.com_offenses_count_Danville Police Dept_California.csv")
#> 
#> -- Column specification --------------------------------------------------------
#> cols(
#>   .default = col_double(),
#>   agency = col_character(),
#>   year = col_date(format = ""),
#>   state = col_character(),
#>   ORI = col_character()
#> )
#> i Use `spec()` for the full column specifications.
```

UCR data is only available at the agency-level.^[Even for county-level agencies such as Sheriff's Offices, the data is only for crimes in that agency's jurisdiction. So the county sheriff reports crimes that they responded to but not crimes within the county that other agencies, such as a city police force, responded to.] This has caused a lot of problems for researchers because many variables from other datasets (e.g. CDC data, economic data) is primarily available at the county-level. Their solution to this problem is to aggregate the data to the county-level but summing all the agencies in a particular county. 

More specifically, nearly all researchers who use this county-level UCR data use the National Archive for Criminal Justice Data (NACJD)'s [datasets](https://www.icpsr.umich.edu/web/pages/NACJD/guides/ucr.html#desc_cl) which have done the aggregation themselves (full disclosure, I used to have my own version of this data available on openICPSR and followed NACJD's method. My reasoning was that people were using it anyways and I wanted to make sure that they knew the problem of the data so I included the issues with this data in the documentation when downloading it. However, I decided that the data was more flawed than I originally though so I took down the data.).^[These files are known on NACJD's website as "Uniform Crime Reporting Program Data: County-Level Detailed Arrest and Offense Data."]

The problem is that not all agencies report data, and even those that do many report only partially (e.g. report fewer than 12 months of the year). So by necessity the missing data has to be filled in somehow. While all methods are imputing missing data are wrong - as they will also be different than the real data, though sometimes not by much - the ways done to impute the missing data in these data are particularly incorrect. We'll go into more detail about why they're incorrect in this chapter. 

In this chapter, rather than talk about the data as it is (as is done in all of the other chapters), I'll talk about why the data is flawed and should never be used. To be clear, all data has measurement errors and much of this book is dedicated to talking about the errors in the other UCR datasets. 

The problems in the county-level data, however, are egregious enough to merit special warning. This is by no means the first warning about this data. Most famously is [Maltz and Targonski's (2002)](https://link.springer.com/article/10.1023/A:1016060020848) paper in the Journal of Quantitative Criminology about the issues with this data. They concluded that "Until improved methods of imputing county-level crime data are developed, tested, and implemented, they should not be used, especially in policy studies" which is a conclusion I also hold. These warnings, as well as those from others have been largely (it appears) ignored.^[Hopefully the warnings deters at least some people.] 

## Current usage

Even with the well-known flaws of this data, it remains a popular dataset. A search on Google Scholar for ["county-level UCR"](https://scholar.google.com/scholar?q=county-level+ucr&hl=en&as_sdt=0,20) returns 3,780 results as of this writing in summer 2021. About half of these results are from 2015 or later. In addition to use by researchers, the county-level UCR data is used by organizations such as the FBI in their annual [Crimes in the United States](https://ucr.fbi.gov/crime-in-the-u.s) report (which is essentially the report that informs the media and the public about crime, even though it's actually only a subset of actual UCR data) and [Social Explorer](https://www.socialexplorer.com/explore-maps), a website that makes it extremely convenient to examine US Census data. Based on my reading of UCR papers there are some differences in data usage by field.^[I used to have a Google Scholar alert for UCR papers but turned it off since so many papers either used my data but didn't cite me, used the data improperly, or both.] 

This data is most widely used (as a share of papers in the field) by economics researchers (who largely emphasize statistical technique over having good data) and fields other than criminology such as the relatively rare psychologist or political scientist studying crime.^[Given economist's policy of not citing other fields it's likely that they haven't read Maltz and Targonski's paper. Normally I'd be concerned with criticizing entire fields but no economist will read this as I'm not an economist myself so it's fine.] Criminologists, however, tend to focus more on agency-level data rather than county-level data, though many criminologists still do use county-level UCR data.^[I note these differences not to join the ego-driven feud between the fields. As a criminologist who currently works in a political science department, these feuds are quite stupid. I note it, however, to show that this data usage is partially driven by subcultures within fields. For example, criminology has long known about which may explain why it is more commonly used in non-criminology fields. It is therefore important for researchers to talk to (or collaborate with {though to be clear I'm not volunteering or requesting to collaborate with you}) people who have content-expertise about the data that you're using. And that open communication between the fields (including collaborations and submitting to journals from fields other than your own) will strengthen both fields.] 

## Why is this data so widely used?

We'll get into exactly why this data is so heavily flawed in the next section but suffice to say at the moment that there's a lot of missing data and it's imputed in a really stupid way. And this way is very obvious to anyone who reads the documentation.^[Considering the number of emails I've received asking about something clearly in the documentation (or even this book) and reviewers who did not read my paper, academics have serious trouble with reading.] Even a non-naive approach to the data that minimizes the issues will leave substantial measurement errors, though for the most part researchers take the naive "everything is okay" approach with this data. So considering these problems and that they're known since at least 2002, why do people still use this data?

There are a number of reasons that I believe explain it, but these are simply my opinions on why without any evidence other than my observations.^[If reading this section makes you think I'm cynical about academia, this is actually me being optimistic.] The first, and simplest (so probably the most correct), reason is that many *many* researchers are lazy. As much as academics like to bray about the how much they've read or how their opinions are based on the strongest available research, many seem to be largely unwilling to do the absolutely most basic step in using data: **reading the manual.** I am most familiar with UCR data so I see this issue all the time when reading papers that use the data, but I'm certain that it happens with all sorts of data. UCR papers are ubiquitous with *basic data errors* such as how many years are available, what units (geography and temporally) the data are in, and even what crimes are included. All of which are clearly explained in the data manual released by the FBI, released by NACJD, and released by me in this book (not to mention is clear if you actually look at the data!).^[This is also why I no longer read papers that use UCR data. It just annoys me to see such slop published.] Given the unwillingness to read the manual for such data - including NACJD's very helpful guide on how they imputed the missing data - it stands to reason that people also don't search for papers on the intregrity of this data.^[Some people would excuse this by saying that they're too busy to spend all this time reading carefully, especially reading boring manuals. Indeed, at Penn I was told by professors to just skim papers I'm reading and not read it thoroughly other than the methods section (and occasionally data section) which I consider very bad advice. If you don't have time to read thoroughly then you don't have time to read at all, and certainly not to do research. If you have too much work to do to do it all well, then drop something. Overextending yourself is no excuse for sloppy work.]


I believe that there is a large degree of self-protective behavior when it comes to county-level UCR data. Having county-level data makes lots of research easy as you can merge it with a bunch of other datasets. So, naturally, researchers will use it. 

^[Indeed I recently received an email from a prominent researcher at a prestigious university. He asked me where the county-level data was. When I told him that my county-level data were archived because of their major flaws, he asked that I send him the archived data since he had used this dataset before.]

Finally, some researchers may believe that the problems in this data are not seriously enough to stop it from being used. In some cases this is true. Some counties do in fact have no missing data so can be used without issue. In these cases, however it is trivial to simply aggregate the agency-level data to the county-level after verifying that no agencies are missing any data. So the county-level data is not actually necessary in these cases, though is more convenient since it does the aggregation work already. 

## Current imputation practices


```r
month_to_num <- data.frame(last_month_reported = c(tolower(month.name), "no months reported"),
                           last_month_reported_num = c(1:12, 0))

z <- offenses_known_yearly_1960_2018 %>%
  filter(year %in% 2017) %>%
  mutate(number_of_months_reported = 12 - number_of_months_missing) %>%
  left_join(month_to_num)
#> Joining, by = "last_month_reported"
table(z$number_of_months_reported)
#> 
#>     0     1     2     3     4     5     6     7     8     9    10    11    12 
#>  6119   127    85   170    80    88    91    87    97   117   289   483 14951
table(z$last_month_reported_num)
#> 
#>     0     1     2     3     4     5     6     7     8     9    10    11    12 
#>  6055   128    40    45    52    49    63    60    61    62   185   220 15764
table(z$last_month_reported)
#> 
#>              april             august           december           february 
#>                 52                 61              15764                 40 
#>            january               july               june              march 
#>                128                 60                 63                 45 
#>                may no months reported           november            october 
#>                 49               6055                220                185 
#>          september 
#>                 62

months_table <- data.frame(table(z$last_month_reported_num),
           table(z$number_of_months_reported))
months_table$Var1.1 <- NULL
months_table$percent_change <- months_table$Freq.1 - months_table$Freq
months_table$percent_change <- months_table$percent_change / months_table$Freq * 100
months_table$percent_change <- round(months_table$percent_change, 2)
months_table$percent_change <- pad_decimals(months_table$percent_change, 2)
months_table$percent_change[-grep("-", months_table$percent_change)] <- paste0("+", months_table$percent_change[-grep("-", months_table$percent_change)])

months_table$Freq <- formatC(months_table$Freq, format="d", big.mark=",")
months_table$Freq.1 <- formatC(months_table$Freq.1, format="d", big.mark=",")
names(months_table) <- c("Months Reported",
                         "Last Month Definition",
                         "Months Not Missing Definition", "Percent Change")


knitr::kable(months_table, 
             format = "markdown",
             digits = 2, 
             align = c("l", "r", "r", "r"),
             booktabs = TRUE, 
             longtable = TRUE,
             escape = FALSE,
             caption = "The number of months reported to the 2017 Offenses Known and Clearances by Arrest data using two definitions of months reported. The 'Last Month' definition is the preferred measure of months reported by both the FBI and researchers, though this overcounts months.") %>%
  kable_styling(bootstrap_options = "striped", full_width = FALSE, latex_options = c("hold_position", "repeat_header"))
#> Warning in kable_styling(., bootstrap_options = "striped", full_width = FALSE, :
#> Please specify format in kable. kableExtra can customize either HTML or LaTeX
#> outputs. See https://haozhu233.github.io/kableExtra/ for details.
```



Table: (\#tab:unnamed-chunk-2)The number of months reported to the 2017 Offenses Known and Clearances by Arrest data using two definitions of months reported. The 'Last Month' definition is the preferred measure of months reported by both the FBI and researchers, though this overcounts months.

|Months Reported | Last Month Definition| Months Not Missing Definition| Percent Change|
|:---------------|---------------------:|-----------------------------:|--------------:|
|0               |                 6,055|                         6,119|          +1.06|
|1               |                   128|                           127|          -0.78|
|2               |                    40|                            85|        +112.50|
|3               |                    45|                           170|        +277.78|
|4               |                    52|                            80|         +53.85|
|5               |                    49|                            88|         +79.59|
|6               |                    63|                            91|         +44.44|
|7               |                    60|                            87|         +45.00|
|8               |                    61|                            97|         +59.02|
|9               |                    62|                           117|         +88.71|
|10              |                   185|                           289|         +56.22|
|11              |                   220|                           483|        +119.55|
|12              |                15,764|                        14,951|          -5.16|












