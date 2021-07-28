# Hate Crime Data {#hate_crimes}






This dataset covers crimes that are reported to the police and judged by the police to be motivated by hate. More specifically, they are, first, crimes which were, second, motivated - at least in part - by bias towards a certain person or group of people because of characteristics about them such as race, sexual orientation, or religion. The first part is key, they must be crimes - and really must be the selection of crimes that the FBI collects for this dataset. Biased actions that don't meet the standard of a crime, or are of a crime not included in this data, are not considered hate crimes. For example, if someone yells at a Black person and uses racial slurs against them, it is clearly a racist action. For it to be included in this data, however, it would have to extend to a threat since "intimidation" is a crime included in this data but lesser actions such as simply insulting someone is not included. For the second part, the bias motivation, it must be against a group that the FBI includes in this data. For example, when this data collection began crimes against transgender people were not counted so if a transgender person was assaulted or killed because they were transgender, this is not a hate crime recorded in the data (though it would have counted in the "Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT)" bias motivation which was always reported).^[The first year where transgender as a group was a considered a bias motivation was in 2013.] 

So this data is really a narrower measure of hate crimes than it might seem. In practice it is (some) crimes motivated by (some) kinds of hate that are reported to the police. It is also the most under-reported UCR dataset with most agencies not reporting any hate crimes to the FBI. This leads to huge gaps in the data with some states having zero agencies report crime, agencies reporting some bias motivations but not others, agencies reporting some years but not others. While these problems exist for all of the UCR datasets, it is most severe in this data. This problem is exacerbated by hate crimes being rare even in agencies that report them - with such rare events, even minor changes in which agencies report or which types of offenses they include can have large effects. 

My main takeaway for this data is that it is inappropriate to use for most hate crime research. At most it can be used to look at within-city within-bias-motivation trends, while keeping in mind that even this narrow subset of data is limited by under-reporting by victims and potential changes in police practices of reporting such as how many months of data they report per year. 

## Agencies reporting

We'll start by looking at how many agencies report hate crime each year. This is a bit tricky since there can be multiple ways to examine how agencies report, and since agencies can truly have no hate crimes in a year so it's hard to differentiate the true zeroes from the non-reporters. Figure \@ref(fig:hateAgencies) shows the number of agencies that report at least one hate crime incident in that year. From the start in 1991 there were about 750 agencies reporting and that grew steadily to about 2,000 agencies in year 2000. From there it increased a bit over the next decade before declining to below 1,750 in the early 2010s and rising again to around 2,000 agencies at the end of our data.

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/hateAgencies-1.svg" alt="The annual number of police agencies that report at least one hate crime incident in that year." width="90%" />
<p class="caption">(\#fig:hateAgencies)The annual number of police agencies that report at least one hate crime incident in that year.</p>
</div>

The 2,000 or so agencies that report each year are not the same every year. Figure \@ref(fig:hateCrimesEver) shows the cumulative number of agencies that have reported at least one hate crime between 1991 and 2018. There is a steady growth in the cumulative number of agencies, with about 350 new agencies each year. This means that each year some new agencies report hate crimes while some agencies that reported a hate crime in the previous year don't report any hate crimes in the current year.

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/hateCrimesEver-1.svg" alt="The cumulative number of agencies that have reported one or more hate crimes between 1991 to 2018." width="90%" />
<p class="caption">(\#fig:hateCrimesEver)The cumulative number of agencies that have reported one or more hate crimes between 1991 to 2018.</p>
</div>

Figure \@ref(fig:hateCrimesPreviousYear) puts this into hard numbers by showing the percent of agencies who reported a hate crime in a certain year who *also* reported a hate crime in the previous year. For most years between 50% and 60% of agencies which reported a hate crime in the year shown on the x-axis also reported a hate crime in the previous year, indicating somewhat high consistency in which agencies have hate crimes. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/hateCrimesPreviousYear-1.svg" alt="The percent of agencies that report a hate crime in a given year that also reported a hate crime in the previous year, 1992-2018." width="90%" />
<p class="caption">(\#fig:hateCrimesPreviousYear)The percent of agencies that report a hate crime in a given year that also reported a hate crime in the previous year, 1992-2018.</p>
</div>

Another way to understand reporting is to look at the number of reported hate crimes by state and see which states report and which don't. Figure \@ref(fig:hateCrimesMap) does this for 2018 data by showing the number of reported hate crime incidents by state. While every state other than Wyoming reporting at least one hate crime in 2018, there are large differences between states because even in states that have reporting agencies, not all agencies in that state report. For example, Alabama reported only two hate crimes in 2018, the least of any state other than Wyoming. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/hateCrimesMap-1.svg" alt="Total reported hate crimes by state, 2018." width="90%" />
<p class="caption">(\#fig:hateCrimesMap)Total reported hate crimes by state, 2018.</p>
</div>

Since the number of state-wide hate crimes is partially influenced by population, we'll also look at it as the percent of agencies in the state that report at least one hate crime. Again this is limited by population as agencies in each state cover different populations - and most agencies are small so a few large agencies can account for a large share of crimes, including hate crimes. Still, this is a useful exercise as we can easily see where very few agencies report. Figure \@ref(fig:statePercentReporting) shows the percent of agencies for each state that reported at least one hate crime in 2018. In Connecticut, the state with the highest percent of agencies reporting, 28% of agencies reported at least one hate crime. In 34 states, fewer than 10% of agencies reported a hate crime, and in 19 states fewer than 5% of agencies did so. One interesting finding from this graph is the more liberal states - Connecticut, New Jersey, Vermont, California, Washington - have the highest share of agencies reporting a hate crime, indicating that the culture of the state may influence either the propensity of hate crimes, whether victims report, or whether agencies report hate crimes.   

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/statePercentReporting-1.svg" alt="The percent of agencies in each state that reported at least one hate crime in 2018." width="90%" />
<p class="caption">(\#fig:statePercentReporting)The percent of agencies in each state that reported at least one hate crime in 2018.</p>
</div>

## Important variables

This data has the standard set of variables describing the agency that is reporting. This includes the agency ORI - which is the unique ID for that agency - the agency name, their state, and the population under their jurisdiction.

They also have a variable with the exact date that the hate crime occurred on - though not the date it was reported on. Figure \@ref(fig:hateCrimesByDay) shows the percent of hates crimes between 1991 and 2018 that occurred on each day of the week. Interestingly, the most common days for a hate crime to occur is on Friday and Saturday, which is also when non-hate crimes most frequently occur. This suggests that hate crimes do follow the same trends - at least partially - as other crimes.

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/hateCrimesByDay-1.svg" alt="The day of the week that hate crimes occurred on, 1991-2018." width="90%" />
<p class="caption">(\#fig:hateCrimesByDay)The day of the week that hate crimes occurred on, 1991-2018.</p>
</div>

Each hate crime incident can cover up to 10 different crimes occurring - e.g. a person who burglarizes a synagogue and spray paints a swastika on the wall would have both vandalism and burglary reported in this data. With each crime, this data has the bias motivation for that crime, the location of the crime (in broad categories, not the actual location in the city like a street address would have), and the number of victims for that offense. In practice, in most hate crimes with multiple offenses recorded, the bias motivation, location, and victim count is the same for each offense.

Figure \@ref(fig:crimesPerHateCrime) shows the number of crimes per incident for each hate crime reported between 1991 and 2018. In 96.6% of cases, there is only one offense in that incident.^[In 0.0005% of hate crimes there is no recorded offense. This is not shown in the graph.] This drops sharply to 3.2% of incidents having two offenses, 0.21% having three offenses, 0.016% having four offenses, and 0.002% having five offenses. Even though this data does allow up to 10 offenses per hate crime incident, there has never been a recorded case with more than five offenses. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/crimesPerHateCrime-1.svg" alt="The number of offenses per hate crime incident." width="90%" />
<p class="caption">(\#fig:crimesPerHateCrime)The number of offenses per hate crime incident.</p>
</div>

### The bias motivation (who the hate is against)

The most important variable in this data is the "bias motivation" which is the FBI's term for the cause of the hate. A hate crime targeted against Black people would be an "anti-Black" bias motivation. For the police to classify an incident as a hate crime, and to assign a particular bias motivation, the police must have *some* evidence that the crime was motivated by hate. The victim saying that the crime is a hate crime alone is not sufficient - though if large portions of the victim's community believe that the crime is a hate crime, this is a factor in the police's assessment. The evidence required is not major, it includes things as explicit as racial slurs said during an incident and less obvious factors like the victim is celebrating their community (e.g. attending a holiday event) or the crime occurring on an important holiday for that community (e.g. Martin Luther King Day, religious holidays). The FBI also encourages police to consider the totality of the evidence even if none alone strongly suggests that the crime was a hate crime in making their determination about whether the incident was a hate crime or not.

This also means that many (likely most) hate crimes will not be recorded as hate crimes since there is no evidence that the crime is motivated by hate. For example, if a man committed a crime against Asian people for crimes because they are Asian, that would in reality be a hate crime. However, if the offender does not say anything anti-Asian to the victim, which is the mostly likely thing to indicate that this is a hate crime, the crime would not likely be recorded as a hate crime. For example, at the time of this writing (Spring, 2021), there are numerous media reports discussing an increase in anti-Asian hate crimes as a result of racism relating to the pandemic.^[This dataset for 2020 won't be released until Fall 2021 so this data is not useful for measuring urgent policies about current events.] This data would likely undercount both anti-Asian behavior and anti-Asian hate crimes. First, if someone walked to an Asian person and called them an anti-Asian slur, that is clearly a hateful act and would be classified as a hate crime under some organization's collections methods. However, as hateful as this incident is, *this alone* would not be classified as a hate crime in this dataset as a slur is not a crime. If accompanied by other criminal behavior, or if it continues to the point where it can be considered intimidation, it would then be classified as a hate crime. Second, crimes against Asian victims that are in fact hate crimes, but have no evidence that they are hate crimes would not be classified as hate crimes in this data. 

Bias motivation is based on the offender's perceptions of the victim so even if they are incorrect in who their victim is, if they intended to target someone for their perceived group membership, that is still a hate crime. For example, if a person assaults a man because they think he is gay, that is a hate crime because the assault was motivated by hate towards gay people. Whether the victim is actually gay or not is not relevant - the offender perceived him to be gay so it is an anti-gay  hate crime. To make this even more complicated, the offender must have committed the crime because they are motivated, at least to some degree, by their bias against the victim. Being biased against the victim but targeting them for some other reason means that the crime is not a hate crime. 

The biases that the FBI includes in this data has grown over time, with new bias motivations being added in 1997, 2012, 2013, and 2015. Table \@ref(tab:hateBiasMotivation) shows each bias motivation in this data, the year it was first reported, how many hate crimes there were for this bias motivation from 1991-2018 and what percent of hate crimes that bias motivation makes up. For ease of seeing how bias motivations changed over time, the table is sorted by year and by frequency of incident within that year. If you're viewing this on a computer or phone, you can sort the table yourself. The year is the first year with that bias motivation - as hate crimes for certain groups are very rare, the bias motivation could have technically been available in previous years. The last column in this table shows the percent of hate crimes from 1991-2018, though this is a very rough measure since some groups are so small that even accounting for a small percent of total hate crimes can mean that are massively disproportionately targeted. 


Table: (\#tab:hateBiasMotivation)The bias motivation for hate crime incidents. In incidents with multiple bias motivation, this shows only the first bias motivation recorded.

|Bias Motivation                                                 | First Year Reported| \# of Incidents|\% of Incidents |
|:---------------------------------------------------------------|-------------------:|---------------:|:---------------|
|Anti-Eastern Orthodox (Greek, Russian, Etc.)                    |                2015|             131|0.07\%          |
|Anti-Other Christian                                            |                2015|             130|0.07\%          |
|Anti-Sikh                                                       |                2015|              80|0.04\%          |
|Anti-Hindu                                                      |                2015|              40|0.02\%          |
|Anti-Mormon                                                     |                2015|              38|0.02\%          |
|Anti-Jehovahs Witness                                           |                2015|              20|0.01\%          |
|Anti-Buddhist                                                   |                2015|              19|0.01\%          |
|Anti-Transgender                                                |                2013|             513|0.26\%          |
|Anti-Male                                                       |                2013|              77|0.04\%          |
|Anti-Native Hawaiian Or Other Pacific Islander                  |                2013|              49|0.02\%          |
|Anti-Gender Non-Conforming                                      |                2012|             152|0.08\%          |
|Anti-Female                                                     |                2012|             142|0.07\%          |
|Anti-Mental Disability                                          |                1997|             944|0.47\%          |
|Anti-Physical Disability                                        |                1997|             503|0.25\%          |
|Anti-Black                                                      |                1991|          68,588|34.35\%         |
|Anti-Jewish                                                     |                1991|          25,943|12.99\%         |
|Anti-White                                                      |                1991|          23,366|11.70\%         |
|Anti-Male Homosexual (Gay)                                      |                1991|          20,188|10.11\%         |
|Anti-Hispanic                                                   |                1991|          12,725|6.37\%          |
|Anti-Ethnicity Other Than Hispanic                              |                1991|          10,016|5.02\%          |
|Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT) |                1991|           5,990|3.00\%          |
|Anti-Asian                                                      |                1991|           5,891|2.95\%          |
|Anti-Multi-Racial Group                                         |                1991|           4,811|2.41\%          |
|Anti-Female Homosexual (Lesbian)                                |                1991|           4,221|2.11\%          |
|Anti-Muslim                                                     |                1991|           3,561|1.78\%          |
|Anti-Other Religion                                             |                1991|           3,269|1.64\%          |
|Anti-American Indian Or Native Alaskan                          |                1991|           2,195|1.10\%          |
|Anti-Catholic                                                   |                1991|           1,458|0.73\%          |
|Anti-Protestant                                                 |                1991|           1,196|0.60\%          |
|Anti-Multi-Religious Group                                      |                1991|           1,118|0.56\%          |
|Anti-Arab                                                       |                1991|           1,091|0.55\%          |
|Anti-Heterosexual                                               |                1991|             542|0.27\%          |
|Anti-Bisexual                                                   |                1991|             527|0.26\%          |
|Anti-Atheism/Agnosticism                                        |                1991|             149|0.07\%          |
|Total                                                           |                  NA|         199,683|100\%           |

2015 is the most year of new bias motivations, as of data through 2018. This year added a number of religions such as Anti-Buddhist, Anti-Sikh, and Anti-Jehovah's Witness. In 2013, anti-Transgender was added and this is the most common of the bias motivations added since data began in 1991 with 513 hate crimes between 2013-2018 - 0.26% of all hate crimes from 1991-2018. That year also added anti-male and Anti-Native Hawaiian or Other Pacific Islander, which is the most recent racial group added.  In 2012, anti-gender non-conforming and anti-female were included, while in 1997 both anti-mental and anti-physical disability were added. In part due to having fewer years of data available, these newer bias motivations make up a small percent of total hate crimes, accounting for ~1.4%. 

The original hate crimes - that is, those in the data in 1991 when this dataset was released - are far more common. The most common bias motivation is anti-Black at 34% of hate crimes, anti-Jewish at 13%, anti-White at 12%, anti-male homosexual (gay) at 10%, anti-Hispanic at 6%, and anti-ethnicity other than Hispanic (this group means a crime against an ethnic group that isn't Hispanic, though it is occasionally reported as anti-non-Hispanic which is incorrect.) at 5%. All other bias motivations are less than 5% of hate crimes and consist of a variety of ethnic, racial, religious, or sexual orientation. Some hate crimes can potentially fall in multiple categories. For example, there is a bias motivation of "anti-male homosexual (gay)" and of "anti-lesbian, gay, bisexual, or transgender, mixed group (LGBT)" so there is some overlap between them.

### The crime that occurred

The "crime" part of hate crimes is which criminal offense occurred during the incident. A hateful act where the action is not one of the crimes that the FBI records would not be considered a hate crime. This is likely most common when considering something like a person calling someone by a hateful slur (e.g. "You're a [slur]", "go back to your own country") but where the action is not technically a crime. Another layer of difficulty in using this data is that not all crimes that the FBI includes were initially included when data become available in 1991. Every several years the FBI adds new crimes to be included in this data. Table \@ref(tab:hateOffense) shows each crime in the data, the first year that this crime was reported, the total number of these crimes reported between 1991 and 2018, and the percent of all incidents this crime makes up.^[This tables uses only the first offense in an incident so counts are slightly lower than if all crimes in every incident is used.] This table is sorted with the most recent years first, and within year by how common the crime was.

Nearly all hate crimes are vandalism/destruction of property (31%), intimidation (30%), and simple assault (20%) or aggravated assault (11%) with no remaining crime making up more than 2% of total hate crimes. 


Table: (\#tab:hateOffense)The offense type for hate crime incidents. In incidents with multiple offense types, this shows only the first offense type recorded.

|Offense                                             | First Year Reported| \# of Incidents|\% of Incidents |
|:---------------------------------------------------|-------------------:|---------------:|:---------------|
|Human Trafficking - Commercial Sex Acts             |                2017|               1|0.00\%          |
|Fraud-Other                                         |                2016|              17|0.01\%          |
|Bribery                                             |                2014|               2|0.00\%          |
|Assisting Or Promoting Prostitution                 |                2013|               4|0.00\%          |
|Purchasing Prostitution                             |                2013|               2|0.00\%          |
|Wire Fraud                                          |                2006|              18|0.01\%          |
|Impersonation                                       |                2001|             108|0.05\%          |
|Prostitution                                        |                2001|              12|0.01\%          |
|Statutory Rape                                      |                1999|              12|0.01\%          |
|Theft From Coin-Operated Machine Or Device          |                1999|              11|0.01\%          |
|Negligent Manslaughter                              |                1999|               3|0.00\%          |
|False Pretenses/Swindle/Confidence Game             |                1997|             230|0.12\%          |
|Extortion/Blackmail                                 |                1997|              41|0.02\%          |
|Incest                                              |                1997|               7|0.00\%          |
|Stolen Property Offenses - Receiving, Selling, Etc. |                1996|              94|0.05\%          |
|Sexual Assault With An Object                       |                1996|              23|0.01\%          |
|Pocket-Picking                                      |                1996|              19|0.01\%          |
|Welfare Fraud                                       |                1996|               2|0.00\%          |
|Drug Equipment Violations                           |                1995|             204|0.10\%          |
|Credit Card/Atm Fraud                               |                1995|             125|0.06\%          |
|Embezzlement                                        |                1995|              56|0.03\%          |
|Forcible Sodomy                                     |                1995|              52|0.03\%          |
|Pornography/Obscene Material                        |                1995|              34|0.02\%          |
|Purse-Snatching                                     |                1995|              23|0.01\%          |
|Theft From Building                                 |                1994|             478|0.24\%          |
|Kidnapping/Abduction                                |                1994|              99|0.05\%          |
|All Other Larceny                                   |                1993|           1,670|0.84\%          |
|Drug/Narcotic Violations                            |                1993|             862|0.43\%          |
|Theft From Motor Vehicle                            |                1993|             642|0.32\%          |
|Shoplifting                                         |                1993|             521|0.26\%          |
|Weapon Law Violations                               |                1993|             289|0.14\%          |
|Theft of Motor Vehicle Parts/Accessories            |                1993|             174|0.09\%          |
|Counterfeiting/Forgery                              |                1993|             165|0.08\%          |
|Forcible Fondling - Indecent Liberties/Child Molest |                1993|             142|0.07\%          |
|Motor Vehicle Theft                                 |                1992|             401|0.20\%          |
|Destruction of Property/Vandalism                   |                1991|          62,502|31.30\%         |
|Intimidation                                        |                1991|          59,750|29.92\%         |
|Simple Assault                                      |                1991|          39,035|19.55\%         |
|Aggravated Assault                                  |                1991|          22,213|11.12\%         |
|Robbery                                             |                1991|           3,748|1.88\%          |
|Burglary/Breaking And Entering                      |                1991|           3,363|1.68\%          |
|Arson                                               |                1991|           1,224|0.61\%          |
|Theft-Other                                         |                1991|             796|0.40\%          |
|Murder/Non-Negligent Manslaughter                   |                1991|             265|0.13\%          |
|Forcible Rape                                       |                1991|             242|0.12\%          |
|Total                                               |                  NA|         199,681|100\%           |

Agencies that report to the FBI's National Incident-Based Reporting System (NIBRS) can also report bias motivations for their crimes, and these reports are included in this dataset. One tricky thing is that the crimes included are different depending on if the agency reported through NIBRS or to the dataset directly, and are not NIBRS reporting agencies. The above table shows all crimes included, but agencies who report directly can only submit a subset of crimes. For these agencies the only possible crimes are the ones that are included Offenses Known and Clearances by Arrest dataset, that is detailed in Chapter \@ref(offensesKnown), as well as vandalism/destruction of property and human trafficking. 

### The location of the crime

This data is interesting because it includes the location - in categories for types of places, not actual location in the city - of the incident. This is important since the type of location can be a factor in whether the incident is classified as a hate crime. For example, spray paint on a synagogue or a mosque is much more likely to be a hate crime than spray paint on a wall of an abandoned building. Table \@ref(tab:hateLocations) shows the locations of hate crimes sorted by the year that location was first included in the data and then by frequency of hate crimes. Each hate crime incident can have multiple locations since each offense can have its own incident, but in most cases (96.6%) a hate crime only has a single location. 

As with the crime and the bias motivation, the available locations have increased as time went on, though these newer locations are relatively uncommon. One important change in location is that starting in 2010 the location of school/college was split to have one location be for elementary and high schools and another location be for colleges and universities. The majority of hate crimes occur in the victim's home (30%), on a road or alley (19%), in an unknown location (13.6%), and in a parking lot or parking garage. All other locations occur in fewer than 5% of hate crimes. 


Table: (\#tab:hateLocations)The location of hate crime incidents. In incidents with multiple locations, this shows only the first location recorded.

|Location                            | First Year Reported| \# of Incidents|\% of Incidents |
|:-----------------------------------|-------------------:|---------------:|:---------------|
|Military Installation               |                2015|               3|0.00\%          |
|Community Center                    |                2013|              75|0.04\%          |
|Dock/Wharf/Freight/Modal Terminal   |                2012|              14|0.01\%          |
|Shelter - Mission/Homeless          |                2011|              68|0.03\%          |
|Rest Area                           |                2011|              44|0.02\%          |
|Arena/Stadium/Fairgrounds/Coliseum  |                2011|              35|0.02\%          |
|Auto Dealership New/Used            |                2011|              34|0.02\%          |
|Abandoned/Condemned Structure       |                2011|              31|0.02\%          |
|Daycare Facility                    |                2011|              23|0.01\%          |
|Farm Facility                       |                2011|              16|0.01\%          |
|Amusement Park                      |                2011|              14|0.01\%          |
|Atm Separate From Bank              |                2011|               9|0.00\%          |
|Tribal Lands                        |                2011|               6|0.00\%          |
|School - Elementary/Secondary       |                2010|           1,748|0.88\%          |
|School - College/University         |                2010|           1,248|0.63\%          |
|Park/Playground                     |                2010|             646|0.32\%          |
|Shopping Mall                       |                2010|             142|0.07\%          |
|Industrial Site                     |                2010|              65|0.03\%          |
|Camp/Campground                     |                2010|              23|0.01\%          |
|Gambling Facility/Casino/Race Track |                2010|              21|0.01\%          |
|Residence/Home                      |                1991|          59,606|29.86\%         |
|Highway/Road/Alley                  |                1991|          37,988|19.03\%         |
|Other/Unknown                       |                1991|          27,178|13.61\%         |
|School/College                      |                1991|          17,249|8.64\%          |
|Parking Lot/Garage                  |                1991|          11,440|5.73\%          |
|Church/Synagogue/Temple             |                1991|           7,530|3.77\%          |
|Commercial/Office Building          |                1991|           4,502|2.25\%          |
|Restaurant                          |                1991|           3,978|1.99\%          |
|Bar/Nightclub                       |                1991|           3,549|1.78\%          |
|Government/Public Building          |                1991|           2,894|1.45\%          |
|Convenience Store                   |                1991|           2,561|1.28\%          |
|Specialty Store - Tv, Fur, Etc.     |                1991|           2,375|1.19\%          |
|Air/Bus/Train Terminal              |                1991|           1,931|0.97\%          |
|Field/Woods                         |                1991|           1,917|0.96\%          |
|Service/Gas Station                 |                1991|           1,830|0.92\%          |
|Grocery/Supermarket                 |                1991|           1,628|0.82\%          |
|Department/Discount Store           |                1991|           1,516|0.76\%          |
|Drug Store/Doctors Office/Hospital  |                1991|           1,448|0.73\%          |
|Jail/Prison                         |                1991|           1,262|0.63\%          |
|Hotel/Motel                         |                1991|           1,214|0.61\%          |
|Construction Site                   |                1991|             507|0.25\%          |
|Bank/Savings And Loan               |                1991|             418|0.21\%          |
|Liquor Store                        |                1991|             346|0.17\%          |
|Lake/Waterway                       |                1991|             326|0.16\%          |
|Rental Storage Facility             |                1991|             188|0.09\%          |
|Total                               |                  NA|         199,646|100\%           |

### Number and race of offenders

There are two variables that have information about the people who commit the hate crime: the number of offenders and the race of the offenders (as a single value with the race of the group if all are of the same race or it will say a "multi-racial" group). Unfortunately, important information like the age of the offenders, their criminal history, their relationship to the victim, their gender, or whether they are arrested are completely unavailable in this dataset. 

When the police do not have any information about the number of offenders (which is common in cases of property crimes such as vandalism but rare in violent crimes), this data considers that to have zero offenders. The zero is just a placeholder that means that the police have no idea how many offenders there are, not that they think there were actually no offenders. Figure \@ref(fig:hateCrimeOffenderNumber) shows the percent of hate crimes from 1991-2018 that have each number of offenders recorded. In the actual data it says the actual number of offenders, with the largest group in the current data going to 99 offenders - in this graph I group 10 or more offenders together for simplicity. I also relabel zero offenders as "Unknown" offenders since that's more accurate. The most common number of offenders per hate crime is one offender, at about 46% of hate crimes from 1991-2018 having only one offender. This drops sharply to 9% of hate crimes having 2 offenders and continues to drop as the number of offenders increase. However, about a third (36.8%) of hate crimes have an unknown number of offenders. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/hateCrimeOffenderNumber-1.svg" alt="The race of offenders, as a group, for hate crime incidents, 1991-2018." width="90%" />
<p class="caption">(\#fig:hateCrimeOffenderNumber)The race of offenders, as a group, for hate crime incidents, 1991-2018.</p>
</div>


The data also includes the race of the offenders as a group, though not the ethnicity (Hispanic or non-Hispanic) of the offenders. In cases where there are multiple races among offenders, that will be classified as a "multi-racial group". As shown in Figure \@ref(fig:hateCrimeOffenderNumber) The most common racial group is "unknown" since the police do not know the race of the offenders. Then are White offenders at nearly 40% of hate crimes followed by Black offenders at nearly 13% of hate crimes. The remaining racial groups are rare with about 2% of hate crimes being committed by a multi-racial group of offenders and 0.72% of hate crimes committed by Asian or Pacific Islander offenders and 0.54% committed by American Indian or Native Alaskan offenders. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/hateCrimeOffenderRace-1.svg" alt="The race of offenders, as a group, for hate crime incidents, 1991-2018." width="90%" />
<p class="caption">(\#fig:hateCrimeOffenderRace)The race of offenders, as a group, for hate crime incidents, 1991-2018.</p>
</div>
