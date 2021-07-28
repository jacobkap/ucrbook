# Supplementary Homicide Reports (SHR) {#shr}




The Supplementary Homicide Reports dataset - often abbreviated to SHR -  is the most detailed of the UCR datasets and provides information about the circumstances and participants (victim and offender demographics and relationship status) for homicides.^[If you're familiar with the National Incident-Based Reporting System (NIBRS) data that is replacing UCR, this dataset is the closest UCR data to it, though it is still less detailed than NIBRS data.] For each homicide incident it tells you the age, gender, race, and ethnicity of each victim and offender as well as the relationship between the first victim and each of the offenders (but not the other victims in cases where there are multiple victims). It also tells you the weapon used by each offender and the circumstance of the killing, such as a "lovers triangle" or a gang-related murder. As with other UCR data, it also tells you the agency it occurred in and the month and year when the crime happened. 




## Agencies reporting

This data only has a report when the agency has a murder that year and since murder is rare it is difficult to measure underreporting. One way we can look at reporting is to compare murders in the SHR data with that of other datasets. We'll look at two of them: the Offenses Known and Clearances by Arrest which is covered in detail in Chapter \@ref(offensesKnown), and the Center for Disease Control and Prevention (CDC) data on national deaths from homicide.^[CDC WONDER data is available here: https://wonder.cdc.gov/] Both this dataset and the Offenses Known and Clearances by Arrest data are UCR datasets so you may think that the numbers of murders from each dataset should be the same. That is a perfectly reasonable assumption, but since this is UCR data we're talking about, you'd be wrong. Police agencies are free to report to either, both, or neither dataset so while the number of murders are close for each dataset, they are never equal. CDC WONDER data aggregates mortality data (among other data) from state death certificates which reduces the issue of voluntary reporting that we have in UCR data.

Figure \@ref(fig:shrVsOffenses) shows the annual number of murder victims from each of these datasets starting in 1976 for the UCR data and in 1999 for the CDC data.^[1975 is actually the first year that the Supplementary Homicide Reports data is available but that dataset only has info for a single victim and offender - all later years has info for up to 11 victims and offenders - so 1976 is often used as the first year of data] For the UCR data, in every year the numbers are fairly similar and the trends are the same over time, but the number of murders is never equal. The numbers have actually gotten worse over time with the difference between the datasets increasing and the Offenses Known data having consistently more murders reported than the SHR data since the late 1990s. Compared to the CDC data, however, both UCR datasets - and in particular the SHR data - undercount the number of murders. While trends are the same, UCR data reports thousands fewer murders per year than the CDC data, indicating how much of an issue underreporting is in this data.

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrVsOffenses-1.svg" alt="The annual number of murders from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset. Numbers differ because agencies voluntarily report and may not report to both datasets." width="90%" />
<p class="caption">(\#fig:shrVsOffenses)The annual number of murders from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset. Numbers differ because agencies voluntarily report and may not report to both datasets.</p>
</div>

## Important variables

The data has demographic information for up to 11 victims and 11 offenders, as well as the information on the weapon used by each offender, the relationship between the first victim and each offender, and the circumstance of the murder. The data also has the traditional UCR set of variables about the agency: their ORI code, population, state, region and the month and year of this data. One key variable that is missing is the outcome of the homicide: there is no information on whether any of the offenders were arrested. 

While there is information on up to 11 victims and offenders, in most cases, there is only a single victim and a single offender in each incident. To see how the breakdown for the number of victims in each incident looks, Figure \@ref(fig:numberSHRVictims) shows the percent of incidents with each possible number of victims.^[There is one incident where there are a reported 12 victims. For simplicity of the graph, this incident is not included.] In nearly all incidents - 96.1% - there was only a single victim. This drops to 3.2% of incidents for two victims, 0.5% for three victims, and only about 0.2% of incidents have four or more victims. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/numberSHRVictims-1.svg" alt="The percent of incidents from 1976-2018 that have 1-11 victims." width="90%" />
<p class="caption">(\#fig:numberSHRVictims)The percent of incidents from 1976-2018 that have 1-11 victims.</p>
</div>

Figure \@ref(fig:numberSHROffenders) shows the breakdown of the number of offenders per homicide incident.^[There is one incident where there are a reported 22 offenders and one with 12 offenders. For simplicity of the graph, these incidents are not included.] It's a little less concentrated than with victims but the vast majority of homicides are committed by one offender - or at least the police only report one offender. About 88% of homicides have only one offender, 8.2% have two, 2.4% have three, and fewer than 1% have four. Fewer than 0.5% of homicides have more than four offenders. However, this is all a bit misleading. In cases where there is no information about the offender, including how many offenders there is, the data simply says that there is a single offender. So the number of homicides with a single offender is an overcount while the number with more offenders is an undercount. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/numberSHROffenders-1.svg" alt="The percent of incidents from 1976-2018 that have 1-11 offenders." width="90%" />
<p class="caption">(\#fig:numberSHROffenders)The percent of incidents from 1976-2018 that have 1-11 offenders.</p>
</div>

The variable "situation" says what type of victim-offender number combination the incident is - e.g. "multiple victims/single offender", "single victim/multiple offenders", etc. - and does indicate if the number of offenders is unknown (though curiously there are over 4,000 instances where the number of offenders is unknown but they still say there are two offenders) so you can use this variable to determine if the police don't know how many offenders there is. You're still limited, of course, in that the number of offenders is always what the police think there are, and they may be wrong. So use this variable - and anything that comes from it like the percent of offenders of a certain race - with caution. 

We'll now look at a number of important variables individually. Since the data can potentially have 11 victims and 11 offenders - but in practice has only one each in the vast majority of cases - we'll only look at the first victim/offender for each of these variables. Therefore, the results will not be entirely accurate, but will still give you a good overview of the data. The figures below will use data for all homicides from 1976 to 2018 so will cover all but the most recent year of data. 

### Demographics

There are two broad categories of variables that we'll cover: demographics of the victim and offenders, and characteristics of the case. We start with demographics.

#### Age

This data includes the age (in years) for each victim and each offender. For those under one years old, it also breaks this down into those from birth to six days old "including abandoned infant" and those seven days old to 364 days old. So there's a bit more info on baby murders. It also maxes out the age at 99 so for victims or offenders older than that we don't get their exact age, just text that says "99 years or older" (which I turn to the number 99 in the figures below).  

Figure \@ref(fig:shrOffenderAge) shows the percent of murders from 1976-2018 where the first offender in the case is of each age from 0-99. Offenders with unknown ages are excluded from this graph and make up about 27% of cases. The average (mean) age is 30.9 years old (shown in orange) which is due to a long right tail; the median age is 28 years old. If you look closely at the left side of the graph you can see that there are some very young offenders, with at least one offender for each year of age from 0 to 10 included in the data. It's not clear from this alone that these ages are a data entry error. While a two-year-old certainly couldn't murder someone, the data does include deaths caused by "children playing with gun" (homicide circumstances will be discussed in Section \@ref(circumstance)) so these ages could potentially be correct. 

If you're familiar with the age-crime curve in criminology - which basically says crime peaks in late teen years then falls dramatically - this shows that exact curve, though is older and doesn't decline as the offender ages as quickly as we see with less serious crimes. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrOffenderAge-1.svg" alt="The age of homicide offenders, based on the first offender in any homicide incident. Offenders under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Offenders reported as '99 years or older' are considered 99 years old." width="90%" />
<p class="caption">(\#fig:shrOffenderAge)The age of homicide offenders, based on the first offender in any homicide incident. Offenders under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Offenders reported as '99 years or older' are considered 99 years old.</p>
</div>

Figure \@ref(fig:shrVictimAge) repeats Figure \@ref(fig:shrOffenderAge) but with victim age rather than offender age. The mean victim age (shown in orange) is 32.9 and the median age is 30. Though the age victim age is a bit younger than the average offender age, trends are relatively similar for teenagers and older where deaths spikes in the late teen years and then declines steadily. The major difference is the U-shape for younger victims - for victims under age 15, homicides peak at age 0 (i.e. younger than their first birthday) with ~1.5% of all homicides being this this age. They then decline until plateauing at around age 6 before increasing again in the early teen years. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrVictimAge-1.svg" alt="The age of homicide victims, based on the first victims in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old." width="90%" />
<p class="caption">(\#fig:shrVictimAge)The age of homicide victims, based on the first victims in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old.</p>
</div>

#### Sex 

We'll next look at victim and offender sex, a simple variable since only male and female are included. About 62% of offenders, as seen in Figure \@ref(fig:shrOffenderSex), are male and about 8% are female, indicating a large disparity in the sex of homicide offenders. The remaining 30% of offenders do not have sex data available because the police do not know the sex of this individual. For offenders who aren't arrested, this variable may be inaccurate since it is perceived sex of the offender. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrOffenderSex-1.svg" alt="The sex of offenders, 1976-2018." width="90%" />
<p class="caption">(\#fig:shrOffenderSex)The sex of offenders, 1976-2018.</p>
</div>

There is far less uncertainty for victim sex, with under 0.15% of victims having an unknown sex. Here again there is a large disparity between male and female with about 78% of victims being male and 22% being female. While there are more male victims than male offenders, this is probably just due to there being so many unknown offenders. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrVictimSex-1.svg" alt="The sex of victims, 1976-2018." width="90%" />
<p class="caption">(\#fig:shrVictimSex)The sex of victims, 1976-2018.</p>
</div>

#### Race

This data also includes the race of the victims and offenders. This includes the following races: American Indian or Alaskan Native, Asian, Black, Native Hawaiian or Other Pacific Islander, and White. These are the only races included in the data; Hispanic is considered an ethnicity and is available as a separate, though flawed, variable. There is no category for bi- or multi-racial. As with other demographics info for offenders, in cases where no arrest is made (and we don't know in this data if one is made), there's no way to confirm the person's race (and race itself is hard to put into discrete boxes like done here) so these results may not be entirely accurate. 

Figure \@ref(fig:shrOffenderRace) shows the percent of homicides in the data by race. Black and White victims are included are similar percentages, at 34.2% and 33.8% of victims, respectively. The next most common group is Unknown at about 30.5% of offenders. Given that so many offenders have an unknown race, the reliability of the other race measures is limited. The remaining races are Asian at 0.9% of offenders, American Indian or Alaskan Native at 0.6%, and Native Hawaiian or Other Pacific Islander at 0.004%. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrOffenderRace-1.svg" alt="The race of offenders, 1976-2018." width="90%" />
<p class="caption">(\#fig:shrOffenderRace)The race of offenders, 1976-2018.</p>
</div>

For victim race, seen in Figure \@ref(fig:shrVictimRace), only about 1% of victim races are unknown. This means we can be a lot more confident in the race of the victims than in the race of the offender. Or, at least the challenge of categorizing people by race is the major problem, not missing data As with offenders, White and Black victims are the two most common races, with 49% and 47.7% of victims, respectively. There are almost double the percent of Asian victims than Asian offenders at 1.51% of victims (and 0.9% of offenders). American Indian or Alaskan Natives make up 0.8% of victims while Native Hawaiian or Pacific Islanders make up 0.005% of victims.

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrVictimRace-1.svg" alt="The race of victims, 1976-2018" width="90%" />
<p class="caption">(\#fig:shrVictimRace)The race of victims, 1976-2018</p>
</div>

#### Ethnicity

The final demographic variable is ethnicity which is whether the victim or offender is Hispanic or not Hispanic. The UCR data has a weird relationship with this variable (which is also in the Arrests by Age, Sex, and Race dataset, discussed in Chapter \@ref(arrests)) where ethnicity is technically a variable in the data but very rarely collected. As such, this is an unreliable variable that if you really want to use needs careful attention to make sure it is being reported consistently by the agencies that you are looking at. 

The vast majority - 71.6% - of offenders have an unknown ethnicity while 21.5% are not Hispanic and 6.9% are Hispanic. 

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrOffenderEthnicity-1.svg" alt="The ethnicity of offenders, 1976-2018." width="90%" />
<p class="caption">(\#fig:shrOffenderEthnicity)The ethnicity of offenders, 1976-2018.</p>
</div>

Unlike the other demographic variables, there is still a huge amount of underreporting when it comes to victim ethnicity, though still less than for offender ethnicity. 59% of victims have an unknown ethnicity. Nearly 30% of victims are reported as not Hispanic while 10.8% are reported as Hispanic.

<div class="figure" style="text-align: center">
<img src="ucrbook_files/figure-epub3/shrVictimEthnicity-1.svg" alt="The ethnicity of victims, 1976-2018." width="90%" />
<p class="caption">(\#fig:shrVictimEthnicity)The ethnicity of victims, 1976-2018.</p>
</div>

### Case characteristics

#### Weapon used

The first variable we'll look at is the weapon used by each offender. Table \@ref(tab:shrWeapon) shows the weapon used by the first offender in every incident from 1976 to 2018. Each offender can only be reported as having a single weapon, so this table essentially shows the number (and percent) of murders caused by this weapon. This isn't entirely true since in reality an offender could use multiple weapons and there can be multiple offenders. In these cases the police include what they believe is the "primary" weapon used by this offender.

The most commonly used weapon is a handgun, which is used in nearly half of murders. This is followed by a knife or other sharp weapon used to cut at 15% of murders, and then by "firearm, type not stated" which is just a firearm where we don't know the exact type (it can include handguns) at 7.3% of murders. The fourth most common weapon is "personal weapons" at nearly 6% of murders. "Personal weapons" is a weird term to mean that there was no weapon - the "weapon" was the offender who beat the victim to death. Shotguns are involved in 5% of murders and all other weapons are involved in fewer than 5% of cases. In total there are 19 different weapons included though most are very uncommon. 


Table: (\#tab:shrWeapon)The weapon used in a homicide incident. In cases where there are multiple offenders, shows only the primary weapon for the first offender.

|Weapon                                    | \# of Incidents| \% of Incidents|
|:-----------------------------------------|---------------:|---------------:|
|Handgun                                   |         359,188|         49.75\%|
|Knife Or Cutting Instrument               |         109,670|         15.19\%|
|Firearm, Type Not Stated                  |          52,638|          7.29\%|
|Personal Weapons - Includes Beating       |          42,763|          5.92\%|
|Shotgun                                   |          36,072|          5.00\%|
|Other Or Unknown Weapon                   |          35,073|          4.86\%|
|Blunt Object                              |          33,291|          4.61\%|
|Rifle                                     |          26,314|          3.64\%|
|Strangulation - Includes Hanging          |           9,619|          1.33\%|
|Fire                                      |           5,089|          0.70\%|
|Asphyxiation - Includes Death By Gas      |           4,420|          0.61\%|
|Other Gun                                 |           2,668|          0.37\%|
|Narcotics/Drugs - Includes Sleeping Pills |           2,058|          0.29\%|
|Drowning                                  |           1,367|          0.19\%|
|Other Or Type Unknown                     |             586|          0.08\%|
|Poison - Does Not Include Gas             |             467|          0.06\%|
|Explosives                                |             374|          0.05\%|
|Pushed Or Thrown Out of Window            |             251|          0.03\%|
|Narcotics Or Drugs                        |              48|          0.01\%|
|Total                                     |         721,956|           100\%|

#### Relationship between first victim and offenders

An interesting and highly useful variable is the relationship between the first victim and each offender. To be clear, this is only for the first victim; we don't have the relationship between other victims and offenders. However, as seen earlier, this isn't *too much* of an issue since nearly all incidents only have a single victim. There are 29 possible relationship types (including "unknown" relationship) which are broken into three categories: legal family members, people known to the victim but who aren't family, and people not known to the victim. Table \@ref(tab:shrRelationship) shows these relationships and the number and percent of murders with these relationships. If you're looking at this on a computer you can sort or search through this table. 

The most common relationship, with a little over a third of murders, is that the police don't know the relationship. So there is a good deal of uncertainty in the relationship between victims and offenders. Next is that the victim is the offender's acquaintance at 20.5% or is a stranger at 15.5%. The next is "other - known to victim" which is similar to being an acquaintance at almost 5% of murders. The 5th most common relationship, at 3.65% is that the victim is the wife of the offender, so is murdered by her husband, and is the first familial relationship of this list. This is followed by the victim being the friend of the murderer at 3.62%. The remaining relationships all make up fewer than 3% of all murders. 


Table: (\#tab:shrRelationship)The relationship between the first victim and the first offender in a homicide incident.

|Relationship            |               Category| \# of Incidents|\% of Incidents |
|:-----------------------|----------------------:|---------------:|:---------------|
|Unknown                 |                       |         263,237|36.46\%         |
|Acquaintance            | Not family (but known)|         147,741|20.46\%         |
|Stranger                |              Not known|         111,955|15.51\%         |
|Other - Known To Victim | Not family (but known)|          33,426|4.63\%          |
|Wife                    |                 Family|          26,353|3.65\%          |
|Friend                  | Not family (but known)|          26,143|3.62\%          |
|Girlfriend              | Not family (but known)|          19,194|2.66\%          |
|Husband                 |                 Family|          11,700|1.62\%          |
|Other Family            |                 Family|          10,400|1.44\%          |
|Son                     |                 Family|          10,342|1.43\%          |
|Boyfriend               | Not family (but known)|           9,041|1.25\%          |
|Neighbor                | Not family (but known)|           7,569|1.05\%          |
|Daughter                |                 Family|           7,436|1.03\%          |
|Brother                 |                 Family|           6,403|0.89\%          |
|Father                  |                 Family|           5,059|0.70\%          |
|Mother                  |                 Family|           4,578|0.63\%          |
|In-Law                  |                 Family|           4,392|0.61\%          |
|Common-Law Wife         |                 Family|           3,209|0.44\%          |
|Common-Law Husband      |                 Family|           2,690|0.37\%          |
|Ex-Wife                 | Not family (but known)|           2,205|0.31\%          |
|Stepfather              |                 Family|           1,693|0.23\%          |
|Homosexual Relationship | Not family (but known)|           1,663|0.23\%          |
|Stepson                 |                 Family|           1,381|0.19\%          |
|Sister                  |                 Family|           1,344|0.19\%          |
|Ex-Husband              | Not family (but known)|             876|0.12\%          |
|Stepdaughter            |                 Family|             747|0.10\%          |
|Employer                | Not family (but known)|             530|0.07\%          |
|Employee                | Not family (but known)|             422|0.06\%          |
|Stepmother              |                 Family|             227|0.03\%          |
|Total                   |                       |         721,956|100\%           |

#### Homicide circumstance {#circumstance}

We also have information on the type of the murder, which this data calls the "circumstance". This comes as relatively broad categories that leave a lot to be desired in our understanding of what led to the murder. Table \@ref(tab:shrCircumstance) shows the number and percent of each circumstance for the first victim of each murder from 1976 to 2018. This data has 33 possible circumstances which it groups into four main categories: murders that coincide with committing another crime ("felony type" murders), murders that don't coincide with another crime ("non-felony type" murders), justifiable homicides, and negligent manslaughter. 

The felony type murders are simply ones where another crime occurred during the murder. While this is called "felony type" it does include other crimes such as theft and gambling (which isn't always a felony) so is a bit of a misnomer. The "non-felony type" are murders that happen without another crime. This includes gang killings (where, supposedly, only the murder occurred), children killed by babysitters, fights among intoxicated (both of alcohol and drugs) people, and "lover's triangle" killings.  Justifiable homicides are when a person (civilian or police officer) kill a person who is committing a crime.^[This dataset is one source of information on how many people police kill each year. But it is a large undercount compared to other sources such as the Washington Post collection, so is not a very useful source of information on this topic.] Negligent manslaughter includes accidental shootings such as when children find and shoot a gun, but excludes deaths from traffic accidents. 

The most common circumstances, accounting for 27.4%, 26.4%, and 12.5%, respectively, are "other arguments", "unknown", and "other non-felony type - not specified". Since the data includes "argument over money or property" as one category, the "other arguments" mean that it's an argument for a reason other than over money or property. The "other non-felony type" one does not mean that the murder did not occur alongside another crime, but also doesn't fall into the non-felony categories included. Robbery is the only remaining circumstance with more than 5% of murders, at 8%. 


Table: (\#tab:shrCircumstance)The circumstance of the homicide for the first offender in a homicide incident.

|Circumstance                                                       |               Category| \# of Incidents|\% of Incidents |
|:------------------------------------------------------------------|----------------------:|---------------:|:---------------|
|Other Arguments                                                    |        Non-Felony Type|         197,905|27.41\%         |
|Unknown                                                            |                       |         190,837|26.43\%         |
|Other Non-Felony Type - Not Specified                              |        Non-Felony Type|          90,203|12.49\%         |
|Robbery                                                            |            Felony Type|          57,312|7.94\%          |
|Narcotic Drug Laws                                                 |            Felony Type|          26,489|3.67\%          |
|Juvenile Gang Killings                                             |        Non-Felony Type|          23,292|3.23\%          |
|Felon Killed By Police                                             |   Justifiable Homicide|          16,394|2.27\%          |
|Brawl Due To Influence of Alcohol                                  |        Non-Felony Type|          15,174|2.10\%          |
|Argument Over Money Or Property                                    |        Non-Felony Type|          14,667|2.03\%          |
|Other Felony Type - Not Specified                                  |            Felony Type|          13,902|1.93\%          |
|All Suspected Felony Type                                          |            Felony Type|          12,743|1.77\%          |
|Felon Killed By Private Citizen                                    |   Justifiable Homicide|          12,376|1.71\%          |
|Lovers Triangle                                                    |        Non-Felony Type|          10,372|1.44\%          |
|Burglary                                                           |            Felony Type|           6,052|0.84\%          |
|Brawl Due To Influence of Narcotics                                |        Non-Felony Type|           4,704|0.65\%          |
|Gangland Killings                                                  |        Non-Felony Type|           4,693|0.65\%          |
|All Other Manslaughter By Negligence Except Traffic Deaths         | Negligent Manslaughter|           4,339|0.60\%          |
|Rape                                                               |            Felony Type|           4,086|0.57\%          |
|Other Negligent Handling of Gun Which Resulted In Death of Another | Negligent Manslaughter|           3,266|0.45\%          |
|Arson                                                              |            Felony Type|           2,982|0.41\%          |
|Other Sex Offenses                                                 |            Felony Type|           1,408|0.20\%          |
|Child Killed By Babysitter                                         |        Non-Felony Type|           1,297|0.18\%          |
|Children Playing With Gun                                          | Negligent Manslaughter|           1,272|0.18\%          |
|Motor Vehicle Theft                                                |            Felony Type|           1,259|0.17\%          |
|Institutional Killings                                             |        Non-Felony Type|           1,055|0.15\%          |
|Gambling                                                           |            Felony Type|           1,031|0.14\%          |
|Larceny                                                            |            Felony Type|             753|0.10\%          |
|Prostitution And Commercialized Vice                               |            Felony Type|             601|0.08\%          |
|Other - Not Specified                                              |            Felony Type|             554|0.08\%          |
|Sniper Attack                                                      |        Non-Felony Type|             474|0.07\%          |
|Victim Shot In Hunting Accident                                    | Negligent Manslaughter|             329|0.05\%          |
|Gun Cleaning Death - Other Than Self-Inflicted                     | Negligent Manslaughter|             125|0.02\%          |
|Abortion                                                           |            Felony Type|              10|0.00\%          |
|Total                                                              |                       |         721,956|100\%           |

#### Homicide subcircumstance

The "subcircumstance" just tells you more information about justifiable homicides. This includes the circumstance leading up to the "felon" - which is how the person killed is described, though technically they don't need to have committed a felony - was killed. It includes if this person attacked an officer (the one who killed them), a different officer, a civilian, or was committing or fleeing a crime. 


Table: (\#tab:shrSubCircumstance)The circumstance for the first offender in a homicide incident in cases where the offender is killed. This includes incidents where the only person who dies in the offender.

|Subcircumstance                       | \# of Incidents| \% of Incidents|
|:-------------------------------------|---------------:|---------------:|
|Felon Killed In Commission of A Crime |          10,320|         35.87\%|
|Felon Attacked Police Officer         |           8,553|         29.73\%|
|Felon Attacked A Civilian             |           4,498|         15.63\%|
|Not Enough Information To Determine   |           2,423|          8.42\%|
|Felon Resisted Arrest                 |           1,226|          4.26\%|
|Felon Attacked Fellow Police Officer  |             951|          3.31\%|
|Felon Attempted Flight From A Crime   |             799|          2.78\%|
|Total                                 |          28,770|           100\%|

