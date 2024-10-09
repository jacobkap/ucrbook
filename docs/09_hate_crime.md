# Hate Crime Data {#hate_crimes}





This dataset covers crimes that are reported to the police and judged by the police to be motivated by hate. More specifically, they are crimes which were motivated - at least in part - by bias towards a certain person or group of people because of characteristics about them such as race, sexual orientation, or religion. The first part is key: incidents must first be crimes—specifically, the types of crimes the FBI includes in this dataset. Actions motivated by bias that do not meet the legal standard of a crime, or fall outside the specific crime categories covered by this data, are not recorded as hate crimes.

For example, if someone yells racial slurs at a Black person, it’s clearly a biased and racist action, but it wouldn’t be included in this data unless it involved a specific crime like intimidation. Racial slurs alone, without additional criminal behavior, are generally not illegal and thus wouldn’t be reported as a hate crime in this dataset. For the second part, the bias motivation, it must be against a group that the FBI includes in this data. For example, when this data collection began in 1991, there was no way to collect information about hate crimes against transgender people specifically. Instead it would be counted in the "Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT) bias motivation. So if a transgender person was assaulted or killed because they were transgender, there would not be a way to count that until 2013 when anti-transgender was first recorded in this data. 

In the previous example the offender shouted a racial slur, clear that the actions were motivated by bias. What about a hate crime where there is no explicit evidence of hate? Say, a White man robs a Black man and targets him because he is Black. The offender does not wear any insignia suggesting bias and never says a word to the victim. If the offender is never caught this robbery would not be considered a hate crime as there is no evidence that it is motivated by hate. Even if the offender is caught this would only be considered a hate crime if the police uncover evidence of bias, such as a confession or text messages between the offender and another person explaining why the victim was targeted. I think many - perhaps even most - hate crimes fall into this category. Where it was in fact a hate crime but there is not sufficient evidence - both in terms of evidence the police can gather and even the victim's own perception - that it was a hate crime. 

This data is a more limited measure of hate crimes than it may initially appear. It represents only (some) crimes, motivated by (some) types of hate, that are both reported to the police and where the police have gathered sufficient evidence to determine bias. It is also the dataset with the fewest agencies reporting, with most agencies not reporting any hate crimes to the FBI in a given year. This may be true for most agencies as hate crimes are rare and many agencies are small with relatively few crimes of any type reported. However, there is evidence that some agencies that likely have hate crimes still do not report. This leads to gaps in the data with some states having few agencies that report hate crimes, agencies reporting some bias motivations but not others, and agencies reporting some years but not others. While these problems exist for all of the SRS datasets, it is more severe in this data. This problem is further complicated by hate crimes being rare even in agencies that report them. With such rare events, even minor changes in which agencies report or whether victims report the crime to the police can drastically change the reported number of hate crimes. For these reasons I strongly advise caution to anyone using these data. 

## Agencies reporting

We will start by looking at how many agencies report hate crime each year. This is a bit tricky since there can be multiple ways to examine how agencies report, and since agencies can truly have no hate crimes in a year it is hard to differentiate the true zeroes from the non-reporters. 

Figure \@ref(fig:hateAgencies) shows the number of agencies that report at least one hate crime incident in that year. During the first year of data in 1991 there were about 750 agencies reporting and that grew steadily to about 2,000 agencies in year 2000. From there it increased a bit over the next decade before declining to below 1,750 in the early 2010s and rising again to around 3,000 agencies at the end of our data.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateAgencies-1} 

}

\caption{The annual number of police agencies that report at least one hate crime incident in that year.}(\#fig:hateAgencies)
\end{figure}

The 3,000 or so agencies that report each year are not the same every year. Figure \@ref(fig:hateCrimesEver) shows the cumulative number of agencies that have reported at least one hate crime between 1991 and 2022. There is a steady growth in the cumulative number of agencies, with about 350 new agencies each year. In each year some new agencies report hate crimes for the first time while some agencies that reported a hate crime in previous years do not report any hate crimes in the current year.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesEver-1} 

}

\caption{The cumulative number of agencies that have reported one or more hate crimes between 1991 and 2022}(\#fig:hateCrimesEver)
\end{figure}

Figure \@ref(fig:hateCrimesPreviousYear) puts this into hard numbers by showing the percent of agencies who reported a hate crime in a certain year who *also* reported a hate crime in the previous year. For most years between 50% and 60% of agencies which reported a hate crime in the year shown on the x-axis also reported a hate crime in the previous year, indicating somewhat high consistency in which agencies have hate crimes. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesPreviousYear-1} 

}

\caption{The percent of agencies that report a hate crime in a given year that also reported a hate crime in the previous year, 1992-2023}(\#fig:hateCrimesPreviousYear)
\end{figure}

Another way to understand reporting is to look at the number of reported hate crimes by state and see which states report and which do not. Figure \@ref(fig:hateCrimesMap) does this for 2022 data by showing the number of reported hate crime incidents by state. Unfortunately what we have done here is basically create a population map, though with California as a clear outlier. Counting up and graphing or mapping the number of crimes is a common first response to getting new data but is not actually that helpful. Here we see that the states with the biggest populations - California, New York, Texas,  - have the most hate crimes. To be more useful let us look at state-level reporting after adjusting to the number of agencies in the state and to the civilian population.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesMap-1} 

}

\caption{Total reported hate crimes by state, 2023}(\#fig:hateCrimesMap)
\end{figure}


We will start with the rate of agencies reporting though this incorrectly assumes that each agency in the state is comparable. For example, say a state has 10 agencies; one that has jurisdiction over 91% of the state's population, and nine that have jurisdiction over 1% of the population each. If the one big agency reports and none of the nine do then we will say that only 10% of agencies report data. But this one covers 91% of the state so this is actually great coverage. Conversely, having that one agency not report means that even with the other nine agencies reporting we actually cover less than one-tenth of the state's population. Still, this is a useful starting point for understanding this data's reporting and usually answering these kinds of questions requires multiple answers that are all wrong in their own way.

Figure \@ref(fig:statePercentReporting) shows the percent of agencies for each state that reported at least one hate crime in 2022. In New Jersey, the state with the highest percent of agencies reporting, 39% of agencies reported at least one hate crime. It is neighboring states of Pennsylvania, Delaware, and New York have a much lower rate of reporting at 4% (the lowest of any state), 11%, and 14%, respectively. This difference is likely due to a 2019 request by the New Jersey Attorney General to police officers that they [https://www.washingtonpost.com/national-security/2022/01/29/hate-crimes-nj-fbi-asian/]("more thoroughly report on bias incidents.") To me this suggests that decisions at the state level can lead to drastic changes in reporting rates by agencies, and is a possible solution to low reporting rates. 

In 15 states, fewer than 10% of agencies reported a hate crime, and in one state (Pennsylvania) fewer than 5% of agencies did so. One interesting finding from this map is the more liberal states - New Jersey, Washington, California, Connecticut, etc. - have the highest share of agencies reporting a hate crime, indicating that the culture of the state may influence either the propensity of hate crimes, whether victims report, whether agencies report hate crimes, or simply that more hate crimes happen in these areas.   

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/statePercentReporting-1} 

}

\caption{The percent of agencies in each state that reported at least one hate crime in 2022, excluding agencies covered by another agency.}(\#fig:statePercentReporting)
\end{figure}

To examine how population affects our results, Figure \@ref(fig:statePercentReportingPop) shows the percent of each state's population that is covered by an agency that reported at least one hate crime. Results are similar to Figure \@ref(fig:statePercentReporting) but now show that there is more reporting than it appeared in that figure. That is because while not all agencies report a hate crime, the ones that do report are generally larger (in terms of population) than the ones that do not. And that is to be expected since smaller agencies will have fewer crimes than larger ones meaning that it is less likely that have a hate crime.

So measuring by population we see that about half of the people in the country lives in the jurisdiction of an agency which reported at least one hate crime. The average state also covers about half of the population in a hate-crime-reporting agency. The state with the lowest population covered is Mississippi with 17% of its residents in a jurisdiction with an agency reporting data; the state with the highest share is Hawaii at 86%.

Is this good? We do not necessarily want 100% of agencies to report a hate crime since not all agencies will experience a hate crime in their jurisdiction. The ideal dataset would have all hate crimes reported but without knowing how many hates crimes there actually are we cannot tell how well this data captures hate crimes.

This is also a fairly poor measure of reporting as it just measures agencies reporting at least one hate crime. If an agency had many hate crimes but only reported very few - and here let us think about that as both agencies not knowing a crime was a hate crime and also knowing but not reporting a hate crime - that is also quite bad for our understanding of hate crimes. However, it is far more likely that a hate crime is not reported than a non-hate crime being reported as a hate crime. Since we know the likely direction of any errors we can think about this entire dataset as being the lower-bound of hate crime data.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/statePercentReportingPop-1} 

}

\caption{The percent of population in each state in agencies that reported at least one hate crime in 2022, excluding agencies that are covered by another agency.}(\#fig:statePercentReportingPop)
\end{figure}

## Tree of Life synagogue shooting {#treeOfLife}

One way I like to check the quality of data is to see how it reports something that I know occurred. Here we will look at how the anti-Semitic attack on a synagogue in Pittsburgh was reported. In October of 2018 the deadliest attack on Jewish people in US history occurred at the Tree of Life synagogue in Pittsburgh, PA. There, 11 congregants were murdered, and several other people, including police officers, were injured by the shooter. Yet according to this data, however, those murders never occurred. Not in Pittsburgh at least. No murders with an anti-Jewish bias were reported in Pittsburgh in 2018. Instead, the shooting was reported by the FBI's Pittsburgh field office, which, like many federal agencies that have offices across the country, is included in the data as its own agency.

This is good and bad. Of course it is good that when a crime happens it is reported in the data. The bad part is that it is counted as hate crimes that occurred in the FBI's Pittsburgh agency, and not the Pittsburgh Police Department. Most research occurs at the local level - usually studying an agency or county. So if a study is examining agency-level characteristics that are related to hate crimes it would almost certainly exclude these murders as they are reported by a federal agency and not the local Pittsburgh agency. 

This also gets complicated as FBI rules say that a crime should be reported by the most local jurisdiction. This is true even when there is overlapping jurisdiction. 11 people were murdered in Pittsburgh, and several Pittsburgh Police officers were injured. That should mean that the crime is reported by Pittsburgh Police, not by the FBI. Pittsburgh does report these murders in their Offenses Known data, making it even more odd that they are Pittsburgh crimes in one dataset and not another.^[The murders of nine Black parishioners in the Emanuel African Methodist Episcopal Church in Charleston, South Carolina, in 2015 was reported by the Charleston Police Department, making it even more inconsistent for when the FBI reports hate crime murders.] 

## Important variables

This data has the standard set of variables describing the agency that is reporting. This includes the agency ORI - which is the unique ID for that agency - the agency name, their state, and the population under their jurisdiction. It then has more detailed information about each crime such as what crime happened, what type of bias it involved, where it occurred, and some demographics of the offender.

### Date and time

This data says the exact date that the hate crime occurred on - though not the date it was reported on. Figure \@ref(fig:hateCrimesByDay) shows the percent of hates crimes between 1991 and 2022 that occurred on each day of the week. Interestingly, the most common days for a hate crime to occur is on Friday, which is also when non-hate crimes most frequently occur. This suggests that hate crimes do follow the same trends - at least partially - as other crimes.




\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesByDay-1} 

}

\caption{The day of the week that hate crimes occurred on, 1991-2023}(\#fig:hateCrimesByDay)
\end{figure}

We can also look at which day of the month is most common, as shown in Figure \@ref(fig:hateCrimesByMonthDay). There's no pattern that I can see other than the the 1st of the most has the most hate crimes and the end of the month has the fewest. Not all months have more than 28 days so it makes sense that the 29th, 30th, and 31st are the least common days. Is the 1st of the month really the most dangerous? I think this is likely just a quirk of the data, and is something we also see in NIBRS data. When an agency does not report an actual date they may use the 1st of the month as a placeholder which then looks to us like the 1st is an especially prolific day for hate crimes. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesByMonthDay-1} 

}

\caption{The day of the month that hate crimes occurred on, 1991-2023}(\#fig:hateCrimesByMonthDay)
\end{figure}

### The bias motivation (who the hate is against)

The most important variable in this data is the "bias motivation" which is the FBI's term for the cause of the hate. A hate crime targeted against Black people would be an "anti-Black" bias motivation. For the police to classify an incident as a hate crime, and to assign a particular bias motivation, the police must have *some* evidence that the crime was motivated by hate. The victim saying that the crime is a hate crime alone is not sufficient - though if large portions of the victim's community believe that the crime is a hate crime, this can be a factor in the police's assessment. 

The evidence required is not major. It includes evidence as explicit as slurs said during an incident and less obvious factors like the crime occurring on an important holiday for that community (e.g. Martin Luther King Day, religious holidays). The FBI also encourages police to consider the totality of the evidence even if none alone strongly suggests that the crime was a hate crime in making their determination about whether the incident was a hate crime or not. This also means that many (perhaps most) hate crimes will not be recorded as hate crimes since there is no evidence that the crime is motivated by hate. 

Consider, for example, a person who is biased against Asian people and decides to rob them because they are Asian. This is clearly a hate crime. And say this persons robs 10 Asian people in 10 different incidents, causing 10 hate crimes. All of the victims report it to the police but only two of them tell the police that they think it was a hate crime; the other eight do not think it is a hate crime. Without additional information the police would likely not report any of these robberies as hate crimes. And if all ten of the victims happened to be surveyed about crime victimization, such as through the Bureau of Justice Statistics' National Crime Victimization Survey, only two of the 10 victims would report being the victim of a hate crime. Using FBI data the anti-Asian hate crimes would be zero; using victimization surveys would undercount anti-Asian hate crimes enormously. This is the main problem with using hate crime data, even with perfect reporting or surveys of everyone possibly victimized we may still be getting data that is completely incorrect.

In the FBI data bias motivation is based on the offender's perceptions of the victim so even if they are incorrect in who their victim is, if they intended to target someone for their perceived group membership, that is still a hate crime. For example, if a person assaults a man because they think he is gay, that is a hate crime because the assault was motivated by hate towards gay people. Whether the victim is actually gay or not is not relevant - the offender perceived him to be gay so it is an anti-gay hate crime. To make this even more complicated, the offender must have committed the crime because they are motivated, at least to some degree, by their bias against the victim. Being biased against the victim but targeting them for some other reason means that the crime is not a hate crime. 

The biases that the FBI includes in this data have grown over time, with new bias motivations being added in 1997, 2012, 2013, and 2015. Table \@ref(tab:hateBiasMotivation) shows each bias motivation in this data, the year it was first reported, how many hate crimes there were for this bias motivation from 1991-2023 and what percent of hate crimes that bias motivation makes up. 

To make the most common bias motivations easier to identify, the table is sorted by the frequency of incidents. The "first year" column reflects the first year that the bias motivation was officially recorded, though some biases may have existed earlier but were not yet captured in the data. The last column in this table shows the percent of hate crime incidents from 1991-2023. 

This sorting makes it easy to see the most common bias motivations, but that is not actually that useful to most people since we usually care more about a rate than a count. For example, according to this table there were almost three times as many anti-Black hate crimes than anti-Jewish hate crimes, showing that anti-Black hate crimes are more of a problem in this country. But this is not right. We cannot just count of the number of offenses or we risk accidentally just measuring the population of these groups. Black people, for example, make up about 14% of the United States population while Jewish people make up about 2%.^[For simplicity I am treating these groups as independent though of course some Black people can be Jewish.] If we adjust the numbers to equalize population then we see that there is a much higher anti-Jewish hate crime rate than anti-Black rate. 

And even this is not that useful since you really need a much deeper dive into the data before pulling out these seemingly simple statistics. For example, maybe areas with more Jewish people have better reporting than areas with more Black people. Or that Jewish victims would report to the police at higher rates than Black victims. Maybe these are both true at certain times between 1992 and 2022 but have changed over the years. It is not hard to think of possible explanations for differences between groups so without running down each of these explanations I recommend caution before putting out even something as seemingly simple at the number of crimes by bias group. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hateBiasMotivation)The bias motivation for hate crime incidents. In incidents with multiple bias motivation, this shows only the first bias motivation recorded.}\\
\hline
Bias Motivation & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateBiasMotivation)The bias motivation for hate crime incidents. In incidents with multiple bias motivation, this shows only the first bias motivation recorded. \textit{(continued)}}\\
\hline
Bias Motivation & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endhead
Total &  & 252,093 & 100\textbackslash{}\%\\
\hline
Anti-Black & 1991 & 84,508 & 33.52\textbackslash{}\%\\
\hline
Anti-Jewish & 1991 & 31,838 & 12.63\textbackslash{}\%\\
\hline
Anti-White & 1991 & 28,192 & 11.18\textbackslash{}\%\\
\hline
Anti-Gay (Male) & 1991 & 24,927 & 9.89\textbackslash{}\%\\
\hline
Anti-Hispanic Or Latino & 1991 & 16,231 & 6.44\textbackslash{}\%\\
\hline
Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 1991 & 11,899 & 4.72\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 1991 & 8,684 & 3.44\textbackslash{}\%\\
\hline
Anti-Asian & 1991 & 8,088 & 3.21\textbackslash{}\%\\
\hline
Anti-Multiple Races, Group & 1991 & 5,876 & 2.33\textbackslash{}\%\\
\hline
Anti-Lesbian (Female) & 1991 & 5,041 & 2.00\textbackslash{}\%\\
\hline
Anti-Islamic (Muslim) & 1991 & 4,468 & 1.77\textbackslash{}\%\\
\hline
Anti-Other Religion & 1991 & 3,741 & 1.48\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & 1991 & 2,878 & 1.14\textbackslash{}\%\\
\hline
Anti-Catholic & 1991 & 1,894 & 0.75\textbackslash{}\%\\
\hline
Anti-Transgender & 2013 & 1,855 & 0.74\textbackslash{}\%\\
\hline
Anti-Arab & 1991 & 1,633 & 0.65\textbackslash{}\%\\
\hline
Anti-Mental Disability & 1997 & 1,439 & 0.57\textbackslash{}\%\\
\hline
Anti-Protestant & 1991 & 1,389 & 0.55\textbackslash{}\%\\
\hline
Anti-Multiple Religions, Group & 1991 & 1,352 & 0.54\textbackslash{}\%\\
\hline
Anti-Physical Disability & 1997 & 870 & 0.35\textbackslash{}\%\\
\hline
Anti-Sikh & 2015 & 821 & 0.33\textbackslash{}\%\\
\hline
Anti-Bisexual & 1991 & 684 & 0.27\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & 2012 & 653 & 0.26\textbackslash{}\%\\
\hline
Anti-Heterosexual & 1991 & 627 & 0.25\textbackslash{}\%\\
\hline
Anti-Female & 2012 & 539 & 0.21\textbackslash{}\%\\
\hline
Anti-Other Christian & 2015 & 472 & 0.19\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Other) & 2015 & 441 & 0.17\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & 1991 & 218 & 0.09\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & 2013 & 198 & 0.08\textbackslash{}\%\\
\hline
Anti-Male & 2013 & 194 & 0.08\textbackslash{}\%\\
\hline
Anti-Buddhist & 2015 & 130 & 0.05\textbackslash{}\%\\
\hline
Anti-Hindu & 2015 & 128 & 0.05\textbackslash{}\%\\
\hline
Anti-Church of Jesus Christ (Mormon) & 2015 & 118 & 0.05\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & 2015 & 67 & 0.03\textbackslash{}\%\\
\hline
\end{longtable}



2015 is the year with the most bias additions, as of data through 2022. This year added a number of religions such as Anti-Buddhist, Anti-Sikh, and Anti-Jehovah's Witness. In 2013, anti-Transgender was added and this is the most common of the bias motivations added since data began in 1991 with 1500 hate crimes between 2013-2023 - 0.62% of all hate crime incidents from 1991-2023. That year also added anti-male and Anti-Native Hawaiian or Other Pacific Islander, which is the most recent racial group added. In 2012, anti-gender non-conforming and anti-female were included, while in 1997 both anti-mental and anti-physical disability were added. In part due to having fewer years of data available, these newer bias motivations make up a small percent of total hate crimes. 

The original hate crimes - that is, those in the data in 1991 when this dataset was released - are far more common. The most common bias motivation is anti-Black at 34% of hate crimes, anti-Jewish at 12%, anti-White at 11%, anti-male homosexual (gay) at 10%, anti-Hispanic at 6%, and anti-ethnicity other than Hispanic (this group means a crime against an ethnic group that is not Hispanic, though it is occasionally reported as anti-non-Hispanic which is incorrect.) at 5%. All other bias motivations are less than 5% of hate crimes and consist of a variety of ethnic, racial, religious, or sexual orientation. Some hate crimes can potentially fall in multiple categories. For example, there is a bias motivation of "anti-male homosexual (gay)" and of "anti-lesbian, gay, bisexual, or transgender, mixed group (LGBT)" so there is some overlap between them. When an incident involves multiple bias motivations we can track that in the data as police can report up to 10 bias motivations per incident. In practice, however, most incidents involve only a single bias motivation.

### The crime that occurred

The "crime" part of hate crimes is which criminal offense occurred during the incident. A hateful act where the action is not one of the crimes that the FBI records would not be considered a hate crime. This is likely most common when considering something like a person calling someone by a hateful slur (e.g. "You're a [slur]," "go back to your own country", etc.) but where the action is not technically a crime. Another layer of difficulty in using this data is that not all crimes that the FBI includes were initially included when data become available in 1991. Every several years the FBI adds new crimes to be included in this data. Table \@ref(tab:hateOffense) shows each crime in the data, the first year that this crime was reported, the total number of these crimes reported between 1991 and 2022, and the percent of all incidents this crime makes up.^[This tables uses only the first offense in an incident so counts are slightly lower than if all crimes in every incident is used.] 

Each hate crime incident can cover up to 10 different crimes occurring - for example, a person who burglarizes a synagogue and spray paints a swastika on the wall would have both burglary and vandalism reported in this data. With each crime, this data has the bias motivation for that crime, the location of the crime (in broad categories, not the actual location in the city like a street address would have), and the number of victims for that offense. In practice, in most hate crimes with multiple offenses recorded, the bias motivation, location, and victim count is the same for each offense.

Figure \@ref(fig:crimesPerHateCrime) shows the number of crimes per incident for each hate crime reported between 1991 and 2022. In 96.6% of cases, there is only one offense in that incident.^[In 0.0004% of hate crimes there is no recorded offense. This is not shown in the graph.] This drops sharply to 3.2% of incidents having two offenses, 0.21% having three offenses, 0.019% having four offenses, and 0.002% having five offenses. Even though this data does allow up to 10 offenses per hate crime incident, there has never been a recorded case with more than five offenses. Results are nearly identical when examining the number of bias motivations and locations reported in an incident. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/crimesPerHateCrime-1} 

}

\caption{The number of offenses per hate crime incident.}(\#fig:crimesPerHateCrime)
\end{figure}

Nearly all hate crimes are vandalism/destruction of property (30%), intimidation (30%), and simple assault (20%) or aggravated assault (11%) with no remaining crime making up more than 2% of total hate crimes. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hateOffense)The offense type for hate crime incidents. In incidents with multiple offense types, this shows only the first offense type recorded.}\\
\hline
Offense & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateOffense)The offense type for hate crime incidents. In incidents with multiple offense types, this shows only the first offense type recorded. \textit{(continued)}}\\
\hline
Offense & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endhead
Total &  & 252,094 & 100\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 1991 & 75,524 & 29.96\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 1991 & 75,381 & 29.90\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & 1991 & 50,410 & 20.00\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 1991 & 28,127 & 11.16\textbackslash{}\%\\
\hline
Robbery & 1991 & 4,509 & 1.79\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 4,023 & 1.60\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 1993 & 3,010 & 1.19\textbackslash{}\%\\
\hline
Arson & 1991 & 1,518 & 0.60\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & 1993 & 1,462 & 0.58\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 1993 & 942 & 0.37\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Other & 1991 & 925 & 0.37\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 1993 & 853 & 0.34\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 1994 & 685 & 0.27\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1992 & 614 & 0.24\textbackslash{}\%\\
\hline
Weapon Law Violations & 1993 & 501 & 0.20\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & 1995 & 403 & 0.16\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1997 & 378 & 0.15\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & 1991 & 348 & 0.14\textbackslash{}\%\\
\hline
Sex Offenses - Rape & 1991 & 329 & 0.13\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 1993 & 265 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Fondling - Indecent Liberties/Child Molest & 1993 & 265 & 0.11\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 1993 & 256 & 0.10\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 1995 & 189 & 0.07\textbackslash{}\%\\
\hline
Kidnapping/Abduction & 1994 & 173 & 0.07\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 2001 & 155 & 0.06\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 1996 & 148 & 0.06\textbackslash{}\%\\
\hline
Fraud Offenses - Other & 2016 & 122 & 0.05\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1995 & 89 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & 1995 & 86 & 0.03\textbackslash{}\%\\
\hline
Extortion/Blackmail & 1997 & 77 & 0.03\textbackslash{}\%\\
\hline
Embezzlement & 1995 & 71 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & 1996 & 50 & 0.02\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 1995 & 31 & 0.01\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 1996 & 30 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & 2006 & 29 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & 1999 & 22 & 0.01\textbackslash{}\%\\
\hline
Undocumented Code & 2018 & 17 & 0.01\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & 1999 & 16 & 0.01\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & 2001 & 15 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & 1996 & 10 & 0.00\textbackslash{}\%\\
\hline
Negligent Manslaughter & 1999 & 8 & 0.00\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 2013 & 7 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Incest & 1997 & 7 & 0.00\textbackslash{}\%\\
\hline
Bribery & 2014 & 6 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 2017 & 4 & 0.00\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & 2013 & 2 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & 2017 & 1 & 0.00\textbackslash{}\%\\
\hline
\end{longtable}



Agencies that report to the FBI's National Incident-Based Reporting System (NIBRS) can also report bias motivations for their crimes, and these reports are included in this dataset. One tricky thing is that the crimes included are different depending on if the agency reported through NIBRS or to the dataset directly, and are not NIBRS reporting agencies. NIBRS agencies report all of the crimes as the agencies directly submitting SRS data, but have a wider variety of crimes they can report. In practice, however, both NIBRS and SRS reporting agencies can report the most common offenses so there is relatively little difference.



\begin{longtable}[t]{l|l|l|r|r}
\caption{(\#tab:hateBiasOffense)The number and percent of offenses by bias motivation, 2023.}\\
\hline
  & Bias Motivation & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateBiasOffense)The number and percent of offenses by bias motivation, 2023. \textit{(continued)}}\\
\hline
  & Bias Motivation & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
...1 & Anti-American Indian Or Native Alaskan & Assault Offenses - Simple Assault & 561 & 19.49\textbackslash{}\%\\
\hline
...2 & Anti-American Indian Or Native Alaskan & Assault Offenses - Intimidation & 432 & 15.01\textbackslash{}\%\\
\hline
...3 & Anti-American Indian Or Native Alaskan & Destruction/Damage/Vandalism of Property & 415 & 14.42\textbackslash{}\%\\
\hline
...4 & Anti-American Indian Or Native Alaskan & Assault Offenses - Aggravated Assault & 284 & 9.87\textbackslash{}\%\\
\hline
...5 & Anti-American Indian Or Native Alaskan & Larceny/Theft Offenses - All Other Larceny & 202 & 7.02\textbackslash{}\%\\
\hline
...6 & Anti-American Indian Or Native Alaskan & All Other & 984 & 34.16\textbackslash{}\%\\
\hline
...7 & Anti-American Indian Or Native Alaskan & Total & 2,878 & 100\textbackslash{}\%\\
\hline
...8 & Anti-Arab & Assault Offenses - Intimidation & 634 & 38.82\textbackslash{}\%\\
\hline
...9 & Anti-Arab & Assault Offenses - Simple Assault & 385 & 23.58\textbackslash{}\%\\
\hline
...10 & Anti-Arab & Destruction/Damage/Vandalism of Property & 308 & 18.86\textbackslash{}\%\\
\hline
...11 & Anti-Arab & Assault Offenses - Aggravated Assault & 182 & 11.15\textbackslash{}\%\\
\hline
...12 & Anti-Arab & Burglary/Breaking And Entering & 21 & 1.29\textbackslash{}\%\\
\hline
...13 & Anti-Arab & All Other & 103 & 6.27\textbackslash{}\%\\
\hline
...14 & Anti-Arab & Total & 1,633 & 100\textbackslash{}\%\\
\hline
...15 & Anti-Asian & Assault Offenses - Intimidation & 2,683 & 33.17\textbackslash{}\%\\
\hline
...16 & Anti-Asian & Destruction/Damage/Vandalism of Property & 2,067 & 25.56\textbackslash{}\%\\
\hline
...17 & Anti-Asian & Assault Offenses - Simple Assault & 1,920 & 23.74\textbackslash{}\%\\
\hline
...18 & Anti-Asian & Assault Offenses - Aggravated Assault & 803 & 9.93\textbackslash{}\%\\
\hline
...19 & Anti-Asian & Burglary/Breaking And Entering & 157 & 1.94\textbackslash{}\%\\
\hline
...20 & Anti-Asian & All Other & 458 & 5.63\textbackslash{}\%\\
\hline
...21 & Anti-Asian & Total & 8,088 & 100\textbackslash{}\%\\
\hline
...22 & Anti-Atheism/Agnosticism & Destruction/Damage/Vandalism of Property & 75 & 34.40\textbackslash{}\%\\
\hline
...23 & Anti-Atheism/Agnosticism & Assault Offenses - Simple Assault & 25 & 11.47\textbackslash{}\%\\
\hline
...24 & Anti-Atheism/Agnosticism & Larceny/Theft Offenses - All Other Larceny & 24 & 11.01\textbackslash{}\%\\
\hline
...25 & Anti-Atheism/Agnosticism & Assault Offenses - Intimidation & 21 & 9.63\textbackslash{}\%\\
\hline
...26 & Anti-Atheism/Agnosticism & Burglary/Breaking And Entering & 14 & 6.42\textbackslash{}\%\\
\hline
...27 & Anti-Atheism/Agnosticism & All Other & 59 & 27.09\textbackslash{}\%\\
\hline
...28 & Anti-Atheism/Agnosticism & Total & 218 & 100\textbackslash{}\%\\
\hline
...29 & Anti-Bisexual & Assault Offenses - Simple Assault & 196 & 28.65\textbackslash{}\%\\
\hline
...30 & Anti-Bisexual & Assault Offenses - Intimidation & 134 & 19.59\textbackslash{}\%\\
\hline
...31 & Anti-Bisexual & Destruction/Damage/Vandalism of Property & 93 & 13.60\textbackslash{}\%\\
\hline
...32 & Anti-Bisexual & Assault Offenses - Aggravated Assault & 67 & 9.80\textbackslash{}\%\\
\hline
...33 & Anti-Bisexual & Larceny/Theft Offenses - All Other Larceny & 47 & 6.87\textbackslash{}\%\\
\hline
...34 & Anti-Bisexual & All Other & 147 & 21.49\textbackslash{}\%\\
\hline
...35 & Anti-Bisexual & Total & 684 & 100\textbackslash{}\%\\
\hline
...36 & Anti-Black & Assault Offenses - Intimidation & 30,996 & 36.68\textbackslash{}\%\\
\hline
...37 & Anti-Black & Destruction/Damage/Vandalism of Property & 24,150 & 28.58\textbackslash{}\%\\
\hline
...38 & Anti-Black & Assault Offenses - Simple Assault & 15,481 & 18.32\textbackslash{}\%\\
\hline
...39 & Anti-Black & Assault Offenses - Aggravated Assault & 10,128 & 11.98\textbackslash{}\%\\
\hline
...40 & Anti-Black & Burglary/Breaking And Entering & 1,003 & 1.19\textbackslash{}\%\\
\hline
...41 & Anti-Black & All Other & 2,750 & 3.23\textbackslash{}\%\\
\hline
...42 & Anti-Black & Total & 84,508 & 100\textbackslash{}\%\\
\hline
...43 & Anti-Buddhist & Destruction/Damage/Vandalism of Property & 41 & 31.54\textbackslash{}\%\\
\hline
...44 & Anti-Buddhist & Assault Offenses - Simple Assault & 17 & 13.08\textbackslash{}\%\\
\hline
...45 & Anti-Buddhist & Larceny/Theft Offenses - All Other Larceny & 13 & 10.00\textbackslash{}\%\\
\hline
...46 & Anti-Buddhist & Assault Offenses - Aggravated Assault & 8 & 6.15\textbackslash{}\%\\
\hline
...47 & Anti-Buddhist & Burglary/Breaking And Entering & 6 & 4.62\textbackslash{}\%\\
\hline
...48 & Anti-Buddhist & All Other & 45 & 34.65\textbackslash{}\%\\
\hline
...49 & Anti-Buddhist & Total & 130 & 100\textbackslash{}\%\\
\hline
...50 & Anti-Catholic & Destruction/Damage/Vandalism of Property & 1,115 & 58.87\textbackslash{}\%\\
\hline
...51 & Anti-Catholic & Assault Offenses - Intimidation & 213 & 11.25\textbackslash{}\%\\
\hline
...52 & Anti-Catholic & Assault Offenses - Simple Assault & 97 & 5.12\textbackslash{}\%\\
\hline
...53 & Anti-Catholic & Burglary/Breaking And Entering & 86 & 4.54\textbackslash{}\%\\
\hline
...54 & Anti-Catholic & Larceny/Theft Offenses - All Other Larceny & 63 & 3.33\textbackslash{}\%\\
\hline
...55 & Anti-Catholic & All Other & 320 & 16.89\textbackslash{}\%\\
\hline
...56 & Anti-Catholic & Total & 1,894 & 100\textbackslash{}\%\\
\hline
...57 & Anti-Church of Jesus Christ (Mormon) & Destruction/Damage/Vandalism of Property & 51 & 43.22\textbackslash{}\%\\
\hline
...58 & Anti-Church of Jesus Christ (Mormon) & Assault Offenses - Intimidation & 14 & 11.86\textbackslash{}\%\\
\hline
...59 & Anti-Church of Jesus Christ (Mormon) & Burglary/Breaking And Entering & 13 & 11.02\textbackslash{}\%\\
\hline
...60 & Anti-Church of Jesus Christ (Mormon) & Assault Offenses - Simple Assault & 12 & 10.17\textbackslash{}\%\\
\hline
...61 & Anti-Church of Jesus Christ (Mormon) & Arson & 7 & 5.93\textbackslash{}\%\\
\hline
...62 & Anti-Church of Jesus Christ (Mormon) & All Other & 21 & 17.78\textbackslash{}\%\\
\hline
...63 & Anti-Church of Jesus Christ (Mormon) & Total & 118 & 100\textbackslash{}\%\\
\hline
...64 & Anti-Eastern Orthodox (Greek, Russian, Other) & Destruction/Damage/Vandalism of Property & 74 & 16.78\textbackslash{}\%\\
\hline
...65 & Anti-Eastern Orthodox (Greek, Russian, Other) & Assault Offenses - Simple Assault & 49 & 11.11\textbackslash{}\%\\
\hline
...66 & Anti-Eastern Orthodox (Greek, Russian, Other) & Larceny/Theft Offenses - All Other Larceny & 49 & 11.11\textbackslash{}\%\\
\hline
...67 & Anti-Eastern Orthodox (Greek, Russian, Other) & Drug/Narcotic Offenses - Drug/Narcotic Violations & 41 & 9.30\textbackslash{}\%\\
\hline
...68 & Anti-Eastern Orthodox (Greek, Russian, Other) & Burglary/Breaking And Entering & 34 & 7.71\textbackslash{}\%\\
\hline
...69 & Anti-Eastern Orthodox (Greek, Russian, Other) & All Other & 194 & 44.02\textbackslash{}\%\\
\hline
...70 & Anti-Eastern Orthodox (Greek, Russian, Other) & Total & 441 & 100\textbackslash{}\%\\
\hline
...71 & Anti-Female & Assault Offenses - Intimidation & 149 & 27.64\textbackslash{}\%\\
\hline
...72 & Anti-Female & Assault Offenses - Simple Assault & 137 & 25.42\textbackslash{}\%\\
\hline
...73 & Anti-Female & Assault Offenses - Aggravated Assault & 69 & 12.80\textbackslash{}\%\\
\hline
...74 & Anti-Female & Destruction/Damage/Vandalism of Property & 67 & 12.43\textbackslash{}\%\\
\hline
...75 & Anti-Female & Sex Offenses - Rape & 16 & 2.97\textbackslash{}\%\\
\hline
...76 & Anti-Female & All Other & 101 & 18.76\textbackslash{}\%\\
\hline
...77 & Anti-Female & Total & 539 & 100\textbackslash{}\%\\
\hline
...78 & Anti-Gay (Male) & Assault Offenses - Simple Assault & 7,944 & 31.87\textbackslash{}\%\\
\hline
...79 & Anti-Gay (Male) & Assault Offenses - Intimidation & 6,771 & 27.16\textbackslash{}\%\\
\hline
...80 & Anti-Gay (Male) & Destruction/Damage/Vandalism of Property & 4,271 & 17.13\textbackslash{}\%\\
\hline
...81 & Anti-Gay (Male) & Assault Offenses - Aggravated Assault & 3,999 & 16.04\textbackslash{}\%\\
\hline
...82 & Anti-Gay (Male) & Robbery & 1,079 & 4.33\textbackslash{}\%\\
\hline
...83 & Anti-Gay (Male) & All Other & 863 & 3.48\textbackslash{}\%\\
\hline
...84 & Anti-Gay (Male) & Total & 24,927 & 100\textbackslash{}\%\\
\hline
...85 & Anti-Gender Non-Conforming & Assault Offenses - Simple Assault & 150 & 22.97\textbackslash{}\%\\
\hline
...86 & Anti-Gender Non-Conforming & Destruction/Damage/Vandalism of Property & 104 & 15.93\textbackslash{}\%\\
\hline
...87 & Anti-Gender Non-Conforming & Assault Offenses - Intimidation & 74 & 11.33\textbackslash{}\%\\
\hline
...88 & Anti-Gender Non-Conforming & Larceny/Theft Offenses - All Other Larceny & 58 & 8.88\textbackslash{}\%\\
\hline
...89 & Anti-Gender Non-Conforming & Assault Offenses - Aggravated Assault & 57 & 8.73\textbackslash{}\%\\
\hline
...90 & Anti-Gender Non-Conforming & All Other & 210 & 32.16\textbackslash{}\%\\
\hline
...91 & Anti-Gender Non-Conforming & Total & 653 & 100\textbackslash{}\%\\
\hline
...92 & Anti-Heterosexual & Assault Offenses - Intimidation & 156 & 24.88\textbackslash{}\%\\
\hline
...93 & Anti-Heterosexual & Destruction/Damage/Vandalism of Property & 154 & 24.56\textbackslash{}\%\\
\hline
...94 & Anti-Heterosexual & Assault Offenses - Simple Assault & 116 & 18.50\textbackslash{}\%\\
\hline
...95 & Anti-Heterosexual & Assault Offenses - Aggravated Assault & 43 & 6.86\textbackslash{}\%\\
\hline
...96 & Anti-Heterosexual & Larceny/Theft Offenses - All Other Larceny & 24 & 3.83\textbackslash{}\%\\
\hline
...97 & Anti-Heterosexual & All Other & 134 & 21.41\textbackslash{}\%\\
\hline
...98 & Anti-Heterosexual & Total & 627 & 100\textbackslash{}\%\\
\hline
...99 & Anti-Hindu & Assault Offenses - Intimidation & 39 & 30.47\textbackslash{}\%\\
\hline
...100 & Anti-Hindu & Destruction/Damage/Vandalism of Property & 33 & 25.78\textbackslash{}\%\\
\hline
...101 & Anti-Hindu & Assault Offenses - Simple Assault & 25 & 19.53\textbackslash{}\%\\
\hline
...102 & Anti-Hindu & Assault Offenses - Aggravated Assault & 8 & 6.25\textbackslash{}\%\\
\hline
...103 & Anti-Hindu & Burglary/Breaking And Entering & 5 & 3.91\textbackslash{}\%\\
\hline
...104 & Anti-Hindu & All Other & 18 & 14.04\textbackslash{}\%\\
\hline
...105 & Anti-Hindu & Total & 128 & 100\textbackslash{}\%\\
\hline
...106 & Anti-Hispanic Or Latino & Assault Offenses - Intimidation & 5,033 & 31.01\textbackslash{}\%\\
\hline
...107 & Anti-Hispanic Or Latino & Assault Offenses - Simple Assault & 4,278 & 26.36\textbackslash{}\%\\
\hline
...108 & Anti-Hispanic Or Latino & Assault Offenses - Aggravated Assault & 2,994 & 18.45\textbackslash{}\%\\
\hline
...109 & Anti-Hispanic Or Latino & Destruction/Damage/Vandalism of Property & 2,694 & 16.60\textbackslash{}\%\\
\hline
...110 & Anti-Hispanic Or Latino & Robbery & 544 & 3.35\textbackslash{}\%\\
\hline
...111 & Anti-Hispanic Or Latino & All Other & 688 & 4.24\textbackslash{}\%\\
\hline
...112 & Anti-Hispanic Or Latino & Total & 16,231 & 100\textbackslash{}\%\\
\hline
...113 & Anti-Islamic (Muslim) & Assault Offenses - Intimidation & 1,808 & 40.47\textbackslash{}\%\\
\hline
...114 & Anti-Islamic (Muslim) & Destruction/Damage/Vandalism of Property & 1,174 & 26.28\textbackslash{}\%\\
\hline
...115 & Anti-Islamic (Muslim) & Assault Offenses - Simple Assault & 856 & 19.16\textbackslash{}\%\\
\hline
...116 & Anti-Islamic (Muslim) & Assault Offenses - Aggravated Assault & 332 & 7.43\textbackslash{}\%\\
\hline
...117 & Anti-Islamic (Muslim) & Arson & 61 & 1.37\textbackslash{}\%\\
\hline
...118 & Anti-Islamic (Muslim) & All Other & 237 & 5.28\textbackslash{}\%\\
\hline
...119 & Anti-Islamic (Muslim) & Total & 4,468 & 100\textbackslash{}\%\\
\hline
...120 & Anti-Jehovahs Witness & Destruction/Damage/Vandalism of Property & 22 & 32.84\textbackslash{}\%\\
\hline
...121 & Anti-Jehovahs Witness & Assault Offenses - Intimidation & 10 & 14.93\textbackslash{}\%\\
\hline
...122 & Anti-Jehovahs Witness & Assault Offenses - Simple Assault & 9 & 13.43\textbackslash{}\%\\
\hline
...123 & Anti-Jehovahs Witness & Assault Offenses - Aggravated Assault & 6 & 8.96\textbackslash{}\%\\
\hline
...124 & Anti-Jehovahs Witness & Larceny/Theft Offenses - All Other Larceny & 4 & 5.97\textbackslash{}\%\\
\hline
...125 & Anti-Jehovahs Witness & All Other & 16 & 23.89\textbackslash{}\%\\
\hline
...126 & Anti-Jehovahs Witness & Total & 67 & 100\textbackslash{}\%\\
\hline
...127 & Anti-Jewish & Destruction/Damage/Vandalism of Property & 20,381 & 64.01\textbackslash{}\%\\
\hline
...128 & Anti-Jewish & Assault Offenses - Intimidation & 8,246 & 25.90\textbackslash{}\%\\
\hline
...129 & Anti-Jewish & Assault Offenses - Simple Assault & 1,665 & 5.23\textbackslash{}\%\\
\hline
...130 & Anti-Jewish & Assault Offenses - Aggravated Assault & 471 & 1.48\textbackslash{}\%\\
\hline
...131 & Anti-Jewish & Burglary/Breaking And Entering & 341 & 1.07\textbackslash{}\%\\
\hline
...132 & Anti-Jewish & All Other & 734 & 2.32\textbackslash{}\%\\
\hline
...133 & Anti-Jewish & Total & 31,838 & 100\textbackslash{}\%\\
\hline
...134 & Anti-Lesbian (Female) & Assault Offenses - Intimidation & 1,684 & 33.41\textbackslash{}\%\\
\hline
...135 & Anti-Lesbian (Female) & Assault Offenses - Simple Assault & 1,284 & 25.47\textbackslash{}\%\\
\hline
...136 & Anti-Lesbian (Female) & Destruction/Damage/Vandalism of Property & 1,100 & 21.82\textbackslash{}\%\\
\hline
...137 & Anti-Lesbian (Female) & Assault Offenses - Aggravated Assault & 620 & 12.30\textbackslash{}\%\\
\hline
...138 & Anti-Lesbian (Female) & Burglary/Breaking And Entering & 64 & 1.27\textbackslash{}\%\\
\hline
...139 & Anti-Lesbian (Female) & All Other & 289 & 5.74\textbackslash{}\%\\
\hline
...140 & Anti-Lesbian (Female) & Total & 5,041 & 100\textbackslash{}\%\\
\hline
...141 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Destruction/Damage/Vandalism of Property & 2,488 & 28.65\textbackslash{}\%\\
\hline
...142 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Intimidation & 2,122 & 24.44\textbackslash{}\%\\
\hline
...143 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Simple Assault & 2,104 & 24.23\textbackslash{}\%\\
\hline
...144 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Aggravated Assault & 1,027 & 11.83\textbackslash{}\%\\
\hline
...145 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Larceny/Theft Offenses - All Other Larceny & 320 & 3.68\textbackslash{}\%\\
\hline
...146 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & All Other & 623 & 7.16\textbackslash{}\%\\
\hline
...147 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Total & 8,684 & 100\textbackslash{}\%\\
\hline
...148 & Anti-Male & Assault Offenses - Simple Assault & 50 & 25.77\textbackslash{}\%\\
\hline
...149 & Anti-Male & Assault Offenses - Intimidation & 41 & 21.13\textbackslash{}\%\\
\hline
...150 & Anti-Male & Destruction/Damage/Vandalism of Property & 21 & 10.82\textbackslash{}\%\\
\hline
...151 & Anti-Male & Assault Offenses - Aggravated Assault & 19 & 9.79\textbackslash{}\%\\
\hline
...152 & Anti-Male & Burglary/Breaking And Entering & 10 & 5.15\textbackslash{}\%\\
\hline
...153 & Anti-Male & All Other & 53 & 27.38\textbackslash{}\%\\
\hline
...154 & Anti-Male & Total & 194 & 100\textbackslash{}\%\\
\hline
...155 & Anti-Mental Disability & Assault Offenses - Simple Assault & 381 & 26.48\textbackslash{}\%\\
\hline
...156 & Anti-Mental Disability & Assault Offenses - Intimidation & 223 & 15.50\textbackslash{}\%\\
\hline
...157 & Anti-Mental Disability & Destruction/Damage/Vandalism of Property & 177 & 12.30\textbackslash{}\%\\
\hline
...158 & Anti-Mental Disability & Assault Offenses - Aggravated Assault & 147 & 10.22\textbackslash{}\%\\
\hline
...159 & Anti-Mental Disability & Larceny/Theft Offenses - All Other Larceny & 118 & 8.20\textbackslash{}\%\\
\hline
...160 & Anti-Mental Disability & All Other & 393 & 27.35\textbackslash{}\%\\
\hline
...161 & Anti-Mental Disability & Total & 1,439 & 100\textbackslash{}\%\\
\hline
...162 & Anti-Multiple Races, Group & Destruction/Damage/Vandalism of Property & 2,899 & 49.34\textbackslash{}\%\\
\hline
...163 & Anti-Multiple Races, Group & Assault Offenses - Intimidation & 1,570 & 26.72\textbackslash{}\%\\
\hline
...164 & Anti-Multiple Races, Group & Assault Offenses - Simple Assault & 657 & 11.18\textbackslash{}\%\\
\hline
...165 & Anti-Multiple Races, Group & Assault Offenses - Aggravated Assault & 415 & 7.06\textbackslash{}\%\\
\hline
...166 & Anti-Multiple Races, Group & Burglary/Breaking And Entering & 105 & 1.79\textbackslash{}\%\\
\hline
...167 & Anti-Multiple Races, Group & All Other & 230 & 3.93\textbackslash{}\%\\
\hline
...168 & Anti-Multiple Races, Group & Total & 5,876 & 100\textbackslash{}\%\\
\hline
...169 & Anti-Multiple Religions, Group & Destruction/Damage/Vandalism of Property & 793 & 58.65\textbackslash{}\%\\
\hline
...170 & Anti-Multiple Religions, Group & Assault Offenses - Intimidation & 204 & 15.09\textbackslash{}\%\\
\hline
...171 & Anti-Multiple Religions, Group & Assault Offenses - Simple Assault & 94 & 6.95\textbackslash{}\%\\
\hline
...172 & Anti-Multiple Religions, Group & Larceny/Theft Offenses - All Other Larceny & 54 & 3.99\textbackslash{}\%\\
\hline
...173 & Anti-Multiple Religions, Group & Burglary/Breaking And Entering & 49 & 3.62\textbackslash{}\%\\
\hline
...174 & Anti-Multiple Religions, Group & All Other & 158 & 11.68\textbackslash{}\%\\
\hline
...175 & Anti-Multiple Religions, Group & Total & 1,352 & 100\textbackslash{}\%\\
\hline
...176 & Anti-Native Hawaiian Or Other Pacific Islander & Assault Offenses - Simple Assault & 40 & 20.20\textbackslash{}\%\\
\hline
...177 & Anti-Native Hawaiian Or Other Pacific Islander & Assault Offenses - Intimidation & 27 & 13.64\textbackslash{}\%\\
\hline
...178 & Anti-Native Hawaiian Or Other Pacific Islander & Destruction/Damage/Vandalism of Property & 21 & 10.61\textbackslash{}\%\\
\hline
...179 & Anti-Native Hawaiian Or Other Pacific Islander & Assault Offenses - Aggravated Assault & 19 & 9.60\textbackslash{}\%\\
\hline
...180 & Anti-Native Hawaiian Or Other Pacific Islander & Larceny/Theft Offenses - All Other Larceny & 14 & 7.07\textbackslash{}\%\\
\hline
...181 & Anti-Native Hawaiian Or Other Pacific Islander & All Other & 77 & 38.94\textbackslash{}\%\\
\hline
...182 & Anti-Native Hawaiian Or Other Pacific Islander & Total & 198 & 100\textbackslash{}\%\\
\hline
...183 & Anti-Other Christian & Destruction/Damage/Vandalism of Property & 238 & 50.42\textbackslash{}\%\\
\hline
...184 & Anti-Other Christian & Assault Offenses - Intimidation & 80 & 16.95\textbackslash{}\%\\
\hline
...185 & Anti-Other Christian & Assault Offenses - Simple Assault & 33 & 6.99\textbackslash{}\%\\
\hline
...186 & Anti-Other Christian & Arson & 28 & 5.93\textbackslash{}\%\\
\hline
...187 & Anti-Other Christian & Burglary/Breaking And Entering & 25 & 5.30\textbackslash{}\%\\
\hline
...188 & Anti-Other Christian & All Other & 68 & 14.4\textbackslash{}\%\\
\hline
...189 & Anti-Other Christian & Total & 472 & 100\textbackslash{}\%\\
\hline
...190 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Intimidation & 4,131 & 34.72\textbackslash{}\%\\
\hline
...191 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Destruction/Damage/Vandalism of Property & 3,378 & 28.39\textbackslash{}\%\\
\hline
...192 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Simple Assault & 2,343 & 19.69\textbackslash{}\%\\
\hline
...193 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Aggravated Assault & 1,164 & 9.78\textbackslash{}\%\\
\hline
...194 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Burglary/Breaking And Entering & 190 & 1.60\textbackslash{}\%\\
\hline
...195 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & All Other & 693 & 5.84\textbackslash{}\%\\
\hline
...196 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Total & 11,899 & 100\textbackslash{}\%\\
\hline
...197 & Anti-Other Religion & Destruction/Damage/Vandalism of Property & 2,111 & 56.43\textbackslash{}\%\\
\hline
...198 & Anti-Other Religion & Assault Offenses - Intimidation & 746 & 19.94\textbackslash{}\%\\
\hline
...199 & Anti-Other Religion & Assault Offenses - Simple Assault & 238 & 6.36\textbackslash{}\%\\
\hline
...200 & Anti-Other Religion & Burglary/Breaking And Entering & 161 & 4.30\textbackslash{}\%\\
\hline
...201 & Anti-Other Religion & Assault Offenses - Aggravated Assault & 119 & 3.18\textbackslash{}\%\\
\hline
...202 & Anti-Other Religion & All Other & 366 & 9.8\textbackslash{}\%\\
\hline
...203 & Anti-Other Religion & Total & 3,741 & 100\textbackslash{}\%\\
\hline
...204 & Anti-Physical Disability & Assault Offenses - Simple Assault & 248 & 28.51\textbackslash{}\%\\
\hline
...205 & Anti-Physical Disability & Assault Offenses - Intimidation & 182 & 20.92\textbackslash{}\%\\
\hline
...206 & Anti-Physical Disability & Destruction/Damage/Vandalism of Property & 91 & 10.46\textbackslash{}\%\\
\hline
...207 & Anti-Physical Disability & Assault Offenses - Aggravated Assault & 78 & 8.97\textbackslash{}\%\\
\hline
...208 & Anti-Physical Disability & Larceny/Theft Offenses - All Other Larceny & 69 & 7.93\textbackslash{}\%\\
\hline
...209 & Anti-Physical Disability & All Other & 202 & 23.13\textbackslash{}\%\\
\hline
...210 & Anti-Physical Disability & Total & 870 & 100\textbackslash{}\%\\
\hline
...211 & Anti-Protestant & Destruction/Damage/Vandalism of Property & 818 & 58.89\textbackslash{}\%\\
\hline
...212 & Anti-Protestant & Assault Offenses - Intimidation & 134 & 9.65\textbackslash{}\%\\
\hline
...213 & Anti-Protestant & Burglary/Breaking And Entering & 93 & 6.70\textbackslash{}\%\\
\hline
...214 & Anti-Protestant & Assault Offenses - Simple Assault & 72 & 5.18\textbackslash{}\%\\
\hline
...215 & Anti-Protestant & Larceny/Theft Offenses - All Other Larceny & 64 & 4.61\textbackslash{}\%\\
\hline
...216 & Anti-Protestant & All Other & 208 & 14.97\textbackslash{}\%\\
\hline
...217 & Anti-Protestant & Total & 1,389 & 100\textbackslash{}\%\\
\hline
...218 & Anti-Sikh & Destruction/Damage/Vandalism of Property & 124 & 15.10\textbackslash{}\%\\
\hline
...219 & Anti-Sikh & Larceny/Theft Offenses - All Other Larceny & 116 & 14.13\textbackslash{}\%\\
\hline
...220 & Anti-Sikh & Assault Offenses - Simple Assault & 100 & 12.18\textbackslash{}\%\\
\hline
...221 & Anti-Sikh & Drug/Narcotic Offenses - Drug/Narcotic Violations & 62 & 7.55\textbackslash{}\%\\
\hline
...222 & Anti-Sikh & Burglary/Breaking And Entering & 53 & 6.46\textbackslash{}\%\\
\hline
...223 & Anti-Sikh & All Other & 366 & 44.56\textbackslash{}\%\\
\hline
...224 & Anti-Sikh & Total & 821 & 100\textbackslash{}\%\\
\hline
...225 & Anti-Transgender & Assault Offenses - Simple Assault & 610 & 32.88\textbackslash{}\%\\
\hline
...226 & Anti-Transgender & Assault Offenses - Intimidation & 467 & 25.18\textbackslash{}\%\\
\hline
...227 & Anti-Transgender & Assault Offenses - Aggravated Assault & 345 & 18.60\textbackslash{}\%\\
\hline
...228 & Anti-Transgender & Destruction/Damage/Vandalism of Property & 164 & 8.84\textbackslash{}\%\\
\hline
...229 & Anti-Transgender & Robbery & 71 & 3.83\textbackslash{}\%\\
\hline
...230 & Anti-Transgender & All Other & 198 & 10.65\textbackslash{}\%\\
\hline
...231 & Anti-Transgender & Total & 1,855 & 100\textbackslash{}\%\\
\hline
...232 & Anti-White & Assault Offenses - Simple Assault & 8,233 & 29.20\textbackslash{}\%\\
\hline
...233 & Anti-White & Assault Offenses - Intimidation & 6,280 & 22.28\textbackslash{}\%\\
\hline
...234 & Anti-White & Assault Offenses - Aggravated Assault & 4,528 & 16.06\textbackslash{}\%\\
\hline
...235 & Anti-White & Destruction/Damage/Vandalism of Property & 3,811 & 13.52\textbackslash{}\%\\
\hline
...236 & Anti-White & Robbery & 1,153 & 4.09\textbackslash{}\%\\
\hline
...237 & Anti-White & All Other & 4,187 & 14.83\textbackslash{}\%\\
\hline
...238 & Anti-White & Total & 28,192 & 100\textbackslash{}\%\\
\hline
1 & Undocumented Code & Destruction/Damage/Vandalism of Property & 1 & 100.00\textbackslash{}\%\\
\hline
NA & NA & NA & NA & NA\\
\hline
NA.1 & NA & NA & NA & NA\\
\hline
NA.2 & NA & NA & NA & NA\\
\hline
NA.3 & NA & NA & NA & NA\\
\hline
...244 & Undocumented Code & All Other & NA & NA\textbackslash{}\%\\
\hline
...245 & Undocumented Code & Total & 1 & 100\textbackslash{}\%\\
\hline
\end{longtable}





\begin{longtable}[t]{l|l|l|r|r}
\caption{(\#tab:hateOffenseBias)The number and percent of biases by offense, 2023.}\\
\hline
  & Offense & Bias Motivation & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateOffenseBias)The number and percent of biases by offense, 2023. \textit{(continued)}}\\
\hline
  & Offense & Bias Motivation & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
...1 & Arson & Anti-Black & 449 & 29.58\textbackslash{}\%\\
\hline
...2 & Arson & Anti-Jewish & 178 & 11.73\textbackslash{}\%\\
\hline
...3 & Arson & Anti-Other Religion & 110 & 7.25\textbackslash{}\%\\
\hline
...4 & Arson & Anti-Gay (Male) & 97 & 6.39\textbackslash{}\%\\
\hline
...5 & Arson & Anti-White & 96 & 6.32\textbackslash{}\%\\
\hline
...6 & Arson & All Other & 588 & 38.75\textbackslash{}\%\\
\hline
...7 & Arson & Total & 1,518 & 100\textbackslash{}\%\\
\hline
...8 & Assault Offenses - Aggravated Assault & Anti-Black & 10,128 & 36.01\textbackslash{}\%\\
\hline
...9 & Assault Offenses - Aggravated Assault & Anti-White & 4,528 & 16.10\textbackslash{}\%\\
\hline
...10 & Assault Offenses - Aggravated Assault & Anti-Gay (Male) & 3,999 & 14.22\textbackslash{}\%\\
\hline
...11 & Assault Offenses - Aggravated Assault & Anti-Hispanic Or Latino & 2,994 & 10.64\textbackslash{}\%\\
\hline
...12 & Assault Offenses - Aggravated Assault & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 1,164 & 4.14\textbackslash{}\%\\
\hline
...13 & Assault Offenses - Aggravated Assault & All Other & 5,314 & 18.89\textbackslash{}\%\\
\hline
...14 & Assault Offenses - Aggravated Assault & Total & 28,127 & 100\textbackslash{}\%\\
\hline
...15 & Assault Offenses - Intimidation & Anti-Black & 30,996 & 41.12\textbackslash{}\%\\
\hline
...16 & Assault Offenses - Intimidation & Anti-Jewish & 8,246 & 10.94\textbackslash{}\%\\
\hline
...17 & Assault Offenses - Intimidation & Anti-Gay (Male) & 6,771 & 8.98\textbackslash{}\%\\
\hline
...18 & Assault Offenses - Intimidation & Anti-White & 6,280 & 8.33\textbackslash{}\%\\
\hline
...19 & Assault Offenses - Intimidation & Anti-Hispanic Or Latino & 5,033 & 6.68\textbackslash{}\%\\
\hline
...20 & Assault Offenses - Intimidation & All Other & 18,055 & 23.96\textbackslash{}\%\\
\hline
...21 & Assault Offenses - Intimidation & Total & 75,381 & 100\textbackslash{}\%\\
\hline
...22 & Assault Offenses - Simple Assault & Anti-Black & 15,481 & 30.71\textbackslash{}\%\\
\hline
...23 & Assault Offenses - Simple Assault & Anti-White & 8,233 & 16.33\textbackslash{}\%\\
\hline
...24 & Assault Offenses - Simple Assault & Anti-Gay (Male) & 7,944 & 15.76\textbackslash{}\%\\
\hline
...25 & Assault Offenses - Simple Assault & Anti-Hispanic Or Latino & 4,278 & 8.49\textbackslash{}\%\\
\hline
...26 & Assault Offenses - Simple Assault & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 2,343 & 4.65\textbackslash{}\%\\
\hline
...27 & Assault Offenses - Simple Assault & All Other & 12,131 & 24.06\textbackslash{}\%\\
\hline
...28 & Assault Offenses - Simple Assault & Total & 50,410 & 100\textbackslash{}\%\\
\hline
...29 & Bribery & Anti-Black & 2 & 33.33\textbackslash{}\%\\
\hline
...30 & Bribery & Anti-White & 1 & 16.67\textbackslash{}\%\\
\hline
...31 & Bribery & Anti-Heterosexual & 1 & 16.67\textbackslash{}\%\\
\hline
...32 & Bribery & Anti-Arab & 1 & 16.67\textbackslash{}\%\\
\hline
...33 & Bribery & Anti-Gay (Male) & 1 & 16.67\textbackslash{}\%\\
\hline
...34 & Bribery & All Other & NA & NA\textbackslash{}\%\\
\hline
...35 & Bribery & Total & 6 & 100\textbackslash{}\%\\
\hline
...36 & Burglary/Breaking And Entering & Anti-Black & 1,003 & 24.93\textbackslash{}\%\\
\hline
...37 & Burglary/Breaking And Entering & Anti-White & 641 & 15.93\textbackslash{}\%\\
\hline
...38 & Burglary/Breaking And Entering & Anti-Jewish & 341 & 8.48\textbackslash{}\%\\
\hline
...39 & Burglary/Breaking And Entering & Anti-Gay (Male) & 241 & 5.99\textbackslash{}\%\\
\hline
...40 & Burglary/Breaking And Entering & Anti-Hispanic Or Latino & 212 & 5.27\textbackslash{}\%\\
\hline
...41 & Burglary/Breaking And Entering & All Other & 1,585 & 39.4\textbackslash{}\%\\
\hline
...42 & Burglary/Breaking And Entering & Total & 4,023 & 100\textbackslash{}\%\\
\hline
...43 & Counterfeiting/Forgery & Anti-White & 103 & 40.23\textbackslash{}\%\\
\hline
...44 & Counterfeiting/Forgery & Anti-Black & 25 & 9.77\textbackslash{}\%\\
\hline
...45 & Counterfeiting/Forgery & Anti-American Indian Or Native Alaskan & 21 & 8.20\textbackslash{}\%\\
\hline
...46 & Counterfeiting/Forgery & Anti-Catholic & 11 & 4.30\textbackslash{}\%\\
\hline
...47 & Counterfeiting/Forgery & Anti-Sikh & 10 & 3.91\textbackslash{}\%\\
\hline
...48 & Counterfeiting/Forgery & All Other & 86 & 33.54\textbackslash{}\%\\
\hline
...49 & Counterfeiting/Forgery & Total & 256 & 100\textbackslash{}\%\\
\hline
...50 & Destruction/Damage/Vandalism of Property & Anti-Black & 24,150 & 31.98\textbackslash{}\%\\
\hline
...51 & Destruction/Damage/Vandalism of Property & Anti-Jewish & 20,381 & 26.99\textbackslash{}\%\\
\hline
...52 & Destruction/Damage/Vandalism of Property & Anti-Gay (Male) & 4,271 & 5.66\textbackslash{}\%\\
\hline
...53 & Destruction/Damage/Vandalism of Property & Anti-White & 3,811 & 5.05\textbackslash{}\%\\
\hline
...54 & Destruction/Damage/Vandalism of Property & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 3,378 & 4.47\textbackslash{}\%\\
\hline
...55 & Destruction/Damage/Vandalism of Property & All Other & 19,533 & 25.87\textbackslash{}\%\\
\hline
...56 & Destruction/Damage/Vandalism of Property & Total & 75,524 & 100\textbackslash{}\%\\
\hline
...57 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-White & 131 & 32.51\textbackslash{}\%\\
\hline
...58 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-American Indian Or Native Alaskan & 58 & 14.39\textbackslash{}\%\\
\hline
...59 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-Eastern Orthodox (Greek, Russian, Other) & 26 & 6.45\textbackslash{}\%\\
\hline
...60 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-Sikh & 24 & 5.96\textbackslash{}\%\\
\hline
...61 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-Black & 19 & 4.71\textbackslash{}\%\\
\hline
...62 & Drug/Narcotic Offenses - Drug Equipment Violations & All Other & 145 & 35.96\textbackslash{}\%\\
\hline
...63 & Drug/Narcotic Offenses - Drug Equipment Violations & Total & 403 & 100\textbackslash{}\%\\
\hline
...64 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-White & 495 & 33.86\textbackslash{}\%\\
\hline
...65 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-Black & 248 & 16.96\textbackslash{}\%\\
\hline
...66 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-American Indian Or Native Alaskan & 156 & 10.67\textbackslash{}\%\\
\hline
...67 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-Sikh & 62 & 4.24\textbackslash{}\%\\
\hline
...68 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-Hispanic Or Latino & 46 & 3.15\textbackslash{}\%\\
\hline
...69 & Drug/Narcotic Offenses - Drug/Narcotic Violations & All Other & 455 & 31.15\textbackslash{}\%\\
\hline
...70 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Total & 1,462 & 100\textbackslash{}\%\\
\hline
...71 & Embezzlement & Anti-White & 24 & 33.80\textbackslash{}\%\\
\hline
...72 & Embezzlement & Anti-American Indian Or Native Alaskan & 9 & 12.68\textbackslash{}\%\\
\hline
...73 & Embezzlement & Anti-Mental Disability & 6 & 8.45\textbackslash{}\%\\
\hline
...74 & Embezzlement & Anti-Black & 5 & 7.04\textbackslash{}\%\\
\hline
...75 & Embezzlement & Anti-Physical Disability & 5 & 7.04\textbackslash{}\%\\
\hline
...76 & Embezzlement & All Other & 22 & 31.02\textbackslash{}\%\\
\hline
...77 & Embezzlement & Total & 71 & 100\textbackslash{}\%\\
\hline
...78 & Extortion/Blackmail & Anti-Gay (Male) & 17 & 22.08\textbackslash{}\%\\
\hline
...79 & Extortion/Blackmail & Anti-White & 9 & 11.69\textbackslash{}\%\\
\hline
...80 & Extortion/Blackmail & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 7 & 9.09\textbackslash{}\%\\
\hline
...81 & Extortion/Blackmail & Anti-Black & 7 & 9.09\textbackslash{}\%\\
\hline
...82 & Extortion/Blackmail & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 7 & 9.09\textbackslash{}\%\\
\hline
...83 & Extortion/Blackmail & All Other & 30 & 38.97\textbackslash{}\%\\
\hline
...84 & Extortion/Blackmail & Total & 77 & 100\textbackslash{}\%\\
\hline
...85 & Fraud Offenses - Credit Card/Atm Fraud & Anti-White & 57 & 30.16\textbackslash{}\%\\
\hline
...86 & Fraud Offenses - Credit Card/Atm Fraud & Anti-American Indian Or Native Alaskan & 18 & 9.52\textbackslash{}\%\\
\hline
...87 & Fraud Offenses - Credit Card/Atm Fraud & Anti-Sikh & 14 & 7.41\textbackslash{}\%\\
\hline
...88 & Fraud Offenses - Credit Card/Atm Fraud & Anti-Mental Disability & 14 & 7.41\textbackslash{}\%\\
\hline
...89 & Fraud Offenses - Credit Card/Atm Fraud & Anti-Black & 10 & 5.29\textbackslash{}\%\\
\hline
...90 & Fraud Offenses - Credit Card/Atm Fraud & All Other & 76 & 40.23\textbackslash{}\%\\
\hline
...91 & Fraud Offenses - Credit Card/Atm Fraud & Total & 189 & 100\textbackslash{}\%\\
\hline
...92 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-White & 123 & 32.54\textbackslash{}\%\\
\hline
...93 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-Black & 34 & 8.99\textbackslash{}\%\\
\hline
...94 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-Mental Disability & 29 & 7.67\textbackslash{}\%\\
\hline
...95 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-Sikh & 28 & 7.41\textbackslash{}\%\\
\hline
...96 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-American Indian Or Native Alaskan & 18 & 4.76\textbackslash{}\%\\
\hline
...97 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & All Other & 146 & 38.62\textbackslash{}\%\\
\hline
...98 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Total & 378 & 100\textbackslash{}\%\\
\hline
...99 & Fraud Offenses - Impersonation & Anti-White & 43 & 27.74\textbackslash{}\%\\
\hline
...100 & Fraud Offenses - Impersonation & Anti-Black & 23 & 14.84\textbackslash{}\%\\
\hline
...101 & Fraud Offenses - Impersonation & Anti-American Indian Or Native Alaskan & 23 & 14.84\textbackslash{}\%\\
\hline
...102 & Fraud Offenses - Impersonation & Anti-Hispanic Or Latino & 11 & 7.10\textbackslash{}\%\\
\hline
...103 & Fraud Offenses - Impersonation & Anti-Catholic & 5 & 3.23\textbackslash{}\%\\
\hline
...104 & Fraud Offenses - Impersonation & All Other & 50 & 32.32\textbackslash{}\%\\
\hline
...105 & Fraud Offenses - Impersonation & Total & 155 & 100\textbackslash{}\%\\
\hline
...106 & Fraud Offenses - Other & Anti-White & 34 & 27.87\textbackslash{}\%\\
\hline
...107 & Fraud Offenses - Other & Anti-Sikh & 12 & 9.84\textbackslash{}\%\\
\hline
...108 & Fraud Offenses - Other & Anti-Black & 12 & 9.84\textbackslash{}\%\\
\hline
...109 & Fraud Offenses - Other & Anti-American Indian Or Native Alaskan & 12 & 9.84\textbackslash{}\%\\
\hline
...110 & Fraud Offenses - Other & Anti-Mental Disability & 6 & 4.92\textbackslash{}\%\\
\hline
...111 & Fraud Offenses - Other & All Other & 46 & 37.72\textbackslash{}\%\\
\hline
...112 & Fraud Offenses - Other & Total & 122 & 100\textbackslash{}\%\\
\hline
1...113 & Fraud Offenses - Welfare Fraud & Anti-White & 6 & 60.00\textbackslash{}\%\\
\hline
2...114 & Fraud Offenses - Welfare Fraud & Anti-Mental Disability & 2 & 20.00\textbackslash{}\%\\
\hline
3...115 & Fraud Offenses - Welfare Fraud & Anti-American Indian Or Native Alaskan & 1 & 10.00\textbackslash{}\%\\
\hline
4...116 & Fraud Offenses - Welfare Fraud & Anti-Arab & 1 & 10.00\textbackslash{}\%\\
\hline
NA...117 & NA & NA & NA & NA\\
\hline
...118 & Fraud Offenses - Welfare Fraud & All Other & NA & NA\textbackslash{}\%\\
\hline
...119 & Fraud Offenses - Welfare Fraud & Total & 10 & 100\textbackslash{}\%\\
\hline
...120 & Fraud Offenses - Wire Fraud & Anti-White & 8 & 27.59\textbackslash{}\%\\
\hline
...121 & Fraud Offenses - Wire Fraud & Anti-Gender Non-Conforming & 3 & 10.34\textbackslash{}\%\\
\hline
...122 & Fraud Offenses - Wire Fraud & Anti-Catholic & 2 & 6.90\textbackslash{}\%\\
\hline
...123 & Fraud Offenses - Wire Fraud & Anti-Female & 2 & 6.90\textbackslash{}\%\\
\hline
...124 & Fraud Offenses - Wire Fraud & Anti-Multiple Races, Group & 2 & 6.90\textbackslash{}\%\\
\hline
...125 & Fraud Offenses - Wire Fraud & All Other & 12 & 41.4\textbackslash{}\%\\
\hline
...126 & Fraud Offenses - Wire Fraud & Total & 29 & 100\textbackslash{}\%\\
\hline
1...127 & Gambling Offenses - Betting/Wagering & Anti-Physical Disability & 1 & 100.00\textbackslash{}\%\\
\hline
NA...128 & NA & NA & NA & NA\\
\hline
NA.1...129 & NA & NA & NA & NA\\
\hline
NA.2...130 & NA & NA & NA & NA\\
\hline
NA.3...131 & NA & NA & NA & NA\\
\hline
...132 & Gambling Offenses - Betting/Wagering & All Other & NA & NA\textbackslash{}\%\\
\hline
...133 & Gambling Offenses - Betting/Wagering & Total & 1 & 100\textbackslash{}\%\\
\hline
1...134 & Human Trafficking - Commercial Sex Acts & Anti-Transgender & 1 & 25.00\textbackslash{}\%\\
\hline
2...135 & Human Trafficking - Commercial Sex Acts & Anti-Asian & 1 & 25.00\textbackslash{}\%\\
\hline
3...136 & Human Trafficking - Commercial Sex Acts & Anti-Physical Disability & 1 & 25.00\textbackslash{}\%\\
\hline
4...137 & Human Trafficking - Commercial Sex Acts & Anti-Black & 1 & 25.00\textbackslash{}\%\\
\hline
NA...138 & NA & NA & NA & NA\\
\hline
...139 & Human Trafficking - Commercial Sex Acts & All Other & NA & NA\textbackslash{}\%\\
\hline
...140 & Human Trafficking - Commercial Sex Acts & Total & 4 & 100\textbackslash{}\%\\
\hline
1...141 & Human Trafficking - Involuntary Servitude & Anti-Female & 1 & 100.00\textbackslash{}\%\\
\hline
NA...142 & NA & NA & NA & NA\\
\hline
NA.1...143 & NA & NA & NA & NA\\
\hline
NA.2...144 & NA & NA & NA & NA\\
\hline
NA.3...145 & NA & NA & NA & NA\\
\hline
...146 & Human Trafficking - Involuntary Servitude & All Other & NA & NA\textbackslash{}\%\\
\hline
...147 & Human Trafficking - Involuntary Servitude & Total & 1 & 100\textbackslash{}\%\\
\hline
...148 & Kidnapping/Abduction & Anti-Black & 31 & 17.92\textbackslash{}\%\\
\hline
...149 & Kidnapping/Abduction & Anti-White & 31 & 17.92\textbackslash{}\%\\
\hline
...150 & Kidnapping/Abduction & Anti-Gay (Male) & 13 & 7.51\textbackslash{}\%\\
\hline
...151 & Kidnapping/Abduction & Anti-Hispanic Or Latino & 11 & 6.36\textbackslash{}\%\\
\hline
...152 & Kidnapping/Abduction & Anti-Transgender & 9 & 5.20\textbackslash{}\%\\
\hline
...153 & Kidnapping/Abduction & All Other & 78 & 45.08\textbackslash{}\%\\
\hline
...154 & Kidnapping/Abduction & Total & 173 & 100\textbackslash{}\%\\
\hline
...155 & Larceny/Theft Offenses - All Other Larceny & Anti-White & 824 & 27.38\textbackslash{}\%\\
\hline
...156 & Larceny/Theft Offenses - All Other Larceny & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 320 & 10.63\textbackslash{}\%\\
\hline
...157 & Larceny/Theft Offenses - All Other Larceny & Anti-Black & 271 & 9.00\textbackslash{}\%\\
\hline
...158 & Larceny/Theft Offenses - All Other Larceny & Anti-American Indian Or Native Alaskan & 202 & 6.71\textbackslash{}\%\\
\hline
...159 & Larceny/Theft Offenses - All Other Larceny & Anti-Mental Disability & 118 & 3.92\textbackslash{}\%\\
\hline
...160 & Larceny/Theft Offenses - All Other Larceny & All Other & 1,275 & 42.36\textbackslash{}\%\\
\hline
...161 & Larceny/Theft Offenses - All Other Larceny & Total & 3,010 & 100\textbackslash{}\%\\
\hline
...162 & Larceny/Theft Offenses - Other & Anti-Black & 178 & 19.24\textbackslash{}\%\\
\hline
...163 & Larceny/Theft Offenses - Other & Anti-Jewish & 176 & 19.03\textbackslash{}\%\\
\hline
...164 & Larceny/Theft Offenses - Other & Anti-Gay (Male) & 84 & 9.08\textbackslash{}\%\\
\hline
...165 & Larceny/Theft Offenses - Other & Anti-White & 76 & 8.22\textbackslash{}\%\\
\hline
...166 & Larceny/Theft Offenses - Other & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 62 & 6.70\textbackslash{}\%\\
\hline
...167 & Larceny/Theft Offenses - Other & All Other & 349 & 37.73\textbackslash{}\%\\
\hline
...168 & Larceny/Theft Offenses - Other & Total & 925 & 100\textbackslash{}\%\\
\hline
...169 & Larceny/Theft Offenses - Pocket-Picking & Anti-Black & 8 & 26.67\textbackslash{}\%\\
\hline
...170 & Larceny/Theft Offenses - Pocket-Picking & Anti-White & 7 & 23.33\textbackslash{}\%\\
\hline
...171 & Larceny/Theft Offenses - Pocket-Picking & Anti-Hispanic Or Latino & 4 & 13.33\textbackslash{}\%\\
\hline
...172 & Larceny/Theft Offenses - Pocket-Picking & Anti-American Indian Or Native Alaskan & 3 & 10.00\textbackslash{}\%\\
\hline
...173 & Larceny/Theft Offenses - Pocket-Picking & Anti-Physical Disability & 2 & 6.67\textbackslash{}\%\\
\hline
...174 & Larceny/Theft Offenses - Pocket-Picking & All Other & 6 & 19.98\textbackslash{}\%\\
\hline
...175 & Larceny/Theft Offenses - Pocket-Picking & Total & 30 & 100\textbackslash{}\%\\
\hline
...176 & Larceny/Theft Offenses - Purse-Snatching & Anti-White & 10 & 32.26\textbackslash{}\%\\
\hline
...177 & Larceny/Theft Offenses - Purse-Snatching & Anti-Black & 3 & 9.68\textbackslash{}\%\\
\hline
...178 & Larceny/Theft Offenses - Purse-Snatching & Anti-American Indian Or Native Alaskan & 3 & 9.68\textbackslash{}\%\\
\hline
...179 & Larceny/Theft Offenses - Purse-Snatching & Anti-Gay (Male) & 2 & 6.45\textbackslash{}\%\\
\hline
...180 & Larceny/Theft Offenses - Purse-Snatching & Anti-Bisexual & 2 & 6.45\textbackslash{}\%\\
\hline
...181 & Larceny/Theft Offenses - Purse-Snatching & All Other & 11 & 35.51\textbackslash{}\%\\
\hline
...182 & Larceny/Theft Offenses - Purse-Snatching & Total & 31 & 100\textbackslash{}\%\\
\hline
...183 & Larceny/Theft Offenses - Shoplifting & Anti-White & 285 & 33.41\textbackslash{}\%\\
\hline
...184 & Larceny/Theft Offenses - Shoplifting & Anti-Black & 92 & 10.79\textbackslash{}\%\\
\hline
...185 & Larceny/Theft Offenses - Shoplifting & Anti-American Indian Or Native Alaskan & 88 & 10.32\textbackslash{}\%\\
\hline
...186 & Larceny/Theft Offenses - Shoplifting & Anti-Sikh & 35 & 4.10\textbackslash{}\%\\
\hline
...187 & Larceny/Theft Offenses - Shoplifting & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 31 & 3.63\textbackslash{}\%\\
\hline
...188 & Larceny/Theft Offenses - Shoplifting & All Other & 322 & 37.77\textbackslash{}\%\\
\hline
...189 & Larceny/Theft Offenses - Shoplifting & Total & 853 & 100\textbackslash{}\%\\
\hline
...190 & Larceny/Theft Offenses - Theft From Building & Anti-White & 206 & 30.07\textbackslash{}\%\\
\hline
...191 & Larceny/Theft Offenses - Theft From Building & Anti-Black & 61 & 8.91\textbackslash{}\%\\
\hline
...192 & Larceny/Theft Offenses - Theft From Building & Anti-American Indian Or Native Alaskan & 54 & 7.88\textbackslash{}\%\\
\hline
...193 & Larceny/Theft Offenses - Theft From Building & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 47 & 6.86\textbackslash{}\%\\
\hline
...194 & Larceny/Theft Offenses - Theft From Building & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 33 & 4.82\textbackslash{}\%\\
\hline
...195 & Larceny/Theft Offenses - Theft From Building & All Other & 284 & 41.49\textbackslash{}\%\\
\hline
...196 & Larceny/Theft Offenses - Theft From Building & Total & 685 & 100\textbackslash{}\%\\
\hline
...197 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-White & 313 & 33.23\textbackslash{}\%\\
\hline
...198 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-American Indian Or Native Alaskan & 102 & 10.83\textbackslash{}\%\\
\hline
...199 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-Black & 91 & 9.66\textbackslash{}\%\\
\hline
...200 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-Sikh & 43 & 4.56\textbackslash{}\%\\
\hline
...201 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-Hispanic Or Latino & 40 & 4.25\textbackslash{}\%\\
\hline
...202 & Larceny/Theft Offenses - Theft From Motor Vehicle & All Other & 353 & 37.46\textbackslash{}\%\\
\hline
...203 & Larceny/Theft Offenses - Theft From Motor Vehicle & Total & 942 & 100\textbackslash{}\%\\
\hline
...204 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-White & 91 & 34.34\textbackslash{}\%\\
\hline
...205 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-Black & 27 & 10.19\textbackslash{}\%\\
\hline
...206 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-American Indian Or Native Alaskan & 26 & 9.81\textbackslash{}\%\\
\hline
...207 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-Sikh & 14 & 5.28\textbackslash{}\%\\
\hline
...208 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 10 & 3.77\textbackslash{}\%\\
\hline
...209 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & All Other & 97 & 36.59\textbackslash{}\%\\
\hline
...210 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Total & 265 & 100\textbackslash{}\%\\
\hline
...211 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-White & 4 & 25.00\textbackslash{}\%\\
\hline
...212 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-American Indian Or Native Alaskan & 3 & 18.75\textbackslash{}\%\\
\hline
...213 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-Physical Disability & 3 & 18.75\textbackslash{}\%\\
\hline
...214 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-Black & 2 & 12.50\textbackslash{}\%\\
\hline
...215 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-Sikh & 1 & 6.25\textbackslash{}\%\\
\hline
...216 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & All Other & 3 & 18.75\textbackslash{}\%\\
\hline
...217 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Total & 16 & 100\textbackslash{}\%\\
\hline
...218 & Motor Vehicle Theft & Anti-White & 173 & 28.18\textbackslash{}\%\\
\hline
...219 & Motor Vehicle Theft & Anti-Black & 87 & 14.17\textbackslash{}\%\\
\hline
...220 & Motor Vehicle Theft & Anti-American Indian Or Native Alaskan & 81 & 13.19\textbackslash{}\%\\
\hline
...221 & Motor Vehicle Theft & Anti-Sikh & 31 & 5.05\textbackslash{}\%\\
\hline
...222 & Motor Vehicle Theft & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 25 & 4.07\textbackslash{}\%\\
\hline
...223 & Motor Vehicle Theft & All Other & 217 & 35.34\textbackslash{}\%\\
\hline
...224 & Motor Vehicle Theft & Total & 614 & 100\textbackslash{}\%\\
\hline
...225 & Murder/Nonnegligent Manslaughter & Anti-Black & 82 & 23.56\textbackslash{}\%\\
\hline
...226 & Murder/Nonnegligent Manslaughter & Anti-Gay (Male) & 65 & 18.68\textbackslash{}\%\\
\hline
...227 & Murder/Nonnegligent Manslaughter & Anti-White & 52 & 14.94\textbackslash{}\%\\
\hline
...228 & Murder/Nonnegligent Manslaughter & Anti-Hispanic Or Latino & 42 & 12.07\textbackslash{}\%\\
\hline
...229 & Murder/Nonnegligent Manslaughter & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 16 & 4.60\textbackslash{}\%\\
\hline
...230 & Murder/Nonnegligent Manslaughter & All Other & 91 & 26.14\textbackslash{}\%\\
\hline
...231 & Murder/Nonnegligent Manslaughter & Total & 348 & 100\textbackslash{}\%\\
\hline
...232 & Negligent Manslaughter & Anti-American Indian Or Native Alaskan & 2 & 25.00\textbackslash{}\%\\
\hline
...233 & Negligent Manslaughter & Anti-Physical Disability & 2 & 25.00\textbackslash{}\%\\
\hline
...234 & Negligent Manslaughter & Anti-Black & 2 & 25.00\textbackslash{}\%\\
\hline
...235 & Negligent Manslaughter & Anti-Hispanic Or Latino & 1 & 12.50\textbackslash{}\%\\
\hline
...236 & Negligent Manslaughter & Anti-White & 1 & 12.50\textbackslash{}\%\\
\hline
...237 & Negligent Manslaughter & All Other & NA & NA\textbackslash{}\%\\
\hline
...238 & Negligent Manslaughter & Total & 8 & 100\textbackslash{}\%\\
\hline
...239 & Pornography/Obscene Material & Anti-Black & 15 & 16.85\textbackslash{}\%\\
\hline
...240 & Pornography/Obscene Material & Anti-White & 10 & 11.24\textbackslash{}\%\\
\hline
...241 & Pornography/Obscene Material & Anti-Female & 7 & 7.87\textbackslash{}\%\\
\hline
...242 & Pornography/Obscene Material & Anti-Gay (Male) & 6 & 6.74\textbackslash{}\%\\
\hline
...243 & Pornography/Obscene Material & Anti-American Indian Or Native Alaskan & 6 & 6.74\textbackslash{}\%\\
\hline
...244 & Pornography/Obscene Material & All Other & 45 & 50.54\textbackslash{}\%\\
\hline
...245 & Pornography/Obscene Material & Total & 89 & 100\textbackslash{}\%\\
\hline
...246 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-Mental Disability & 2 & 28.57\textbackslash{}\%\\
\hline
...247 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-White & 1 & 14.29\textbackslash{}\%\\
\hline
...248 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-Gender Non-Conforming & 1 & 14.29\textbackslash{}\%\\
\hline
...249 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-Black & 1 & 14.29\textbackslash{}\%\\
\hline
...250 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-Male & 1 & 14.29\textbackslash{}\%\\
\hline
...251 & Prostitution Offenses - Assisting Or Promoting Prostitution & All Other & 1 & 14.29\textbackslash{}\%\\
\hline
...252 & Prostitution Offenses - Assisting Or Promoting Prostitution & Total & 7 & 100\textbackslash{}\%\\
\hline
1...253 & Prostitution Offenses - Prostitution & Anti-White & 10 & 66.67\textbackslash{}\%\\
\hline
2...254 & Prostitution Offenses - Prostitution & Anti-Asian & 3 & 20.00\textbackslash{}\%\\
\hline
3...255 & Prostitution Offenses - Prostitution & Anti-Lesbian (Female) & 1 & 6.67\textbackslash{}\%\\
\hline
4...256 & Prostitution Offenses - Prostitution & Anti-Other Religion & 1 & 6.67\textbackslash{}\%\\
\hline
NA...257 & NA & NA & NA & NA\\
\hline
...258 & Prostitution Offenses - Prostitution & All Other & NA & NA\textbackslash{}\%\\
\hline
...259 & Prostitution Offenses - Prostitution & Total & 15 & 100\textbackslash{}\%\\
\hline
1...260 & Prostitution Offenses - Purchasing Prostitution & Anti-Asian & 1 & 50.00\textbackslash{}\%\\
\hline
2...261 & Prostitution Offenses - Purchasing Prostitution & Anti-Heterosexual & 1 & 50.00\textbackslash{}\%\\
\hline
NA...262 & NA & NA & NA & NA\\
\hline
NA.1...263 & NA & NA & NA & NA\\
\hline
NA.2...264 & NA & NA & NA & NA\\
\hline
...265 & Prostitution Offenses - Purchasing Prostitution & All Other & NA & NA\textbackslash{}\%\\
\hline
...266 & Prostitution Offenses - Purchasing Prostitution & Total & 2 & 100\textbackslash{}\%\\
\hline
...267 & Robbery & Anti-White & 1,153 & 25.57\textbackslash{}\%\\
\hline
...268 & Robbery & Anti-Gay (Male) & 1,079 & 23.93\textbackslash{}\%\\
\hline
...269 & Robbery & Anti-Black & 673 & 14.93\textbackslash{}\%\\
\hline
...270 & Robbery & Anti-Hispanic Or Latino & 544 & 12.06\textbackslash{}\%\\
\hline
...271 & Robbery & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 215 & 4.77\textbackslash{}\%\\
\hline
...272 & Robbery & All Other & 845 & 18.71\textbackslash{}\%\\
\hline
...273 & Robbery & Total & 4,509 & 100\textbackslash{}\%\\
\hline
...274 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-White & 62 & 23.40\textbackslash{}\%\\
\hline
...275 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-Black & 33 & 12.45\textbackslash{}\%\\
\hline
...276 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-Gay (Male) & 32 & 12.08\textbackslash{}\%\\
\hline
...277 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-Mental Disability & 18 & 6.79\textbackslash{}\%\\
\hline
...278 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-American Indian Or Native Alaskan & 14 & 5.28\textbackslash{}\%\\
\hline
...279 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & All Other & 106 & 39.98\textbackslash{}\%\\
\hline
...280 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Total & 265 & 100\textbackslash{}\%\\
\hline
...281 & Sex Offenses - Incest & Anti-White & 2 & 28.57\textbackslash{}\%\\
\hline
...282 & Sex Offenses - Incest & Anti-American Indian Or Native Alaskan & 1 & 14.29\textbackslash{}\%\\
\hline
...283 & Sex Offenses - Incest & Anti-Heterosexual & 1 & 14.29\textbackslash{}\%\\
\hline
...284 & Sex Offenses - Incest & Anti-Lesbian (Female) & 1 & 14.29\textbackslash{}\%\\
\hline
...285 & Sex Offenses - Incest & Anti-Bisexual & 1 & 14.29\textbackslash{}\%\\
\hline
...286 & Sex Offenses - Incest & All Other & 1 & 14.29\textbackslash{}\%\\
\hline
...287 & Sex Offenses - Incest & Total & 7 & 100\textbackslash{}\%\\
\hline
...288 & Sex Offenses - Rape & Anti-White & 83 & 25.23\textbackslash{}\%\\
\hline
...289 & Sex Offenses - Rape & Anti-Lesbian (Female) & 50 & 15.20\textbackslash{}\%\\
\hline
...290 & Sex Offenses - Rape & Anti-Black & 46 & 13.98\textbackslash{}\%\\
\hline
...291 & Sex Offenses - Rape & Anti-Mental Disability & 20 & 6.08\textbackslash{}\%\\
\hline
...292 & Sex Offenses - Rape & Anti-Female & 16 & 4.86\textbackslash{}\%\\
\hline
...293 & Sex Offenses - Rape & All Other & 114 & 34.63\textbackslash{}\%\\
\hline
...294 & Sex Offenses - Rape & Total & 329 & 100\textbackslash{}\%\\
\hline
...295 & Sex Offenses - Sexual Assault With An Object & Anti-Gay (Male) & 12 & 24.00\textbackslash{}\%\\
\hline
...296 & Sex Offenses - Sexual Assault With An Object & Anti-Black & 7 & 14.00\textbackslash{}\%\\
\hline
...297 & Sex Offenses - Sexual Assault With An Object & Anti-White & 7 & 14.00\textbackslash{}\%\\
\hline
...298 & Sex Offenses - Sexual Assault With An Object & Anti-Lesbian (Female) & 5 & 10.00\textbackslash{}\%\\
\hline
...299 & Sex Offenses - Sexual Assault With An Object & Anti-Transgender & 4 & 8.00\textbackslash{}\%\\
\hline
...300 & Sex Offenses - Sexual Assault With An Object & All Other & 15 & 30\textbackslash{}\%\\
\hline
...301 & Sex Offenses - Sexual Assault With An Object & Total & 50 & 100\textbackslash{}\%\\
\hline
...302 & Sex Offenses - Sodomy & Anti-Gay (Male) & 27 & 31.40\textbackslash{}\%\\
\hline
...303 & Sex Offenses - Sodomy & Anti-White & 11 & 12.79\textbackslash{}\%\\
\hline
...304 & Sex Offenses - Sodomy & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 10 & 11.63\textbackslash{}\%\\
\hline
...305 & Sex Offenses - Sodomy & Anti-Heterosexual & 8 & 9.30\textbackslash{}\%\\
\hline
...306 & Sex Offenses - Sodomy & Anti-Transgender & 7 & 8.14\textbackslash{}\%\\
\hline
...307 & Sex Offenses - Sodomy & All Other & 23 & 26.75\textbackslash{}\%\\
\hline
...308 & Sex Offenses - Sodomy & Total & 86 & 100\textbackslash{}\%\\
\hline
...309 & Sex Offenses - Statutory Rape & Anti-White & 7 & 31.82\textbackslash{}\%\\
\hline
...310 & Sex Offenses - Statutory Rape & Anti-Gay (Male) & 2 & 9.09\textbackslash{}\%\\
\hline
...311 & Sex Offenses - Statutory Rape & Anti-Black & 2 & 9.09\textbackslash{}\%\\
\hline
...312 & Sex Offenses - Statutory Rape & Anti-Heterosexual & 2 & 9.09\textbackslash{}\%\\
\hline
...313 & Sex Offenses - Statutory Rape & Anti-American Indian Or Native Alaskan & 2 & 9.09\textbackslash{}\%\\
\hline
...314 & Sex Offenses - Statutory Rape & All Other & 7 & 31.85\textbackslash{}\%\\
\hline
...315 & Sex Offenses - Statutory Rape & Total & 22 & 100\textbackslash{}\%\\
\hline
...316 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-White & 47 & 31.76\textbackslash{}\%\\
\hline
...317 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-American Indian Or Native Alaskan & 20 & 13.51\textbackslash{}\%\\
\hline
...318 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-Black & 17 & 11.49\textbackslash{}\%\\
\hline
...319 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-Sikh & 8 & 5.41\textbackslash{}\%\\
\hline
...320 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-Mental Disability & 6 & 4.05\textbackslash{}\%\\
\hline
...321 & Stolen Property Offenses (Receiving, Selling, Etc.) & All Other & 50 & 33.79\textbackslash{}\%\\
\hline
...322 & Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 148 & 100\textbackslash{}\%\\
\hline
...323 & Undocumented Code & Anti-White & 5 & 29.41\textbackslash{}\%\\
\hline
...324 & Undocumented Code & Anti-Black & 4 & 23.53\textbackslash{}\%\\
\hline
...325 & Undocumented Code & Anti-American Indian Or Native Alaskan & 3 & 17.65\textbackslash{}\%\\
\hline
...326 & Undocumented Code & Anti-Catholic & 1 & 5.88\textbackslash{}\%\\
\hline
...327 & Undocumented Code & Anti-Male & 1 & 5.88\textbackslash{}\%\\
\hline
...328 & Undocumented Code & All Other & 3 & 17.64\textbackslash{}\%\\
\hline
...329 & Undocumented Code & Total & 17 & 100\textbackslash{}\%\\
\hline
...330 & Weapon Law Violations & Anti-Black & 179 & 35.73\textbackslash{}\%\\
\hline
...331 & Weapon Law Violations & Anti-White & 98 & 19.56\textbackslash{}\%\\
\hline
...332 & Weapon Law Violations & Anti-American Indian Or Native Alaskan & 26 & 5.19\textbackslash{}\%\\
\hline
...333 & Weapon Law Violations & Anti-Hispanic Or Latino & 26 & 5.19\textbackslash{}\%\\
\hline
...334 & Weapon Law Violations & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 20 & 3.99\textbackslash{}\%\\
\hline
...335 & Weapon Law Violations & All Other & 152 & 30.38\textbackslash{}\%\\
\hline
...336 & Weapon Law Violations & Total & 501 & 100\textbackslash{}\%\\
\hline
\end{longtable}




### The location of the crime

This data is interesting because it includes the location - in categories for types of places, not actual addresses - of the incident. This is important since the type of location can be a factor in whether the incident is classified as a hate crime. For example, spray paint on a synagogue or a mosque is much more likely to be a hate crime than spray paint on a wall of an abandoned building. Table \@ref(tab:hateLocations) shows the locations of hate crimes, including the first year that location was reported. Each hate crime incident can have multiple locations (up to ten) since each offense can have its own incident, but in most cases (96.6%) a hate crime only has a single location. 

As with the crime and the bias motivation, the available locations have increased as time went on, though these newer locations are relatively uncommon. One important change in location is that starting in 2010 the location of "school/college" was split to have one location be for elementary and high schools and another location be for colleges and universities. The majority of hate crimes occur in the victim's home (30%), on a road or alley (19%), in an other or unknown location (13%), and in a parking lot or parking garage (6%). All other locations occur in fewer than 5% of hate crimes. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hateLocations)The location of hate crime incidents. In incidents with multiple locations, this shows only the first location recorded.}\\
\hline
Location & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateLocations)The location of hate crime incidents. In incidents with multiple locations, this shows only the first location recorded. \textit{(continued)}}\\
\hline
Location & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endhead
Total &  & 252,094 & 100\textbackslash{}\%\\
\hline
Residence/Home & 1991 & 73,887 & 29.31\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & 1991 & 47,006 & 18.65\textbackslash{}\%\\
\hline
Other/Unknown & 1991 & 32,073 & 12.72\textbackslash{}\%\\
\hline
School/College & 1991 & 17,679 & 7.01\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & 1991 & 14,389 & 5.71\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & 1991 & 9,454 & 3.75\textbackslash{}\%\\
\hline
Commercial/Office Building & 1991 & 5,673 & 2.25\textbackslash{}\%\\
\hline
Restaurant & 1991 & 5,419 & 2.15\textbackslash{}\%\\
\hline
School - Elementary/Secondary & 2010 & 4,899 & 1.94\textbackslash{}\%\\
\hline
Bar/Nightclub & 1991 & 4,270 & 1.69\textbackslash{}\%\\
\hline
Government/Public Building & 1991 & 3,785 & 1.50\textbackslash{}\%\\
\hline
Convenience Store & 1991 & 3,531 & 1.40\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & 1991 & 2,926 & 1.16\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & 1991 & 2,728 & 1.08\textbackslash{}\%\\
\hline
Service/Gas Station & 1991 & 2,414 & 0.96\textbackslash{}\%\\
\hline
Park/Playground & 2010 & 2,356 & 0.93\textbackslash{}\%\\
\hline
School - College/University & 2010 & 2,351 & 0.93\textbackslash{}\%\\
\hline
Grocery/Supermarket & 1991 & 2,325 & 0.92\textbackslash{}\%\\
\hline
Field/Woods & 1991 & 2,241 & 0.89\textbackslash{}\%\\
\hline
Department/Discount Store & 1991 & 2,159 & 0.86\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & 1991 & 2,121 & 0.84\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & 1991 & 1,858 & 0.74\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & 1991 & 1,738 & 0.69\textbackslash{}\%\\
\hline
Construction Site & 1991 & 698 & 0.28\textbackslash{}\%\\
\hline
Bank/Savings And Loan & 1991 & 596 & 0.24\textbackslash{}\%\\
\hline
Undocumented Code & 2016 & 590 & 0.23\textbackslash{}\%\\
\hline
Liquor Store & 1991 & 492 & 0.20\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & 1991 & 436 & 0.17\textbackslash{}\%\\
\hline
Shopping Mall & 2010 & 325 & 0.13\textbackslash{}\%\\
\hline
Rental Storage Facility & 1991 & 276 & 0.11\textbackslash{}\%\\
\hline
Community Center & 2013 & 264 & 0.10\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & 2011 & 202 & 0.08\textbackslash{}\%\\
\hline
Industrial Site & 2010 & 155 & 0.06\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & 2011 & 106 & 0.04\textbackslash{}\%\\
\hline
Camp/Campground & 2010 & 94 & 0.04\textbackslash{}\%\\
\hline
Auto Dealership New/Used & 2011 & 92 & 0.04\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & 2011 & 90 & 0.04\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & 2010 & 79 & 0.03\textbackslash{}\%\\
\hline
Rest Area & 2011 & 68 & 0.03\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & 2012 & 55 & 0.02\textbackslash{}\%\\
\hline
Daycare Facility & 2011 & 52 & 0.02\textbackslash{}\%\\
\hline
Amusement Park & 2011 & 52 & 0.02\textbackslash{}\%\\
\hline
Farm Facility & 2011 & 39 & 0.02\textbackslash{}\%\\
\hline
Tribal Lands & 2011 & 27 & 0.01\textbackslash{}\%\\
\hline
Atm Separate From Bank & 2011 & 18 & 0.01\textbackslash{}\%\\
\hline
Military Installation & 2015 & 6 & 0.00\textbackslash{}\%\\
\hline
\end{longtable}





\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hatelocationOffense)The number and percent of offenses by location, 2023.}\\
\hline
Location & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hatelocationOffense)The number and percent of offenses by location, 2023. \textit{(continued)}}\\
\hline
Location & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
Abandoned/Condemned Structure & Destruction/Damage/Vandalism of Property & 51 & 56.67\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Assault Offenses - Intimidation & 9 & 10.00\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Assault Offenses - Simple Assault & 8 & 8.89\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Burglary/Breaking And Entering & 6 & 6.67\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Assault Offenses - Aggravated Assault & 4 & 4.44\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & All Other & 12 & 13.32\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Total & 90 & 100\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Assault Offenses - Simple Assault & 1,088 & 39.88\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Assault Offenses - Intimidation & 588 & 21.55\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Assault Offenses - Aggravated Assault & 458 & 16.79\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Destruction/Damage/Vandalism of Property & 415 & 15.21\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Robbery & 106 & 3.89\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & All Other & 73 & 2.7\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Total & 2,728 & 100\textbackslash{}\%\\
\hline
Amusement Park & Assault Offenses - Intimidation & 16 & 30.77\textbackslash{}\%\\
\hline
Amusement Park & Assault Offenses - Simple Assault & 15 & 28.85\textbackslash{}\%\\
\hline
Amusement Park & Destruction/Damage/Vandalism of Property & 8 & 15.38\textbackslash{}\%\\
\hline
Amusement Park & Assault Offenses - Aggravated Assault & 6 & 11.54\textbackslash{}\%\\
\hline
Amusement Park & Larceny/Theft Offenses - All Other Larceny & 3 & 5.77\textbackslash{}\%\\
\hline
Amusement Park & All Other & 4 & 7.68\textbackslash{}\%\\
\hline
Amusement Park & Total & 52 & 100\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Assault Offenses - Simple Assault & 48 & 45.28\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Assault Offenses - Intimidation & 24 & 22.64\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Destruction/Damage/Vandalism of Property & 21 & 19.81\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Assault Offenses - Aggravated Assault & 8 & 7.55\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Larceny/Theft Offenses - All Other Larceny & 1 & 0.94\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & All Other & 4 & 3.76\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Total & 106 & 100\textbackslash{}\%\\
\hline
Atm Separate From Bank & Assault Offenses - Simple Assault & 5 & 27.78\textbackslash{}\%\\
\hline
Atm Separate From Bank & Assault Offenses - Intimidation & 4 & 22.22\textbackslash{}\%\\
\hline
Atm Separate From Bank & Larceny/Theft Offenses - All Other Larceny & 2 & 11.11\textbackslash{}\%\\
\hline
Atm Separate From Bank & Fraud Offenses - Credit Card/Atm Fraud & 2 & 11.11\textbackslash{}\%\\
\hline
Atm Separate From Bank & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1 & 5.56\textbackslash{}\%\\
\hline
Atm Separate From Bank & All Other & 4 & 22.24\textbackslash{}\%\\
\hline
Atm Separate From Bank & Total & 18 & 100\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Assault Offenses - Intimidation & 32 & 34.78\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Destruction/Damage/Vandalism of Property & 13 & 14.13\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Assault Offenses - Simple Assault & 12 & 13.04\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Larceny/Theft Offenses - All Other Larceny & 8 & 8.70\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 6 & 6.52\textbackslash{}\%\\
\hline
Auto Dealership New/Used & All Other & 21 & 22.83\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Total & 92 & 100\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Assault Offenses - Intimidation & 191 & 32.05\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Destruction/Damage/Vandalism of Property & 103 & 17.28\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Assault Offenses - Simple Assault & 73 & 12.25\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Counterfeiting/Forgery & 57 & 9.56\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Assault Offenses - Aggravated Assault & 39 & 6.54\textbackslash{}\%\\
\hline
Bank/Savings And Loan & All Other & 133 & 22.32\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Total & 596 & 100\textbackslash{}\%\\
\hline
Bar/Nightclub & Assault Offenses - Simple Assault & 1,968 & 46.09\textbackslash{}\%\\
\hline
Bar/Nightclub & Assault Offenses - Aggravated Assault & 1,021 & 23.91\textbackslash{}\%\\
\hline
Bar/Nightclub & Assault Offenses - Intimidation & 793 & 18.57\textbackslash{}\%\\
\hline
Bar/Nightclub & Destruction/Damage/Vandalism of Property & 285 & 6.67\textbackslash{}\%\\
\hline
Bar/Nightclub & Robbery & 64 & 1.50\textbackslash{}\%\\
\hline
Bar/Nightclub & All Other & 139 & 3.22\textbackslash{}\%\\
\hline
Bar/Nightclub & Total & 4,270 & 100\textbackslash{}\%\\
\hline
Camp/Campground & Destruction/Damage/Vandalism of Property & 28 & 29.79\textbackslash{}\%\\
\hline
Camp/Campground & Assault Offenses - Simple Assault & 20 & 21.28\textbackslash{}\%\\
\hline
Camp/Campground & Assault Offenses - Intimidation & 18 & 19.15\textbackslash{}\%\\
\hline
Camp/Campground & Assault Offenses - Aggravated Assault & 12 & 12.77\textbackslash{}\%\\
\hline
Camp/Campground & Larceny/Theft Offenses - All Other Larceny & 6 & 6.38\textbackslash{}\%\\
\hline
Camp/Campground & All Other & 10 & 10.61\textbackslash{}\%\\
\hline
Camp/Campground & Total & 94 & 100\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Destruction/Damage/Vandalism of Property & 6,329 & 66.95\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Assault Offenses - Intimidation & 1,820 & 19.25\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Burglary/Breaking And Entering & 380 & 4.02\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Arson & 337 & 3.56\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Assault Offenses - Simple Assault & 251 & 2.65\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & All Other & 337 & 3.57\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Total & 9,454 & 100\textbackslash{}\%\\
\hline
Commercial/Office Building & Assault Offenses - Intimidation & 2,416 & 42.59\textbackslash{}\%\\
\hline
Commercial/Office Building & Destruction/Damage/Vandalism of Property & 1,837 & 32.38\textbackslash{}\%\\
\hline
Commercial/Office Building & Assault Offenses - Simple Assault & 722 & 12.73\textbackslash{}\%\\
\hline
Commercial/Office Building & Assault Offenses - Aggravated Assault & 256 & 4.51\textbackslash{}\%\\
\hline
Commercial/Office Building & Burglary/Breaking And Entering & 121 & 2.13\textbackslash{}\%\\
\hline
Commercial/Office Building & All Other & 321 & 5.68\textbackslash{}\%\\
\hline
Commercial/Office Building & Total & 5,673 & 100\textbackslash{}\%\\
\hline
Community Center & Assault Offenses - Intimidation & 108 & 40.91\textbackslash{}\%\\
\hline
Community Center & Destruction/Damage/Vandalism of Property & 84 & 31.82\textbackslash{}\%\\
\hline
Community Center & Assault Offenses - Simple Assault & 44 & 16.67\textbackslash{}\%\\
\hline
Community Center & Assault Offenses - Aggravated Assault & 14 & 5.30\textbackslash{}\%\\
\hline
Community Center & Burglary/Breaking And Entering & 4 & 1.52\textbackslash{}\%\\
\hline
Community Center & All Other & 10 & 3.8\textbackslash{}\%\\
\hline
Community Center & Total & 264 & 100\textbackslash{}\%\\
\hline
Construction Site & Destruction/Damage/Vandalism of Property & 390 & 55.87\textbackslash{}\%\\
\hline
Construction Site & Assault Offenses - Intimidation & 109 & 15.62\textbackslash{}\%\\
\hline
Construction Site & Assault Offenses - Simple Assault & 57 & 8.17\textbackslash{}\%\\
\hline
Construction Site & Burglary/Breaking And Entering & 44 & 6.30\textbackslash{}\%\\
\hline
Construction Site & Assault Offenses - Aggravated Assault & 39 & 5.59\textbackslash{}\%\\
\hline
Construction Site & All Other & 59 & 8.45\textbackslash{}\%\\
\hline
Construction Site & Total & 698 & 100\textbackslash{}\%\\
\hline
Convenience Store & Assault Offenses - Intimidation & 1,193 & 33.79\textbackslash{}\%\\
\hline
Convenience Store & Assault Offenses - Simple Assault & 956 & 27.07\textbackslash{}\%\\
\hline
Convenience Store & Assault Offenses - Aggravated Assault & 501 & 14.19\textbackslash{}\%\\
\hline
Convenience Store & Destruction/Damage/Vandalism of Property & 397 & 11.24\textbackslash{}\%\\
\hline
Convenience Store & Larceny/Theft Offenses - Shoplifting & 114 & 3.23\textbackslash{}\%\\
\hline
Convenience Store & All Other & 370 & 10.48\textbackslash{}\%\\
\hline
Convenience Store & Total & 3,531 & 100\textbackslash{}\%\\
\hline
Daycare Facility & Destruction/Damage/Vandalism of Property & 18 & 34.62\textbackslash{}\%\\
\hline
Daycare Facility & Assault Offenses - Intimidation & 13 & 25.00\textbackslash{}\%\\
\hline
Daycare Facility & Assault Offenses - Simple Assault & 10 & 19.23\textbackslash{}\%\\
\hline
Daycare Facility & Assault Offenses - Aggravated Assault & 3 & 5.77\textbackslash{}\%\\
\hline
Daycare Facility & Burglary/Breaking And Entering & 3 & 5.77\textbackslash{}\%\\
\hline
Daycare Facility & All Other & 5 & 9.6\textbackslash{}\%\\
\hline
Daycare Facility & Total & 52 & 100\textbackslash{}\%\\
\hline
Department/Discount Store & Assault Offenses - Intimidation & 590 & 27.33\textbackslash{}\%\\
\hline
Department/Discount Store & Assault Offenses - Simple Assault & 487 & 22.56\textbackslash{}\%\\
\hline
Department/Discount Store & Larceny/Theft Offenses - Shoplifting & 320 & 14.82\textbackslash{}\%\\
\hline
Department/Discount Store & Destruction/Damage/Vandalism of Property & 279 & 12.92\textbackslash{}\%\\
\hline
Department/Discount Store & Assault Offenses - Aggravated Assault & 167 & 7.74\textbackslash{}\%\\
\hline
Department/Discount Store & All Other & 316 & 14.63\textbackslash{}\%\\
\hline
Department/Discount Store & Total & 2,159 & 100\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Assault Offenses - Simple Assault & 20 & 36.36\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Destruction/Damage/Vandalism of Property & 10 & 18.18\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Assault Offenses - Intimidation & 10 & 18.18\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Assault Offenses - Aggravated Assault & 7 & 12.73\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Robbery & 5 & 9.09\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & All Other & 3 & 5.45\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Total & 55 & 100\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Assault Offenses - Intimidation & 881 & 41.54\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Assault Offenses - Simple Assault & 556 & 26.21\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Destruction/Damage/Vandalism of Property & 399 & 18.81\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Assault Offenses - Aggravated Assault & 147 & 6.93\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Larceny/Theft Offenses - Shoplifting & 22 & 1.04\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & All Other & 116 & 5.46\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Total & 2,121 & 100\textbackslash{}\%\\
\hline
Farm Facility & Destruction/Damage/Vandalism of Property & 9 & 23.08\textbackslash{}\%\\
\hline
Farm Facility & Burglary/Breaking And Entering & 7 & 17.95\textbackslash{}\%\\
\hline
Farm Facility & Assault Offenses - Aggravated Assault & 6 & 15.38\textbackslash{}\%\\
\hline
Farm Facility & Assault Offenses - Simple Assault & 5 & 12.82\textbackslash{}\%\\
\hline
Farm Facility & Larceny/Theft Offenses - All Other Larceny & 4 & 10.26\textbackslash{}\%\\
\hline
Farm Facility & All Other & 8 & 20.5\textbackslash{}\%\\
\hline
Farm Facility & Total & 39 & 100\textbackslash{}\%\\
\hline
Field/Woods & Destruction/Damage/Vandalism of Property & 667 & 29.76\textbackslash{}\%\\
\hline
Field/Woods & Assault Offenses - Simple Assault & 530 & 23.65\textbackslash{}\%\\
\hline
Field/Woods & Assault Offenses - Aggravated Assault & 447 & 19.95\textbackslash{}\%\\
\hline
Field/Woods & Assault Offenses - Intimidation & 302 & 13.48\textbackslash{}\%\\
\hline
Field/Woods & Robbery & 118 & 5.27\textbackslash{}\%\\
\hline
Field/Woods & All Other & 177 & 7.88\textbackslash{}\%\\
\hline
Field/Woods & Total & 2,241 & 100\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Assault Offenses - Simple Assault & 33 & 41.77\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Assault Offenses - Intimidation & 12 & 15.19\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Larceny/Theft Offenses - All Other Larceny & 8 & 10.13\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Destruction/Damage/Vandalism of Property & 8 & 10.13\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Assault Offenses - Aggravated Assault & 4 & 5.06\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & All Other & 14 & 17.74\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Total & 79 & 100\textbackslash{}\%\\
\hline
Government/Public Building & Destruction/Damage/Vandalism of Property & 1,426 & 37.68\textbackslash{}\%\\
\hline
Government/Public Building & Assault Offenses - Intimidation & 1,383 & 36.54\textbackslash{}\%\\
\hline
Government/Public Building & Assault Offenses - Simple Assault & 581 & 15.35\textbackslash{}\%\\
\hline
Government/Public Building & Assault Offenses - Aggravated Assault & 195 & 5.15\textbackslash{}\%\\
\hline
Government/Public Building & Larceny/Theft Offenses - All Other Larceny & 36 & 0.95\textbackslash{}\%\\
\hline
Government/Public Building & All Other & 164 & 4.34\textbackslash{}\%\\
\hline
Government/Public Building & Total & 3,785 & 100\textbackslash{}\%\\
\hline
Grocery/Supermarket & Assault Offenses - Intimidation & 702 & 30.19\textbackslash{}\%\\
\hline
Grocery/Supermarket & Assault Offenses - Simple Assault & 619 & 26.62\textbackslash{}\%\\
\hline
Grocery/Supermarket & Destruction/Damage/Vandalism of Property & 329 & 14.15\textbackslash{}\%\\
\hline
Grocery/Supermarket & Assault Offenses - Aggravated Assault & 246 & 10.58\textbackslash{}\%\\
\hline
Grocery/Supermarket & Larceny/Theft Offenses - Shoplifting & 199 & 8.56\textbackslash{}\%\\
\hline
Grocery/Supermarket & All Other & 230 & 9.87\textbackslash{}\%\\
\hline
Grocery/Supermarket & Total & 2,325 & 100\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Assault Offenses - Simple Assault & 13,746 & 29.24\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Assault Offenses - Aggravated Assault & 10,788 & 22.95\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Assault Offenses - Intimidation & 10,312 & 21.94\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Destruction/Damage/Vandalism of Property & 7,701 & 16.38\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Robbery & 2,241 & 4.77\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & All Other & 2,218 & 4.69\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Total & 47,006 & 100\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Assault Offenses - Intimidation & 541 & 31.13\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Assault Offenses - Simple Assault & 495 & 28.48\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Destruction/Damage/Vandalism of Property & 256 & 14.73\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Assault Offenses - Aggravated Assault & 242 & 13.92\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Robbery & 31 & 1.78\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & All Other & 173 & 9.99\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Total & 1,738 & 100\textbackslash{}\%\\
\hline
Industrial Site & Assault Offenses - Intimidation & 58 & 37.42\textbackslash{}\%\\
\hline
Industrial Site & Destruction/Damage/Vandalism of Property & 41 & 26.45\textbackslash{}\%\\
\hline
Industrial Site & Assault Offenses - Simple Assault & 18 & 11.61\textbackslash{}\%\\
\hline
Industrial Site & Assault Offenses - Aggravated Assault & 13 & 8.39\textbackslash{}\%\\
\hline
Industrial Site & Larceny/Theft Offenses - All Other Larceny & 9 & 5.81\textbackslash{}\%\\
\hline
Industrial Site & All Other & 16 & 10.35\textbackslash{}\%\\
\hline
Industrial Site & Total & 155 & 100\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Simple Assault & 978 & 52.64\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Aggravated Assault & 396 & 21.31\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Intimidation & 344 & 18.51\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Destruction/Damage/Vandalism of Property & 51 & 2.74\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Drug/Narcotic Offenses - Drug/Narcotic Violations & 23 & 1.24\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & All Other & 66 & 3.52\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Total & 1,858 & 100\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Assault Offenses - Simple Assault & 136 & 31.19\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Assault Offenses - Aggravated Assault & 104 & 23.85\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Destruction/Damage/Vandalism of Property & 87 & 19.95\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Assault Offenses - Intimidation & 65 & 14.91\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Robbery & 17 & 3.90\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & All Other & 27 & 6.21\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Total & 436 & 100\textbackslash{}\%\\
\hline
Liquor Store & Assault Offenses - Intimidation & 174 & 35.37\textbackslash{}\%\\
\hline
Liquor Store & Assault Offenses - Simple Assault & 112 & 22.76\textbackslash{}\%\\
\hline
Liquor Store & Assault Offenses - Aggravated Assault & 93 & 18.90\textbackslash{}\%\\
\hline
Liquor Store & Destruction/Damage/Vandalism of Property & 55 & 11.18\textbackslash{}\%\\
\hline
Liquor Store & Robbery & 17 & 3.46\textbackslash{}\%\\
\hline
Liquor Store & All Other & 41 & 8.33\textbackslash{}\%\\
\hline
Liquor Store & Total & 492 & 100\textbackslash{}\%\\
\hline
Military Installation & Destruction/Damage/Vandalism of Property & 2 & 33.33\textbackslash{}\%\\
\hline
Military Installation & Larceny/Theft Offenses - All Other Larceny & 1 & 16.67\textbackslash{}\%\\
\hline
Military Installation & Human Trafficking - Involuntary Servitude & 1 & 16.67\textbackslash{}\%\\
\hline
Military Installation & Assault Offenses - Simple Assault & 1 & 16.67\textbackslash{}\%\\
\hline
Military Installation & Murder/Nonnegligent Manslaughter & 1 & 16.67\textbackslash{}\%\\
\hline
Military Installation & All Other & NA & NA\textbackslash{}\%\\
\hline
Military Installation & Total & 6 & 100\textbackslash{}\%\\
\hline
Other/Unknown & Destruction/Damage/Vandalism of Property & 11,530 & 35.95\textbackslash{}\%\\
\hline
Other/Unknown & Assault Offenses - Intimidation & 9,923 & 30.94\textbackslash{}\%\\
\hline
Other/Unknown & Assault Offenses - Simple Assault & 6,021 & 18.77\textbackslash{}\%\\
\hline
Other/Unknown & Assault Offenses - Aggravated Assault & 2,641 & 8.23\textbackslash{}\%\\
\hline
Other/Unknown & Robbery & 593 & 1.85\textbackslash{}\%\\
\hline
Other/Unknown & All Other & 1,365 & 4.27\textbackslash{}\%\\
\hline
Other/Unknown & Total & 32,073 & 100\textbackslash{}\%\\
\hline
Park/Playground & Destruction/Damage/Vandalism of Property & 1,193 & 50.64\textbackslash{}\%\\
\hline
Park/Playground & Assault Offenses - Simple Assault & 405 & 17.19\textbackslash{}\%\\
\hline
Park/Playground & Assault Offenses - Intimidation & 342 & 14.52\textbackslash{}\%\\
\hline
Park/Playground & Assault Offenses - Aggravated Assault & 282 & 11.97\textbackslash{}\%\\
\hline
Park/Playground & Robbery & 66 & 2.80\textbackslash{}\%\\
\hline
Park/Playground & All Other & 68 & 2.86\textbackslash{}\%\\
\hline
Park/Playground & Total & 2,356 & 100\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Destruction/Damage/Vandalism of Property & 4,392 & 30.52\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Assault Offenses - Simple Assault & 3,318 & 23.06\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Assault Offenses - Intimidation & 2,951 & 20.51\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Assault Offenses - Aggravated Assault & 2,392 & 16.62\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Robbery & 345 & 2.40\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & All Other & 991 & 6.88\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Total & 14,389 & 100\textbackslash{}\%\\
\hline
Rental Storage Facility & Destruction/Damage/Vandalism of Property & 106 & 38.41\textbackslash{}\%\\
\hline
Rental Storage Facility & Assault Offenses - Intimidation & 45 & 16.30\textbackslash{}\%\\
\hline
Rental Storage Facility & Burglary/Breaking And Entering & 41 & 14.86\textbackslash{}\%\\
\hline
Rental Storage Facility & Assault Offenses - Simple Assault & 25 & 9.06\textbackslash{}\%\\
\hline
Rental Storage Facility & Assault Offenses - Aggravated Assault & 19 & 6.88\textbackslash{}\%\\
\hline
Rental Storage Facility & All Other & 40 & 14.47\textbackslash{}\%\\
\hline
Rental Storage Facility & Total & 276 & 100\textbackslash{}\%\\
\hline
Residence/Home & Assault Offenses - Intimidation & 27,096 & 36.67\textbackslash{}\%\\
\hline
Residence/Home & Destruction/Damage/Vandalism of Property & 23,877 & 32.32\textbackslash{}\%\\
\hline
Residence/Home & Assault Offenses - Simple Assault & 9,733 & 13.17\textbackslash{}\%\\
\hline
Residence/Home & Assault Offenses - Aggravated Assault & 5,264 & 7.12\textbackslash{}\%\\
\hline
Residence/Home & Burglary/Breaking And Entering & 2,470 & 3.34\textbackslash{}\%\\
\hline
Residence/Home & All Other & 5,447 & 7.36\textbackslash{}\%\\
\hline
Residence/Home & Total & 73,887 & 100\textbackslash{}\%\\
\hline
Rest Area & Destruction/Damage/Vandalism of Property & 40 & 58.82\textbackslash{}\%\\
\hline
Rest Area & Assault Offenses - Simple Assault & 11 & 16.18\textbackslash{}\%\\
\hline
Rest Area & Assault Offenses - Intimidation & 9 & 13.24\textbackslash{}\%\\
\hline
Rest Area & Assault Offenses - Aggravated Assault & 7 & 10.29\textbackslash{}\%\\
\hline
Rest Area & Larceny/Theft Offenses - All Other Larceny & 1 & 1.47\textbackslash{}\%\\
\hline
Rest Area & All Other & NA & NA\textbackslash{}\%\\
\hline
Rest Area & Total & 68 & 100\textbackslash{}\%\\
\hline
Restaurant & Assault Offenses - Intimidation & 1,944 & 35.87\textbackslash{}\%\\
\hline
Restaurant & Assault Offenses - Simple Assault & 1,591 & 29.36\textbackslash{}\%\\
\hline
Restaurant & Destruction/Damage/Vandalism of Property & 937 & 17.29\textbackslash{}\%\\
\hline
Restaurant & Assault Offenses - Aggravated Assault & 641 & 11.83\textbackslash{}\%\\
\hline
Restaurant & Robbery & 58 & 1.07\textbackslash{}\%\\
\hline
Restaurant & All Other & 248 & 4.6\textbackslash{}\%\\
\hline
Restaurant & Total & 5,419 & 100\textbackslash{}\%\\
\hline
School - College/University & Destruction/Damage/Vandalism of Property & 1,238 & 52.66\textbackslash{}\%\\
\hline
School - College/University & Assault Offenses - Intimidation & 668 & 28.41\textbackslash{}\%\\
\hline
School - College/University & Assault Offenses - Simple Assault & 254 & 10.80\textbackslash{}\%\\
\hline
School - College/University & Assault Offenses - Aggravated Assault & 64 & 2.72\textbackslash{}\%\\
\hline
School - College/University & Burglary/Breaking And Entering & 29 & 1.23\textbackslash{}\%\\
\hline
School - College/University & All Other & 98 & 4.16\textbackslash{}\%\\
\hline
School - College/University & Total & 2,351 & 100\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Assault Offenses - Intimidation & 1,814 & 37.03\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Destruction/Damage/Vandalism of Property & 1,655 & 33.78\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Assault Offenses - Simple Assault & 1,043 & 21.29\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Assault Offenses - Aggravated Assault & 175 & 3.57\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Burglary/Breaking And Entering & 44 & 0.90\textbackslash{}\%\\
\hline
School - Elementary/Secondary & All Other & 168 & 3.41\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Total & 4,899 & 100\textbackslash{}\%\\
\hline
School/College & Destruction/Damage/Vandalism of Property & 7,964 & 45.05\textbackslash{}\%\\
\hline
School/College & Assault Offenses - Intimidation & 5,287 & 29.91\textbackslash{}\%\\
\hline
School/College & Assault Offenses - Simple Assault & 3,182 & 18.00\textbackslash{}\%\\
\hline
School/College & Assault Offenses - Aggravated Assault & 694 & 3.93\textbackslash{}\%\\
\hline
School/College & Burglary/Breaking And Entering & 134 & 0.76\textbackslash{}\%\\
\hline
School/College & All Other & 418 & 2.38\textbackslash{}\%\\
\hline
School/College & Total & 17,679 & 100\textbackslash{}\%\\
\hline
Service/Gas Station & Assault Offenses - Intimidation & 803 & 33.26\textbackslash{}\%\\
\hline
Service/Gas Station & Assault Offenses - Simple Assault & 610 & 25.27\textbackslash{}\%\\
\hline
Service/Gas Station & Assault Offenses - Aggravated Assault & 400 & 16.57\textbackslash{}\%\\
\hline
Service/Gas Station & Destruction/Damage/Vandalism of Property & 257 & 10.65\textbackslash{}\%\\
\hline
Service/Gas Station & Larceny/Theft Offenses - All Other Larceny & 106 & 4.39\textbackslash{}\%\\
\hline
Service/Gas Station & All Other & 238 & 9.85\textbackslash{}\%\\
\hline
Service/Gas Station & Total & 2,414 & 100\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Simple Assault & 105 & 51.98\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Intimidation & 50 & 24.75\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Aggravated Assault & 31 & 15.35\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Destruction/Damage/Vandalism of Property & 11 & 5.45\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Sex Offenses - Sodomy & 1 & 0.50\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & All Other & 4 & 2\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Total & 202 & 100\textbackslash{}\%\\
\hline
Shopping Mall & Assault Offenses - Simple Assault & 92 & 28.31\textbackslash{}\%\\
\hline
Shopping Mall & Assault Offenses - Intimidation & 88 & 27.08\textbackslash{}\%\\
\hline
Shopping Mall & Destruction/Damage/Vandalism of Property & 73 & 22.46\textbackslash{}\%\\
\hline
Shopping Mall & Assault Offenses - Aggravated Assault & 35 & 10.77\textbackslash{}\%\\
\hline
Shopping Mall & Larceny/Theft Offenses - Shoplifting & 16 & 4.92\textbackslash{}\%\\
\hline
Shopping Mall & All Other & 21 & 6.49\textbackslash{}\%\\
\hline
Shopping Mall & Total & 325 & 100\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Assault Offenses - Intimidation & 1,116 & 38.14\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Destruction/Damage/Vandalism of Property & 945 & 32.30\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Assault Offenses - Simple Assault & 419 & 14.32\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Assault Offenses - Aggravated Assault & 141 & 4.82\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Larceny/Theft Offenses - Shoplifting & 59 & 2.02\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & All Other & 246 & 8.37\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Total & 2,926 & 100\textbackslash{}\%\\
\hline
Tribal Lands & Assault Offenses - Intimidation & 6 & 22.22\textbackslash{}\%\\
\hline
Tribal Lands & Assault Offenses - Simple Assault & 6 & 22.22\textbackslash{}\%\\
\hline
Tribal Lands & Assault Offenses - Aggravated Assault & 6 & 22.22\textbackslash{}\%\\
\hline
Tribal Lands & Destruction/Damage/Vandalism of Property & 5 & 18.52\textbackslash{}\%\\
\hline
Tribal Lands & Undocumented Code & 1 & 3.70\textbackslash{}\%\\
\hline
Tribal Lands & All Other & 3 & 11.1\textbackslash{}\%\\
\hline
Tribal Lands & Total & 27 & 100\textbackslash{}\%\\
\hline
Undocumented Code & Assault Offenses - Intimidation & 529 & 89.66\textbackslash{}\%\\
\hline
Undocumented Code & Fraud Offenses - Other & 16 & 2.71\textbackslash{}\%\\
\hline
Undocumented Code & Pornography/Obscene Material & 8 & 1.36\textbackslash{}\%\\
\hline
Undocumented Code & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 8 & 1.36\textbackslash{}\%\\
\hline
Undocumented Code & Extortion/Blackmail & 7 & 1.19\textbackslash{}\%\\
\hline
Undocumented Code & All Other & 22 & 3.74\textbackslash{}\%\\
\hline
Undocumented Code & Total & 590 & 100\textbackslash{}\%\\
\hline
\end{longtable}




### Number and race of offenders

There are two variables that have information about the people who commit the hate crime: the number of offenders and the race of the offenders. The offender race is recorded as a single value with the race of the group if all are of the same race or it will say a "multi-racial" group if there are offenders of different races. Unfortunately, important information like the age of the offenders, their criminal history, their relationship to the victim, their gender, or whether they are arrested are completely unavailable in this dataset. These variables, however, are available in NIBRS data. 

As shown in Figure \@ref(fig:hateCrimeOffenderNumber), the most common racial group is "unknown" since the police do not know the race of the offenders. Next are White offenders at nearly 40% of hate crimes followed by Black offenders at nearly 13% of hate crimes. The remaining racial groups are rare with about 2% of hate crimes being committed by a multi-racial group of offenders and 0.8 % of hate crimes committed by Asian or Pacific Islander offenders and 0.6 % committed by American Indian or Native Alaskan offenders. Only 0.05% of offenders are Native Hawaiian or Other Pacific Islander.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimeOffenderRace-1} 

}

\caption{The race of offenders, as a group, for hate crime incidents, 1991-2023.}(\#fig:hateCrimeOffenderRace)
\end{figure}

When the police do not have any information about the number of offenders (which is common in cases of property crimes such as vandalism but rare in violent crimes), this data considers that to have zero offenders. The zero is just a placeholder that means that the police do not know how many offenders there are, not that they think there were actually no offenders. Figure \@ref(fig:hateCrimeOffenderNumber) shows the percent of hate crimes from 1991-2023 that have each number of offenders recorded. In the actual data it says the actual number of offenders, with the largest group in the current data going to 99 offenders - in this graph I group 10 or more offenders together for simplicity. I also relabel zero offenders as "Unknown" offenders since that is more accurate. The most common number of offenders per hate crime is one offender, at about 49% of hate crimes from 1991-2023 having only one offender. This drops sharply to 9% of hate crimes having two offenders and continues to drop as the number of offenders increase. However, about a third (36%) of hate crimes have an unknown number of offenders. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimeOffenderNumber-1} 

}

\caption{The race of offenders, as a group, for hate crime incidents, 1991-2023.}(\#fig:hateCrimeOffenderNumber)
\end{figure}

### Number of victims 

When considering the data itself, hate crime data is very similar to most other datasets. It is just the number of crimes that were reported to the police, though with the additional step of having evidence of bias. But the difference in use is that while in other crimes the victim is usually, well, the victim, in hate crimes the victim may be a much wider group. Consider a burglary: the homeowner is the direct victim, as their property was targeted. However, the crime can also affect their neighbors, who may now feel unsafe in their own homes, as well as the victim’s family, who may worry about their safety.

Hate crimes, however, tend to affect not just the direct victim but also the entire targeted group, or at least a broader community. A swastika painted on a synagogue, for example, impacts not only the synagogue's congregation but may instill fear in the broader Jewish community. If a swastika, for example, is spray painted on the front door of a synagogue, who is the victim? Directly it would be whomever owns the synagogue building. But it also affects all members of that congregation. And what about members of other synagogues in the city? What about Jewish people in the city who do not go to synagogue? Even though only a single crime occurred - a vandalism - it is very difficult to count how many victims there were. Is a swastika on a synagogue worse if the synagogue has a small congregation versus a large one? What if it is in a city with only one synagogue compared to a city with many? Is it worse to have a large swastika than a small one? 

If we are trying to use this data to measure hate against a particular group these are questions we need to answer, but are of course impossible to answer with this data. Remember, all of the FBI data is essentially just abstract contextless numbers in a spreadsheet. This is true for all UCR data but especially so for hate crimes where no two hate crimes are equal. One burglary in City A is about equivalent to one burglary in City B. For hate crimes a single incident may affect far more people in City A than in City B. 

In fact, I would argue that this issue is bad enough that we should be extraordinarily cautious when using this data. Just aggregating up the number of incidents is insufficient to measuring either hate or fear. Sure, you can measure the number of hate crimes reported to the police and where the police found adequate evidence to label the crime as bias motivated. But is that really what you want be measuring when using hate crime data? 

Nonetheless, this is a book about the data. So let us look at one final variable in this data, the number of victims for each incident. This is not going to be true number of people affected by the crime. It is more the number of direct victims for the incident. Whether that is actually better than just counting incidents is dependent on the context of your question and the hate crimes in question. In Figure \@ref(fig:jewishIncidentVictim) I show the annual number of anti-Jewish hate crimes reported by all agencies in the country. As may be expected, there are always more victims than incidents though the trends are extremely similar over the entire period of data. This trend is also present for other bias motivations, such as anti-Black hate crimes shown in Figure \@ref(fig:blackIncidentVictim). 

While this variable is available in the data, I actually think it is best not to use it. I think there is always a danger in being overly precise and, therefore, overly confident about what the data shows. When you use the number of incidents you implicitly allow for each incident to affect multiple people^[One of the points of hate crimes is to cause fear in more than just the direct victim of the crime.] and readers understand that. But if you use this variable and say that "this is the number of victims of this crime" you are implicitly closing that door and therefore being too confident about how many victims of a crime there is. This is especially true for readers who are not paying close attention - such as academics reviewing papers or New York Times reporters - since they may think you are measuring the number of victims in a better way than you actually are. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/jewishIncidentVictim-1} 

}

\caption{The annual number of anti-Jewish hate crime incidents and victims in the United States, 1991-2023.}(\#fig:jewishIncidentVictim)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/blackIncidentVictim-1} 

}

\caption{The annual number of anti-Black hate crime incidents and victims in the United States, 1991-2023.}(\#fig:blackIncidentVictim)
\end{figure}

