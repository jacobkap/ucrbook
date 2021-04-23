# Arrests by Age, Sex, and Race {#arrests}




```
#>             used   (Mb) gc trigger    (Mb)   max used    (Mb)
#> Ncells   1098113   58.7    2207665   118.0    1244675    66.5
#> Vcells 751971184 5737.1 1568334956 11965.5 1502146129 11460.5
#>              used   (Mb) gc trigger    (Mb)   max used    (Mb)
#> Ncells    1099822   58.8    2207665   118.0    1244675    66.5
#> Vcells 1287290767 9821.3 1884404238 14376.9 1822644334 13905.7
```


The Arrests by Age, Sex, and Race dataset - often called ASR, or the "arrests data", or the "Arrests by Age, Sex, Race, and Ethnicity (ASRE) though this is really misleading since most years don't even report ethnicity data - includes the monthly number of arrests for a variety of crimes and, unlike the crime data, breaks down this data by age and gender. This data includes a broader number of crime categories than the crime dataset (the Offenses Known and Clearances by Arrest data) though is less detailed on violent crimes since it does not breakdown aggravated assault or robberies by weapon type as the Offenses Known data does. For each crime it says the number of arrests for each gender-age group with younger ages (15-24) showing the arrestee's age to the year (e.g. age 16) and other ages grouping years together (e.g. age 25-29, 30-34, "under 10"). It also breaks down arrests by race-age by including the number of arrestees of each race (American Indian, Asian, Black, and White) are the only included races) and if the arrestee is a juvenile (<18 years old) or an adult. The data does technically include a breakdown by ethnicity-age (e.g. juvenile-Hispanic, juvenile-non-Hispanic) but almost no agencies report this data (for many years zero agencies report ethnicity) so in practice the data does not include ethnicity. As the data includes counts of arrestees, people who are arrested multiple times are included in the data multiple times - it is not a measure of unique arrestees. 

## Agencies reporting

<div class="figure" style="text-align: center">
<img src="arrests_files/figure-html/arrestsAgenciesReporting-1.png" alt="The annual number of agencies reporting at least one month of data in that year." width="90%" />
<p class="caption">(\#fig:arrestsAgenciesReporting)The annual number of agencies reporting at least one month of data in that year.</p>
</div>


<div class="figure" style="text-align: center">
<img src="arrests_files/figure-html/arrestsAgenciesReporting12Months-1.png" alt="The annual number of agencies reporting 12 months of data in that year." width="90%" />
<p class="caption">(\#fig:arrestsAgenciesReporting12Months)The annual number of agencies reporting 12 months of data in that year.</p>
</div>

## What is an arrest? (what unit is this data in?)

### The Hierarchy Rule



## Crimes included

1. Homicide
  + Murder and non-negligent manslaughter
  + Manslaughter by negligence
2. Rape
3. Robbery
4. Aggravated assault
5. Burglary 
6. Theft (other than of a motor vehicle)
7. Motor vehicle theft
8. Simple assault
9. Arson
10. Forgery and counterfeiting
11. Fraud
12. Embezzlement
13. Stolen property - buying, receiving, and possessing
14. Vandalism
15. Weapons offenses - carrying, possessing, etc.
16. Prostitution and commercialized vice
17. Sex offenses - other than rape or prostitution
18. Drug abuse violations - total
  + Drug sale or manufacturing
    - Opium and cocaine, and their derivatives (including morphine and heroin)
    - Marijuana
    - Synthetic narcotics
    - Other dangerous non-narcotic drugs
  + Drug possession
    - Opium and cocaine, and their derivatives (including morphine and heroin)
    - Marijuana
    - Synthetic narcotics
    - Other dangerous non-narcotic drugs
19. Gambling - total
  + Bookmaking - horse and sports
  + Number and lottery
  + All other gambling
20. Offenses against family and children - nonviolent acts against family members. Includes neglect or abuse, nonpayment of child support or alimony.
21. Driving under the influence (DUI)
22. Liquor law violations - Includes illegal production, possession (e.g. underage) or sale of alcohol, open container, or public use laws. Does not include DUIs and drunkenness.
23. Drunkenness - i.e. public intoxication
24. Disorderly conduct
25. Vagrancy - includes begging, loitering (for adults only), homelessness, and being a "suspicious person."
26. All other offenses (other than traffic) - a catch-all category for any arrest that is not otherwise specified in this list. Does not include traffic offenses. Very wide variety of crimes are included - use caution when using!
27. Suspicion - "Arrested for no specific offense and released without formal charges being placed."
28. Curfew and loitering law violations - for minors only.
29. Runaways - for minors only.

### Age

For each crime the data provides the number of people of each gender by age, with several years in the peak offending age given as the specific age and younger and older ages broken into groups. Only female and male genders are available, and there is no variable for "unknown" gender. So to get a total arrests for that crime for that age, just add the female and male variables together. 

* Female
    + Under 10
    + 10-12
    + 13-14
    + 15
    + 16
    + 17
    + 18
    + 19
    + 20
    + 21
    + 22
    + 23
    + 24
    + 25-29
    + 30-34
    + 35-39
    + 40-44
    + 45-49
    + 50-54
    + 55-59
    + 60-64
    + 65 and older
* Male
    + Under 10
    + 10-12
    + 13-14
    + 15
    + 16
    + 17
    + 18
    + 19
    + 20
    + 21
    + 22
    + 23
    + 24
    + 25-29
    + 30-34
    + 35-39
    + 40-44
    + 45-49
    + 50-54
    + 55-59
    + 60-64
    + 65 and older

### Race

The data also breaks down the number of arrests for each crime by race, with the only included races being American Indian, Asian, Black, and White. This is further broken down into if the arrestee was an adult (18 years or older) or a juvenile (under 18).  Whether the arrestee is Hispanic is in a separate (and nearly universally non-reported variable). Since the ethnicity variable is separate, and since the data is not at the arrestee-level unit, there's no way to interact the race and ethnicity variables. So, for example, there is no way to determine how many White-Hispanic or White-Non-Hispanic arrestees. Just total White arrestees and total Hispanic arrestees. 

As with race variables in other UCR datasets - and, really, any dataset - you should be cautious about using this variables since it is the officer's perception of the arrestee's race - though of course some arrests do have other data about the arrestee's race such as what they tell the officer. 

Even though there is information about the specific age of arrestee (or the age range, depending on the arrestee's age) and their gender, there is no gender information combined with race and no age beyond the adult/juvenile binary. If you add up all arrests that are broken down by gender-age and compare it to the sum of all of the arrests broken down by adult/juvenile-race here, in some cases these numbers don't add up. That's because while most agencies do report the age variables, not all agencies report the race variables. So summing up the race variables will actually undercount the total number of arrests. 

* Adult
    + American Indian
    + Asian
    + Black
    + White
* Juvenile
    + American Indian
    + Asian
    + Black
    + White
  
### Ethnicity

* Adult
    + Hispanic
    + Non-Hispanic
* Juvenile
    + Hispanic
    + Non-Hispanic
    
<div class="figure" style="text-align: center">
<img src="arrests_files/figure-html/theftHispanic-1.png" alt="The national annual number of Hispanic arrestees for theft. This includes all agencies that year that reporting any number of months. Hispanic arrestees include both juvenile and adult arrestees" width="90%" />
<p class="caption">(\#fig:theftHispanic)The national annual number of Hispanic arrestees for theft. This includes all agencies that year that reporting any number of months. Hispanic arrestees include both juvenile and adult arrestees</p>
</div>

### Juvenile referrals
