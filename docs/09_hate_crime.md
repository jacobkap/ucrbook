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

\caption{The percent of agencies that report a hate crime in a given year that also reported a hate crime in the previous year, 1992-2022}(\#fig:hateCrimesPreviousYear)
\end{figure}

Another way to understand reporting is to look at the number of reported hate crimes by state and see which states report and which do not. Figure \@ref(fig:hateCrimesMap) does this for 2022 data by showing the number of reported hate crime incidents by state. Unfortunately what we have done here is basically create a population map, though with California as a clear outlier. Counting up and graphing or mapping the number of crimes is a common first response to getting new data but is not actually that helpful. Here we see that the states with the biggest populations - California, New York, Texas,  - have the most hate crimes. To be more useful let us look at state-level reporting after adjusting to the number of agencies in the state and to the civilian population.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesMap-1} 

}

\caption{Total reported hate crimes by state, 2022}(\#fig:hateCrimesMap)
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

\caption{The day of the week that hate crimes occurred on, 1991-2022}(\#fig:hateCrimesByDay)
\end{figure}

We can also look at which day of the month is most common, as shown in Figure \@ref(fig:hateCrimesByMonthDay). There's no pattern that I can see other than the the 1st of the most has the most hate crimes and the end of the month has the fewest. Not all months have more than 28 days so it makes sense that the 29th, 30th, and 31st are the least common days. Is the 1st of the month really the most dangerous? I think this is likely just a quirk of the data, and is something we also see in NIBRS data. When an agency does not report an actual date they may use the 1st of the month as a placeholder which then looks to us like the 1st is an especially prolific day for hate crimes. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesByMonthDay-1} 

}

\caption{The day of the month that hate crimes occurred on, 1991-2022}(\#fig:hateCrimesByMonthDay)
\end{figure}

### The bias motivation (who the hate is against)

The most important variable in this data is the "bias motivation" which is the FBI's term for the cause of the hate. A hate crime targeted against Black people would be an "anti-Black" bias motivation. For the police to classify an incident as a hate crime, and to assign a particular bias motivation, the police must have *some* evidence that the crime was motivated by hate. The victim saying that the crime is a hate crime alone is not sufficient - though if large portions of the victim's community believe that the crime is a hate crime, this can be a factor in the police's assessment. 

The evidence required is not major. It includes evidence as explicit as slurs said during an incident and less obvious factors like the crime occurring on an important holiday for that community (e.g. Martin Luther King Day, religious holidays). The FBI also encourages police to consider the totality of the evidence even if none alone strongly suggests that the crime was a hate crime in making their determination about whether the incident was a hate crime or not. This also means that many (perhaps most) hate crimes will not be recorded as hate crimes since there is no evidence that the crime is motivated by hate. 

Consider, for example, a person who is biased against Asian people and decides to rob them because they are Asian. This is clearly a hate crime. And say this persons robs 10 Asian people in 10 different incidents, causing 10 hate crimes. All of the victims report it to the police but only two of them tell the police that they think it was a hate crime; the other eight do not think it is a hate crime. Without additional information the police would likely not report any of these robberies as hate crimes. And if all ten of the victims happened to be surveyed about crime victimization, such as through the Bureau of Justice Statistics' National Crime Victimization Survey, only two of the 10 victims would report being the victim of a hate crime. Using FBI data the anti-Asian hate crimes would be zero; using victimization surveys would undercount anti-Asian hate crimes enormously. This is the main problem with using hate crime data, even with perfect reporting or surveys of everyone possibly victimized we may still be getting data that is completely incorrect.

In the FBI data bias motivation is based on the offender's perceptions of the victim so even if they are incorrect in who their victim is, if they intended to target someone for their perceived group membership, that is still a hate crime. For example, if a person assaults a man because they think he is gay, that is a hate crime because the assault was motivated by hate towards gay people. Whether the victim is actually gay or not is not relevant - the offender perceived him to be gay so it is an anti-gay hate crime. To make this even more complicated, the offender must have committed the crime because they are motivated, at least to some degree, by their bias against the victim. Being biased against the victim but targeting them for some other reason means that the crime is not a hate crime. 

The biases that the FBI includes in this data have grown over time, with new bias motivations being added in 1997, 2012, 2013, and 2015. Table \@ref(tab:hateBiasMotivation) shows each bias motivation in this data, the year it was first reported, how many hate crimes there were for this bias motivation from 1991-2022 and what percent of hate crimes that bias motivation makes up. 

To make the most common bias motivations easier to identify, the table is sorted by the frequency of incidents. The "first year" column reflects the first year that the bias motivation was officially recorded, though some biases may have existed earlier but were not yet captured in the data. The last column in this table shows the percent of hate crime incidents from 1991-2022. 

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
Total &  & 240,108 & 100\textbackslash{}\%\\
\hline
Anti-Black & 1991 & 81,208 & 33.82\textbackslash{}\%\\
\hline
Anti-Jewish & 1991 & 29,967 & 12.48\textbackslash{}\%\\
\hline
Anti-White & 1991 & 27,360 & 11.39\textbackslash{}\%\\
\hline
Anti-Male Homosexual (Gay) & 1991 & 23,862 & 9.94\textbackslash{}\%\\
\hline
Anti-Hispanic & 1991 & 15,397 & 6.41\textbackslash{}\%\\
\hline
Anti-Ethnicity Other Than Hispanic & 1991 & 11,498 & 4.79\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT) & 1991 & 7,815 & 3.25\textbackslash{}\%\\
\hline
Anti-Asian & 1991 & 7,671 & 3.19\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & 1991 & 5,652 & 2.35\textbackslash{}\%\\
\hline
Anti-Female Homosexual (Lesbian) & 1991 & 4,876 & 2.03\textbackslash{}\%\\
\hline
Anti-Muslim & 1991 & 4,206 & 1.75\textbackslash{}\%\\
\hline
Anti-Other Religion & 1991 & 3,621 & 1.51\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & 1991 & 2,781 & 1.16\textbackslash{}\%\\
\hline
Anti-Catholic & 1991 & 1,819 & 0.76\textbackslash{}\%\\
\hline
Anti-Arab & 1991 & 1,510 & 0.63\textbackslash{}\%\\
\hline
Anti-Transgender & 2013 & 1,500 & 0.62\textbackslash{}\%\\
\hline
Anti-Protestant & 1991 & 1,361 & 0.57\textbackslash{}\%\\
\hline
Anti-Mental Disability & 1997 & 1,333 & 0.56\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & 1991 & 1,314 & 0.55\textbackslash{}\%\\
\hline
Anti-Physical Disability & 1997 & 752 & 0.31\textbackslash{}\%\\
\hline
Anti-Sikh & 2015 & 673 & 0.28\textbackslash{}\%\\
\hline
Anti-Bisexual & 1991 & 652 & 0.27\textbackslash{}\%\\
\hline
Anti-Heterosexual & 1991 & 615 & 0.26\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & 2012 & 514 & 0.21\textbackslash{}\%\\
\hline
Anti-Female & 2012 & 443 & 0.18\textbackslash{}\%\\
\hline
Anti-Other Christian & 2015 & 403 & 0.17\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & 2015 & 388 & 0.16\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & 1991 & 201 & 0.08\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & 2013 & 184 & 0.08\textbackslash{}\%\\
\hline
Anti-Male & 2013 & 171 & 0.07\textbackslash{}\%\\
\hline
Anti-Mormon & 2015 & 106 & 0.04\textbackslash{}\%\\
\hline
Anti-Hindu & 2015 & 103 & 0.04\textbackslash{}\%\\
\hline
Anti-Buddhist & 2015 & 101 & 0.04\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & 2015 & 51 & 0.02\textbackslash{}\%\\
\hline
\end{longtable}



2015 is the year with the most bias additions, as of data through 2022. This year added a number of religions such as Anti-Buddhist, Anti-Sikh, and Anti-Jehovah's Witness. In 2013, anti-Transgender was added and this is the most common of the bias motivations added since data began in 1991 with 1500 hate crimes between 2013-2022 - 0.62% of all hate crime incidents from 1991-2022. That year also added anti-male and Anti-Native Hawaiian or Other Pacific Islander, which is the most recent racial group added. In 2012, anti-gender non-conforming and anti-female were included, while in 1997 both anti-mental and anti-physical disability were added. In part due to having fewer years of data available, these newer bias motivations make up a small percent of total hate crimes. 

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
Total &  & 240,108 & 100\textbackslash{}\%\\
\hline
Destruction of Property/Vandalism & 1991 & 72,489 & 30.19\textbackslash{}\%\\
\hline
Intimidation & 1991 & 71,583 & 29.81\textbackslash{}\%\\
\hline
Simple Assault & 1991 & 47,917 & 19.96\textbackslash{}\%\\
\hline
Aggravated Assault & 1991 & 26,879 & 11.19\textbackslash{}\%\\
\hline
Robbery & 1991 & 4,339 & 1.81\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 3,890 & 1.62\textbackslash{}\%\\
\hline
All Other Larceny & 1993 & 2,584 & 1.08\textbackslash{}\%\\
\hline
Arson & 1991 & 1,456 & 0.61\textbackslash{}\%\\
\hline
Drug/Narcotic Violations & 1993 & 1,380 & 0.57\textbackslash{}\%\\
\hline
Theft-Other & 1991 & 917 & 0.38\textbackslash{}\%\\
\hline
Theft From Motor Vehicle & 1993 & 884 & 0.37\textbackslash{}\%\\
\hline
Shoplifting & 1993 & 771 & 0.32\textbackslash{}\%\\
\hline
Theft From Building & 1994 & 617 & 0.26\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1992 & 577 & 0.24\textbackslash{}\%\\
\hline
Weapon Law Violations & 1993 & 469 & 0.20\textbackslash{}\%\\
\hline
Drug Equipment Violations & 1995 & 391 & 0.16\textbackslash{}\%\\
\hline
False Pretenses/Swindle/Confidence Game & 1997 & 353 & 0.15\textbackslash{}\%\\
\hline
Murder/Non-Negligent Manslaughter & 1991 & 330 & 0.14\textbackslash{}\%\\
\hline
Forcible Rape & 1991 & 314 & 0.13\textbackslash{}\%\\
\hline
Theft of Motor Vehicle Parts/Accessories & 1993 & 249 & 0.10\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 1993 & 245 & 0.10\textbackslash{}\%\\
\hline
Forcible Fondling - Indecent Liberties/Child Molest & 1993 & 225 & 0.09\textbackslash{}\%\\
\hline
Credit Card/Atm Fraud & 1995 & 182 & 0.08\textbackslash{}\%\\
\hline
Impersonation & 2001 & 152 & 0.06\textbackslash{}\%\\
\hline
Kidnapping/Abduction & 1994 & 152 & 0.06\textbackslash{}\%\\
\hline
Stolen Property Offenses - Receiving, Selling, Etc. & 1996 & 140 & 0.06\textbackslash{}\%\\
\hline
Fraud-Other & 2016 & 103 & 0.04\textbackslash{}\%\\
\hline
Forcible Sodomy & 1995 & 82 & 0.03\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1995 & 81 & 0.03\textbackslash{}\%\\
\hline
Embezzlement & 1995 & 66 & 0.03\textbackslash{}\%\\
\hline
Extortion/Blackmail & 1997 & 62 & 0.03\textbackslash{}\%\\
\hline
Sexual Assault With An Object & 1996 & 41 & 0.02\textbackslash{}\%\\
\hline
Purse-Snatching & 1995 & 29 & 0.01\textbackslash{}\%\\
\hline
Pocket-Picking & 1996 & 28 & 0.01\textbackslash{}\%\\
\hline
Wire Fraud & 2006 & 26 & 0.01\textbackslash{}\%\\
\hline
Statutory Rape & 1999 & 21 & 0.01\textbackslash{}\%\\
\hline
Theft From Coin-Operated Machine Or Device & 1999 & 16 & 0.01\textbackslash{}\%\\
\hline
Unknown & 2018 & 15 & 0.01\textbackslash{}\%\\
\hline
Prostitution & 2001 & 14 & 0.01\textbackslash{}\%\\
\hline
Negligent Manslaughter & 1999 & 8 & 0.00\textbackslash{}\%\\
\hline
Welfare Fraud & 1996 & 8 & 0.00\textbackslash{}\%\\
\hline
Incest & 1997 & 7 & 0.00\textbackslash{}\%\\
\hline
Assisting Or Promoting Prostitution & 2013 & 5 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 2017 & 4 & 0.00\textbackslash{}\%\\
\hline
Bribery & 2014 & 4 & 0.00\textbackslash{}\%\\
\hline
Purchasing Prostitution & 2013 & 2 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
\end{longtable}



Agencies that report to the FBI's National Incident-Based Reporting System (NIBRS) can also report bias motivations for their crimes, and these reports are included in this dataset. One tricky thing is that the crimes included are different depending on if the agency reported through NIBRS or to the dataset directly, and are not NIBRS reporting agencies. NIBRS agencies report all of the crimes as the agencies directly submitting SRS data, but have a wider variety of crimes they can report. In practice, however, both NIBRS and SRS reporting agencies can report the most common offenses so there is relatively little difference.



\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hateBiasOffense)The number and percent of offenses by bias motivation, 2022.}\\
\hline
Bias Motivation & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateBiasOffense)The number and percent of offenses by bias motivation, 2022. \textit{(continued)}}\\
\hline
Bias Motivation & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
Anti-American Indian Or Native Alaskan & Simple Assault & 536 & 19.27\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & Intimidation & 425 & 15.28\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & Destruction of Property/Vandalism & 409 & 14.71\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & Aggravated Assault & 270 & 9.71\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & All Other Larceny & 192 & 6.90\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & All Other & 949 & 34.15\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & Total & 2,781 & 100\textbackslash{}\%\\
\hline
Anti-Arab & Intimidation & 582 & 38.54\textbackslash{}\%\\
\hline
Anti-Arab & Simple Assault & 351 & 23.25\textbackslash{}\%\\
\hline
Anti-Arab & Destruction of Property/Vandalism & 291 & 19.27\textbackslash{}\%\\
\hline
Anti-Arab & Aggravated Assault & 169 & 11.19\textbackslash{}\%\\
\hline
Anti-Arab & Burglary/Breaking And Entering & 21 & 1.39\textbackslash{}\%\\
\hline
Anti-Arab & All Other & 96 & 6.38\textbackslash{}\%\\
\hline
Anti-Arab & Total & 1,510 & 100\textbackslash{}\%\\
\hline
Anti-Asian & Intimidation & 2,544 & 33.16\textbackslash{}\%\\
\hline
Anti-Asian & Destruction of Property/Vandalism & 2,002 & 26.10\textbackslash{}\%\\
\hline
Anti-Asian & Simple Assault & 1,787 & 23.30\textbackslash{}\%\\
\hline
Anti-Asian & Aggravated Assault & 753 & 9.82\textbackslash{}\%\\
\hline
Anti-Asian & Burglary/Breaking And Entering & 148 & 1.93\textbackslash{}\%\\
\hline
Anti-Asian & All Other & 437 & 5.67\textbackslash{}\%\\
\hline
Anti-Asian & Total & 7,671 & 100\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & Destruction of Property/Vandalism & 74 & 36.82\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & All Other Larceny & 22 & 10.95\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & Simple Assault & 21 & 10.45\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & Intimidation & 16 & 7.96\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & Burglary/Breaking And Entering & 13 & 6.47\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & All Other & 55 & 27.39\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & Total & 201 & 100\textbackslash{}\%\\
\hline
Anti-Bisexual & Simple Assault & 186 & 28.53\textbackslash{}\%\\
\hline
Anti-Bisexual & Intimidation & 125 & 19.17\textbackslash{}\%\\
\hline
Anti-Bisexual & Destruction of Property/Vandalism & 90 & 13.80\textbackslash{}\%\\
\hline
Anti-Bisexual & Aggravated Assault & 64 & 9.82\textbackslash{}\%\\
\hline
Anti-Bisexual & All Other Larceny & 47 & 7.21\textbackslash{}\%\\
\hline
Anti-Bisexual & All Other & 140 & 21.46\textbackslash{}\%\\
\hline
Anti-Bisexual & Total & 652 & 100\textbackslash{}\%\\
\hline
Anti-Black & Intimidation & 29,761 & 36.65\textbackslash{}\%\\
\hline
Anti-Black & Destruction of Property/Vandalism & 23,283 & 28.67\textbackslash{}\%\\
\hline
Anti-Black & Simple Assault & 14,789 & 18.21\textbackslash{}\%\\
\hline
Anti-Black & Aggravated Assault & 9,760 & 12.02\textbackslash{}\%\\
\hline
Anti-Black & Burglary/Breaking And Entering & 978 & 1.20\textbackslash{}\%\\
\hline
Anti-Black & All Other & 2,637 & 3.24\textbackslash{}\%\\
\hline
Anti-Black & Total & 81,208 & 100\textbackslash{}\%\\
\hline
Anti-Buddhist & Destruction of Property/Vandalism & 38 & 37.62\textbackslash{}\%\\
\hline
Anti-Buddhist & Simple Assault & 12 & 11.88\textbackslash{}\%\\
\hline
Anti-Buddhist & All Other Larceny & 7 & 6.93\textbackslash{}\%\\
\hline
Anti-Buddhist & Aggravated Assault & 7 & 6.93\textbackslash{}\%\\
\hline
Anti-Buddhist & Burglary/Breaking And Entering & 5 & 4.95\textbackslash{}\%\\
\hline
Anti-Buddhist & All Other & 32 & 31.68\textbackslash{}\%\\
\hline
Anti-Buddhist & Total & 101 & 100\textbackslash{}\%\\
\hline
Anti-Catholic & Destruction of Property/Vandalism & 1,066 & 58.60\textbackslash{}\%\\
\hline
Anti-Catholic & Intimidation & 201 & 11.05\textbackslash{}\%\\
\hline
Anti-Catholic & Simple Assault & 96 & 5.28\textbackslash{}\%\\
\hline
Anti-Catholic & Burglary/Breaking And Entering & 82 & 4.51\textbackslash{}\%\\
\hline
Anti-Catholic & All Other Larceny & 59 & 3.24\textbackslash{}\%\\
\hline
Anti-Catholic & All Other & 315 & 17.23\textbackslash{}\%\\
\hline
Anti-Catholic & Total & 1,819 & 100\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & Destruction of Property/Vandalism & 64 & 16.49\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & Simple Assault & 48 & 12.37\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & All Other Larceny & 45 & 11.60\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & Drug/Narcotic Violations & 34 & 8.76\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & Burglary/Breaking And Entering & 31 & 7.99\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & All Other & 166 & 42.81\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & Total & 388 & 100\textbackslash{}\%\\
\hline
Anti-Ethnicity Other Than Hispanic & Intimidation & 4,013 & 34.90\textbackslash{}\%\\
\hline
Anti-Ethnicity Other Than Hispanic & Destruction of Property/Vandalism & 3,271 & 28.45\textbackslash{}\%\\
\hline
Anti-Ethnicity Other Than Hispanic & Simple Assault & 2,245 & 19.53\textbackslash{}\%\\
\hline
Anti-Ethnicity Other Than Hispanic & Aggravated Assault & 1,130 & 9.83\textbackslash{}\%\\
\hline
Anti-Ethnicity Other Than Hispanic & Burglary/Breaking And Entering & 182 & 1.58\textbackslash{}\%\\
\hline
Anti-Ethnicity Other Than Hispanic & All Other & 657 & 5.71\textbackslash{}\%\\
\hline
Anti-Ethnicity Other Than Hispanic & Total & 11,498 & 100\textbackslash{}\%\\
\hline
Anti-Female & Intimidation & 132 & 29.80\textbackslash{}\%\\
\hline
Anti-Female & Simple Assault & 115 & 25.96\textbackslash{}\%\\
\hline
Anti-Female & Aggravated Assault & 58 & 13.09\textbackslash{}\%\\
\hline
Anti-Female & Destruction of Property/Vandalism & 57 & 12.87\textbackslash{}\%\\
\hline
Anti-Female & Forcible Rape & 12 & 2.71\textbackslash{}\%\\
\hline
Anti-Female & All Other & 69 & 15.6\textbackslash{}\%\\
\hline
Anti-Female & Total & 443 & 100\textbackslash{}\%\\
\hline
Anti-Female Homosexual (Lesbian) & Intimidation & 1,624 & 33.31\textbackslash{}\%\\
\hline
Anti-Female Homosexual (Lesbian) & Simple Assault & 1,240 & 25.43\textbackslash{}\%\\
\hline
Anti-Female Homosexual (Lesbian) & Destruction of Property/Vandalism & 1,075 & 22.05\textbackslash{}\%\\
\hline
Anti-Female Homosexual (Lesbian) & Aggravated Assault & 600 & 12.31\textbackslash{}\%\\
\hline
Anti-Female Homosexual (Lesbian) & Burglary/Breaking And Entering & 61 & 1.25\textbackslash{}\%\\
\hline
Anti-Female Homosexual (Lesbian) & All Other & 276 & 5.64\textbackslash{}\%\\
\hline
Anti-Female Homosexual (Lesbian) & Total & 4,876 & 100\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & Simple Assault & 123 & 23.93\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & Destruction of Property/Vandalism & 78 & 15.18\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & Intimidation & 59 & 11.48\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & Aggravated Assault & 50 & 9.73\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & All Other Larceny & 44 & 8.56\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & All Other & 160 & 31.11\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & Total & 514 & 100\textbackslash{}\%\\
\hline
Anti-Heterosexual & Intimidation & 154 & 25.04\textbackslash{}\%\\
\hline
Anti-Heterosexual & Destruction of Property/Vandalism & 151 & 24.55\textbackslash{}\%\\
\hline
Anti-Heterosexual & Simple Assault & 114 & 18.54\textbackslash{}\%\\
\hline
Anti-Heterosexual & Aggravated Assault & 41 & 6.67\textbackslash{}\%\\
\hline
Anti-Heterosexual & Burglary/Breaking And Entering & 22 & 3.58\textbackslash{}\%\\
\hline
Anti-Heterosexual & All Other & 133 & 21.65\textbackslash{}\%\\
\hline
Anti-Heterosexual & Total & 615 & 100\textbackslash{}\%\\
\hline
Anti-Hindu & Intimidation & 31 & 30.10\textbackslash{}\%\\
\hline
Anti-Hindu & Destruction of Property/Vandalism & 26 & 25.24\textbackslash{}\%\\
\hline
Anti-Hindu & Simple Assault & 19 & 18.45\textbackslash{}\%\\
\hline
Anti-Hindu & Aggravated Assault & 7 & 6.80\textbackslash{}\%\\
\hline
Anti-Hindu & Burglary/Breaking And Entering & 4 & 3.88\textbackslash{}\%\\
\hline
Anti-Hindu & All Other & 16 & 15.52\textbackslash{}\%\\
\hline
Anti-Hindu & Total & 103 & 100\textbackslash{}\%\\
\hline
Anti-Hispanic & Intimidation & 4,748 & 30.84\textbackslash{}\%\\
\hline
Anti-Hispanic & Simple Assault & 4,008 & 26.03\textbackslash{}\%\\
\hline
Anti-Hispanic & Aggravated Assault & 2,826 & 18.35\textbackslash{}\%\\
\hline
Anti-Hispanic & Destruction of Property/Vandalism & 2,635 & 17.11\textbackslash{}\%\\
\hline
Anti-Hispanic & Robbery & 520 & 3.38\textbackslash{}\%\\
\hline
Anti-Hispanic & All Other & 660 & 4.3\textbackslash{}\%\\
\hline
Anti-Hispanic & Total & 15,397 & 100\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & Destruction of Property/Vandalism & 17 & 33.33\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & Intimidation & 8 & 15.69\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & Simple Assault & 6 & 11.76\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & Aggravated Assault & 6 & 11.76\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & All Other Larceny & 4 & 7.84\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & All Other & 10 & 19.6\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & Total & 51 & 100\textbackslash{}\%\\
\hline
Anti-Jewish & Destruction of Property/Vandalism & 19,407 & 64.76\textbackslash{}\%\\
\hline
Anti-Jewish & Intimidation & 7,617 & 25.42\textbackslash{}\%\\
\hline
Anti-Jewish & Simple Assault & 1,555 & 5.19\textbackslash{}\%\\
\hline
Anti-Jewish & Aggravated Assault & 423 & 1.41\textbackslash{}\%\\
\hline
Anti-Jewish & Burglary/Breaking And Entering & 331 & 1.10\textbackslash{}\%\\
\hline
Anti-Jewish & All Other & 634 & 2.11\textbackslash{}\%\\
\hline
Anti-Jewish & Total & 29,967 & 100\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & Destruction of Property/Vandalism & 2,242 & 28.69\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & Simple Assault & 1,957 & 25.04\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & Intimidation & 1,927 & 24.66\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & Aggravated Assault & 957 & 12.25\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & Robbery & 200 & 2.56\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & All Other & 532 & 6.82\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & Total & 7,815 & 100\textbackslash{}\%\\
\hline
Anti-Male & Simple Assault & 45 & 26.32\textbackslash{}\%\\
\hline
Anti-Male & Intimidation & 37 & 21.64\textbackslash{}\%\\
\hline
Anti-Male & Aggravated Assault & 20 & 11.70\textbackslash{}\%\\
\hline
Anti-Male & Destruction of Property/Vandalism & 17 & 9.94\textbackslash{}\%\\
\hline
Anti-Male & All Other Larceny & 8 & 4.68\textbackslash{}\%\\
\hline
Anti-Male & All Other & 44 & 25.64\textbackslash{}\%\\
\hline
Anti-Male & Total & 171 & 100\textbackslash{}\%\\
\hline
Anti-Male Homosexual (Gay) & Simple Assault & 7,612 & 31.90\textbackslash{}\%\\
\hline
Anti-Male Homosexual (Gay) & Intimidation & 6,446 & 27.01\textbackslash{}\%\\
\hline
Anti-Male Homosexual (Gay) & Destruction of Property/Vandalism & 4,143 & 17.36\textbackslash{}\%\\
\hline
Anti-Male Homosexual (Gay) & Aggravated Assault & 3,821 & 16.01\textbackslash{}\%\\
\hline
Anti-Male Homosexual (Gay) & Robbery & 1,045 & 4.38\textbackslash{}\%\\
\hline
Anti-Male Homosexual (Gay) & All Other & 795 & 3.33\textbackslash{}\%\\
\hline
Anti-Male Homosexual (Gay) & Total & 23,862 & 100\textbackslash{}\%\\
\hline
Anti-Mental Disability & Simple Assault & 355 & 26.63\textbackslash{}\%\\
\hline
Anti-Mental Disability & Intimidation & 199 & 14.93\textbackslash{}\%\\
\hline
Anti-Mental Disability & Destruction of Property/Vandalism & 172 & 12.90\textbackslash{}\%\\
\hline
Anti-Mental Disability & Aggravated Assault & 124 & 9.30\textbackslash{}\%\\
\hline
Anti-Mental Disability & All Other Larceny & 110 & 8.25\textbackslash{}\%\\
\hline
Anti-Mental Disability & All Other & 373 & 28.04\textbackslash{}\%\\
\hline
Anti-Mental Disability & Total & 1,333 & 100\textbackslash{}\%\\
\hline
Anti-Mormon & Destruction of Property/Vandalism & 42 & 39.62\textbackslash{}\%\\
\hline
Anti-Mormon & Burglary/Breaking And Entering & 12 & 11.32\textbackslash{}\%\\
\hline
Anti-Mormon & Intimidation & 10 & 9.43\textbackslash{}\%\\
\hline
Anti-Mormon & Simple Assault & 9 & 8.49\textbackslash{}\%\\
\hline
Anti-Mormon & Arson & 6 & 5.66\textbackslash{}\%\\
\hline
Anti-Mormon & All Other & 27 & 25.46\textbackslash{}\%\\
\hline
Anti-Mormon & Total & 106 & 100\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & Destruction of Property/Vandalism & 2,787 & 49.31\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & Intimidation & 1,505 & 26.63\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & Simple Assault & 631 & 11.16\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & Aggravated Assault & 401 & 7.09\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & Burglary/Breaking And Entering & 106 & 1.88\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & All Other & 222 & 3.95\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & Total & 5,652 & 100\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & Destruction of Property/Vandalism & 781 & 59.44\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & Intimidation & 197 & 14.99\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & Simple Assault & 87 & 6.62\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & All Other Larceny & 51 & 3.88\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & Burglary/Breaking And Entering & 49 & 3.73\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & All Other & 149 & 11.34\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & Total & 1,314 & 100\textbackslash{}\%\\
\hline
Anti-Muslim & Intimidation & 1,677 & 39.87\textbackslash{}\%\\
\hline
Anti-Muslim & Destruction of Property/Vandalism & 1,135 & 26.99\textbackslash{}\%\\
\hline
Anti-Muslim & Simple Assault & 800 & 19.02\textbackslash{}\%\\
\hline
Anti-Muslim & Aggravated Assault & 309 & 7.35\textbackslash{}\%\\
\hline
Anti-Muslim & Burglary/Breaking And Entering & 59 & 1.40\textbackslash{}\%\\
\hline
Anti-Muslim & All Other & 226 & 5.37\textbackslash{}\%\\
\hline
Anti-Muslim & Total & 4,206 & 100\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & Simple Assault & 35 & 19.02\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & Intimidation & 23 & 12.50\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & Destruction of Property/Vandalism & 21 & 11.41\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & Aggravated Assault & 18 & 9.78\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & Drug/Narcotic Violations & 13 & 7.07\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & All Other & 74 & 40.19\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & Total & 184 & 100\textbackslash{}\%\\
\hline
Anti-Other Christian & Destruction of Property/Vandalism & 206 & 51.12\textbackslash{}\%\\
\hline
Anti-Other Christian & Intimidation & 62 & 15.38\textbackslash{}\%\\
\hline
Anti-Other Christian & Simple Assault & 29 & 7.20\textbackslash{}\%\\
\hline
Anti-Other Christian & Arson & 25 & 6.20\textbackslash{}\%\\
\hline
Anti-Other Christian & Burglary/Breaking And Entering & 21 & 5.21\textbackslash{}\%\\
\hline
Anti-Other Christian & All Other & 60 & 14.9\textbackslash{}\%\\
\hline
Anti-Other Christian & Total & 403 & 100\textbackslash{}\%\\
\hline
Anti-Other Religion & Destruction of Property/Vandalism & 2,057 & 56.81\textbackslash{}\%\\
\hline
Anti-Other Religion & Intimidation & 721 & 19.91\textbackslash{}\%\\
\hline
Anti-Other Religion & Simple Assault & 227 & 6.27\textbackslash{}\%\\
\hline
Anti-Other Religion & Burglary/Breaking And Entering & 156 & 4.31\textbackslash{}\%\\
\hline
Anti-Other Religion & Aggravated Assault & 112 & 3.09\textbackslash{}\%\\
\hline
Anti-Other Religion & All Other & 348 & 9.63\textbackslash{}\%\\
\hline
Anti-Other Religion & Total & 3,621 & 100\textbackslash{}\%\\
\hline
Anti-Physical Disability & Simple Assault & 218 & 28.99\textbackslash{}\%\\
\hline
Anti-Physical Disability & Intimidation & 152 & 20.21\textbackslash{}\%\\
\hline
Anti-Physical Disability & Destruction of Property/Vandalism & 83 & 11.04\textbackslash{}\%\\
\hline
Anti-Physical Disability & Aggravated Assault & 68 & 9.04\textbackslash{}\%\\
\hline
Anti-Physical Disability & All Other Larceny & 56 & 7.45\textbackslash{}\%\\
\hline
Anti-Physical Disability & All Other & 175 & 23.26\textbackslash{}\%\\
\hline
Anti-Physical Disability & Total & 752 & 100\textbackslash{}\%\\
\hline
Anti-Protestant & Destruction of Property/Vandalism & 811 & 59.59\textbackslash{}\%\\
\hline
Anti-Protestant & Intimidation & 131 & 9.63\textbackslash{}\%\\
\hline
Anti-Protestant & Burglary/Breaking And Entering & 91 & 6.69\textbackslash{}\%\\
\hline
Anti-Protestant & Simple Assault & 69 & 5.07\textbackslash{}\%\\
\hline
Anti-Protestant & All Other Larceny & 62 & 4.56\textbackslash{}\%\\
\hline
Anti-Protestant & All Other & 197 & 14.47\textbackslash{}\%\\
\hline
Anti-Protestant & Total & 1,361 & 100\textbackslash{}\%\\
\hline
Anti-Sikh & All Other Larceny & 97 & 14.41\textbackslash{}\%\\
\hline
Anti-Sikh & Destruction of Property/Vandalism & 96 & 14.26\textbackslash{}\%\\
\hline
Anti-Sikh & Simple Assault & 83 & 12.33\textbackslash{}\%\\
\hline
Anti-Sikh & Drug/Narcotic Violations & 48 & 7.13\textbackslash{}\%\\
\hline
Anti-Sikh & Burglary/Breaking And Entering & 44 & 6.54\textbackslash{}\%\\
\hline
Anti-Sikh & All Other & 305 & 45.33\textbackslash{}\%\\
\hline
Anti-Sikh & Total & 673 & 100\textbackslash{}\%\\
\hline
Anti-Transgender & Simple Assault & 515 & 34.33\textbackslash{}\%\\
\hline
Anti-Transgender & Intimidation & 343 & 22.87\textbackslash{}\%\\
\hline
Anti-Transgender & Aggravated Assault & 293 & 19.53\textbackslash{}\%\\
\hline
Anti-Transgender & Destruction of Property/Vandalism & 132 & 8.80\textbackslash{}\%\\
\hline
Anti-Transgender & Robbery & 60 & 4.00\textbackslash{}\%\\
\hline
Anti-Transgender & All Other & 157 & 10.47\textbackslash{}\%\\
\hline
Anti-Transgender & Total & 1,500 & 100\textbackslash{}\%\\
\hline
Anti-White & Simple Assault & 7,994 & 29.22\textbackslash{}\%\\
\hline
Anti-White & Intimidation & 6,051 & 22.12\textbackslash{}\%\\
\hline
Anti-White & Aggravated Assault & 4,418 & 16.15\textbackslash{}\%\\
\hline
Anti-White & Destruction of Property/Vandalism & 3,729 & 13.63\textbackslash{}\%\\
\hline
Anti-White & Robbery & 1,136 & 4.15\textbackslash{}\%\\
\hline
Anti-White & All Other & 4,032 & 14.76\textbackslash{}\%\\
\hline
Anti-White & Total & 27,360 & 100\textbackslash{}\%\\
\hline
\end{longtable}





\begin{longtable}[t]{l|l|l|r|r}
\caption{(\#tab:hateOffenseBias)The number and percent of biases by offense, 2022.}\\
\hline
  & Offense & Bias Motivation & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateOffenseBias)The number and percent of biases by offense, 2022. \textit{(continued)}}\\
\hline
  & Offense & Bias Motivation & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
...1 & Aggravated Assault & Anti-Black & 9,760 & 36.31\textbackslash{}\%\\
\hline
...2 & Aggravated Assault & Anti-White & 4,418 & 16.44\textbackslash{}\%\\
\hline
...3 & Aggravated Assault & Anti-Male Homosexual (Gay) & 3,821 & 14.22\textbackslash{}\%\\
\hline
...4 & Aggravated Assault & Anti-Hispanic & 2,826 & 10.51\textbackslash{}\%\\
\hline
...5 & Aggravated Assault & Anti-Ethnicity Other Than Hispanic & 1,130 & 4.20\textbackslash{}\%\\
\hline
...6 & Aggravated Assault & All Other & 4,924 & 18.32\textbackslash{}\%\\
\hline
...7 & Aggravated Assault & Total & 26,879 & 100\textbackslash{}\%\\
\hline
...8 & All Other Larceny & Anti-White & 787 & 30.46\textbackslash{}\%\\
\hline
...9 & All Other Larceny & Anti-Black & 254 & 9.83\textbackslash{}\%\\
\hline
...10 & All Other Larceny & Anti-American Indian Or Native Alaskan & 192 & 7.43\textbackslash{}\%\\
\hline
...11 & All Other Larceny & Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & 177 & 6.85\textbackslash{}\%\\
\hline
...12 & All Other Larceny & Anti-Mental Disability & 110 & 4.26\textbackslash{}\%\\
\hline
...13 & All Other Larceny & All Other & 1,064 & 41.15\textbackslash{}\%\\
\hline
...14 & All Other Larceny & Total & 2,584 & 100\textbackslash{}\%\\
\hline
...15 & Arson & Anti-Black & 443 & 30.43\textbackslash{}\%\\
\hline
...16 & Arson & Anti-Jewish & 172 & 11.81\textbackslash{}\%\\
\hline
...17 & Arson & Anti-Other Religion & 107 & 7.35\textbackslash{}\%\\
\hline
...18 & Arson & Anti-White & 97 & 6.66\textbackslash{}\%\\
\hline
...19 & Arson & Anti-Male Homosexual (Gay) & 92 & 6.32\textbackslash{}\%\\
\hline
...20 & Arson & All Other & 545 & 37.46\textbackslash{}\%\\
\hline
...21 & Arson & Total & 1,456 & 100\textbackslash{}\%\\
\hline
1...22 & Assisting Or Promoting Prostitution & Anti-Mental Disability & 2 & 40.00\textbackslash{}\%\\
\hline
2...23 & Assisting Or Promoting Prostitution & Anti-Black & 1 & 20.00\textbackslash{}\%\\
\hline
3...24 & Assisting Or Promoting Prostitution & Anti-Male & 1 & 20.00\textbackslash{}\%\\
\hline
4...25 & Assisting Or Promoting Prostitution & Anti-Ethnicity Other Than Hispanic & 1 & 20.00\textbackslash{}\%\\
\hline
NA...26 & NA & NA & NA & NA\\
\hline
...27 & Assisting Or Promoting Prostitution & All Other & NA & NA\textbackslash{}\%\\
\hline
...28 & Assisting Or Promoting Prostitution & Total & 5 & 100\textbackslash{}\%\\
\hline
1...29 & Bribery & Anti-Black & 2 & 50.00\textbackslash{}\%\\
\hline
2...30 & Bribery & Anti-Heterosexual & 1 & 25.00\textbackslash{}\%\\
\hline
3...31 & Bribery & Anti-Arab & 1 & 25.00\textbackslash{}\%\\
\hline
NA...32 & NA & NA & NA & NA\\
\hline
NA.1...33 & NA & NA & NA & NA\\
\hline
...34 & Bribery & All Other & NA & NA\textbackslash{}\%\\
\hline
...35 & Bribery & Total & 4 & 100\textbackslash{}\%\\
\hline
...36 & Burglary/Breaking And Entering & Anti-Black & 978 & 25.14\textbackslash{}\%\\
\hline
...37 & Burglary/Breaking And Entering & Anti-White & 629 & 16.17\textbackslash{}\%\\
\hline
...38 & Burglary/Breaking And Entering & Anti-Jewish & 331 & 8.51\textbackslash{}\%\\
\hline
...39 & Burglary/Breaking And Entering & Anti-Male Homosexual (Gay) & 241 & 6.20\textbackslash{}\%\\
\hline
...40 & Burglary/Breaking And Entering & Anti-Hispanic & 209 & 5.37\textbackslash{}\%\\
\hline
...41 & Burglary/Breaking And Entering & All Other & 1,502 & 38.62\textbackslash{}\%\\
\hline
...42 & Burglary/Breaking And Entering & Total & 3,890 & 100\textbackslash{}\%\\
\hline
...43 & Counterfeiting/Forgery & Anti-White & 100 & 40.82\textbackslash{}\%\\
\hline
...44 & Counterfeiting/Forgery & Anti-Black & 25 & 10.20\textbackslash{}\%\\
\hline
...45 & Counterfeiting/Forgery & Anti-American Indian Or Native Alaskan & 20 & 8.16\textbackslash{}\%\\
\hline
...46 & Counterfeiting/Forgery & Anti-Sikh & 11 & 4.49\textbackslash{}\%\\
\hline
...47 & Counterfeiting/Forgery & Anti-Catholic & 11 & 4.49\textbackslash{}\%\\
\hline
...48 & Counterfeiting/Forgery & All Other & 78 & 31.86\textbackslash{}\%\\
\hline
...49 & Counterfeiting/Forgery & Total & 245 & 100\textbackslash{}\%\\
\hline
...50 & Credit Card/Atm Fraud & Anti-White & 55 & 30.22\textbackslash{}\%\\
\hline
...51 & Credit Card/Atm Fraud & Anti-American Indian Or Native Alaskan & 18 & 9.89\textbackslash{}\%\\
\hline
...52 & Credit Card/Atm Fraud & Anti-Mental Disability & 13 & 7.14\textbackslash{}\%\\
\hline
...53 & Credit Card/Atm Fraud & Anti-Sikh & 12 & 6.59\textbackslash{}\%\\
\hline
...54 & Credit Card/Atm Fraud & Anti-Black & 10 & 5.49\textbackslash{}\%\\
\hline
...55 & Credit Card/Atm Fraud & All Other & 74 & 40.7\textbackslash{}\%\\
\hline
...56 & Credit Card/Atm Fraud & Total & 182 & 100\textbackslash{}\%\\
\hline
...57 & Destruction of Property/Vandalism & Anti-Black & 23,283 & 32.12\textbackslash{}\%\\
\hline
...58 & Destruction of Property/Vandalism & Anti-Jewish & 19,407 & 26.77\textbackslash{}\%\\
\hline
...59 & Destruction of Property/Vandalism & Anti-Male Homosexual (Gay) & 4,143 & 5.72\textbackslash{}\%\\
\hline
...60 & Destruction of Property/Vandalism & Anti-White & 3,729 & 5.14\textbackslash{}\%\\
\hline
...61 & Destruction of Property/Vandalism & Anti-Ethnicity Other Than Hispanic & 3,271 & 4.51\textbackslash{}\%\\
\hline
...62 & Destruction of Property/Vandalism & All Other & 18,655 & 25.72\textbackslash{}\%\\
\hline
...63 & Destruction of Property/Vandalism & Total & 72,488 & 100\textbackslash{}\%\\
\hline
...64 & Drug Equipment Violations & Anti-White & 126 & 32.23\textbackslash{}\%\\
\hline
...65 & Drug Equipment Violations & Anti-American Indian Or Native Alaskan & 57 & 14.58\textbackslash{}\%\\
\hline
...66 & Drug Equipment Violations & Anti-Eastern Orthodox (Greek, Russian, Etc.) & 24 & 6.14\textbackslash{}\%\\
\hline
...67 & Drug Equipment Violations & Anti-Sikh & 23 & 5.88\textbackslash{}\%\\
\hline
...68 & Drug Equipment Violations & Anti-Black & 20 & 5.12\textbackslash{}\%\\
\hline
...69 & Drug Equipment Violations & All Other & 141 & 36.04\textbackslash{}\%\\
\hline
...70 & Drug Equipment Violations & Total & 391 & 100\textbackslash{}\%\\
\hline
...71 & Drug/Narcotic Violations & Anti-White & 484 & 35.07\textbackslash{}\%\\
\hline
...72 & Drug/Narcotic Violations & Anti-Black & 235 & 17.03\textbackslash{}\%\\
\hline
...73 & Drug/Narcotic Violations & Anti-American Indian Or Native Alaskan & 156 & 11.30\textbackslash{}\%\\
\hline
...74 & Drug/Narcotic Violations & Anti-Sikh & 48 & 3.48\textbackslash{}\%\\
\hline
...75 & Drug/Narcotic Violations & Anti-Hispanic & 43 & 3.12\textbackslash{}\%\\
\hline
...76 & Drug/Narcotic Violations & All Other & 414 & 29.96\textbackslash{}\%\\
\hline
...77 & Drug/Narcotic Violations & Total & 1,380 & 100\textbackslash{}\%\\
\hline
...78 & Embezzlement & Anti-White & 23 & 34.85\textbackslash{}\%\\
\hline
...79 & Embezzlement & Anti-American Indian Or Native Alaskan & 8 & 12.12\textbackslash{}\%\\
\hline
...80 & Embezzlement & Anti-Mental Disability & 6 & 9.09\textbackslash{}\%\\
\hline
...81 & Embezzlement & Anti-Black & 5 & 7.58\textbackslash{}\%\\
\hline
...82 & Embezzlement & Anti-Physical Disability & 4 & 6.06\textbackslash{}\%\\
\hline
...83 & Embezzlement & All Other & 20 & 30.35\textbackslash{}\%\\
\hline
...84 & Embezzlement & Total & 66 & 100\textbackslash{}\%\\
\hline
...85 & Extortion/Blackmail & Anti-Male Homosexual (Gay) & 15 & 24.19\textbackslash{}\%\\
\hline
...86 & Extortion/Blackmail & Anti-White & 7 & 11.29\textbackslash{}\%\\
\hline
...87 & Extortion/Blackmail & Anti-Ethnicity Other Than Hispanic & 6 & 9.68\textbackslash{}\%\\
\hline
...88 & Extortion/Blackmail & Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & 6 & 9.68\textbackslash{}\%\\
\hline
...89 & Extortion/Blackmail & Anti-Jewish & 6 & 9.68\textbackslash{}\%\\
\hline
...90 & Extortion/Blackmail & All Other & 22 & 35.47\textbackslash{}\%\\
\hline
...91 & Extortion/Blackmail & Total & 62 & 100\textbackslash{}\%\\
\hline
...92 & False Pretenses/Swindle/Confidence Game & Anti-White & 120 & 33.99\textbackslash{}\%\\
\hline
...93 & False Pretenses/Swindle/Confidence Game & Anti-Black & 31 & 8.78\textbackslash{}\%\\
\hline
...94 & False Pretenses/Swindle/Confidence Game & Anti-Mental Disability & 30 & 8.50\textbackslash{}\%\\
\hline
...95 & False Pretenses/Swindle/Confidence Game & Anti-Sikh & 23 & 6.52\textbackslash{}\%\\
\hline
...96 & False Pretenses/Swindle/Confidence Game & Anti-American Indian Or Native Alaskan & 17 & 4.82\textbackslash{}\%\\
\hline
...97 & False Pretenses/Swindle/Confidence Game & All Other & 132 & 37.39\textbackslash{}\%\\
\hline
...98 & False Pretenses/Swindle/Confidence Game & Total & 353 & 100\textbackslash{}\%\\
\hline
...99 & Forcible Fondling - Indecent Liberties/Child Molest & Anti-White & 56 & 24.89\textbackslash{}\%\\
\hline
...100 & Forcible Fondling - Indecent Liberties/Child Molest & Anti-Black & 27 & 12.00\textbackslash{}\%\\
\hline
...101 & Forcible Fondling - Indecent Liberties/Child Molest & Anti-Male Homosexual (Gay) & 25 & 11.11\textbackslash{}\%\\
\hline
...102 & Forcible Fondling - Indecent Liberties/Child Molest & Anti-Mental Disability & 17 & 7.56\textbackslash{}\%\\
\hline
...103 & Forcible Fondling - Indecent Liberties/Child Molest & Anti-American Indian Or Native Alaskan & 13 & 5.78\textbackslash{}\%\\
\hline
...104 & Forcible Fondling - Indecent Liberties/Child Molest & All Other & 87 & 38.61\textbackslash{}\%\\
\hline
...105 & Forcible Fondling - Indecent Liberties/Child Molest & Total & 225 & 100\textbackslash{}\%\\
\hline
...106 & Forcible Rape & Anti-White & 82 & 26.11\textbackslash{}\%\\
\hline
...107 & Forcible Rape & Anti-Female Homosexual (Lesbian) & 51 & 16.24\textbackslash{}\%\\
\hline
...108 & Forcible Rape & Anti-Black & 45 & 14.33\textbackslash{}\%\\
\hline
...109 & Forcible Rape & Anti-Mental Disability & 18 & 5.73\textbackslash{}\%\\
\hline
...110 & Forcible Rape & Anti-Hispanic & 15 & 4.78\textbackslash{}\%\\
\hline
...111 & Forcible Rape & All Other & 103 & 32.82\textbackslash{}\%\\
\hline
...112 & Forcible Rape & Total & 314 & 100\textbackslash{}\%\\
\hline
...113 & Forcible Sodomy & Anti-Male Homosexual (Gay) & 27 & 32.93\textbackslash{}\%\\
\hline
...114 & Forcible Sodomy & Anti-White & 11 & 13.41\textbackslash{}\%\\
\hline
...115 & Forcible Sodomy & Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & 9 & 10.98\textbackslash{}\%\\
\hline
...116 & Forcible Sodomy & Anti-Heterosexual & 8 & 9.76\textbackslash{}\%\\
\hline
...117 & Forcible Sodomy & Anti-Transgender & 6 & 7.32\textbackslash{}\%\\
\hline
...118 & Forcible Sodomy & All Other & 21 & 25.62\textbackslash{}\%\\
\hline
...119 & Forcible Sodomy & Total & 82 & 100\textbackslash{}\%\\
\hline
...120 & Fraud-Other & Anti-White & 29 & 28.16\textbackslash{}\%\\
\hline
...121 & Fraud-Other & Anti-American Indian Or Native Alaskan & 11 & 10.68\textbackslash{}\%\\
\hline
...122 & Fraud-Other & Anti-Black & 10 & 9.71\textbackslash{}\%\\
\hline
...123 & Fraud-Other & Anti-Sikh & 10 & 9.71\textbackslash{}\%\\
\hline
...124 & Fraud-Other & Anti-Mental Disability & 5 & 4.85\textbackslash{}\%\\
\hline
...125 & Fraud-Other & All Other & 38 & 36.86\textbackslash{}\%\\
\hline
...126 & Fraud-Other & Total & 103 & 100\textbackslash{}\%\\
\hline
1...127 & Human Trafficking - Commercial Sex Acts & Anti-Transgender & 1 & 25.00\textbackslash{}\%\\
\hline
2...128 & Human Trafficking - Commercial Sex Acts & Anti-Asian & 1 & 25.00\textbackslash{}\%\\
\hline
3...129 & Human Trafficking - Commercial Sex Acts & Anti-Physical Disability & 1 & 25.00\textbackslash{}\%\\
\hline
4...130 & Human Trafficking - Commercial Sex Acts & Anti-Native Hawaiian Or Other Pacific Islander & 1 & 25.00\textbackslash{}\%\\
\hline
NA...131 & NA & NA & NA & NA\\
\hline
...132 & Human Trafficking - Commercial Sex Acts & All Other & NA & NA\textbackslash{}\%\\
\hline
...133 & Human Trafficking - Commercial Sex Acts & Total & 4 & 100\textbackslash{}\%\\
\hline
1...134 & Human Trafficking - Involuntary Servitude & Anti-Female & 1 & 100.00\textbackslash{}\%\\
\hline
NA...135 & NA & NA & NA & NA\\
\hline
NA.1...136 & NA & NA & NA & NA\\
\hline
NA.2...137 & NA & NA & NA & NA\\
\hline
NA.3 & NA & NA & NA & NA\\
\hline
...139 & Human Trafficking - Involuntary Servitude & All Other & NA & NA\textbackslash{}\%\\
\hline
...140 & Human Trafficking - Involuntary Servitude & Total & 1 & 100\textbackslash{}\%\\
\hline
...141 & Impersonation & Anti-White & 43 & 28.29\textbackslash{}\%\\
\hline
...142 & Impersonation & Anti-American Indian Or Native Alaskan & 22 & 14.47\textbackslash{}\%\\
\hline
...143 & Impersonation & Anti-Black & 20 & 13.16\textbackslash{}\%\\
\hline
...144 & Impersonation & Anti-Hispanic & 11 & 7.24\textbackslash{}\%\\
\hline
...145 & Impersonation & Anti-Eastern Orthodox (Greek, Russian, Etc.) & 6 & 3.95\textbackslash{}\%\\
\hline
...146 & Impersonation & All Other & 50 & 32.92\textbackslash{}\%\\
\hline
...147 & Impersonation & Total & 152 & 100\textbackslash{}\%\\
\hline
...148 & Incest & Anti-White & 2 & 28.57\textbackslash{}\%\\
\hline
...149 & Incest & Anti-American Indian Or Native Alaskan & 1 & 14.29\textbackslash{}\%\\
\hline
...150 & Incest & Anti-Heterosexual & 1 & 14.29\textbackslash{}\%\\
\hline
...151 & Incest & Anti-Female Homosexual (Lesbian) & 1 & 14.29\textbackslash{}\%\\
\hline
...152 & Incest & Anti-Bisexual & 1 & 14.29\textbackslash{}\%\\
\hline
...153 & Incest & All Other & 1 & 14.29\textbackslash{}\%\\
\hline
...154 & Incest & Total & 7 & 100\textbackslash{}\%\\
\hline
...155 & Intimidation & Anti-Black & 29,761 & 41.58\textbackslash{}\%\\
\hline
...156 & Intimidation & Anti-Jewish & 7,617 & 10.64\textbackslash{}\%\\
\hline
...157 & Intimidation & Anti-Male Homosexual (Gay) & 6,446 & 9.00\textbackslash{}\%\\
\hline
...158 & Intimidation & Anti-White & 6,051 & 8.45\textbackslash{}\%\\
\hline
...159 & Intimidation & Anti-Hispanic & 4,748 & 6.63\textbackslash{}\%\\
\hline
...160 & Intimidation & All Other & 16,960 & 23.66\textbackslash{}\%\\
\hline
...161 & Intimidation & Total & 71,583 & 100\textbackslash{}\%\\
\hline
...162 & Kidnapping/Abduction & Anti-White & 29 & 19.08\textbackslash{}\%\\
\hline
...163 & Kidnapping/Abduction & Anti-Black & 27 & 17.76\textbackslash{}\%\\
\hline
...164 & Kidnapping/Abduction & Anti-Male Homosexual (Gay) & 12 & 7.89\textbackslash{}\%\\
\hline
...165 & Kidnapping/Abduction & Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & 9 & 5.92\textbackslash{}\%\\
\hline
...166 & Kidnapping/Abduction & Anti-Hispanic & 9 & 5.92\textbackslash{}\%\\
\hline
...167 & Kidnapping/Abduction & All Other & 66 & 43.44\textbackslash{}\%\\
\hline
...168 & Kidnapping/Abduction & Total & 152 & 100\textbackslash{}\%\\
\hline
...169 & Motor Vehicle Theft & Anti-White & 164 & 28.42\textbackslash{}\%\\
\hline
...170 & Motor Vehicle Theft & Anti-Black & 84 & 14.56\textbackslash{}\%\\
\hline
...171 & Motor Vehicle Theft & Anti-American Indian Or Native Alaskan & 78 & 13.52\textbackslash{}\%\\
\hline
...172 & Motor Vehicle Theft & Anti-Sikh & 25 & 4.33\textbackslash{}\%\\
\hline
...173 & Motor Vehicle Theft & Anti-Ethnicity Other Than Hispanic & 24 & 4.16\textbackslash{}\%\\
\hline
...174 & Motor Vehicle Theft & All Other & 202 & 35.03\textbackslash{}\%\\
\hline
...175 & Motor Vehicle Theft & Total & 577 & 100\textbackslash{}\%\\
\hline
...176 & Murder/Non-Negligent Manslaughter & Anti-Black & 80 & 24.24\textbackslash{}\%\\
\hline
...177 & Murder/Non-Negligent Manslaughter & Anti-Male Homosexual (Gay) & 61 & 18.48\textbackslash{}\%\\
\hline
...178 & Murder/Non-Negligent Manslaughter & Anti-White & 50 & 15.15\textbackslash{}\%\\
\hline
...179 & Murder/Non-Negligent Manslaughter & Anti-Hispanic & 40 & 12.12\textbackslash{}\%\\
\hline
...180 & Murder/Non-Negligent Manslaughter & Anti-Asian & 14 & 4.24\textbackslash{}\%\\
\hline
...181 & Murder/Non-Negligent Manslaughter & All Other & 85 & 25.77\textbackslash{}\%\\
\hline
...182 & Murder/Non-Negligent Manslaughter & Total & 330 & 100\textbackslash{}\%\\
\hline
...183 & Negligent Manslaughter & Anti-American Indian Or Native Alaskan & 2 & 25.00\textbackslash{}\%\\
\hline
...184 & Negligent Manslaughter & Anti-Physical Disability & 2 & 25.00\textbackslash{}\%\\
\hline
...185 & Negligent Manslaughter & Anti-Black & 2 & 25.00\textbackslash{}\%\\
\hline
...186 & Negligent Manslaughter & Anti-Hispanic & 1 & 12.50\textbackslash{}\%\\
\hline
...187 & Negligent Manslaughter & Anti-White & 1 & 12.50\textbackslash{}\%\\
\hline
...188 & Negligent Manslaughter & All Other & NA & NA\textbackslash{}\%\\
\hline
...189 & Negligent Manslaughter & Total & 8 & 100\textbackslash{}\%\\
\hline
...190 & Pocket-Picking & Anti-Black & 7 & 25.00\textbackslash{}\%\\
\hline
...191 & Pocket-Picking & Anti-White & 7 & 25.00\textbackslash{}\%\\
\hline
...192 & Pocket-Picking & Anti-Hispanic & 4 & 14.29\textbackslash{}\%\\
\hline
...193 & Pocket-Picking & Anti-American Indian Or Native Alaskan & 3 & 10.71\textbackslash{}\%\\
\hline
...194 & Pocket-Picking & Anti-Physical Disability & 2 & 7.14\textbackslash{}\%\\
\hline
...195 & Pocket-Picking & All Other & 5 & 17.85\textbackslash{}\%\\
\hline
...196 & Pocket-Picking & Total & 28 & 100\textbackslash{}\%\\
\hline
...197 & Pornography/Obscene Material & Anti-Black & 13 & 16.05\textbackslash{}\%\\
\hline
...198 & Pornography/Obscene Material & Anti-Female & 7 & 8.64\textbackslash{}\%\\
\hline
...199 & Pornography/Obscene Material & Anti-White & 7 & 8.64\textbackslash{}\%\\
\hline
...200 & Pornography/Obscene Material & Anti-American Indian Or Native Alaskan & 6 & 7.41\textbackslash{}\%\\
\hline
...201 & Pornography/Obscene Material & Anti-Mental Disability & 5 & 6.17\textbackslash{}\%\\
\hline
...202 & Pornography/Obscene Material & All Other & 43 & 53.06\textbackslash{}\%\\
\hline
...203 & Pornography/Obscene Material & Total & 81 & 100\textbackslash{}\%\\
\hline
1...204 & Prostitution & Anti-White & 10 & 71.43\textbackslash{}\%\\
\hline
2...205 & Prostitution & Anti-Asian & 3 & 21.43\textbackslash{}\%\\
\hline
3...206 & Prostitution & Anti-Other Religion & 1 & 7.14\textbackslash{}\%\\
\hline
NA...207 & NA & NA & NA & NA\\
\hline
NA.1...208 & NA & NA & NA & NA\\
\hline
...209 & Prostitution & All Other & NA & NA\textbackslash{}\%\\
\hline
...210 & Prostitution & Total & 14 & 100\textbackslash{}\%\\
\hline
1...211 & Purchasing Prostitution & Anti-Asian & 1 & 50.00\textbackslash{}\%\\
\hline
2...212 & Purchasing Prostitution & Anti-Heterosexual & 1 & 50.00\textbackslash{}\%\\
\hline
NA...213 & NA & NA & NA & NA\\
\hline
NA.1...214 & NA & NA & NA & NA\\
\hline
NA.2...215 & NA & NA & NA & NA\\
\hline
...216 & Purchasing Prostitution & All Other & NA & NA\textbackslash{}\%\\
\hline
...217 & Purchasing Prostitution & Total & 2 & 100\textbackslash{}\%\\
\hline
...218 & Purse-Snatching & Anti-White & 11 & 37.93\textbackslash{}\%\\
\hline
...219 & Purse-Snatching & Anti-American Indian Or Native Alaskan & 3 & 10.34\textbackslash{}\%\\
\hline
...220 & Purse-Snatching & Anti-Hispanic & 2 & 6.90\textbackslash{}\%\\
\hline
...221 & Purse-Snatching & Anti-Other Religion & 2 & 6.90\textbackslash{}\%\\
\hline
...222 & Purse-Snatching & Anti-Black & 2 & 6.90\textbackslash{}\%\\
\hline
...223 & Purse-Snatching & All Other & 9 & 31.05\textbackslash{}\%\\
\hline
...224 & Purse-Snatching & Total & 29 & 100\textbackslash{}\%\\
\hline
...225 & Robbery & Anti-White & 1,136 & 26.18\textbackslash{}\%\\
\hline
...226 & Robbery & Anti-Male Homosexual (Gay) & 1,045 & 24.08\textbackslash{}\%\\
\hline
...227 & Robbery & Anti-Black & 652 & 15.03\textbackslash{}\%\\
\hline
...228 & Robbery & Anti-Hispanic & 520 & 11.98\textbackslash{}\%\\
\hline
...229 & Robbery & Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & 200 & 4.61\textbackslash{}\%\\
\hline
...230 & Robbery & All Other & 786 & 18.11\textbackslash{}\%\\
\hline
...231 & Robbery & Total & 4,339 & 100\textbackslash{}\%\\
\hline
...232 & Sexual Assault With An Object & Anti-Male Homosexual (Gay) & 9 & 21.95\textbackslash{}\%\\
\hline
...233 & Sexual Assault With An Object & Anti-Black & 6 & 14.63\textbackslash{}\%\\
\hline
...234 & Sexual Assault With An Object & Anti-White & 5 & 12.20\textbackslash{}\%\\
\hline
...235 & Sexual Assault With An Object & Anti-Transgender & 4 & 9.76\textbackslash{}\%\\
\hline
...236 & Sexual Assault With An Object & Anti-Female Homosexual (Lesbian) & 3 & 7.32\textbackslash{}\%\\
\hline
...237 & Sexual Assault With An Object & All Other & 14 & 34.16\textbackslash{}\%\\
\hline
...238 & Sexual Assault With An Object & Total & 41 & 100\textbackslash{}\%\\
\hline
...239 & Shoplifting & Anti-White & 263 & 34.11\textbackslash{}\%\\
\hline
...240 & Shoplifting & Anti-Black & 87 & 11.28\textbackslash{}\%\\
\hline
...241 & Shoplifting & Anti-American Indian Or Native Alaskan & 80 & 10.38\textbackslash{}\%\\
\hline
...242 & Shoplifting & Anti-Ethnicity Other Than Hispanic & 29 & 3.76\textbackslash{}\%\\
\hline
...243 & Shoplifting & Anti-Sikh & 27 & 3.50\textbackslash{}\%\\
\hline
...244 & Shoplifting & All Other & 285 & 36.99\textbackslash{}\%\\
\hline
...245 & Shoplifting & Total & 771 & 100\textbackslash{}\%\\
\hline
...246 & Simple Assault & Anti-Black & 14,789 & 30.86\textbackslash{}\%\\
\hline
...247 & Simple Assault & Anti-White & 7,994 & 16.68\textbackslash{}\%\\
\hline
...248 & Simple Assault & Anti-Male Homosexual (Gay) & 7,612 & 15.89\textbackslash{}\%\\
\hline
...249 & Simple Assault & Anti-Hispanic & 4,008 & 8.36\textbackslash{}\%\\
\hline
...250 & Simple Assault & Anti-Ethnicity Other Than Hispanic & 2,245 & 4.69\textbackslash{}\%\\
\hline
...251 & Simple Assault & All Other & 11,269 & 23.5\textbackslash{}\%\\
\hline
...252 & Simple Assault & Total & 47,917 & 100\textbackslash{}\%\\
\hline
...253 & Statutory Rape & Anti-White & 7 & 33.33\textbackslash{}\%\\
\hline
...254 & Statutory Rape & Anti-Male Homosexual (Gay) & 2 & 9.52\textbackslash{}\%\\
\hline
...255 & Statutory Rape & Anti-Black & 2 & 9.52\textbackslash{}\%\\
\hline
...256 & Statutory Rape & Anti-Heterosexual & 2 & 9.52\textbackslash{}\%\\
\hline
...257 & Statutory Rape & Anti-American Indian Or Native Alaskan & 2 & 9.52\textbackslash{}\%\\
\hline
...258 & Statutory Rape & All Other & 6 & 28.56\textbackslash{}\%\\
\hline
...259 & Statutory Rape & Total & 21 & 100\textbackslash{}\%\\
\hline
...260 & Stolen Property Offenses - Receiving, Selling, Etc. & Anti-White & 46 & 32.86\textbackslash{}\%\\
\hline
...261 & Stolen Property Offenses - Receiving, Selling, Etc. & Anti-American Indian Or Native Alaskan & 18 & 12.86\textbackslash{}\%\\
\hline
...262 & Stolen Property Offenses - Receiving, Selling, Etc. & Anti-Black & 17 & 12.14\textbackslash{}\%\\
\hline
...263 & Stolen Property Offenses - Receiving, Selling, Etc. & Anti-Sikh & 7 & 5.00\textbackslash{}\%\\
\hline
...264 & Stolen Property Offenses - Receiving, Selling, Etc. & Anti-Mental Disability & 6 & 4.29\textbackslash{}\%\\
\hline
...265 & Stolen Property Offenses - Receiving, Selling, Etc. & All Other & 46 & 32.84\textbackslash{}\%\\
\hline
...266 & Stolen Property Offenses - Receiving, Selling, Etc. & Total & 140 & 100\textbackslash{}\%\\
\hline
...267 & Theft-Other & Anti-Black & 176 & 19.19\textbackslash{}\%\\
\hline
...268 & Theft-Other & Anti-Jewish & 175 & 19.08\textbackslash{}\%\\
\hline
...269 & Theft-Other & Anti-Male Homosexual (Gay) & 85 & 9.27\textbackslash{}\%\\
\hline
...270 & Theft-Other & Anti-White & 76 & 8.29\textbackslash{}\%\\
\hline
...271 & Theft-Other & Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & 56 & 6.11\textbackslash{}\%\\
\hline
...272 & Theft-Other & All Other & 349 & 38.09\textbackslash{}\%\\
\hline
...273 & Theft-Other & Total & 917 & 100\textbackslash{}\%\\
\hline
...274 & Theft From Building & Anti-White & 202 & 32.74\textbackslash{}\%\\
\hline
...275 & Theft From Building & Anti-Black & 55 & 8.91\textbackslash{}\%\\
\hline
...276 & Theft From Building & Anti-American Indian Or Native Alaskan & 52 & 8.43\textbackslash{}\%\\
\hline
...277 & Theft From Building & Anti-Ethnicity Other Than Hispanic & 32 & 5.19\textbackslash{}\%\\
\hline
...278 & Theft From Building & Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (Lgbt) & 32 & 5.19\textbackslash{}\%\\
\hline
...279 & Theft From Building & All Other & 244 & 39.55\textbackslash{}\%\\
\hline
...280 & Theft From Building & Total & 617 & 100\textbackslash{}\%\\
\hline
...281 & Theft From Coin-Operated Machine Or Device & Anti-White & 4 & 25.00\textbackslash{}\%\\
\hline
...282 & Theft From Coin-Operated Machine Or Device & Anti-American Indian Or Native Alaskan & 3 & 18.75\textbackslash{}\%\\
\hline
...283 & Theft From Coin-Operated Machine Or Device & Anti-Physical Disability & 3 & 18.75\textbackslash{}\%\\
\hline
...284 & Theft From Coin-Operated Machine Or Device & Anti-Black & 2 & 12.50\textbackslash{}\%\\
\hline
...285 & Theft From Coin-Operated Machine Or Device & Anti-Sikh & 1 & 6.25\textbackslash{}\%\\
\hline
...286 & Theft From Coin-Operated Machine Or Device & All Other & 3 & 18.75\textbackslash{}\%\\
\hline
...287 & Theft From Coin-Operated Machine Or Device & Total & 16 & 100\textbackslash{}\%\\
\hline
...288 & Theft From Motor Vehicle & Anti-White & 303 & 34.28\textbackslash{}\%\\
\hline
...289 & Theft From Motor Vehicle & Anti-American Indian Or Native Alaskan & 101 & 11.43\textbackslash{}\%\\
\hline
...290 & Theft From Motor Vehicle & Anti-Black & 88 & 9.95\textbackslash{}\%\\
\hline
...291 & Theft From Motor Vehicle & Anti-Hispanic & 38 & 4.30\textbackslash{}\%\\
\hline
...292 & Theft From Motor Vehicle & Anti-Sikh & 30 & 3.39\textbackslash{}\%\\
\hline
...293 & Theft From Motor Vehicle & All Other & 324 & 36.63\textbackslash{}\%\\
\hline
...294 & Theft From Motor Vehicle & Total & 884 & 100\textbackslash{}\%\\
\hline
...295 & Theft of Motor Vehicle Parts/Accessories & Anti-White & 86 & 34.54\textbackslash{}\%\\
\hline
...296 & Theft of Motor Vehicle Parts/Accessories & Anti-American Indian Or Native Alaskan & 24 & 9.64\textbackslash{}\%\\
\hline
...297 & Theft of Motor Vehicle Parts/Accessories & Anti-Black & 23 & 9.24\textbackslash{}\%\\
\hline
...298 & Theft of Motor Vehicle Parts/Accessories & Anti-Sikh & 11 & 4.42\textbackslash{}\%\\
\hline
...299 & Theft of Motor Vehicle Parts/Accessories & Anti-Ethnicity Other Than Hispanic & 9 & 3.61\textbackslash{}\%\\
\hline
...300 & Theft of Motor Vehicle Parts/Accessories & All Other & 96 & 38.53\textbackslash{}\%\\
\hline
...301 & Theft of Motor Vehicle Parts/Accessories & Total & 249 & 100\textbackslash{}\%\\
\hline
...302 & Unknown & Anti-Black & 5 & 31.25\textbackslash{}\%\\
\hline
...303 & Unknown & Anti-White & 4 & 25.00\textbackslash{}\%\\
\hline
...304 & Unknown & Anti-American Indian Or Native Alaskan & 2 & 12.50\textbackslash{}\%\\
\hline
...305 & Unknown & Anti-Catholic & 1 & 6.25\textbackslash{}\%\\
\hline
...306 & Unknown & Anti-Male & 1 & 6.25\textbackslash{}\%\\
\hline
...307 & Unknown & All Other & 3 & 18.75\textbackslash{}\%\\
\hline
...308 & Unknown & Total & 16 & 100\textbackslash{}\%\\
\hline
...309 & Weapon Law Violations & Anti-Black & 173 & 36.89\textbackslash{}\%\\
\hline
...310 & Weapon Law Violations & Anti-White & 95 & 20.26\textbackslash{}\%\\
\hline
...311 & Weapon Law Violations & Anti-Hispanic & 23 & 4.90\textbackslash{}\%\\
\hline
...312 & Weapon Law Violations & Anti-American Indian Or Native Alaskan & 23 & 4.90\textbackslash{}\%\\
\hline
...313 & Weapon Law Violations & Anti-Ethnicity Other Than Hispanic & 19 & 4.05\textbackslash{}\%\\
\hline
...314 & Weapon Law Violations & All Other & 136 & 29.02\textbackslash{}\%\\
\hline
...315 & Weapon Law Violations & Total & 469 & 100\textbackslash{}\%\\
\hline
1...316 & Welfare Fraud & Anti-White & 4 & 50.00\textbackslash{}\%\\
\hline
2...317 & Welfare Fraud & Anti-Mental Disability & 2 & 25.00\textbackslash{}\%\\
\hline
3...318 & Welfare Fraud & Anti-American Indian Or Native Alaskan & 1 & 12.50\textbackslash{}\%\\
\hline
4...319 & Welfare Fraud & Anti-Arab & 1 & 12.50\textbackslash{}\%\\
\hline
NA...320 & NA & NA & NA & NA\\
\hline
...321 & Welfare Fraud & All Other & NA & NA\textbackslash{}\%\\
\hline
...322 & Welfare Fraud & Total & 8 & 100\textbackslash{}\%\\
\hline
...323 & Wire Fraud & Anti-White & 7 & 26.92\textbackslash{}\%\\
\hline
...324 & Wire Fraud & Anti-Catholic & 2 & 7.69\textbackslash{}\%\\
\hline
...325 & Wire Fraud & Anti-Female & 2 & 7.69\textbackslash{}\%\\
\hline
...326 & Wire Fraud & Anti-Multi-Racial Group & 2 & 7.69\textbackslash{}\%\\
\hline
...327 & Wire Fraud & Anti-Male Homosexual (Gay) & 2 & 7.69\textbackslash{}\%\\
\hline
...328 & Wire Fraud & All Other & 11 & 42.35\textbackslash{}\%\\
\hline
...329 & Wire Fraud & Total & 26 & 100\textbackslash{}\%\\
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
Total &  & 239,665 & 100\textbackslash{}\%\\
\hline
Residence/Home & 1991 & 70,736 & 29.51\textbackslash{}\%\\
\hline
Highway/Road/Alley & 1991 & 45,004 & 18.78\textbackslash{}\%\\
\hline
Other/Unknown & 1991 & 31,218 & 13.03\textbackslash{}\%\\
\hline
School/College & 1991 & 17,550 & 7.32\textbackslash{}\%\\
\hline
Parking Lot/Garage & 1991 & 13,786 & 5.75\textbackslash{}\%\\
\hline
Church/Synagogue/Temple & 1991 & 8,926 & 3.72\textbackslash{}\%\\
\hline
Commercial/Office Building & 1991 & 5,403 & 2.25\textbackslash{}\%\\
\hline
Restaurant & 1991 & 5,099 & 2.13\textbackslash{}\%\\
\hline
Bar/Nightclub & 1991 & 4,088 & 1.71\textbackslash{}\%\\
\hline
School - Elementary/Secondary & 2010 & 3,919 & 1.64\textbackslash{}\%\\
\hline
Government/Public Building & 1991 & 3,545 & 1.48\textbackslash{}\%\\
\hline
Convenience Store & 1991 & 3,357 & 1.40\textbackslash{}\%\\
\hline
Specialty Store - Tv, Fur, Etc. & 1991 & 2,795 & 1.17\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & 1991 & 2,531 & 1.06\textbackslash{}\%\\
\hline
Service/Gas Station & 1991 & 2,287 & 0.95\textbackslash{}\%\\
\hline
Grocery/Supermarket & 1991 & 2,178 & 0.91\textbackslash{}\%\\
\hline
Field/Woods & 1991 & 2,169 & 0.91\textbackslash{}\%\\
\hline
School - College/University & 2010 & 2,068 & 0.86\textbackslash{}\%\\
\hline
Department/Discount Store & 1991 & 2,024 & 0.84\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & 1991 & 1,967 & 0.82\textbackslash{}\%\\
\hline
Park/Playground & 2010 & 1,883 & 0.79\textbackslash{}\%\\
\hline
Jail/Prison & 1991 & 1,726 & 0.72\textbackslash{}\%\\
\hline
Hotel/Motel & 1991 & 1,618 & 0.68\textbackslash{}\%\\
\hline
Construction Site & 1991 & 643 & 0.27\textbackslash{}\%\\
\hline
Bank/Savings And Loan & 1991 & 556 & 0.23\textbackslash{}\%\\
\hline
Liquor Store & 1991 & 459 & 0.19\textbackslash{}\%\\
\hline
Lake/Waterway & 1991 & 416 & 0.17\textbackslash{}\%\\
\hline
Shopping Mall & 2010 & 268 & 0.11\textbackslash{}\%\\
\hline
Rental Storage Facility & 1991 & 257 & 0.11\textbackslash{}\%\\
\hline
Community Center & 2013 & 215 & 0.09\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & 2011 & 169 & 0.07\textbackslash{}\%\\
\hline
Industrial Site & 2010 & 135 & 0.06\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & 2011 & 88 & 0.04\textbackslash{}\%\\
\hline
Auto Dealership New/Used & 2011 & 82 & 0.03\textbackslash{}\%\\
\hline
Camp/Campground & 2010 & 77 & 0.03\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & 2011 & 75 & 0.03\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & 2010 & 69 & 0.03\textbackslash{}\%\\
\hline
Rest Area & 2011 & 65 & 0.03\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & 2012 & 47 & 0.02\textbackslash{}\%\\
\hline
Daycare Facility & 2011 & 47 & 0.02\textbackslash{}\%\\
\hline
Amusement Park & 2011 & 41 & 0.02\textbackslash{}\%\\
\hline
Farm Facility & 2011 & 34 & 0.01\textbackslash{}\%\\
\hline
Tribal Lands & 2011 & 23 & 0.01\textbackslash{}\%\\
\hline
Atm Separate From Bank & 2011 & 17 & 0.01\textbackslash{}\%\\
\hline
Military Installation & 2015 & 5 & 0.00\textbackslash{}\%\\
\hline
\end{longtable}





\begin{longtable}[t]{l|l|l|r|r}
\caption{(\#tab:hatelocationOffense)The number and percent of offenses by location, 2022.}\\
\hline
  & Location & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hatelocationOffense)The number and percent of offenses by location, 2022. \textit{(continued)}}\\
\hline
  & Location & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
...1 & Abandoned/Condemned Structure & Destruction of Property/Vandalism & 42 & 56.00\textbackslash{}\%\\
\hline
...2 & Abandoned/Condemned Structure & Intimidation & 7 & 9.33\textbackslash{}\%\\
\hline
...3 & Abandoned/Condemned Structure & Simple Assault & 7 & 9.33\textbackslash{}\%\\
\hline
...4 & Abandoned/Condemned Structure & Burglary/Breaking And Entering & 5 & 6.67\textbackslash{}\%\\
\hline
...5 & Abandoned/Condemned Structure & Aggravated Assault & 3 & 4.00\textbackslash{}\%\\
\hline
...6 & Abandoned/Condemned Structure & All Other & 11 & 14.66\textbackslash{}\%\\
\hline
...7 & Abandoned/Condemned Structure & Total & 75 & 100\textbackslash{}\%\\
\hline
...8 & Air/Bus/Train Terminal & Simple Assault & 998 & 39.43\textbackslash{}\%\\
\hline
...9 & Air/Bus/Train Terminal & Intimidation & 552 & 21.81\textbackslash{}\%\\
\hline
...10 & Air/Bus/Train Terminal & Aggravated Assault & 414 & 16.36\textbackslash{}\%\\
\hline
...11 & Air/Bus/Train Terminal & Destruction of Property/Vandalism & 390 & 15.41\textbackslash{}\%\\
\hline
...12 & Air/Bus/Train Terminal & Robbery & 98 & 3.87\textbackslash{}\%\\
\hline
...13 & Air/Bus/Train Terminal & All Other & 79 & 3.15\textbackslash{}\%\\
\hline
...14 & Air/Bus/Train Terminal & Total & 2,531 & 100\textbackslash{}\%\\
\hline
...15 & Amusement Park & Simple Assault & 14 & 34.15\textbackslash{}\%\\
\hline
...16 & Amusement Park & Intimidation & 12 & 29.27\textbackslash{}\%\\
\hline
...17 & Amusement Park & Aggravated Assault & 5 & 12.20\textbackslash{}\%\\
\hline
...18 & Amusement Park & Destruction of Property/Vandalism & 5 & 12.20\textbackslash{}\%\\
\hline
...19 & Amusement Park & All Other Larceny & 2 & 4.88\textbackslash{}\%\\
\hline
...20 & Amusement Park & All Other & 3 & 7.32\textbackslash{}\%\\
\hline
...21 & Amusement Park & Total & 41 & 100\textbackslash{}\%\\
\hline
...22 & Arena/Stadium/Fairgrounds/Coliseum & Simple Assault & 40 & 45.45\textbackslash{}\%\\
\hline
...23 & Arena/Stadium/Fairgrounds/Coliseum & Intimidation & 20 & 22.73\textbackslash{}\%\\
\hline
...24 & Arena/Stadium/Fairgrounds/Coliseum & Destruction of Property/Vandalism & 15 & 17.05\textbackslash{}\%\\
\hline
...25 & Arena/Stadium/Fairgrounds/Coliseum & Aggravated Assault & 8 & 9.09\textbackslash{}\%\\
\hline
...26 & Arena/Stadium/Fairgrounds/Coliseum & All Other Larceny & 1 & 1.14\textbackslash{}\%\\
\hline
...27 & Arena/Stadium/Fairgrounds/Coliseum & All Other & 4 & 4.56\textbackslash{}\%\\
\hline
...28 & Arena/Stadium/Fairgrounds/Coliseum & Total & 88 & 100\textbackslash{}\%\\
\hline
...29 & Atm Separate From Bank & Simple Assault & 5 & 29.41\textbackslash{}\%\\
\hline
...30 & Atm Separate From Bank & Intimidation & 3 & 17.65\textbackslash{}\%\\
\hline
...31 & Atm Separate From Bank & Credit Card/Atm Fraud & 3 & 17.65\textbackslash{}\%\\
\hline
...32 & Atm Separate From Bank & False Pretenses/Swindle/Confidence Game & 1 & 5.88\textbackslash{}\%\\
\hline
...33 & Atm Separate From Bank & Fraud-Other & 1 & 5.88\textbackslash{}\%\\
\hline
...34 & Atm Separate From Bank & All Other & 4 & 23.52\textbackslash{}\%\\
\hline
...35 & Atm Separate From Bank & Total & 17 & 100\textbackslash{}\%\\
\hline
...36 & Auto Dealership New/Used & Intimidation & 27 & 32.93\textbackslash{}\%\\
\hline
...37 & Auto Dealership New/Used & Destruction of Property/Vandalism & 12 & 14.63\textbackslash{}\%\\
\hline
...38 & Auto Dealership New/Used & Simple Assault & 11 & 13.41\textbackslash{}\%\\
\hline
...39 & Auto Dealership New/Used & Theft of Motor Vehicle Parts/Accessories & 6 & 7.32\textbackslash{}\%\\
\hline
...40 & Auto Dealership New/Used & All Other Larceny & 6 & 7.32\textbackslash{}\%\\
\hline
...41 & Auto Dealership New/Used & All Other & 20 & 24.4\textbackslash{}\%\\
\hline
...42 & Auto Dealership New/Used & Total & 82 & 100\textbackslash{}\%\\
\hline
...43 & Bank/Savings And Loan & Intimidation & 181 & 32.55\textbackslash{}\%\\
\hline
...44 & Bank/Savings And Loan & Destruction of Property/Vandalism & 96 & 17.27\textbackslash{}\%\\
\hline
...45 & Bank/Savings And Loan & Simple Assault & 67 & 12.05\textbackslash{}\%\\
\hline
...46 & Bank/Savings And Loan & Counterfeiting/Forgery & 54 & 9.71\textbackslash{}\%\\
\hline
...47 & Bank/Savings And Loan & Aggravated Assault & 38 & 6.83\textbackslash{}\%\\
\hline
...48 & Bank/Savings And Loan & All Other & 120 & 21.6\textbackslash{}\%\\
\hline
...49 & Bank/Savings And Loan & Total & 556 & 100\textbackslash{}\%\\
\hline
...50 & Bar/Nightclub & Simple Assault & 1,881 & 46.01\textbackslash{}\%\\
\hline
...51 & Bar/Nightclub & Aggravated Assault & 985 & 24.09\textbackslash{}\%\\
\hline
...52 & Bar/Nightclub & Intimidation & 757 & 18.52\textbackslash{}\%\\
\hline
...53 & Bar/Nightclub & Destruction of Property/Vandalism & 273 & 6.68\textbackslash{}\%\\
\hline
...54 & Bar/Nightclub & Robbery & 63 & 1.54\textbackslash{}\%\\
\hline
...55 & Bar/Nightclub & All Other & 129 & 3.11\textbackslash{}\%\\
\hline
...56 & Bar/Nightclub & Total & 4,088 & 100\textbackslash{}\%\\
\hline
...57 & Camp/Campground & Destruction of Property/Vandalism & 24 & 31.17\textbackslash{}\%\\
\hline
...58 & Camp/Campground & Simple Assault & 18 & 23.38\textbackslash{}\%\\
\hline
...59 & Camp/Campground & Intimidation & 12 & 15.58\textbackslash{}\%\\
\hline
...60 & Camp/Campground & Aggravated Assault & 10 & 12.99\textbackslash{}\%\\
\hline
...61 & Camp/Campground & All Other Larceny & 4 & 5.19\textbackslash{}\%\\
\hline
...62 & Camp/Campground & All Other & 9 & 11.7\textbackslash{}\%\\
\hline
...63 & Camp/Campground & Total & 77 & 100\textbackslash{}\%\\
\hline
...64 & Church/Synagogue/Temple & Destruction of Property/Vandalism & 6,080 & 68.12\textbackslash{}\%\\
\hline
...65 & Church/Synagogue/Temple & Intimidation & 1,636 & 18.33\textbackslash{}\%\\
\hline
...66 & Church/Synagogue/Temple & Burglary/Breaking And Entering & 372 & 4.17\textbackslash{}\%\\
\hline
...67 & Church/Synagogue/Temple & Arson & 324 & 3.63\textbackslash{}\%\\
\hline
...68 & Church/Synagogue/Temple & Simple Assault & 228 & 2.55\textbackslash{}\%\\
\hline
...69 & Church/Synagogue/Temple & All Other & 286 & 3.18\textbackslash{}\%\\
\hline
...70 & Church/Synagogue/Temple & Total & 8,926 & 100\textbackslash{}\%\\
\hline
...71 & Commercial/Office Building & Intimidation & 2,317 & 42.88\textbackslash{}\%\\
\hline
...72 & Commercial/Office Building & Destruction of Property/Vandalism & 1,745 & 32.30\textbackslash{}\%\\
\hline
...73 & Commercial/Office Building & Simple Assault & 687 & 12.72\textbackslash{}\%\\
\hline
...74 & Commercial/Office Building & Aggravated Assault & 240 & 4.44\textbackslash{}\%\\
\hline
...75 & Commercial/Office Building & Burglary/Breaking And Entering & 116 & 2.15\textbackslash{}\%\\
\hline
...76 & Commercial/Office Building & All Other & 298 & 5.51\textbackslash{}\%\\
\hline
...77 & Commercial/Office Building & Total & 5,403 & 100\textbackslash{}\%\\
\hline
...78 & Community Center & Intimidation & 89 & 41.40\textbackslash{}\%\\
\hline
...79 & Community Center & Destruction of Property/Vandalism & 72 & 33.49\textbackslash{}\%\\
\hline
...80 & Community Center & Simple Assault & 30 & 13.95\textbackslash{}\%\\
\hline
...81 & Community Center & Aggravated Assault & 12 & 5.58\textbackslash{}\%\\
\hline
...82 & Community Center & Burglary/Breaking And Entering & 3 & 1.40\textbackslash{}\%\\
\hline
...83 & Community Center & All Other & 9 & 4.21\textbackslash{}\%\\
\hline
...84 & Community Center & Total & 215 & 100\textbackslash{}\%\\
\hline
...85 & Construction Site & Destruction of Property/Vandalism & 359 & 55.83\textbackslash{}\%\\
\hline
...86 & Construction Site & Intimidation & 100 & 15.55\textbackslash{}\%\\
\hline
...87 & Construction Site & Simple Assault & 54 & 8.40\textbackslash{}\%\\
\hline
...88 & Construction Site & Burglary/Breaking And Entering & 41 & 6.38\textbackslash{}\%\\
\hline
...89 & Construction Site & Aggravated Assault & 34 & 5.29\textbackslash{}\%\\
\hline
...90 & Construction Site & All Other & 55 & 8.55\textbackslash{}\%\\
\hline
...91 & Construction Site & Total & 643 & 100\textbackslash{}\%\\
\hline
...92 & Convenience Store & Intimidation & 1,137 & 33.87\textbackslash{}\%\\
\hline
...93 & Convenience Store & Simple Assault & 907 & 27.02\textbackslash{}\%\\
\hline
...94 & Convenience Store & Aggravated Assault & 469 & 13.97\textbackslash{}\%\\
\hline
...95 & Convenience Store & Destruction of Property/Vandalism & 388 & 11.56\textbackslash{}\%\\
\hline
...96 & Convenience Store & Shoplifting & 99 & 2.95\textbackslash{}\%\\
\hline
...97 & Convenience Store & All Other & 357 & 10.66\textbackslash{}\%\\
\hline
...98 & Convenience Store & Total & 3,357 & 100\textbackslash{}\%\\
\hline
...99 & Daycare Facility & Destruction of Property/Vandalism & 16 & 34.04\textbackslash{}\%\\
\hline
...100 & Daycare Facility & Intimidation & 12 & 25.53\textbackslash{}\%\\
\hline
...101 & Daycare Facility & Simple Assault & 9 & 19.15\textbackslash{}\%\\
\hline
...102 & Daycare Facility & Burglary/Breaking And Entering & 3 & 6.38\textbackslash{}\%\\
\hline
...103 & Daycare Facility & Aggravated Assault & 2 & 4.26\textbackslash{}\%\\
\hline
...104 & Daycare Facility & All Other & 5 & 10.65\textbackslash{}\%\\
\hline
...105 & Daycare Facility & Total & 47 & 100\textbackslash{}\%\\
\hline
...106 & Department/Discount Store & Intimidation & 553 & 27.32\textbackslash{}\%\\
\hline
...107 & Department/Discount Store & Simple Assault & 452 & 22.33\textbackslash{}\%\\
\hline
...108 & Department/Discount Store & Shoplifting & 298 & 14.72\textbackslash{}\%\\
\hline
...109 & Department/Discount Store & Destruction of Property/Vandalism & 270 & 13.34\textbackslash{}\%\\
\hline
...110 & Department/Discount Store & Aggravated Assault & 161 & 7.95\textbackslash{}\%\\
\hline
...111 & Department/Discount Store & All Other & 290 & 14.37\textbackslash{}\%\\
\hline
...112 & Department/Discount Store & Total & 2,024 & 100\textbackslash{}\%\\
\hline
...113 & Dock/Wharf/Freight/Modal Terminal & Simple Assault & 17 & 36.17\textbackslash{}\%\\
\hline
...114 & Dock/Wharf/Freight/Modal Terminal & Destruction of Property/Vandalism & 8 & 17.02\textbackslash{}\%\\
\hline
...115 & Dock/Wharf/Freight/Modal Terminal & Intimidation & 8 & 17.02\textbackslash{}\%\\
\hline
...116 & Dock/Wharf/Freight/Modal Terminal & Aggravated Assault & 7 & 14.89\textbackslash{}\%\\
\hline
...117 & Dock/Wharf/Freight/Modal Terminal & Robbery & 5 & 10.64\textbackslash{}\%\\
\hline
...118 & Dock/Wharf/Freight/Modal Terminal & All Other & 2 & 4.26\textbackslash{}\%\\
\hline
...119 & Dock/Wharf/Freight/Modal Terminal & Total & 47 & 100\textbackslash{}\%\\
\hline
...120 & Drug Store/Doctors Office/Hospital & Intimidation & 830 & 42.20\textbackslash{}\%\\
\hline
...121 & Drug Store/Doctors Office/Hospital & Simple Assault & 492 & 25.01\textbackslash{}\%\\
\hline
...122 & Drug Store/Doctors Office/Hospital & Destruction of Property/Vandalism & 388 & 19.73\textbackslash{}\%\\
\hline
...123 & Drug Store/Doctors Office/Hospital & Aggravated Assault & 130 & 6.61\textbackslash{}\%\\
\hline
...124 & Drug Store/Doctors Office/Hospital & Shoplifting & 19 & 0.97\textbackslash{}\%\\
\hline
...125 & Drug Store/Doctors Office/Hospital & All Other & 108 & 5.47\textbackslash{}\%\\
\hline
...126 & Drug Store/Doctors Office/Hospital & Total & 1,967 & 100\textbackslash{}\%\\
\hline
...127 & Farm Facility & Destruction of Property/Vandalism & 8 & 23.53\textbackslash{}\%\\
\hline
...128 & Farm Facility & Burglary/Breaking And Entering & 7 & 20.59\textbackslash{}\%\\
\hline
...129 & Farm Facility & Aggravated Assault & 5 & 14.71\textbackslash{}\%\\
\hline
...130 & Farm Facility & Simple Assault & 5 & 14.71\textbackslash{}\%\\
\hline
...131 & Farm Facility & All Other Larceny & 2 & 5.88\textbackslash{}\%\\
\hline
...132 & Farm Facility & All Other & 7 & 20.58\textbackslash{}\%\\
\hline
...133 & Farm Facility & Total & 34 & 100\textbackslash{}\%\\
\hline
...134 & Field/Woods & Destruction of Property/Vandalism & 638 & 29.41\textbackslash{}\%\\
\hline
...135 & Field/Woods & Simple Assault & 519 & 23.93\textbackslash{}\%\\
\hline
...136 & Field/Woods & Aggravated Assault & 436 & 20.10\textbackslash{}\%\\
\hline
...137 & Field/Woods & Intimidation & 293 & 13.51\textbackslash{}\%\\
\hline
...138 & Field/Woods & Robbery & 116 & 5.35\textbackslash{}\%\\
\hline
...139 & Field/Woods & All Other & 167 & 7.71\textbackslash{}\%\\
\hline
...140 & Field/Woods & Total & 2,169 & 100\textbackslash{}\%\\
\hline
...141 & Gambling Facility/Casino/Race Track & Simple Assault & 29 & 42.03\textbackslash{}\%\\
\hline
...142 & Gambling Facility/Casino/Race Track & Intimidation & 12 & 17.39\textbackslash{}\%\\
\hline
...143 & Gambling Facility/Casino/Race Track & Destruction of Property/Vandalism & 8 & 11.59\textbackslash{}\%\\
\hline
...144 & Gambling Facility/Casino/Race Track & All Other Larceny & 6 & 8.70\textbackslash{}\%\\
\hline
...145 & Gambling Facility/Casino/Race Track & Counterfeiting/Forgery & 4 & 5.80\textbackslash{}\%\\
\hline
...146 & Gambling Facility/Casino/Race Track & All Other & 10 & 14.5\textbackslash{}\%\\
\hline
...147 & Gambling Facility/Casino/Race Track & Total & 69 & 100\textbackslash{}\%\\
\hline
...148 & Government/Public Building & Destruction of Property/Vandalism & 1,354 & 38.19\textbackslash{}\%\\
\hline
...149 & Government/Public Building & Intimidation & 1,279 & 36.08\textbackslash{}\%\\
\hline
...150 & Government/Public Building & Simple Assault & 548 & 15.46\textbackslash{}\%\\
\hline
...151 & Government/Public Building & Aggravated Assault & 180 & 5.08\textbackslash{}\%\\
\hline
...152 & Government/Public Building & Drug/Narcotic Violations & 31 & 0.87\textbackslash{}\%\\
\hline
...153 & Government/Public Building & All Other & 153 & 4.32\textbackslash{}\%\\
\hline
...154 & Government/Public Building & Total & 3,545 & 100\textbackslash{}\%\\
\hline
...155 & Grocery/Supermarket & Intimidation & 657 & 30.17\textbackslash{}\%\\
\hline
...156 & Grocery/Supermarket & Simple Assault & 577 & 26.49\textbackslash{}\%\\
\hline
...157 & Grocery/Supermarket & Destruction of Property/Vandalism & 320 & 14.69\textbackslash{}\%\\
\hline
...158 & Grocery/Supermarket & Aggravated Assault & 232 & 10.65\textbackslash{}\%\\
\hline
...159 & Grocery/Supermarket & Shoplifting & 180 & 8.26\textbackslash{}\%\\
\hline
...160 & Grocery/Supermarket & All Other & 212 & 9.78\textbackslash{}\%\\
\hline
...161 & Grocery/Supermarket & Total & 2,178 & 100\textbackslash{}\%\\
\hline
...162 & Highway/Road/Alley & Simple Assault & 13,194 & 29.32\textbackslash{}\%\\
\hline
...163 & Highway/Road/Alley & Aggravated Assault & 10,401 & 23.11\textbackslash{}\%\\
\hline
...164 & Highway/Road/Alley & Intimidation & 9,803 & 21.78\textbackslash{}\%\\
\hline
...165 & Highway/Road/Alley & Destruction of Property/Vandalism & 7,356 & 16.35\textbackslash{}\%\\
\hline
...166 & Highway/Road/Alley & Robbery & 2,169 & 4.82\textbackslash{}\%\\
\hline
...167 & Highway/Road/Alley & All Other & 2,081 & 4.59\textbackslash{}\%\\
\hline
...168 & Highway/Road/Alley & Total & 45,004 & 100\textbackslash{}\%\\
\hline
...169 & Hotel/Motel & Intimidation & 491 & 30.35\textbackslash{}\%\\
\hline
...170 & Hotel/Motel & Simple Assault & 459 & 28.37\textbackslash{}\%\\
\hline
...171 & Hotel/Motel & Destruction of Property/Vandalism & 245 & 15.14\textbackslash{}\%\\
\hline
...172 & Hotel/Motel & Aggravated Assault & 226 & 13.97\textbackslash{}\%\\
\hline
...173 & Hotel/Motel & Robbery & 31 & 1.92\textbackslash{}\%\\
\hline
...174 & Hotel/Motel & All Other & 166 & 10.24\textbackslash{}\%\\
\hline
...175 & Hotel/Motel & Total & 1,618 & 100\textbackslash{}\%\\
\hline
...176 & Industrial Site & Intimidation & 53 & 39.26\textbackslash{}\%\\
\hline
...177 & Industrial Site & Destruction of Property/Vandalism & 32 & 23.70\textbackslash{}\%\\
\hline
...178 & Industrial Site & Simple Assault & 16 & 11.85\textbackslash{}\%\\
\hline
...179 & Industrial Site & Aggravated Assault & 10 & 7.41\textbackslash{}\%\\
\hline
...180 & Industrial Site & All Other Larceny & 9 & 6.67\textbackslash{}\%\\
\hline
...181 & Industrial Site & All Other & 15 & 11.11\textbackslash{}\%\\
\hline
...182 & Industrial Site & Total & 135 & 100\textbackslash{}\%\\
\hline
...183 & Jail/Prison & Simple Assault & 903 & 52.32\textbackslash{}\%\\
\hline
...184 & Jail/Prison & Aggravated Assault & 367 & 21.26\textbackslash{}\%\\
\hline
...185 & Jail/Prison & Intimidation & 326 & 18.89\textbackslash{}\%\\
\hline
...186 & Jail/Prison & Destruction of Property/Vandalism & 47 & 2.72\textbackslash{}\%\\
\hline
...187 & Jail/Prison & Drug/Narcotic Violations & 25 & 1.45\textbackslash{}\%\\
\hline
...188 & Jail/Prison & All Other & 58 & 3.4\textbackslash{}\%\\
\hline
...189 & Jail/Prison & Total & 1,726 & 100\textbackslash{}\%\\
\hline
...190 & Lake/Waterway & Simple Assault & 127 & 30.53\textbackslash{}\%\\
\hline
...191 & Lake/Waterway & Aggravated Assault & 102 & 24.52\textbackslash{}\%\\
\hline
...192 & Lake/Waterway & Destruction of Property/Vandalism & 80 & 19.23\textbackslash{}\%\\
\hline
...193 & Lake/Waterway & Intimidation & 64 & 15.38\textbackslash{}\%\\
\hline
...194 & Lake/Waterway & Robbery & 17 & 4.09\textbackslash{}\%\\
\hline
...195 & Lake/Waterway & All Other & 26 & 6.24\textbackslash{}\%\\
\hline
...196 & Lake/Waterway & Total & 416 & 100\textbackslash{}\%\\
\hline
...197 & Liquor Store & Intimidation & 170 & 37.04\textbackslash{}\%\\
\hline
...198 & Liquor Store & Simple Assault & 101 & 22.00\textbackslash{}\%\\
\hline
...199 & Liquor Store & Aggravated Assault & 88 & 19.17\textbackslash{}\%\\
\hline
...200 & Liquor Store & Destruction of Property/Vandalism & 50 & 10.89\textbackslash{}\%\\
\hline
...201 & Liquor Store & Robbery & 14 & 3.05\textbackslash{}\%\\
\hline
...202 & Liquor Store & All Other & 36 & 7.86\textbackslash{}\%\\
\hline
...203 & Liquor Store & Total & 459 & 100\textbackslash{}\%\\
\hline
1 & Military Installation & Destruction of Property/Vandalism & 2 & 40.00\textbackslash{}\%\\
\hline
2 & Military Installation & Human Trafficking - Involuntary Servitude & 1 & 20.00\textbackslash{}\%\\
\hline
3 & Military Installation & Simple Assault & 1 & 20.00\textbackslash{}\%\\
\hline
4 & Military Installation & Murder/Non-Negligent Manslaughter & 1 & 20.00\textbackslash{}\%\\
\hline
NA & NA & NA & NA & NA\\
\hline
...209 & Military Installation & All Other & NA & NA\textbackslash{}\%\\
\hline
...210 & Military Installation & Total & 5 & 100\textbackslash{}\%\\
\hline
...211 & Other/Unknown & Destruction of Property/Vandalism & 11,242 & 36.01\textbackslash{}\%\\
\hline
...212 & Other/Unknown & Intimidation & 9,642 & 30.89\textbackslash{}\%\\
\hline
...213 & Other/Unknown & Simple Assault & 5,865 & 18.79\textbackslash{}\%\\
\hline
...214 & Other/Unknown & Aggravated Assault & 2,577 & 8.25\textbackslash{}\%\\
\hline
...215 & Other/Unknown & Robbery & 583 & 1.87\textbackslash{}\%\\
\hline
...216 & Other/Unknown & All Other & 1,309 & 4.2\textbackslash{}\%\\
\hline
...217 & Other/Unknown & Total & 31,218 & 100\textbackslash{}\%\\
\hline
...218 & Park/Playground & Destruction of Property/Vandalism & 909 & 48.27\textbackslash{}\%\\
\hline
...219 & Park/Playground & Simple Assault & 338 & 17.95\textbackslash{}\%\\
\hline
...220 & Park/Playground & Intimidation & 283 & 15.03\textbackslash{}\%\\
\hline
...221 & Park/Playground & Aggravated Assault & 243 & 12.90\textbackslash{}\%\\
\hline
...222 & Park/Playground & Robbery & 56 & 2.97\textbackslash{}\%\\
\hline
...223 & Park/Playground & All Other & 54 & 2.88\textbackslash{}\%\\
\hline
...224 & Park/Playground & Total & 1,883 & 100\textbackslash{}\%\\
\hline
...225 & Parking Lot/Garage & Destruction of Property/Vandalism & 4,234 & 30.71\textbackslash{}\%\\
\hline
...226 & Parking Lot/Garage & Simple Assault & 3,185 & 23.10\textbackslash{}\%\\
\hline
...227 & Parking Lot/Garage & Intimidation & 2,801 & 20.32\textbackslash{}\%\\
\hline
...228 & Parking Lot/Garage & Aggravated Assault & 2,293 & 16.63\textbackslash{}\%\\
\hline
...229 & Parking Lot/Garage & Robbery & 332 & 2.41\textbackslash{}\%\\
\hline
...230 & Parking Lot/Garage & All Other & 941 & 6.82\textbackslash{}\%\\
\hline
...231 & Parking Lot/Garage & Total & 13,786 & 100\textbackslash{}\%\\
\hline
...232 & Rental Storage Facility & Destruction of Property/Vandalism & 100 & 38.91\textbackslash{}\%\\
\hline
...233 & Rental Storage Facility & Intimidation & 43 & 16.73\textbackslash{}\%\\
\hline
...234 & Rental Storage Facility & Burglary/Breaking And Entering & 37 & 14.40\textbackslash{}\%\\
\hline
...235 & Rental Storage Facility & Simple Assault & 22 & 8.56\textbackslash{}\%\\
\hline
...236 & Rental Storage Facility & Aggravated Assault & 19 & 7.39\textbackslash{}\%\\
\hline
...237 & Rental Storage Facility & All Other & 36 & 14.02\textbackslash{}\%\\
\hline
...238 & Rental Storage Facility & Total & 257 & 100\textbackslash{}\%\\
\hline
...239 & Residence/Home & Intimidation & 25,953 & 36.69\textbackslash{}\%\\
\hline
...240 & Residence/Home & Destruction of Property/Vandalism & 23,212 & 32.81\textbackslash{}\%\\
\hline
...241 & Residence/Home & Simple Assault & 9,231 & 13.05\textbackslash{}\%\\
\hline
...242 & Residence/Home & Aggravated Assault & 4,999 & 7.07\textbackslash{}\%\\
\hline
...243 & Residence/Home & Burglary/Breaking And Entering & 2,395 & 3.39\textbackslash{}\%\\
\hline
...244 & Residence/Home & All Other & 4,946 & 7.02\textbackslash{}\%\\
\hline
...245 & Residence/Home & Total & 70,736 & 100\textbackslash{}\%\\
\hline
...246 & Rest Area & Destruction of Property/Vandalism & 38 & 58.46\textbackslash{}\%\\
\hline
...247 & Rest Area & Simple Assault & 10 & 15.38\textbackslash{}\%\\
\hline
...248 & Rest Area & Intimidation & 9 & 13.85\textbackslash{}\%\\
\hline
...249 & Rest Area & Aggravated Assault & 7 & 10.77\textbackslash{}\%\\
\hline
...250 & Rest Area & All Other Larceny & 1 & 1.54\textbackslash{}\%\\
\hline
...251 & Rest Area & All Other & NA & NA\textbackslash{}\%\\
\hline
...252 & Rest Area & Total & 65 & 100\textbackslash{}\%\\
\hline
...253 & Restaurant & Intimidation & 1,830 & 35.89\textbackslash{}\%\\
\hline
...254 & Restaurant & Simple Assault & 1,491 & 29.24\textbackslash{}\%\\
\hline
...255 & Restaurant & Destruction of Property/Vandalism & 881 & 17.28\textbackslash{}\%\\
\hline
...256 & Restaurant & Aggravated Assault & 606 & 11.88\textbackslash{}\%\\
\hline
...257 & Restaurant & Robbery & 55 & 1.08\textbackslash{}\%\\
\hline
...258 & Restaurant & All Other & 236 & 4.63\textbackslash{}\%\\
\hline
...259 & Restaurant & Total & 5,099 & 100\textbackslash{}\%\\
\hline
...260 & School - College/University & Destruction of Property/Vandalism & 1,042 & 50.39\textbackslash{}\%\\
\hline
...261 & School - College/University & Intimidation & 643 & 31.09\textbackslash{}\%\\
\hline
...262 & School - College/University & Simple Assault & 215 & 10.40\textbackslash{}\%\\
\hline
...263 & School - College/University & Aggravated Assault & 58 & 2.80\textbackslash{}\%\\
\hline
...264 & School - College/University & Burglary/Breaking And Entering & 27 & 1.31\textbackslash{}\%\\
\hline
...265 & School - College/University & All Other & 83 & 4.03\textbackslash{}\%\\
\hline
...266 & School - College/University & Total & 2,068 & 100\textbackslash{}\%\\
\hline
...267 & School - Elementary/Secondary & Intimidation & 1,386 & 35.37\textbackslash{}\%\\
\hline
...268 & School - Elementary/Secondary & Destruction of Property/Vandalism & 1,348 & 34.40\textbackslash{}\%\\
\hline
...269 & School - Elementary/Secondary & Simple Assault & 871 & 22.23\textbackslash{}\%\\
\hline
...270 & School - Elementary/Secondary & Aggravated Assault & 144 & 3.67\textbackslash{}\%\\
\hline
...271 & School - Elementary/Secondary & Burglary/Breaking And Entering & 33 & 0.84\textbackslash{}\%\\
\hline
...272 & School - Elementary/Secondary & All Other & 137 & 3.52\textbackslash{}\%\\
\hline
...273 & School - Elementary/Secondary & Total & 3,919 & 100\textbackslash{}\%\\
\hline
...274 & School/College & Destruction of Property/Vandalism & 7,922 & 45.14\textbackslash{}\%\\
\hline
...275 & School/College & Intimidation & 5,234 & 29.82\textbackslash{}\%\\
\hline
...276 & School/College & Simple Assault & 3,158 & 17.99\textbackslash{}\%\\
\hline
...277 & School/College & Aggravated Assault & 690 & 3.93\textbackslash{}\%\\
\hline
...278 & School/College & Burglary/Breaking And Entering & 132 & 0.75\textbackslash{}\%\\
\hline
...279 & School/College & All Other & 414 & 2.38\textbackslash{}\%\\
\hline
...280 & School/College & Total & 17,550 & 100\textbackslash{}\%\\
\hline
...281 & Service/Gas Station & Intimidation & 768 & 33.58\textbackslash{}\%\\
\hline
...282 & Service/Gas Station & Simple Assault & 576 & 25.19\textbackslash{}\%\\
\hline
...283 & Service/Gas Station & Aggravated Assault & 374 & 16.35\textbackslash{}\%\\
\hline
...284 & Service/Gas Station & Destruction of Property/Vandalism & 246 & 10.76\textbackslash{}\%\\
\hline
...285 & Service/Gas Station & All Other Larceny & 100 & 4.37\textbackslash{}\%\\
\hline
...286 & Service/Gas Station & All Other & 223 & 9.74\textbackslash{}\%\\
\hline
...287 & Service/Gas Station & Total & 2,287 & 100\textbackslash{}\%\\
\hline
...288 & Shelter - Mission/Homeless & Simple Assault & 85 & 50.30\textbackslash{}\%\\
\hline
...289 & Shelter - Mission/Homeless & Intimidation & 43 & 25.44\textbackslash{}\%\\
\hline
...290 & Shelter - Mission/Homeless & Aggravated Assault & 25 & 14.79\textbackslash{}\%\\
\hline
...291 & Shelter - Mission/Homeless & Destruction of Property/Vandalism & 11 & 6.51\textbackslash{}\%\\
\hline
...292 & Shelter - Mission/Homeless & Forcible Sodomy & 1 & 0.59\textbackslash{}\%\\
\hline
...293 & Shelter - Mission/Homeless & All Other & 4 & 2.36\textbackslash{}\%\\
\hline
...294 & Shelter - Mission/Homeless & Total & 169 & 100\textbackslash{}\%\\
\hline
...295 & Shopping Mall & Simple Assault & 77 & 28.73\textbackslash{}\%\\
\hline
...296 & Shopping Mall & Intimidation & 71 & 26.49\textbackslash{}\%\\
\hline
...297 & Shopping Mall & Destruction of Property/Vandalism & 59 & 22.01\textbackslash{}\%\\
\hline
...298 & Shopping Mall & Aggravated Assault & 31 & 11.57\textbackslash{}\%\\
\hline
...299 & Shopping Mall & Shoplifting & 13 & 4.85\textbackslash{}\%\\
\hline
...300 & Shopping Mall & All Other & 17 & 6.33\textbackslash{}\%\\
\hline
...301 & Shopping Mall & Total & 268 & 100\textbackslash{}\%\\
\hline
...302 & Specialty Store - Tv, Fur, Etc. & Intimidation & 1,074 & 38.43\textbackslash{}\%\\
\hline
...303 & Specialty Store - Tv, Fur, Etc. & Destruction of Property/Vandalism & 917 & 32.81\textbackslash{}\%\\
\hline
...304 & Specialty Store - Tv, Fur, Etc. & Simple Assault & 391 & 13.99\textbackslash{}\%\\
\hline
...305 & Specialty Store - Tv, Fur, Etc. & Aggravated Assault & 134 & 4.79\textbackslash{}\%\\
\hline
...306 & Specialty Store - Tv, Fur, Etc. & Burglary/Breaking And Entering & 53 & 1.90\textbackslash{}\%\\
\hline
...307 & Specialty Store - Tv, Fur, Etc. & All Other & 226 & 8.13\textbackslash{}\%\\
\hline
...308 & Specialty Store - Tv, Fur, Etc. & Total & 2,795 & 100\textbackslash{}\%\\
\hline
...309 & Tribal Lands & Aggravated Assault & 6 & 26.09\textbackslash{}\%\\
\hline
...310 & Tribal Lands & Simple Assault & 5 & 21.74\textbackslash{}\%\\
\hline
...311 & Tribal Lands & Intimidation & 5 & 21.74\textbackslash{}\%\\
\hline
...312 & Tribal Lands & Destruction of Property/Vandalism & 4 & 17.39\textbackslash{}\%\\
\hline
...313 & Tribal Lands & All Other Larceny & 1 & 4.35\textbackslash{}\%\\
\hline
...314 & Tribal Lands & All Other & 2 & 8.7\textbackslash{}\%\\
\hline
...315 & Tribal Lands & Total & 23 & 100\textbackslash{}\%\\
\hline
\end{longtable}




### Number and race of offenders

There are two variables that have information about the people who commit the hate crime: the number of offenders and the race of the offenders. The offender race is recorded as a single value with the race of the group if all are of the same race or it will say a "multi-racial" group if there are offenders of different races. Unfortunately, important information like the age of the offenders, their criminal history, their relationship to the victim, their gender, or whether they are arrested are completely unavailable in this dataset. These variables, however, are available in NIBRS data. 

As shown in Figure \@ref(fig:hateCrimeOffenderNumber), the most common racial group is "unknown" since the police do not know the race of the offenders. Next are White offenders at nearly 40% of hate crimes followed by Black offenders at nearly 13% of hate crimes. The remaining racial groups are rare with about 2% of hate crimes being committed by a multi-racial group of offenders and 0.8 % of hate crimes committed by Asian or Pacific Islander offenders and 0.6 % committed by American Indian or Native Alaskan offenders. Only 0.05% of offenders are Native Hawaiian or Other Pacific Islander.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimeOffenderRace-1} 

}

\caption{The race of offenders, as a group, for hate crime incidents, 1991-2022.}(\#fig:hateCrimeOffenderRace)
\end{figure}

When the police do not have any information about the number of offenders (which is common in cases of property crimes such as vandalism but rare in violent crimes), this data considers that to have zero offenders. The zero is just a placeholder that means that the police do not know how many offenders there are, not that they think there were actually no offenders. Figure \@ref(fig:hateCrimeOffenderNumber) shows the percent of hate crimes from 1991-2022 that have each number of offenders recorded. In the actual data it says the actual number of offenders, with the largest group in the current data going to 99 offenders - in this graph I group 10 or more offenders together for simplicity. I also relabel zero offenders as "Unknown" offenders since that is more accurate. The most common number of offenders per hate crime is one offender, at about 49% of hate crimes from 1991-2022 having only one offender. This drops sharply to 9% of hate crimes having two offenders and continues to drop as the number of offenders increase. However, about a third (36%) of hate crimes have an unknown number of offenders. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimeOffenderNumber-1} 

}

\caption{The race of offenders, as a group, for hate crime incidents, 1991-2022.}(\#fig:hateCrimeOffenderNumber)
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

\caption{The annual number of anti-Jewish hate crime incidents and victims in the United States, 1991-2022.}(\#fig:jewishIncidentVictim)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/blackIncidentVictim-1} 

}

\caption{The annual number of anti-Black hate crime incidents and victims in the United States, 1991-2022.}(\#fig:blackIncidentVictim)
\end{figure}

