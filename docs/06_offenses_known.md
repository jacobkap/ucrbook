# Offenses Known and Clearances by Arrest {#offensesKnown}






The Offenses Known and Clearances by Arrest data set - often called Return A, "Offenses Known" or, less commonly, OKCA - is the oldest and most commonly used data set and measures crimes reported to the police. For this reason it is used as the main measure of crime in the United States, and I tend to call it the "crimes data set." This data includes the monthly number of crimes reported to the police or otherwise known to the police (e.g. discovered while on patrol) for a small selection of crimes, as well as the number of crimes cleared by arrest or by "exceptional means" (a relatively flawed and manipulable measure of whether the case is "solved"). It also covers the number reported but found by police to have not occurred.  Since this data has monthly agency-level crime information it is often used to measure crime trends between police agencies and over time. The data uses something called a Hierarchy Rule which means that in incidents with multiple crimes, only the most serious is recorded - though in practice this affects only a small percent of cases, and primarily affects property crimes.

## Which crimes are included? {#indexCrimesOffensesKnown}

This data set contains information on the number of "Index Crimes" (sometimes called Part I crimes) reported to each agency. These index crimes are a collection of eight crimes that, for historical reasons based largely by perceived importance and reliable of their reporting in the 1920's when the UCR program was first developed, are used as the primary measure of crime today. Other data sets in the UCR, such as the Arrests by Age, Sex, and Race data and the Hate Crime data have more crimes reported. 

The crimes are, in order by the Hierarchy Rule (which we'll discuss next):
    
1. Homicide     
    + Murder and non-negligent manslaughter  
    + Manslaughter by negligence 
2. Rape     
    + Rape     
    + Attempted rape     
3. Robbery     
    + With a firearm     
    + With a knife of cutting instrument     
    + With a dangerous weapon not otherwise specified     
    + Unarmed - using hands, fists, feet, etc.     
4. Aggravated Assault (assault with a weapon or with the intent to cause serious bodily injury)     
    + With a firearm     
    + With a knife of cutting instrument     
    + With a dangerous weapon not otherwise specified     
    + Unarmed - using hands, fists, feet, etc.     
5. Burglary     
    + With forcible entry     
    + Without forcible entry      
    + Attempted burglary with forcible entry     
6. Theft (other than of a motor vehicle)     
7. Motor Vehicle Theft     
    + Cars     
    + Trucks and buses     
    + Other vehicles          
8. Arson     
9. Simple Assault     

Arson is considered an index crime but is not reported in this data - you need to use the separate Arson data set of the UCR to get access to arson counts. See Chapter \@ref(arsonChapter) for an overview of the Arson data. The ninth crime on that list, simple assault, is not considered an index crime but is nevertheless included in this data. 

Each of the crimes in the list above, and their subcategories, are included in the UCR data. In most news and academic articles, however, you'll see them reported as the total number of index crimes, summing up categories 1-7 and reporting that as "crime." These index crimes are often divided into violent index crimes - murder, rape, robbery, and aggravated assault - and property index crimes - burglary, theft, motor vehicle theft. For more on index crimes, and the drawbacks of using them, please see Section \@ref(indexCrimes).

### Hierarchy Rule {#hierarchy}

This data set uses what is called the Hierarchy Rule where only the most serious crime in an incident is reported (except for motor vehicle theft and arson, which are always included). For example if there is an incident where the victim is robbed and then murdered, only the murder is counted as it is considered more serious than the robbery. That the data uses the Hierarchy Rule is an oft-cited (by academics, reporters, random people on Twitter) criticism of the data that is, in my opinion, overblown. 

In practice, the Hierarchy Rule has only modest effects on the data, undercounting few crimes. Though the Hierarchy Rule does mean this data is an undercount, data from other sources indicate that it isn't much of an under count. The FBI's other data set, the National Incident-Based Reporting System (NIBRS) contains every crime that occurs in an incident (i.e. it doesn't use the Hierarchy Rule). Using this we can measure how many crimes the Hierarchy Rule excludes (Most major cities do not report to NIBRS so what we find in NIBRS may not apply to them). In over 90% of incidents, only one crime is committed. Additionally, when people talk about "crime" they usually mean murder which, while incomplete to discuss crime, means the UCR data here is accurate on that measure.

The FBI also released a report [available here](https://ucr.fbi.gov/nibrs/2014/resource-pages/effects_of_nibrs_on_crime_statistics_final.pdf) in 2015 that directly examined this issue by taking NIBRS data from 2014 and examined how NIBRS data (which includes all crimes) compares to using the Hierarchy Rule and keeping only the most serious crime. Figure \@ref(fig:fbiHierarchy) is a screenshot from their report showing the percent increases in crimes when including all crimes in an incident relative to following the Hierarchy Rule. They find that 10.6% of incidents have multiple crimes occurring, which is similar to other years of data that I have examined myself. For violent crime, murder and rape have no change; for the remaining violent crimes - robbery and aggravated assault - crimes increased by 0.6%.^[Murder is not shown in this figure since murder is always reported so cannot change.] Burglary increased by 1% and the largest increases came from theft and motor vehicle theft, increasing by 2.6% and 2.7%, respectively. Curiously motor vehicle theft increased even though the FBI's documentation for this data says that it is exempt from the Hierarchy Rule and should always be reported. This suggests either non-compliance or that the manual is incorrect.

<div class="figure" style="text-align: center">
<img src="images/fbi_hierarchy.PNG" alt="The FBI's findings of how crime reporting changes when using the Hierarchy Rule using NIBRS 2014 data." width="90%" />
<p class="caption">(\#fig:fbiHierarchy)The FBI's findings of how crime reporting changes when using the Hierarchy Rule using NIBRS 2014 data.</p>
</div>

So using the Hierarchy Rule does undercount crime, but this is a small undercounting and is primarily led by property crime. Violent crime is only slightly undercounted. Please keep in mind that this is for crimes that the police record and is unaffected by outside decisions like what the district attorney charges or what the defendant is ultimately convicted of. 

## Agencies reporting

Figure \@ref(fig:offensesAgenciesReporting) shows the annual number of police agencies that reported at least one month that year. With data starting in 1960, there were a little under 7,500 agencies reporting a year until 1970 when the number of agencies began increasing. This continued until the late 1970s when about 14,000 agencies reported, and this remained steady for over a decade before declining in the 1990s until about 12,500 in the latter half of the decade. Then the number of agencies reporting increased steadily until about 16,500 agencies reported in 2010. The number of agencies has slowly increased since then, adding a few hundred agencies from 2010 to 2018. While this data is available through 2019, this graph only shows data through 2018. As this graph shows agencies that report at least one month, it overcounts reporting agencies as some report fewer than every month in the year. Agencies that do report, however, tend to report all 12 months of the year so this problem is not necessarily serious, though it depends on the agencies you're looking at. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/offensesAgenciesReporting-1.png" alt="The annual number of agencies reporting to the Offenses Known and Clearances by Arrest data set. Reporting is based on the agency reporting at least one month of data in that year." width="90%" />
<p class="caption">(\#fig:offensesAgenciesReporting)The annual number of agencies reporting to the Offenses Known and Clearances by Arrest data set. Reporting is based on the agency reporting at least one month of data in that year.</p>
</div>

Figure \@ref(fig:offensesbigAgenciesReporting) repeats the above figure but now including only agencies with 100,000 people or more in their jurisdiction. While these agencies have a far more linear trend than all agencies, the basic lesson is the same: recent data has most agencies reporting; old data excludes many agencies. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/offensesbigAgenciesReporting-1.png" alt="The annual number of agencies with a population of 100,000 or higher reporting to the Offenses Known and Clearances by Arrest data set. Reporting is based on the agency reporting at least one month of data in that year." width="90%" />
<p class="caption">(\#fig:offensesbigAgenciesReporting)The annual number of agencies with a population of 100,000 or higher reporting to the Offenses Known and Clearances by Arrest data set. Reporting is based on the agency reporting at least one month of data in that year.</p>
</div>

## Important variables

For each crime we have four different categories indicating the number of crimes actually committed, the number cleared, and the number determined to not have occurred. Like other UCR data, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. 

### Actual crimes {#actual}

This is the number of offenses that *actually* occurred - where *actually* means that a police investigation found that the crime report was accurate. Crimes that are reported that the police find did not occur (e.g. report of an arson but turns that the fire began accidentally) are called "unfounded" crimes. So this variable is the one people use to measure *crime*. For example if 10 people are murdered in a city the number of "actual murders" would be 10. A crime is a crime incident, regardless of how many offenders there were. If there are multiple victims in a case, such as a double murder, then it would count as multiple crimes.

### Total cleared crimes {#clearedCrimes}

A crime is cleared when an offender is arrested or when the case is considered cleared by exceptional means. To be more specific, this data counts crime as a crime incident, regardless of the number of offenders. For example, if 3 people robbed a person, that is one crime of robbery, not 3 separate crimes. This crime is cleared when one of the three robbers is arrested - no matter the outcome for the other two robbers. Arresting all 3 still counts as a single robbery cleared.

Even though this data set is formally named "Offenses Known and Clearances by Arrest" it does include clearances where no one is arrested, which are called "exceptional clearances" or "clearances by exceptional means." For exceptional clearances, police must have identified the offender, have sufficient evidence to arrest that offender, know where they are (so they can actually be apprehended) and only then be unable to make the arrest. Exceptional clearances include cases where the offender dies before an arrest (by any means, including suicide, accidental, illness, killed by someone including a police officer) or when the police are unable to arrest the person since they are already in custody by another jurisdiction (including out of the country or in custody of another agency) and extradition is denied. Two other potential causes of exceptional clearance are when prosecution of the case cannot go forward because the district attorney refuses to prosecute the case, for reasons other than lack of evidence, or when a victim refuses to assist the prosecution in the case. 

Unfortunately, this data does not differentiate between clearances by arrest or by exceptional means so there's no way to determine how many clearances mean the offender is actually arrested - and even more problematic, how many clearances have all of the offenders arrested.^[NIBRS data does differentiate these types of clearances] There is also evidence that police agencies report classify large numbers of clearances as clearances through exception means (again, we have no way to tell which is which using this data) even though exceptional clearances should be rare given that times where the offender is known but cannot be arrested are likely far less common than when they are arrested. This is particularly a problem in the case of rapes where in some cases there are far more exceptional clearances than clearances by arrest [@yeung2018comes]. For an excellent investigation into this issue, please read the @yeung2018comes article available on ProPublica's website [here](https://www.propublica.org/article/when-it-comes-to-rape-just-because-a-case-is-cleared-does-not-mean-solved)

Clearances are reported in the month that they occur, regardless of when the crime they are clearing occurred. In practice, however, most crimes are cleared in the month that they occur. According to the 2019 NIBRS, it takes on average 7 days between the incident and the arrest (median = 0 days) date when averaging across all crimes - for individual crimes these values will be different. This means that most of the clearances will be for the same month as the initial crime - though less so as the month comes to a close. Of course, police agencies can solve older cases - and even target cold cases to be solved - so this is still a degree of uncertainty for which month these clearances are for. 

Still, there are occasionally months - and even years - where there are more reported crimes cleared than crimes that occur. Figure \@ref(fig:montgomeryClearances) shows the number of actual and cleared murders from the Montgomery County Police Department in Maryland. Several years have more murders cleared than were committed - a sign that the month of clearance does not correspond to the month of occurrence, rather than the police solving crime before it happened.^[The Minority Report is not yet a documentary.]

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/montgomeryClearances-1.png" alt="The annual number of actual and cleared murders from the Montgomery County Police Department, MD, 1960-2022." width="90%" />
<p class="caption">(\#fig:montgomeryClearances)The annual number of actual and cleared murders from the Montgomery County Police Department, MD, 1960-2022.</p>
</div>

### Crimes cleared where all offenders are under 18 years old

This variable is a subset of the Total Cleared variable and only includes clearances for offenses in which **every** offender is younger than age 18. Since this requires that the police know, or at least believe, the age of every offender, it is probably highly inaccurate. This category includes cases where the juvenile is given a citation to show up in court for their trial and is not formally arrested and taken into custody. 

### Unfounded crimes

An unfounded crime is one in which a police investigation has determined that the reported crime did not actually happen. For example I observed during a ride-along a report of a burglary where the homeowners said that they came home, and the front door was open and they thought it might have been their son who forgot to close it but were worried that it could be a burglar, so they called the police just in case. This would be recorded as a burglary and if it turned out to be the son, the police would then record this as an unfounded burglary. 

Other unfounded crimes would include when someone reports a crime but later says that the report wasn't true. For example, a person could report a burglary to the police to collect insurance money on the items they claim was stolen. If the police discover this they would unfound the case - and the lying to the police and fraud would not be counted as neither of those are crimes included in this data set. Unfounding crimes are especially common for rapes. If a person reports that they were raped and then later say that this report isn't true - and doing so is relatively common, especially for child sexual abuse victims, even when the rape did actually happen - then the police will unfound the case. 

Figure \@ref(fig:phillyRapeUnfound) provides one example of this by showing the number of actual - that is, rapes that the police say actually occurred - and unfounded rapes annually from 1960-2022 in Philadelphia, PA. Interestingly, the spike in actual rapes in 2013 due to the new rape definition that year (discussed below) does not correspond to a spike in unfounded rapes - which suggests that this variable is not being reported properly. It is unlikely that the number of rapes would spike so much without any corresponding increase - and an actual decrease - in unfounded rapes. Since unfounded rapes are so common, especially compared to other crimes - and evidence that police also misreport clearances for rape - this variable is likely to be manipulated by the police to make it appear that there are fewer rapes than there actually is. As such, this variable - and relatedly the actual crimes variable" is not reliable, especially for rapes. How unreliable, of course depends on the specific offense and the agency reporting. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/phillyRapeUnfound-1.png" alt="The annual number of actual and unfounded rapes in Philadelphia, PA, 1960-2022." width="90%" />
<p class="caption">(\#fig:phillyRapeUnfound)The annual number of actual and unfounded rapes in Philadelphia, PA, 1960-2022.</p>
</div>

Another way to look at this data is the percent of rapes that were unfounded. Since unfounded and actual rapes are distinct categories, we'll need to divide unfounded rapes by the sum of actual and unfounded rapes and then multiple the result by 100. Please note that unfounding occurs in the month the police discover the case to be unfounded, it is not tied to the month of the original report. So this graph isn't really showing the percent that year that were unfounded - but for our purposes of getting a general sense it is acceptable. Usually about 10% of reported rapes are unfounded in Philadelphia. The 44% in 1983, the first year with data, is probably high due to it accounting for unfounded cases in previous years that weren't reported in the data until 1983. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/phillyRapeUnfoundPercent-1.png" alt="The percent of reported rapes that the police recorded as unfounded in Philadelphia, PA, 1960-2022." width="90%" />
<p class="caption">(\#fig:phillyRapeUnfoundPercent)The percent of reported rapes that the police recorded as unfounded in Philadelphia, PA, 1960-2022.</p>
</div>

As a comparison, Figure \@ref(fig:phillyRobberyUnfoundPercent) shows the percent of robberies that are recorded as unfounded in Philadelphia over the same time period. While the percent has been increasing, for most of the data it is under 1% and never exceeds 3%. To me this suggests that the Philly Police, and they aren't unique, are overcounting rapes as unfounded to improve their rape statistic data. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/phillyRobberyUnfoundPercent-1.png" alt="The percent of reported robberies that the police recorded as unfounded in Philadelphia, PA, 1960-2022." width="90%" />
<p class="caption">(\#fig:phillyRobberyUnfoundPercent)The percent of reported robberies that the police recorded as unfounded in Philadelphia, PA, 1960-2022.</p>
</div>

## Important issues

### Rape definition change

The FBI changed the definition of rape for UCR data starting in 2013 to a broader definition than the older definition, which is commonly called the "legacy definition" or "legacy" or "historical" rape. The legacy definition is "the carnal knowledge of a female **forcibly** and against her will" (emphasis added). This means that only rape is only included in UCR data when it is a female (or any age, there is no differentiation for child victims) forcibly vaginally penetrated by a penis. This is a narrow definition and excludes a number of sexual acts that people may consider rape such as forced oral or anal sex, and cases with a male victim. 

The new (and current) definition "penetration, no matter how slight, of the vagina or anus with any body part or object, or oral penetration by a sex organ of another person, without the consent of the victim." Starting in 2013, rape has a new, broader definition in the UCR to include oral and anal penetration (by a body part or object) and to allow men to be victims. The new definition is: "Penetration, no matter how slight, of the vagina or anus with any body part or object, or oral penetration by a sex organ of another person, without the consent of the victim." The previous definition included only forcible intercourse against a woman. This definition is far broader and is effectively any non-consensual sexual act. It also includes male victims though the data does not differentiate between male or female (or any other gender) victims. 
 
Both the current and legacy definitions exclude statutory rape and incest other than forcible incest. They both also include lack of consent as cases where the victim cannot give consent, such as if they are too young or are mentally or physically incapacitated - the FBI specifically give the example of being temporarily incapacitated through drugs or alcohol.

As this revised definition is broader than the original one post-2013, rape data is not comparable to pre-2013 data. 2013, however, is simply the year that the FBI changed the definition which means that agencies should have changed their reporting to the new definition. As might not be too surprising, not all agencies followed this requirement. We'll look at four examples to show when there is clear evidence that the agency did change their definition in 2013, when it's clear they did so a year later, when it's unclear exactly when they made the change, and when the agency seems to not follow the change at all. 

We'll start with the Philadelphia Police Department in Philadelphia, PA, shown in Figure \@ref(fig:rapePhilly) which shows the annual number of rapes from 2000-2018. It's declining slowly but steadily over the 2000-2012 time period until spiking sharply in 2013. Since the rape definition change in 2013 is far broader than previous year's definition, this makes sense. A broader definition should lead to a sudden increase in reported rapes if the agency is reporting correctly. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/rapePhilly-1.png" alt="The annual number of rapes reported in Philadelphia, Pennsylvania, 2000-2018." width="90%" />
<p class="caption">(\#fig:rapePhilly)The annual number of rapes reported in Philadelphia, Pennsylvania, 2000-2018.</p>
</div>

In comparison, New York City has the sudden spike a year later, which indicates that they didn't start using the new definition until 2014. Figure \@ref(fig:rapeNYC) shows that rape is fairly steady, though increasing, in the years leading up to 2013 and has almost no change from 2012 to 2013, but a huge increase in 2014 and then steadily increases from there, spiking again in 2018. This seems like a fairly clear indicator that NYC simply didn't follow the new definition until 2014. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/rapeNYC-1.png" alt="The annual number of rapes reported in New York City, 2000-2018." width="90%" />
<p class="caption">(\#fig:rapeNYC)The annual number of rapes reported in New York City, 2000-2018.</p>
</div>

Less clear is what's happening in San Francisco, California, shown in Figure \@ref(fig:rapeLA). 
Here we do see an increase in 2013 which while it appears small on the graph is actually a 49% increase from 2012. Then there is a much larger spike in 2014 - a 120% increase - which may suggest that part of the agency started following the new definition in 2013 and the remainder followed in 2014. However, large increases or decreases are relatively common in San Francisco so it could also be that the agency only switched to the new definition in 2014 and the spike in 2013 is just a coincidence.

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/rapeLA-1.png" alt="The annual number of rapes reported in San Francisco, California, 2000-2018." width="90%" />
<p class="caption">(\#fig:rapeLA)The annual number of rapes reported in San Francisco, California, 2000-2018.</p>
</div>

Finally, we'll look at Jackson Police Department in Mississippi where the definition change seems to have had no effect. As seen in Figure \@ref(fig:rapeJackson), reported rapes start to undulate in 2010 with 2013 data perfectly in line with the before and after trends - no sign that there is a change in reporting. This suggests that Jackson simply did not follow the definition change and continues to report using the old definition. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/rapeJackson-1.png" alt="The annual number of rapes reported in Jackson, Mississippi, 2000-2018." width="90%" />
<p class="caption">(\#fig:rapeJackson)The annual number of rapes reported in Jackson, Mississippi, 2000-2018.</p>
</div>

My takeaway from this is that rape should not be used at all for years after 2012. While the definition change makes pre-2013 and 2013+ years non-comparable, the differences in agency responses to this change - i.e. if they follow the rules or not - is such a mess that the data is too flawed to use. 

### The decline of manslaughter

This data contains two different crime subcategories for homicide: murder and non-negligent manslaughter, and manslaughter by negligence. The first is our measure of murder, and it includes everything we traditionally think of when it comes to murder - shootings, stabbings, strangulation, basically any intentional killing of another person.^[Attempted murder is usually classified as an aggravated assault.] Suicides, killing a fetus, and accidental killings (e.g. car crashes) are not considered murders.^[Even the intentional killing of a fetus is classified as an aggravated assault against the mother, not a murder of the fetus.] The second, manslaughter by negligence - usually called just "manslaughter" - is when someone kills another person through "gross negligence" but does not kill them intentionally. This can include accidental killings when the death was caused by gross negligence. The FBI provide examples of this as kids playing with guns and shooting each other (and not knowing the gun was loaded) or a hunter accidentally shooting someone while hunting. After the late 1970s this excludes deaths from traffic accidents caused by negligence, such as hit and runs or DUIs. However, prior to this, these deaths were included, which is the cause of the very high number of manslaughters in the 1960s and 1970s.

Figure \@ref(fig:manslaughterVsMurder) shows the annual number of murders, manslaughter, and the sum of the two nationwide from 1960-2022. This just sums up the total reported counts from every agency each year so part of the increase is simply due to more agencies reporting as the year gets closer to the present day - so please pay attention to the diverging paths of each crime, not the trend for the individual crime over time. Murder is always more common than manslaughter but these values are not that far apart in the early decade of data and manslaughter doesn't become rare until the end of the 1970s. 

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/manslaughterVsMurder-1.png" alt="The annual number of murder and non-negligent manslaughter, manslaughter by negligence, and the sum of the two, nationwide from 1960-2022." width="90%" />
<p class="caption">(\#fig:manslaughterVsMurder)The annual number of murder and non-negligent manslaughter, manslaughter by negligence, and the sum of the two, nationwide from 1960-2022.</p>
</div>

Figure \@ref(fig:manslaughterPercent) shows another way to look at this data: manslaughter as a percent of reported murder. In the early years of our data manslaughter was fairly common, with about 70-80% as many manslaughters reported as murders. This declined sharply in the mid-1960s until there were around 45% as many manslaughters as murders in the mid-1970s. Again this declined until it was about 4% in 1980, and it has remained around there ever since. As police behavior could reduce traffic fatalities - and arrests for DUIs and traffic tickets are designed to improve public safety - it is unfortunate the we no longer have data on traffic deaths.

<div class="figure" style="text-align: center">
<img src="06_offenses_known_files/figure-html/manslaughterPercent-1.png" alt="Reported manslaughter by negligence as a percent of reported murder and non-negligent manslaughter, nationwide 1960-2022." width="90%" />
<p class="caption">(\#fig:manslaughterPercent)Reported manslaughter by negligence as a percent of reported murder and non-negligent manslaughter, nationwide 1960-2022.</p>
</div>

