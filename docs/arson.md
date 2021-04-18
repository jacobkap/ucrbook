# Arson






The arson dataset provides monthly counts at the police agency-level for arsons that occur, and includes a breakdown of arsons by the type of arson (e.g. arson of a person's home, arson of a vehicle, arson of a community/public building) and the estimated value of the damage caused by the arson. This data includes all arsons reported to the police or otherwise known to the police (e.g. discovered while on patrol) and also has a count of arsons that lead to an arrest (of at least one person who committed the arson) and reports that turned out to not be arsons (such as if an investigation found that the fire was started accidentally). 

For each type of arson it includes the number of arsons where the structure was uninhabited or otherwise not in use, so you can estimate the percent of arsons of buildings which had the potential to harm people. This measure is for structures where people normally did not inhabit the structure - such as a vacant building where no one lives. A home where no one is home *at the time of the arson* does not count as an uninhabited building.

In cases where the arson led to a death, that death would be recorded as a murder on the Offenses Known and Clearances by Arrest dataset - but not indicated anywhere on this dataset. If an individual who responds to the arson dies because of it, such as a police officer or a firefighter, this is not considered a homicide (though the officer death is still included in the Law Enforcement Officers Killed and Assaulted data) unless the arsonists intended to cause their deaths. Even though the UCR uses the Hierarchy Rule, where only the most serious offense that occurs is recorded, all arsons are reported - arson is exempt from the Hierarchy Rule. 

## Agencies reporting

Figure \@ref(fig:arsonAgencies) shows the annual number of police agencies that reported at least one month that year. With data starting in 1979, there were a little over 12,000 agencies reporting a year until the early 2000s where it recovered from a sharp drop in agencies to steadily increase to about 16,000 a year. While arson data is available through 2019, this graph only shows data through 2018. 

<div class="figure">
<img src="arson_files/figure-html/arsonAgencies-1.png" alt="The annual number of police agencies that report at least month of data that year." width="672" />
<p class="caption">(\#fig:arsonAgencies)The annual number of police agencies that report at least month of data that year.</p>
</div>

## Important variables

Similar to the Offenses Known and Clearances by Arrest data, which is covered in Chapter \@ref(offenses_known), this data shows the monthly number of crimes - in this case only arsons - reported or discovered by the police, the number found by police to be unfounded, and the number cleared by the police. In addition, it includes the number of arsons in structures that were uninhabited, and the estimated cost of the damage caused by the arsons. For each variable, the arsons also broken into several categories of arsons, which we'll talk about in Section \@ref(arsonType). Like other UCR data, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. 

### Actual arsons

This variable includes the number of arsons either reported to the police or otherwise known to the police in that month and that the police determine to actually be arsons - that is, reports that are not unfounded. This is based only on the police's determination that an arson occurred, not the decision of other groups like a court or the conviction of someone for the crime. 

### Unfounded arsons

This variable shows the number of arsons reports that the police determined to not actually be arsons. For example, if a house burns down and police think it was arson but later determine that it was an accident, it would be an unfounded arson. 

### Reported arsons

This variable is the sum of actual arsons and unfounded arsons - it is the total number of arsons that were reported or known to the police, even if a later investigation found that it wasn't actually an arson. Since this is the sum of two already present variables - and is less informative than the two variables are as separate variables - I'm not exactly sure why it's included.

### Cleared arsons

This shows the number of arsons where at least one offender is arrested or when an arrest cannot be made for some reason but the police know who the offender is - the latter option is called "exceptional clearances" or "clearances by exceptional means." There is no way to tell if an clearance is due to an arrest or due to exceptional means.^[NIBRS data does tell more information about the type of arrest, but UCR data does not]. 

For exceptional clearances, police must have identified the offender, have sufficient evidence to arrest that offender, know where they are (so they can actually be apprehended) and only then be unable to make the arrest. Exceptional clearances include cases where the offender dies before an arrest (by any means, including suicide, accidental, illness, killed by someone including a police officer) or when the police are unable to arrest the person since they are already in custody by another jurisdiction (including out of the country or in custody of another agency) and extradition is denied. Two other potential causes of exceptional clearance is when prosecution of the case cannot go forward because the district attorney refuses to prosecute the case, for reasons other than lack of evidence, or when a victim refuses to assist the prosecution in the case. 

Please note that this data is at the incident-level which means that having multiple people arrested for an incident still only is a clearance for that single incident. Clearances are also reported in the month they occur, not in the month that the initial crime happened. This can lead to cases where there are more clearances than crimes, incorrectly leading to the conclusion that police solve >100% of crimes. 

Figure \@ref(fig:arsonClearance) shows the number of actual arsons (reports that are founded) and clearances for single-family home arsons in League City, Texas, a city of about 100,000 outside of Houston. In most years there were fewer clearances than arsons, but in four years (1982, 1981, 1992, and 2007) there were more clearances than arsons. This is simply because clearances are reported in the month they occur, regardless of when the arson they are clearance occurred. 

<div class="figure">
<img src="arson_files/figure-html/arsonClearance-1.png" alt="The annual number of single-family home arsons and clearances in League City, Texas." width="672" />
<p class="caption">(\#fig:arsonClearance)The annual number of single-family home arsons and clearances in League City, Texas.</p>
</div>

It is rare that there are more clearances than crimes in a given month though this is partially just due to few cases every being cleared. According to the 2019 NIBRS, it takes on average 7 days between the incident and the arrest (median = 0 days) for all crimes, and an average of 11.6 days from incident to arrest for arsons specifically (median = 0 days) for offenders who get arrested. This means that most clearances will be for crimes committed that month, though certainly not all. Therefore, use caution when trying to use this variable to measure crime clearance rates. 

### Cleared for arsons where all offenders are under age 18

This variable is the same for normal clearances but only for arsons where every offender is under the age of 18. In these cases a clearance by arrest can include citing the juvenile offender with an order to go to court to stand trial, even if the juvenile is not actually taken into police custody. As this variable requires that the police know every offender (to be able to determine that they are all under 18), it is likely highly flawed and not a very useful variable to use. 

### Uninhabited building arsons

This data also includes the number of arsons that occur in uninhabited structures. These structures must be uninhabited in the long-term, not simply having no one inside them when the arson occurs. The FBI defines these are structures that are "uninhabited, abandoned, deserted, or not normally in use." at the time of the arson. For example, a vacation home whose owners aren't living in at the time would be "not normally in use" so would be an uninhabited building. A business that is closed when the fire started, but is open during the day, is not an uninhabited building. 

### Estimated damage cost

The final variable is the estimated cost of the arson. This is how much the police estimates the value (in dollars) of the damaged or destroyed property is. Since this is the value of property damage, injuries to people (including non-physical injuries such as trauma or mental health costs) are not included. Since this is estimated damage it may be inaccurate to some degree. This variable is the sum of monthly estimated cost so while you can get the average cost by dividing this by the number of actual offenses, this average may be significantly off due to having extremely small or large values in your data. This value may be $0 since arsons include attempted arsons which may cause little or no damage. Please note that this value is not inflation-adjusted so you will have to adjust the value yourself. 

## Types of arsons {#arsonType}

For each of the arson categories above, this dataset has information for ten different *types* of arson. The type is based on where the arson occurred, not based on how the fire was initiated, how far or fast it spread, or any other information about the arson - nothing is actually known about the arson outcome other than if the arson was cleared and the estimated damage. There are seven arsons types for buildings, two for vehicles, and one as an "other" category that includes arsons of outdoor areas like parks or forests (though this group does not have any subcategories so all you know is the arson is neither of a building or a vehicle). For both the buildings and the vehicle arson types there is also a "total buildings" and "total vehicles" category that is just the sum of each subcategory; there is also a "grant total" variable that sums all building, vehicle, and other arsons.

1. Building arsons
    + Single occupancy home
    + Other residential
    + Storage 
    + Industrial/manufacturing building
    + Other commercial building
    + Community or public building
    + All other structures
2. Vehicles
    + Motor vehicles
    + Other vehicles
3. All other arsons

Some arsons can burn down multiple types or structures or cars - fire, after all, tends to spread. This data defines the arson based on where the fire originated. So an arson that starts in someone's house and also burns down their car in the garage would be a single-family home arson, not a vehicle arson. This is true even if the damage is more severe for a type other than where the fire started. So if someone threw a Molotov cocktail at a car parked outside a house and it lightly damaged the car but spread to homes nearby and destroyed those homes, it is still a vehicle arson (though the damage recorded would include the homes burned.)

## Data errors

Like the other UCR data, there are some cases where there are obvious data entry errors leading to impossible numbers of reported arsons or the price of an arson. As an example, Figure \@ref(fig:residenceArson) shows the annual number of single-family home arsons in Byron City, Illinois, which has a population of slightly over 3,600 people. Every year with data available there are zero arsons reported until 2003 when 469 arsons are reported. Since it is exceedingly unlikely that suddenly an eighth of the city suddenly burned down, and the city never again had a residence arson, this is almost certainly a data entry error. As arsons are relatively rare, having errors - and especially ones like this - can drastically change the results of your analysis so it is important to check your data carefully for more errors. For those using the data that I have cleaned and concatenated, the complete list of obvious outliers that I removed is available on the data's [page on openICPSR](https://www.openicpsr.org/openicpsr/project/103540/version/V9/view).

<div class="figure">
<img src="arson_files/figure-html/residenceArson-1.png" alt="Annual single-family home arsons in Byron  City, Illinois. The sudden spike to over 400 arsons in a single year is an example of data errors in this dataset. " width="672" />
<p class="caption">(\#fig:residenceArson)Annual single-family home arsons in Byron  City, Illinois. The sudden spike to over 400 arsons in a single year is an example of data errors in this dataset. </p>
</div>

There are also cases where it is less clear when a value is a data error or is simply due to an outlier - but real - value. For example, Figure \@ref(fig:arsonCost) shows the annual average cost of a single-family home fire in Los Angeles, California. In most years the damage is low - since an arson can damage only part of the house, these low values likely mean that on average only part of the house was damaged, not the entire house. In 2009, however, the average damage is about $540,000 per arson. Is this a data entry error that simply inputs a damage value that is too high? It's certainly possible. However, it could also be that some extraordinarily expensive homes were destroyed that year. In 2009 Los Angeles only reported 63 single-family home arsons so having one, or a few, super mansions - which LA has plenty of - destroyed could mean that this huge value is real. 

<div class="figure">
<img src="arson_files/figure-html/arsonCost-1.png" alt="The annual average cost per single-family home arson in Los Angeles, California." width="672" />
<p class="caption">(\#fig:arsonCost)The annual average cost per single-family home arson in Los Angeles, California.</p>
</div>
