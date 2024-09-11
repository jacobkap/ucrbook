# Hate Crime Data {#hate_crimes}





This dataset covers crimes that are reported to the police and judged by the police to be motivated by hate. More specifically, they are (1) crimes which were (2) motivated - at least in part - by bias towards a certain person or group of people because of characteristics about them such as race, sexual orientation, or religion. The first part is key, they must be crimes - and really must be the selection of crimes that the FBI collects for this dataset. Biased actions that don't meet the standard of a crime, or are of a crime category not included in this data, are not considered hate crimes. For example, if someone yells at a Black person and uses racial slurs against them, it is clearly a racist action. For it to be included in this data, however, it would have to extend to a threat since "intimidation" is a crime included in this data but lesser actions such as simply insulting someone is not included. For the second part, the bias motivation, it must be against a group that the FBI includes in this data. For example, when this data collection began in 1991 crimes against transgender people were not counted so if a transgender person was assaulted or killed because they were transgender, this is not a hate crime recorded in the data (though it would have counted in the "Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT)" bias motivation which was always reported).^[The first year where transgender as a group was a considered a bias motivation was in 2013.] 

In this example the offender shouted a racial slur, making it clear that their actions were motivated by bias. What about a hate crime where there is no explicit evidence of hate? Say, a White man robs a Black man and targets him because he is Black. The offender doesn't wear any insignia suggesting bias and never says a word to the victim. If the offender is never caught this robbery would not be considered a hate crime as there is no evidence that it is motivated by hate. Even if the offender is caught this would only be considered a hate crime if the police uncover evidence of bias, such as a confession or text messages between the offender and another person explaining why the victim was targeted. I think many - perhaps even most - hate crimes fall into this category. Where it was in fact a hate crime but there isn't sufficient evidence - both in terms of evidence the police can gather and even the victim's own perception - that it was a hate crime. 

So this data is really a narrower measure of hate crimes than it might seem. In practice it is (some) crimes motivated by (some) kinds of hate that are reported to the police. It is also the dataset with the fewest agencies reporting, with most agencies not reporting any hate crimes to the FBI in a given year. This may be true for most agencies as hate crimes are rare and many agencies are small with relatively few crimes of any type reported. However, there is evidence that some agencies that likely have hate crimes still do not report. This leads to gaps in the data with some states having zero agencies report crime, agencies reporting some bias motivations but not others, agencies reporting some years but not others. While these problems exist for all of the SRS datasets, it is more severe in this data. This problem is exacerbated by hate crimes being rare even in agencies that report them - with such rare events, even minor changes in which agencies report or whether victims report the crime to the police can drastically change the number of hate crimes in this data. 

## Agencies reporting

We'll start by looking at how many agencies report hate crime each year. This is a bit tricky since there can be multiple ways to examine how agencies report, and since agencies can truly have no hate crimes in a year so it's hard to differentiate the true zeroes from the non-reporters. 

Figure \@ref(fig:hateAgencies) shows the number of agencies that report at least one hate crime incident in that year. During the first year of data in 1991 there were about 750 agencies reporting and that grew steadily to about 2,000 agencies in year 2000. From there it increased a bit over the next decade before declining to below 1,750 in the early 2010s and rising again to around 3,000 agencies at the end of our data.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/hateAgencies-1} 

}

\caption{The annual number of police agencies that report at least one hate crime incident in that year.}(\#fig:hateAgencies)
\end{figure}

The 3,000 or so agencies that report each year are not the same every year. Figure \@ref(fig:hateCrimesEver) shows the cumulative number of agencies that have reported at least one hate crime between 1991 and 2022. There is a steady growth in the cumulative number of agencies, with about 350 new agencies each year. In each year some new agencies report hate crimes for the first time while some agencies that reported a hate crime in previous years don't report any hate crimes in the current year.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/hateCrimesEver-1} 

}

\caption{The cumulative number of agencies that have reported one or more hate crimes between 1991 and 2022}(\#fig:hateCrimesEver)
\end{figure}

Figure \@ref(fig:hateCrimesPreviousYear) puts this into hard numbers by showing the percent of agencies who reported a hate crime in a certain year who *also* reported a hate crime in the previous year. For most years between 50% and 60% of agencies which reported a hate crime in the year shown on the x-axis also reported a hate crime in the previous year, indicating somewhat high consistency in which agencies have hate crimes. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/hateCrimesPreviousYear-1} 

}

\caption{The percent of agencies that report a hate crime in a given year that also reported a hate crime in the previous year, 1992-2020}(\#fig:hateCrimesPreviousYear)
\end{figure}

Another way to understand reporting is to look at the number of reported hate crimes by state and see which states report and which don't. Figure \@ref(fig:hateCrimesMap) does this for 2022 data by showing the number of reported hate crime incidents by state. While every state reported at least one hate crime in 2022, there are large differences between states because even in states that have reporting agencies, not all agencies in that state report. In Florida, for example, only 3% of agencies reported having at least one hate crime. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/hateCrimesMap-1} 

}

\caption{Total reported hate crimes by state, 2022}(\#fig:hateCrimesMap)
\end{figure}

Since the number of state-wide hate crimes is partially influenced by population, we'll also look at it as the percent of agencies in the state that report at least one hate crime. Again this is limited by population as agencies in each state cover different populations - and most agencies are small so a few large agencies can account for a large share of crimes, including hate crimes. Still, this is a useful exercise as we can easily see where very few agencies report. Figure \@ref(fig:statePercentReporting) shows the percent of agencies for each state that reported at least one hate crime in 2022. In New Jersey, the state with the highest percent of agencies reporting, 35% of agencies reported at least one hate crime. In 22 states, fewer than 10% of agencies reported a hate crime, and in four states fewer than 5% of agencies did so. One interesting finding from this graph is the more liberal states - New Jersey, Washington, California, Connecticut, etc. - have the highest share of agencies reporting a hate crime, indicating that the culture of the state may influence either the propensity of hate crimes, whether victims report, or whether agencies report hate crimes.   

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/statePercentReporting-1} 

}

\caption{The percent of agencies in each state that reported at least one hate crime in 2022.}(\#fig:statePercentReporting)
\end{figure}

To examine how population affects our results, Figure \@ref(fig:statePercentReportingPop) shows the percent of each state's population that is covered by an agency that reported at least one hate crime. Results are similar to Figure \@ref(fig:statePercentReporting) but now show that there is more reporting than it appeared in that figure. That is because while not all agencies report a hate crime, the ones that don't report are generally smaller than the ones that do. So measuring by population we see that about half of the people in the country lives in the jurisdiction of an agency which reported at least one hate crime. The average state also covers about half of the population in a hate-crime-reporting agency. 

Is this good? We don't necessarily want 100% of agencies to report a hate crime since not all agencies will experience a hate crime in their jurisdiction. The idea dataset would have all hate crimes reported  but without knowing how many hates crimes there actually are we can't tell how well this data captures hate crimes.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/statePercentReportingPop-1} 

}

\caption{The percent of population in each state in agencies that reported at least one hate crime in 2022.}(\#fig:statePercentReportingPop)
\end{figure}

## Tree of Life synagogue shooting {#treeOfLife}

One way I like to check the quality of data is to see how it reports something that I know occurred. Here we'll look at how the anti-Semitic attack on a synagogue in Pittsburgh was reported. In October of 2018 the deadliest attack on Jewish people in US history occurred at the Tree of Life synagogue in Pittsburgh, PA. There, 11 congregants were murdered, and several other people, including police officers, were injured by the shooter. According to this data, however, those murders never occurred. Not in Pittsburgh at least. No murders with an anti-Jewish bias were reported in Pittsburgh were reported in 2018. Instead, the shooting was reported by the FBI's Pittsburgh field office, which, like many federal agencies that have offices across the country, is included in the data as its own agency.

This is good and bad. Of course it is good that when a crime happens it is reported in the data. The bad part is that it is counted as hate crimes that occurred in the FBI's Pittsburgh agency, and not the Pittsburgh Police Department. Most research occurs at the local level - usually studying an agency or county. So if a study is examining agency-level characteristics that are related to hate crimes it'd almost certainly exclude these murders as they are reported by a federal agency and not the local Pittsburgh agency. 

This also gets complicated as FBI rules say that a crime should be reported by the most local jurisdiction. This is true even when there is overlapping jurisdiction. 11 people were murdered in Pittsburgh, and several Pittsburgh Police officers were injured. That should mean that the crime is reported by Pittsburgh Police, not by the FBI. Pittsburgh does report these murders in their Offenses Known data, making it even more odd that they're Pittsburgh crimes in one dataset and not another.^[The murders of nine Black parishioners in the Emanuel African Methodist Episcopal Church in Charleston, South Carolina, in 2015 was reported by the Charleston Police Department, making it even more inconsistent for when the FBI reports hate crime murders.] 

## Important variables

This data has the standard set of variables describing the agency that is reporting. This includes the agency ORI - which is the unique ID for that agency - the agency name, their state, and the population under their jurisdiction.

They also have a variable with the exact date that the hate crime occurred on - though not the date it was reported on. Figure \@ref(fig:hateCrimesByDay) shows the percent of hates crimes between 1991 and 2022 that occurred on each day of the week. Interestingly, the most common days for a hate crime to occur is on Friday, which is also when non-hate crimes most frequently occur. This suggests that hate crimes do follow the same trends - at least partially - as other crimes.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/hateCrimesByDay-1} 

}

\caption{The day of the week that hate crimes occurred on, 1991-2022}(\#fig:hateCrimesByDay)
\end{figure}

We can also look at which day of the month is most common, as shown in Figure \@ref(fig:hateCrimesByMonthDay). There's no pattern that I can see other than the the 1st of the most has the most hate crimes and the end of the month has the fewest. Not all months have more than 28 days so it makes sense that the 29th, 30th, and 31st are the least common day. Is the 1st of the month really the most dangerous? I think this is likely just a quirk of the data, and is something we also see in NIBRS data. When an agency doesn't report an actual date they may use the 1st of the month as a placeholder which then looks to us like the 1st is an especially prolific day for hate crimes. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/hateCrimesByMonthDay-1} 

}

\caption{The day of the month that hate crimes occurred on, 1991-2022}(\#fig:hateCrimesByMonthDay)
\end{figure}


Each hate crime incident can cover up to 10 different crimes occurring - e.g. a person who burglarizes a synagogue and spray paints a swastika on the wall would have both burglary and vandalism reported in this data. With each crime, this data has the bias motivation for that crime, the location of the crime (in broad categories, not the actual location in the city like a street address would have), and the number of victims for that offense. In practice, in most hate crimes with multiple offenses recorded, the bias motivation, location, and victim count is the same for each offense.

Figure \@ref(fig:crimesPerHateCrime) shows the number of crimes per incident for each hate crime reported between 1991 and 2022. In 96.6% of cases, there is only one offense in that incident.^[In 0.0004% of hate crimes there is no recorded offense. This is not shown in the graph.] This drops sharply to 3.2% of incidents having two offenses, 0.21% having three offenses, 0.019% having four offenses, and 0.002% having five offenses. Even though this data does allow up to 10 offenses per hate crime incident, there has never been a recorded case with more than five offenses. Results are nearly identical when examining the number of bias motivations and locations reported in an incident. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/crimesPerHateCrime-1} 

}

\caption{The number of offenses per hate crime incident.}(\#fig:crimesPerHateCrime)
\end{figure}

### The bias motivation (who the hate is against)

The most important variable in this data is the "bias motivation" which is the FBI's term for the cause of the hate. A hate crime targeted against Black people would be an "anti-Black" bias motivation. For the police to classify an incident as a hate crime, and to assign a particular bias motivation, the police must have *some* evidence that the crime was motivated by hate. The victim saying that the crime is a hate crime alone is not sufficient - though if large portions of the victim's community believe that the crime is a hate crime, this is a factor in the police's assessment. The evidence required is not major. It includes things as explicit as racial slurs said during an incident and less obvious factors like the crime occurring on an important holiday for that community (e.g. Martin Luther King Day, religious holidays). The FBI also encourages police to consider the totality of the evidence even if none alone strongly suggests that the crime was a hate crime in making their determination about whether the incident was a hate crime or not. This also means that many (perhaps most) hate crimes will not be recorded as hate crimes since there is no evidence that the crime is motivated by hate. 

Consider, for example, a person who is biased against Asian people and decides to rob them because they are Asian. This is clearly a hate crime. And say this persons robs 10 Asian people in 10 different incidents, causing 10 hate crimes. All of the victims report it to the police but only two of them tell the police that they think it was a hate crime; the other eight do not think it is a hate crime. Without additional information the police would likely not report any of these robberies as hate crimes. And if all ten of the victims happened to be surveyed about crime victimization, such as through the Bureau of Justice Statistics' National Crime Victimization Survey, only two of the 10 victims would report being the victim of a hate crime. Using FBI data the anti-Asian hate crimes would be zero; using victimization surveys would undercount anti-Asian hate crimes enormously. This is the main problem with using hate crime data, even with perfect reporting or surveys of everyone possibly victimized we may still be getting data that is completely incorrect.

In the FBI data Bias motivation is based on the offender's perceptions of the victim so even if they are incorrect in who their victim is, if they intended to target someone for their perceived group membership, that is still a hate crime. For example, if a person assaults a man because they think he is gay, that is a hate crime because the assault was motivated by hate towards gay people. Whether the victim is actually gay or not is not relevant - the offender perceived him to be gay so it is an anti-gay hate crime. To make this even more complicated, the offender must have committed the crime because they are motivated, at least to some degree, by their bias against the victim. Being biased against the victim but targeting them for some other reason means that the crime is not a hate crime. 

The biases that the FBI includes in this data has grown over time, with new bias motivations being added in 1997, 2012, 2013, and 2015. Table \@ref(tab:hateBiasMotivation) shows each bias motivation in this data, the year it was first reported, how many hate crimes there were for this bias motivation from 1991-2022 and what percent of hate crimes that bias motivation makes up. For ease of seeing the most common biases, the table is sorted by frequency of incidents. The year is the first year with that bias motivation - as hate crimes for certain groups are very rare, the bias motivation could have technically been available in previous years. The last column in this table shows the percent of hate crime incidents from 1991-2022, though this is a very rough measure since some groups are so small that even accounting for a small percent of total hate crimes can mean that are massively disproportionately targeted. 


\begin{longtable}[t]{l|r|r|l}
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



2015 is the year with the most bias additions, as of data through 2022. This year added a number of religions such as Anti-Buddhist, Anti-Sikh, and Anti-Jehovah's Witness. In 2013, anti-Transgender was added and this is the most common of the bias motivations added since data began in 1991 with 1500 hate crimes between 2013-2022 - 0.63% of all hate crime incidents from 1991-2022. That year also added anti-male and Anti-Native Hawaiian or Other Pacific Islander, which is the most recent racial group added. In 2012, anti-gender non-conforming and anti-female were included, while in 1997 both anti-mental and anti-physical disability were added. In part due to having fewer years of data available, these newer bias motivations make up a small percent of total hate crimes. 

The original hate crimes - that is, those in the data in 1991 when this dataset was released - are far more common. The most common bias motivation is anti-Black at 34% of hate crimes, anti-Jewish at 12%, anti-White at 11%, anti-male homosexual (gay) at 10%, anti-Hispanic at 6%, and anti-ethnicity other than Hispanic (this group means a crime against an ethnic group that isn't Hispanic, though it is occasionally reported as anti-non-Hispanic which is incorrect.) at 5%. All other bias motivations are less than 5% of hate crimes and consist of a variety of ethnic, racial, religious, or sexual orientation. Some hate crimes can potentially fall in multiple categories. For example, there is a bias motivation of "anti-male homosexual (gay)" and of "anti-lesbian, gay, bisexual, or transgender, mixed group (LGBT)" so there is some overlap between them.

### The crime that occurred

The "crime" part of hate crimes is which criminal offense occurred during the incident. A hateful act where the action is not one of the crimes that the FBI records would not be considered a hate crime. This is likely most common when considering something like a person calling someone by a hateful slur (e.g. "You're a [slur]," "go back to your own country", etc.) but where the action is not technically a crime. Another layer of difficulty in using this data is that not all crimes that the FBI includes were initially included when data become available in 1991. Every several years the FBI adds new crimes to be included in this data. Table \@ref(tab:hateOffense) shows each crime in the data, the first year that this crime was reported, the total number of these crimes reported between 1991 and 2022, and the percent of all incidents this crime makes up.^[This tables uses only the first offense in an incident so counts are slightly lower than if all crimes in every incident is used.] 

Nearly all hate crimes are vandalism/destruction of property (30%), intimidation (30%), and simple assault (20%) or aggravated assault (11%) with no remaining crime making up more than 2% of total hate crimes. 


\begin{longtable}[t]{l|r|r|l}
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

### The location of the crime

This data is interesting because it includes the location - in categories for types of places, not actual location in the city - of the incident. This is important since the type of location can be a factor in whether the incident is classified as a hate crime. For example, spray paint on a synagogue or a mosque is much more likely to be a hate crime than spray paint on a wall of an abandoned building. Table \@ref(tab:hateLocations) shows the locations of hate crimes = including the first year that location was report. Each hate crime incident can have multiple locations since each offense can have its own incident, but in most cases (96.6%) a hate crime only has a single location. 

As with the crime and the bias motivation, the available locations have increased as time went on, though these newer locations are relatively uncommon. One important change in location is that starting in 2010 the location of school/college was split to have one location be for elementary and high schools and another location be for colleges and universities. The majority of hate crimes occur in the victim's home (30%), on a road or alley (19%), in an other or unknown location (13%), and in a parking lot or parking garage (6%). All other locations occur in fewer than 5% of hate crimes. 


\begin{longtable}[t]{l|r|r|l}
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



### Number and race of offenders

There are two variables that have information about the people who commit the hate crime: the number of offenders and the race of the offenders. The offender race is recorded as a single value with the race of the group if all are of the same race or it will say a "multi-racial" group. Unfortunately, important information like the age of the offenders, their criminal history, their relationship to the victim, their gender, or whether they are arrested are completely unavailable in this dataset. These variables, however, are available in NIBRS data. 

When the police do not have any information about the number of offenders (which is common in cases of property crimes such as vandalism but rare in violent crimes), this data considers that to have zero offenders. The zero is just a placeholder that means that the police don't know how many offenders there are, not that they think there were actually no offenders. Figure \@ref(fig:hateCrimeOffenderNumber) shows the percent of hate crimes from 1991-2022 that have each number of offenders recorded. In the actual data it says the actual number of offenders, with the largest group in the current data going to 99 offenders - in this graph I group 10 or more offenders together for simplicity. I also relabel zero offenders as "Unknown" offenders since that's more accurate. The most common number of offenders per hate crime is one offender, at about 49% of hate crimes from 1991-2022 having only one offender. This drops sharply to 9% of hate crimes having two offenders and continues to drop as the number of offenders increase. However, about a third (36%) of hate crimes have an unknown number of offenders. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/hateCrimeOffenderNumber-1} 

}

\caption{The race of offenders, as a group, for hate crime incidents, 1991-2022.}(\#fig:hateCrimeOffenderNumber)
\end{figure}

The data also includes the race of the offenders as a group, though not the ethnicity (Hispanic or non-Hispanic) of the offenders. In cases where there are multiple races among offenders, that will be classified as a "multi-racial group". As shown in Figure \@ref(fig:hateCrimeOffenderNumber) The most common racial group is "unknown" since the police do not know the race of the offenders. Then are White offenders at nearly 40% of hate crimes followed by Black offenders at nearly 13% of hate crimes. The remaining racial groups are rare with about 2% of hate crimes being committed by a multi-racial group of offenders and 0.8 % of hate crimes committed by Asian or Pacific Islander offenders and 0.6 % committed by American Indian or Native Alaskan offenders. Only 0.05% of offenders are Native Hawaiian or Other Pacific Islander.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/hateCrimeOffenderRace-1} 

}

\caption{The race of offenders, as a group, for hate crime incidents, 1991-2022.}(\#fig:hateCrimeOffenderRace)
\end{figure}

### Number of victims 

When considering the data itself, hate crime data is very similar to most other datasets. It's just the number of crimes that were reported to the police, though with the additional step of having evidence of bias. But the difference in use is that while in other crimes the victim is usually, well, the victim, in hate crimes the victim may be a much wider group. Let's say a person's home is burglarized. The resident is clearly the victim as it was their house targeted. Their neighbors may also feel some effect if they are now concerned about their own home. And the victim's family will likely be concern. But the victim group is very limited and is directly related to the crime. Hate crimes tend to affect everyone in the targeted group, or at least a much wider span of people than something like burglary. If a swastika, for example, is spray painted on the front door of a synagogue who is the victim? Directly it'd be whomever owns the synagogue building. But it also affects all members of that congregation. And what about members of other synagogues in the city? What about Jewish people in the city who don't go to synagogue? Even though only a single crime occurred - a vandalism - it is very difficult to count how many victims there were. Is a swastika on a synagogue worse if the synagogue has a small congregation versus a large one? What if it is in a city with only one synagogue compared to a city with many? Is it worse to have a large swastika than a small one? 

If we're trying to use this data to measure hate against a particular group these are questions we need to answer, but are of course impossible to answer with this data. Remember, all of the FBI data is essentially just abstract contextless numbers in a spreadsheet. This is true for all UCR data but especially so for hate crimes where no two hate crimes are equal. One burglary in City A is about equivalent to one burglary in City B. For hate crimes a single incident may affect far more people in City A than in City B. 

In fact, I'd argue that this issue is bad enough that we should be extraordinarily cautious when using this data. Just aggregating up the number of incidents is insufficient to measuring either hate or fear. Sure, you can measure the number of hate crimes reported to the police and where the police found adequate evidence to label the crime as bias motivated. But is that really what you want be measuring when using hate crime data? 

Nonetheless, this is a book about the data. So let's look at one final variable in this data, the number of victims for each incident. This is not going to be true number of people affected by the crime. It's more the number of direct victims for the incident. Whether that is actually better than just counting incidents is dependent on the context of your question and the hate crimes in question. In Figure \@ref(fig:jewishIncidentVictim) I show the annual number of anti-Jewish hate crimes reported by all agencies in the country. As may be expected there are always more victims than incidents though the trends are extremely similar over the entire period of data. This trend is also present for other bias motivations, such as anti-Black hate crimes shown in Figure \@ref(fig:blackIncidentVictim). 

While this variable is available in the data, I actually think it's best not to use it. I think there is always a danger in being overly precise and, therefore, overly confident about what the data shows. When you use the number of incidents you implicitly allow for each incident to affect multiple people^[One of the points of hate crimes is to cause fear in more than just the direct victim of the crime.] and readers understand that. But if you use this variable and say that "this is the number of victims of this crime" you are implicitly closing that door and therefore being too confident about how many victims of a crime there is. This is especially true for readers who aren't paying close attention - such as academics reviewing papers - since they may think you are measuring the number of victims in a better way than you actually are. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/jewishIncidentVictim-1} 

}

\caption{The annual number of anti-Jewish hate crime incidents and victims in the United States, 1991-2022.}(\#fig:jewishIncidentVictim)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{09_hate_crime_files/figure-latex/blackIncidentVictim-1} 

}

\caption{The annual number of anti-Black hate crime incidents and victims in the United States, 1991-2022.}(\#fig:blackIncidentVictim)
\end{figure}

