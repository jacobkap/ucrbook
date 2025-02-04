# Supplementary Homicide Reports (SHR) {#shr}



The Supplementary Homicide Reports data set - often abbreviated to SHR - is the most detailed of the SRS data sets and provides information about the circumstances and participants (victim and offender demographics and relationship status) for homicides. For each homicide incident it tells you the age, sex, race, and ethnicity of each victim and offender as well as the relationship between the first victim and each of the offenders (but not the other victims in cases where there are multiple victims). It also tells you the weapon used by each offender and the circumstance of the killing, such as a "lovers triangle" or a gang-related murder. As with other SRS data, it also tells you the agency it occurred in and the month and year when the crime happened. 

One important point of clarification: this is not the number of murders, though it does track that. This data also includes the number of homicides that are manslaughter by negligence (e.g. children playing with a gun, hunting accident) and justifiable homicides (i.e. not criminal). So be carefully when speaking about this data. It is murders but not only murders so you want to speak precisely. 




## Agencies reporting

This data only has a report when the agency has a homicide that year and since homicides are relatively rare it is difficult to measure underreporting. One way we can look at reporting is to compare homicide in the SHR data with that of other data sets. We will look at two of them: the Offenses Known and Clearances by Arrest which is covered in detail in Chapter \@ref(offensesKnown), and the Center for Disease Control and Prevention (CDC) data on national deaths from homicide.^[CDC WONDER data is available here: https://wonder.cdc.gov/] Both this data set and the Offenses Known and Clearances by Arrest data are SHR data sets so you may think that the numbers of homicides from each data set should be the same. That is a perfectly reasonable assumption, but since this is SHR data we are talking about, you would be wrong. Police agencies are free to report to either, both, or neither data set so while the number of homicides are close for each data set, they are never equal. CDC WONDER data aggregates mortality data (among other data) from state death certificates which reduces the issue of voluntary reporting that we have in SHR data.

Figure \@ref(fig:shrVsOffenses) shows the annual number of homicide victims (including murders and manslaughters) from each of these data sets starting in 1976 for the SHR data and in 1999 for the CDC data.^[1975 is actually the first year that the Supplementary Homicide Reports data is available but that data set only has info for a single victim and offender - all later years has info for up to 11 victims and offenders - so 1976 is often used as the first year of data] 

For the SHR data, in every year the numbers are fairly similar and the trends are the same over time, but the number of homicides is never equal. The numbers have actually gotten worse over time with the difference between the data sets increasing and the Offenses Known data having consistently more murders reported than the SHR data since the late 1990s. Compared to the CDC data, however, both SHR data sets - and in particular the SHR data - undercount the number of homicides. While trends are the same, SHR data reports thousands fewer murders per year than the CDC data, indicating how much of an issue underreporting is in this data.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVsOffenses-1.png" alt="The annual number of murders and nonngeligent manslaughters from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest data set, and homicides from the Center for Disease Control (CDC). Numbers differ because agencies voluntarily report and may not report to both data sets." width="100%" height="100%" />
<p class="caption">(\#fig:shrVsOffenses)The annual number of murders and nonngeligent manslaughters from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest data set, and homicides from the Center for Disease Control (CDC). Numbers differ because agencies voluntarily report and may not report to both data sets.</p>
</div>

Let us look at Chicago for another example of the differences in reporting from the SHR and the Offenses Known data. Figure \@ref(fig:chicagoSHRvsOffensesKnown) shows the annual number of homicide victims from both data sets. In most years they are pretty similar, excluding a few really odd years in the 1980s and in 1990. But what is also strange is that most years have more SHR victims than Offenses Known victims. So nationally SHR has fewer homicides than Offenses Known but that pattern is reversed in Chicago? This is one of the many quirks of SHR data. And is a warning against treating national trends as local trends; what is true nationally is not always true in your community. So when you use this data, check everything closely. And once you have done that, check it again. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/chicagoSHRvsOffensesKnown-1.png" alt="The annual number of homicide victims in Chicago, Supplementary Homicide Reports and Offenses Known and Clearances by Arrest, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:chicagoSHRvsOffensesKnown)The annual number of homicide victims in Chicago, Supplementary Homicide Reports and Offenses Known and Clearances by Arrest, 1976-2023.</p>
</div>

Figures \@ref(fig:shrTopAgenciesCount) and \@ref(fig:shrTopAgenciesCountPercent) attempt to get at this question by looking the number and percent of all incidents that the top 100, 50 and 10 agencies based on number of homicide incidents make up out of all homicide incidents in each year. These agencies are massively disproportionate in how many homicides they represent - though they are also generally the largest cities in the country so are a small number of agencies but a large share of this nation's population. On average, the 10 agencies with the most homicide incidents each year - which may change every year - have over 4,000 homicide incidents and make up about 1/4 of all homicide incidents reported nationally. The top 50 have about 7,500 incidents a year, accounting for 46% of incidents. The top 100 agencies have a bit under 10,000 incidents a year and make up over 55% of all homicide incidents in the United States. So excluding the largest agencies in the country would certainly undercount homicides.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrTopAgenciesCount-1.png" alt="The annual number of homicide incidents, showing all agencies, the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrTopAgenciesCount)The annual number of homicide incidents, showing all agencies, the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2023.</p>
</div>


<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrTopAgenciesCountPercent-1.png" alt="The annual percent of homicide incidents by the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrTopAgenciesCountPercent)The annual percent of homicide incidents by the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2023.</p>
</div>

## Important variables

The data has demographic information for up to 11 victims and 11 offenders, as well as the information on the weapon used by each offender, the relationship between the first victim and each offender, and the circumstance of the homicide. The data also has the traditional SHR set of variables about the agency: their ORI code, population, state, region and the month and year of this data. One key variable that is missing is the outcome of the homicide: there is no information on whether any of the offenders were arrested. 

While there is information on up to 11 victims and offenders, in most cases, there is only a single victim and a single offender in each incident. We can use the additional_victim_count and additional_offender_count columns to see how many additional victims/offenders there are. An additional victim/offender means in addition to the first one. Even though we have columns for up to 11 victims and offenders, in very rare instances the additional_[victim/offender]_count columns may say there are more than 11 victims/offenders.

To see how the breakdown for the number of victims in each incident looks, Figure \@ref(fig:numberSHRVictims) shows the percent of incidents with each possible number of victims.^[There are five incident where there are more than 11 victims. For simplicity of the graph, these incident are excluded.] In nearly all incidents - 96.0% - there was only a single victim. This drops to 3.3% of incidents for two victims, 0.5% for three victims, and only about 0.2% of incidents have four or more victims. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/numberSHRVictims-1.png" alt="The percent of incidents that have 1-11 victims." width="100%" height="100%" />
<p class="caption">(\#fig:numberSHRVictims)The percent of incidents that have 1-11 victims.</p>
</div>

Figure \@ref(fig:numberSHROffenders) shows the breakdown of the number of offenders per homicide incident.^[There are seven incidents with more than 11 offenders. For simplicity of the graph, these incidents are excluded.] It is a little less concentrated than with victims but the vast majority of homicides are committed by one offender - or at least the police only report one offender. About 87.6% of homicides have only one offender, 8.4% have two, 2.5% have three, and 1.5% have four. Fewer than 0.5% of homicides have more than four offenders. However, this is all a bit misleading. In cases where there is no information about the offender, including how many offenders there is, the data simply says that there is a single offender. So the number of homicides with a single offender is an over-count while the number with more offenders is an undercount. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/numberSHROffenders-1.png" alt="The percent of incidents that have 1-11 offenders." width="100%" height="100%" />
<p class="caption">(\#fig:numberSHROffenders)The percent of incidents that have 1-11 offenders.</p>
</div>

The variable "situation" says what type of victim-offender number combination the incident is - e.g. "multiple victims/single offender", "single victim/multiple offenders", etc. - and does indicate if the number of offenders is unknown (though curiously there are over 4,000 instances where the number of offenders is unknown but they still say there are two offenders) so you can use this variable to determine if the police do not know how many offenders there is. You're still limited, of course, in that the number of offenders is always what the police think there are, and they may be wrong. So use this variable - and anything that comes from it like the percent of offenders of a certain race - with caution. 

We will now look at a number of important variables individually. Since the data can potentially have 11 victims and 11 offenders - but in practice has only one each in the vast majority of cases - we will only look at the first victim/offender for each of these variables. Therefore, the results will not be entirely accurate, but will still give you a good overview of the data. The figures below will use data for all homicides from 1976 to 2022 so will cover all currently available years of data. Keep in mind that national trends are not the same as local trends so what is shown in these figures will probably not be the same as what is happening in your community. And that looking at all homicides means we are including murders, manslaughters, and justifiable homicides. 

### Demographics

There are two broad categories of variables that we will cover: demographics of the victim and offenders, and characteristics of the case. We start with demographics.

#### Age

This data includes the age (in years) for each victim and each offender. For those under one years old, it also breaks this down into those from birth to six days old "including abandoned infant" and those seven days old to 364 days old. So there is a bit more info on homicides of babies. It also maxes out the age at 99 so for victims or offenders older than that we do not get their exact age, just text that says "99 years or older" (which I turn to the number 99 in the figures below).  

Figure \@ref(fig:shrOffenderAge) shows the percent of homicides where the first offender in the case is of each age from 0-99. Offenders with unknown ages are excluded from this graph and make up about 27% of cases. The average (mean) age is 31.1 years old (shown in orange) which is due to a long right tail; the median age is 28 years old. If you look closely at the left side of the graph you can see that there are some very young offenders, with at least one offender for each year of age from 0 to 10 included in the data. It is not clear from this alone that these ages are a data entry error. While a two-year-old certainly could not kill someone, the data does include deaths caused by "children playing with gun" (homicide circumstances will be discussed in Section \@ref(circumstance)) so these ages could potentially be correct. 

If you are familiar with the age-crime curve in criminology - which basically says crime peaks in late teen years then falls dramatically - this shows that exact curve, though is older and does not decline as the offender ages as quickly as we see with less serious crimes. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrOffenderAge-1.png" alt="The age of homicide offenders, based on the first offender in any homicide incident. Offenders under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Offenders reported as '99 years or older' are considered 99 years old." width="100%" height="100%" />
<p class="caption">(\#fig:shrOffenderAge)The age of homicide offenders, based on the first offender in any homicide incident. Offenders under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Offenders reported as '99 years or older' are considered 99 years old.</p>
</div>

Figure \@ref(fig:shrVictimAge) repeats Figure \@ref(fig:shrOffenderAge) but with victim age rather than offender age. The mean victim age (shown in orange) is 33 and the median age is 30. Though the average victim age is a bit younger than the average offender age, trends are relatively similar for teenagers and older where deaths spikes in the late teen years and then declines steadily. The major difference is the U-shape for younger victims - for victims under age 15, homicides peak at age 0 (i.e. younger than their first birthday) with ~1.4% of all homicides being this this age. They then decline until plateauing at around age 6 before increasing again in the early teen years. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVictimAge-1.png" alt="The age of homicide victims, based on the first victims in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old." width="100%" height="100%" />
<p class="caption">(\#fig:shrVictimAge)The age of homicide victims, based on the first victims in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old.</p>
</div>

#### Sex 

We will next look at victim and offender sex, a simple variable since only male and female are included. About 62.2% of offenders, as seen in Figure \@ref(fig:shrOffenderSex), are male and about 8.2% are female, indicating a large disparity in the sex of homicide offenders. The remaining 29.6% of offenders do not have sex data available because the police do not know the sex of this individual. For offenders who are not arrested, this variable may be inaccurate since it is perceived sex of the offender.^[If we ignore unknown sex, essentially saying that the unknown people will have their sex distributed exactly as the known sex people, 88% are male and 12% are female. However, this assumption is probably wrong since the unknown people may be materially different than the known people, as evidence by them likely not being arrested and committing the crime in a way where even their sex cannot be identified. ] 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrOffenderSex-1.png" alt="The sex of offender \#1, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrOffenderSex)The sex of offender \#1, 1976-2023.</p>
</div>

There is far less uncertainty for victim sex, with under 0.17% of victims having an unknown sex. Here again there is a large disparity between male and female with about 78.2% of victims being male and 21.6% being female. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVictimSex-1.png" alt="The sex of victim \#1, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrVictimSex)The sex of victim \#1, 1976-2023.</p>
</div>

#### Race

This data also includes the race of the victims and offenders. This includes the following races: American Indian or Alaskan Native, Asian, Black, Native Hawaiian or Other Pacific Islander, and White. These are the only races included in the data; Hispanic is considered an ethnicity and is available as a separate, though flawed, variable. There is no category for bi- or multi-racial. As with other demographics info for offenders, in cases where no arrest is made (and we do not know in this data if one is made), there is no way to confirm the person's race so these results may not be entirely accurate. 

Figure \@ref(fig:shrOffenderRace) shows the percent of homicides in the data by the race of offender #1. Black and White offenders are included are similar percentages, at 34.3% and 33.6% of victims, respectively. The next most common group is Unknown at about 30.6% of offenders. Given that so many offenders have an unknown race, the reliability of race measures is limited. The remaining races are Asian at 0.9% of offenders, American Indian or Alaskan Native at 0.6%, and Native Hawaiian or Other Pacific Islander at 0.02%. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrOffenderRace-1.png" alt="The race of offender \#1, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrOffenderRace)The race of offender \#1, 1976-2023.</p>
</div>

For victim race, seen in Figure \@ref(fig:shrVictimRace), only about 1% of victim #1 races are unknown. This means we can be a lot more confident in the race of the victims than in the race of the offender. Similar to offenders, White and Black victims are the two most common races, with 48.4% and 48.1% of victims, respectively. There is a greater share of Asian victims than Asian offenders at 1.5% of victims. American Indian or Alaskan Natives make up 0.8% of victims while Native Hawaiian or Pacific Islanders make up 0.02% of victims.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVictimRace-1.png" alt="The race of victim \#1, 1976-2023" width="100%" height="100%" />
<p class="caption">(\#fig:shrVictimRace)The race of victim \#1, 1976-2023</p>
</div>

#### Ethnicity

The final demographic variable is ethnicity which is whether the victim or offender is Hispanic or not Hispanic. The SHR data has a weird relationship with this variable (which is also in the Arrests by Age, Sex, and Race data set, discussed in Chapter \@ref(arrests)) where ethnicity is technically a variable in the data but very rarely collected. As such, this is an unreliable variable that if you really want to use needs careful attention to make sure it is being reported consistently by the agencies that you are looking at. 

The vast majority - 69.7% - of offenders have an unknown ethnicity while 23.4% are not Hispanic and 7.1% are Hispanic. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrOffenderEthnicity-1.png" alt="The ethnicity of offender \#1, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrOffenderEthnicity)The ethnicity of offender \#1, 1976-2023.</p>
</div>

Unlike the other demographic variables, there is still a huge amount of underreporting when it comes to victim ethnicity, though still less than for offender ethnicity. 55.6% of victims have an unknown ethnicity. Approximately 33.2% of victim #1 are reported as not Hispanic while 11.1% are reported as Hispanic.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVictimEthnicity-1.png" alt="The ethnicity of victim \#1, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrVictimEthnicity)The ethnicity of victim \#1, 1976-2023.</p>
</div>

As an example of agencies under-reporting this variable, let us look at the number of offender #1s in Albuquerque, New Mexico, a city which the [US Census](https://www.census.gov/quickfacts/fact/table/albuquerquecitynewmexico,US/PST045222) says is about 50% Hispanic. Yet the Albuquerque police reported no ethnicity information for almost three decades of data. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/ABQ-1.png" alt="Annual number of offender \#1 who is Hispanic in Albuquerque, New Mexico, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:ABQ)Annual number of offender \#1 who is Hispanic in Albuquerque, New Mexico, 1976-2023.</p>
</div>


### Case characteristics

Now we will move to facts about each case such as what weapon was used, how people involved knew each other, and what was the (rough) cause of the homicide.

#### Weapon used

The first variable we will look at is the weapon used by each offender. Table \@ref(tab:shrWeapon) shows the weapon used by the first offender in every incident from 1976 to 2022. Each offender can only be reported as having a single weapon, so this table essentially shows the number (and percent) of homicides caused by this weapon. This is not entirely true since in reality an offender could use multiple weapons and there can be multiple offenders. In these cases the police include what they believe is the "primary" weapon used by this offender.

The most commonly used weapon is a handgun, which is used in nearly half of homicides. This is followed by a knife or other sharp weapon used to cut at almost 15% of homicides, and then by "firearm, type not stated" which is just a firearm where we do not know the exact type (it can include handguns) at 8.9% of homicides The fourth most common weapon is "personal weapons" at nearly 6% of homicides. "Personal weapons" is a weird term to mean that there was no weapon - the "weapon" was the offender who beat the victim to death. Shotguns are involved in almost 5% of homicides and all other weapons are involved in fewer than 5% of cases. In total there are 19 different weapons included though most are very uncommon. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:shrWeapon)The weapon used in a homicide incident, 1976-2023. In cases where there are multiple offenders, shows only the primary weapon for the first offender.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Weapon </th>
   <th style="text-align:left;"> # of Incidents </th>
   <th style="text-align:right;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Handgun </td>
   <td style="text-align:left;"> 397,337 </td>
   <td style="text-align:right;"> 48.72\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) </td>
   <td style="text-align:left;"> 101,410 </td>
   <td style="text-align:right;"> 12.43\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Firearm (Type Not Stated) </td>
   <td style="text-align:left;"> 76,807 </td>
   <td style="text-align:right;"> 9.42\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Personal Weapons (Hands, Feet, Teeth, Etc.) </td>
   <td style="text-align:left;"> 46,605 </td>
   <td style="text-align:right;"> 5.71\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Or Unknown Weapon </td>
   <td style="text-align:left;"> 45,887 </td>
   <td style="text-align:right;"> 5.63\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shotgun </td>
   <td style="text-align:left;"> 37,038 </td>
   <td style="text-align:right;"> 4.54\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Blunt Object (E.g., Club/Blackjack/Brass Knuckles) </td>
   <td style="text-align:left;"> 35,157 </td>
   <td style="text-align:right;"> 4.31\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rifle </td>
   <td style="text-align:left;"> 28,672 </td>
   <td style="text-align:right;"> 3.52\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Knife Or Cutting Instrument </td>
   <td style="text-align:left;"> 16,091 </td>
   <td style="text-align:right;"> 1.97\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Strangulation - Includes Hanging </td>
   <td style="text-align:left;"> 9,778 </td>
   <td style="text-align:right;"> 1.20\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fire </td>
   <td style="text-align:left;"> 5,482 </td>
   <td style="text-align:right;"> 0.67\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Asphyxiation - Includes Death By Gas </td>
   <td style="text-align:left;"> 4,956 </td>
   <td style="text-align:right;"> 0.61\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Firearm </td>
   <td style="text-align:left;"> 3,892 </td>
   <td style="text-align:right;"> 0.48\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Drugs/Narcotics/Sleeping Pills </td>
   <td style="text-align:left;"> 3,834 </td>
   <td style="text-align:right;"> 0.47\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Drowning </td>
   <td style="text-align:left;"> 1,384 </td>
   <td style="text-align:right;"> 0.17\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poison - Does Not Include Gas </td>
   <td style="text-align:left;"> 568 </td>
   <td style="text-align:right;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Explosives </td>
   <td style="text-align:left;"> 385 </td>
   <td style="text-align:right;"> 0.05\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pushed Or Thrown Out of Window </td>
   <td style="text-align:left;"> 258 </td>
   <td style="text-align:right;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Narcotics Or Drugs </td>
   <td style="text-align:left;"> 48 </td>
   <td style="text-align:right;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Undocumented Code </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> 815,590 </td>
   <td style="text-align:right;"> 100\% </td>
  </tr>
</tbody>
</table>


You may have noticed from the table that AR-15 is not included. While AR-15 is the commonly discussed in the media and policy circles as a way to control gun violence, it is not in a category by itself. Instead it is combined with other rifles in the "rifle" weapon group, and makes up about 3.6% of the weapons used by offender #1 in the data. 

Let us check if AR-15s, through our rough proxy of the "rifle" weapon group, is getting more common over time. Figure \@ref(fig:shrRifle) shows the number of homicide incidents (including manslaughters, so not necessarily all murders) where offender #1 used a rifle. Figure \@ref(fig:shrRiflePercent) shows the percent of all homicide incidents where the the weapon was a rifle. Using both of these measures we can see the rifles are getting less common, declining substantially since 1980 though increasing again starting in the mid-2010s.  

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrRifle-1.png" alt="The annual number of homicide incidents where offender \#1's weapon was a rifle, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrRifle)The annual number of homicide incidents where offender \#1's weapon was a rifle, 1976-2023.</p>
</div>

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrRiflePercent-1.png" alt="The annual share of homicide incidents where offender \#1's weapon was a rifle, 1976-2023." width="100%" height="100%" />
<p class="caption">(\#fig:shrRiflePercent)The annual share of homicide incidents where offender \#1's weapon was a rifle, 1976-2023.</p>
</div>

Now, maybe this weapon is more commonly used in some types of crimes such as school shootings. You could get at that question using this data by seeing if times when a rifle is used that victims or offenders are younger or if the circumstance is something that suggests a school shooting. Unfortunately there is no offense location variable here, though there is in NIBRS and we can largely recreate this data through NIBRS. And of course you cannot tell if the weapon is actually an AR-15, only if it is a rifle.

#### Relationship between first victim and offenders

An interesting and highly useful variable is the relationship between the first victim and each offender. To be clear, this is only for the first victim; we do not have the relationship between other victims and offenders. However, as seen earlier, this is not *too much* of an issue since nearly all incidents only have a single victim. There are 29 possible relationship types (including "unknown" relationship) which are broken into three categories: legal family members, people known to the victim but who are not family, and people not known to the victim. Table \@ref(tab:shrRelationship) shows these relationships and the number and percent of homicides with these relationships. 

The most common relationship, with about 28% of homicides, is that the police do not know the relationship. So there is a good deal of uncertainty in the relationship between victims and offenders. Next is that the victim is the offender's acquaintance at 19.7% or is a stranger at 15.3%. The next is "other - known to victim" which is similar to being an acquaintance at almost 5% of homicides. This is followed by the victim being the friend of the murderer at 3.6%. The 6th most common relationship, at 3.6% is that the victim is the wife of the offender, so she is murdered by her husband, and is the first familial relationship of this list. The remaining relationships all make up fewer than 3% of all homicides. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:shrRelationship)The relationship between the first victim and the first offender in a homicide incident, 1976-2023.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Relationship </th>
   <th style="text-align:left;"> Category </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:right;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Relationship Unknown </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 307,131 </td>
   <td style="text-align:right;"> 37.66\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Acquaintance </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 159,491 </td>
   <td style="text-align:right;"> 19.56\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Stranger </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 124,083 </td>
   <td style="text-align:right;"> 15.21\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Otherwise Known </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 39,899 </td>
   <td style="text-align:right;"> 4.89\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Friend </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 29,310 </td>
   <td style="text-align:right;"> 3.59\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Wife </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 28,516 </td>
   <td style="text-align:right;"> 3.50\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Girlfriend </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 22,267 </td>
   <td style="text-align:right;"> 2.73\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Other Family </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 12,242 </td>
   <td style="text-align:right;"> 1.50\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Husband </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 12,219 </td>
   <td style="text-align:right;"> 1.50\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Son </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 11,837 </td>
   <td style="text-align:right;"> 1.45\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Boyfriend </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 10,332 </td>
   <td style="text-align:right;"> 1.27\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Daughter </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 8,414 </td>
   <td style="text-align:right;"> 1.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Neighbor </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 8,266 </td>
   <td style="text-align:right;"> 1.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Brother </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 7,209 </td>
   <td style="text-align:right;"> 0.88\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Father </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 5,936 </td>
   <td style="text-align:right;"> 0.73\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Mother </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 5,486 </td>
   <td style="text-align:right;"> 0.67\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was In-Law </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 4,694 </td>
   <td style="text-align:right;"> 0.58\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Common-Law Wife </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 3,350 </td>
   <td style="text-align:right;"> 0.41\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Common-Law Husband </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 2,736 </td>
   <td style="text-align:right;"> 0.34\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Ex-Wife </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 2,397 </td>
   <td style="text-align:right;"> 0.29\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Stepfather </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 1,915 </td>
   <td style="text-align:right;"> 0.23\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was In A Homosexual Relationship With The Offender </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 1,708 </td>
   <td style="text-align:right;"> 0.21\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Sister </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 1,567 </td>
   <td style="text-align:right;"> 0.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Stepson </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 1,530 </td>
   <td style="text-align:right;"> 0.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Ex-Husband </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 951 </td>
   <td style="text-align:right;"> 0.12\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Stepdaughter </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 808 </td>
   <td style="text-align:right;"> 0.10\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Employer </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 575 </td>
   <td style="text-align:right;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Employee </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 466 </td>
   <td style="text-align:right;"> 0.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Was Stepmother </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 255 </td>
   <td style="text-align:right;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 815,590 </td>
   <td style="text-align:right;"> 100\% </td>
  </tr>
</tbody>
</table>



#### Homicide circumstance {#circumstance}

We also have information on the type of the homicide, which this data calls the "circumstance." This comes as relatively broad categories that leave a lot to be desired in our understanding of what led to the homicide. Table \@ref(tab:shrCircumstance) shows the number and percent of each circumstance for the first victim of each homicide from 1976 to 2022. This data has 33 possible circumstances which it groups into four main categories: murders that coincide with committing another crime ("felony type" murders), murders that do not coincide with another crime ("non-felony type" murders), justifiable homicides, and negligent manslaughter. 

The felony type murders are simply ones where another crime occurred during the homicide. While this is called "felony type" it does include other crimes such as theft and gambling (which are not always a felony) so is a bit of a misnomer. The "non-felony type" are murders that happen without another crime. This includes gang killings (where, supposedly, only the murder occurred), children killed by babysitters, fights among intoxicated (both of alcohol and drugs) people, and "lover's triangle" killings.  Justifiable homicides are when a person (civilian or police officer) kill a person who is committing a crime. Negligent manslaughter includes accidental shootings such as when children find and shoot a gun, but excludes deaths from traffic accidents. 

The most common circumstances, accounting for 27.4%, 26.9%, and 12.5%, respectively, are "Unknown", "Other Arguments", and "Other Non-Felony Type - Not Specified." Since the data includes "Argument Over Money Or Property" as one category, the "Other Arguments" mean that it is an argument for a reason other than over money or property. The "Other Non-Felony Type" one does not mean that the murder did not occur alongside another crime, but also does not fall into the non-felony categories included. Robbery is the only remaining circumstance with more than 5% of murders, at 7.4%. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:shrCircumstance)The circumstance of the homicide for the first offender in a homicide incident.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Circumstance </th>
   <th style="text-align:left;"> Category </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:right;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Unknown </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 228,621 </td>
   <td style="text-align:right;"> 28.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Arguments </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 218,716 </td>
   <td style="text-align:right;"> 26.82\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Non-Felony Type - Not Specified </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 101,778 </td>
   <td style="text-align:right;"> 12.48\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Robbery </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 59,295 </td>
   <td style="text-align:right;"> 7.27\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Narcotic Drug Laws </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 29,109 </td>
   <td style="text-align:right;"> 3.57\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Juvenile Gang Killings </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 24,345 </td>
   <td style="text-align:right;"> 2.98\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Killed By Police </td>
   <td style="text-align:left;"> Justifiable Homicide </td>
   <td style="text-align:right;"> 18,039 </td>
   <td style="text-align:right;"> 2.21\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Felony Type - Not Specified </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 15,760 </td>
   <td style="text-align:right;"> 1.93\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brawl Due To Influence of Alcohol </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 15,235 </td>
   <td style="text-align:right;"> 1.87\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Argument Over Money Or Property </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 15,004 </td>
   <td style="text-align:right;"> 1.84\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Killed By Private Citizen </td>
   <td style="text-align:left;"> Justifiable Homicide </td>
   <td style="text-align:right;"> 14,627 </td>
   <td style="text-align:right;"> 1.79\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> All Suspected Felony Type </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 12,996 </td>
   <td style="text-align:right;"> 1.59\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> All Other Manslaughter By Negligence Except Traffic Deaths </td>
   <td style="text-align:left;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 10,983 </td>
   <td style="text-align:right;"> 1.35\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burglary </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 6,467 </td>
   <td style="text-align:right;"> 0.79\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Domestic Violence (Historically Called Lovers Triangle/Quarrel) </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 6,456 </td>
   <td style="text-align:right;"> 0.79\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gangland Killings </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 6,206 </td>
   <td style="text-align:right;"> 0.76\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brawl Due To Influence of Narcotics </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 4,715 </td>
   <td style="text-align:right;"> 0.58\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rape </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 4,160 </td>
   <td style="text-align:right;"> 0.51\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lovers Triangle </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 4,158 </td>
   <td style="text-align:right;"> 0.51\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Negligent Handling of Gun Which Resulted In Death of Another </td>
   <td style="text-align:left;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 4,111 </td>
   <td style="text-align:right;"> 0.50\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Arson </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 3,358 </td>
   <td style="text-align:right;"> 0.41\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Motor Vehicle Theft </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 1,554 </td>
   <td style="text-align:right;"> 0.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Children Playing With Gun </td>
   <td style="text-align:left;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 1,520 </td>
   <td style="text-align:right;"> 0.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Sex Offenses </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 1,440 </td>
   <td style="text-align:right;"> 0.18\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Institutional Killings </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 1,371 </td>
   <td style="text-align:right;"> 0.17\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Child Killed By Babysitter </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 1,353 </td>
   <td style="text-align:right;"> 0.17\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gambling </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 1,041 </td>
   <td style="text-align:right;"> 0.13\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Larceny </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 975 </td>
   <td style="text-align:right;"> 0.12\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Prostitution And Commercialized Vice </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 631 </td>
   <td style="text-align:right;"> 0.08\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other - Not Specified </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 554 </td>
   <td style="text-align:right;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sniper Attack </td>
   <td style="text-align:left;"> Non-Felony Type </td>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Shot In Hunting Accident </td>
   <td style="text-align:left;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 359 </td>
   <td style="text-align:right;"> 0.04\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gun Cleaning Death - Other Than Self-Inflicted </td>
   <td style="text-align:left;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 157 </td>
   <td style="text-align:right;"> 0.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Abortion </td>
   <td style="text-align:left;"> Felony Type </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Human Trafficking/Involuntary Servitude </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Human Trafficking/Commercial Sex Acts </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> 815,590 </td>
   <td style="text-align:right;"> 100\% </td>
  </tr>
</tbody>
</table>



#### Homicide subcircumstance

The "subcircumstance" just tells you more information about justifiable homicides. This includes the circumstance leading up to the "felon" - which is how the person killed is described, though technically they do not need to have committed a felony - was killed. It includes if this person attacked an officer (the one who killed them), a different officer, a civilian, or was committing or fleeing a crime. 

This data set is one source of information on how many people police kill each year. But it is a large undercount compared to other sources such as the Washington Post collection, so is not a very useful source of information on this topic. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:shrSubCircumstance)The circumstance for the first offender in a homicide incident in cases where the offender is killed. This includes incidents where the only person who dies in the offender.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Subcircumstance </th>
   <th style="text-align:left;"> # of Incidents </th>
   <th style="text-align:right;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Felon Killed In Commission of A Crime </td>
   <td style="text-align:left;"> 11,312 </td>
   <td style="text-align:right;"> 34.63\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Attacked Police Officer </td>
   <td style="text-align:left;"> 9,486 </td>
   <td style="text-align:right;"> 29.04\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Attacked A Civilian </td>
   <td style="text-align:left;"> 5,976 </td>
   <td style="text-align:right;"> 18.29\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Not Enough Information To Determine </td>
   <td style="text-align:left;"> 2,572 </td>
   <td style="text-align:right;"> 7.87\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Resisted Arrest </td>
   <td style="text-align:left;"> 1,296 </td>
   <td style="text-align:right;"> 3.97\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Attacked Fellow Police Officer </td>
   <td style="text-align:left;"> 1,175 </td>
   <td style="text-align:right;"> 3.60\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Attempted Flight From A Crime </td>
   <td style="text-align:left;"> 849 </td>
   <td style="text-align:right;"> 2.60\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> 32,666 </td>
   <td style="text-align:right;"> 100\% </td>
  </tr>
</tbody>
</table>



