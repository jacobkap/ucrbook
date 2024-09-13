# Arson {#arsonChapter}





The arson dataset provides monthly counts at the police agency-level for arsons that occur, and includes a breakdown of arsons by the type of arson (e.g. arson of a person's home, arson of a vehicle, arson of a community/public building) and the estimated value of the damage caused by the arson. We have arson data from 1979 to 2022. 

This data includes all arsons reported to the police or otherwise known to the police (e.g. discovered while on patrol) and also has a count of arsons that lead to an arrest (of at least one person who committed the arson) and reports that turned out to not be arsons (such as if an investigation found that the fire was started accidentally). This is essentially the Offenses Known and Clearances by Arrest data, detailed in Chapter \@ref(offensesKnown), but only for arsons. The data even follows the same definitions for categories such as what counts as a cleared or unfounded crime. The primary additional variable is the estimated damage in dollars caused by the arson. As much of this information is the same as detailed in Chapter \@ref(offensesKnown), this chapter will be brief. If you have a question about definitions, please refer to that chapter. 

For each type of arson it includes the number of arsons where the structure was uninhabited or otherwise not in use, so you can estimate the percent of arsons of buildings which had the potential to harm people. This measure is for structures where people normally did not inhabit the structure - such as a vacant building where no one lives. A home where no one is home *at the time of the arson* does not count as an uninhabited building.

In cases where the arson led to a death, that death would be recorded as a murder on the Offenses Known and Clearances by Arrest dataset - but not indicated anywhere on this dataset. If an individual who responds to the arson dies because of it, such as a police officer or a firefighter, this is not considered a homicide (though the officer death is still included in the Law Enforcement Officers Killed and Assaulted data) unless the arsonist intended to cause their deaths. Even though the Offenses Known data uses the Hierarchy Rule, where only the most serious offense that occurs is recorded, all arsons are reported - arson is exempt from the Hierarchy Rule. 

## Agencies reporting

This dataset measures how many months that an agency reports data over a year in the same way as the Offenses Known data does: the standard FBI definition using the last month reported, and my own measure counting how many months reported data according to a column for each month that says so.^[This is different than identifying how many months have an arson as there may be months that truly do not have any arsons. We do not want to count those are non-reporting months.] And just like the Offenses Known data, the variable I use for my own measurement changed in 2018, leading to fewer months of data reported and making it non-comparable to pre-2018 data. The variable changed again in 2021 and said that all agencies always reported data in every month, making the variable useless. 

In Figure \@ref(fig:arsonAgencies) we can see the annual number of agencies that reported at least one month of data using both measures. These measures are nearly identical every year with the last month reported having slightly more agencies reported, but they are effectively the same. This changes in 2018 as my measure declines considerably and then skyrockets to nearly 25,000 agencies in 2021 and 2022. The last month reported variable declines considerably in 2021, consistent with the FBI ending SRS collection, and then rebounds in 2022 when the FBI reopens SRS collection. How can there be more than 18k agencies reporting? The 18k number is the estimated number of agencies that are active. Agencies that can respond to crimes and do investigations. Remember that SRS data goes back decades - the Offenses Known data is available since 1930. So agencies can come and go, with agencies shutting down or joining with other agencies. Over time this adds up to thousands of agencies other than the 18k we normal think about. 


<div class="figure" style="text-align: center">
<img src="08_arson_files/figure-html/arsonAgencies-1.png" alt="The annual number of police agencies that report at least month of data and all 12 months of data that year, 1979-2022." width="90%" />
<p class="caption">(\#fig:arsonAgencies)The annual number of police agencies that report at least month of data and all 12 months of data that year, 1979-2022.</p>
</div>

In Figure \@ref(fig:arsonAgencies12Months) we can see the same graph as before but now for agencies reporting 12 months of data that year. The trends in both measures are the same, at least until 2018, with the last month reported measure always being a bit higher than the number of months missing measure. Which measure is better to use? In general I would say my own measure but obviously that does not work starting in 2018. In practice both measures are quite similar so the decision on which to use depends on your own use-case such as if you are looking at data after 2017. 


## Important variables

Similar to the Offenses Known and Clearances by Arrest data, this data shows the monthly number of crimes - in this case only arsons - reported or discovered by the police, the number found by police to be unfounded, and the number cleared by the police. In addition, it includes the number of arsons in structures that were uninhabited, and the estimated cost of the damage caused by the arsons. For each variable, the arsons are also broken into several categories of arsons, which we will talk about in Section \@ref(arsonType). Like other SRS datasets, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. When another agency submits data for the given agency, that is noted in the data through the "covered_by_ori" variable.

### Types of arsons {#arsonType}

For each of the outcome categories detailed below, this dataset has information for ten different *types* of arson. Some arsons can burn down multiple types or structures or cars - fire, after all, tends to spread. This data defines the arson based on where the fire originated, regardless of what burns after that. This is true even if the damage is more severe for a type other than where the fire started. For example, a [recent fire in California](https://www.nbcnews.com/news/us-news/man-pushing-burning-car-ravine-started-park-fire-burning-45000-acres-c-rcna163697) was started by a man "pushing a burning car into a ravine." That fire, known as the  Park Fire is still burning as of this writing (summer, 2024) and has burned over 429,000 acres and over 600 buildings. This fire would be classified as a motor vehicle arson because the fire started in a vehicle. 

There are seven arsons types for buildings, two for vehicles, and one as an "other" category that includes arsons of outdoor areas like parks or forests (though this group does not have any subcategories so all you know is the arson is neither of a building or a vehicle). For both the buildings and the vehicle arson types there is also a "total buildings" and "total vehicles" category that is just the sum of each subcategory; there is also a "grant total" variable that sums all building, vehicle, and other arsons. For each of the building arsons we also have variables that say how many of the arsons were of uninhabited buildings.

* Total structures (buildings)
  + Single occupancy (e.g. single family homes)
  + Other residential (e.g. hotel, apartment)
  + Storage (warehouses, storage facilities)
  + Industrial
  + Other commercial (e.g. restaurant, office building, car dealership)
  + Community/public (e.g. government buildings, hospitals, community centers, places of worship)
  + All other structures (all buildings that do not fit in another category')
* Total mobile vehicles (vehicles)
  + Motor vehicles (a car that runs on a road such as a SUV, sedan, motorcycle)
  + Other mobile vehicles (other mobile objects such as airplanes and boats)
* Other (everything that does not fit in a previous category)
* Grand total (all arsons of any category)

Some arsons can burn down multiple types or structures or cars - fire, after all, tends to spread. This data defines the arson based on where the fire originated, regardless of what burns after that. This is true even if the damage is more severe for a type other than where the fire started. For example, a (recent fire in California)[https://www.nbcnews.com/news/us-news/man-pushing-burning-car-ravine-started-park-fire-burning-45000-acres-c-rcna163697] was started by a man "pushing a burning car into a ravine." That fire, known as the  Park Fire is still burning as of this writing (summer, 2024) and has burned over 429,000 acres and over 600 buildings. This fire would be classified as a motor vehicle arson because the fire started in a vehicle. 

### Actual arsons

This variable includes the number of arsons either reported to the police or otherwise known to the police in that month and that the police determine to actually be arsons - that is, reports that are not unfounded. This is based only on the police's determination that an arson occurred, not the decision of other groups like a court or the conviction of someone for the crime. This is the number of arsons, regardless of their severity. An arson that burns down a single vehicle is treated as one arson, as is an arson that burns down a vehicle, 429 thousand acres of land, and 600 buildings. 

### Unfounded arsons

This variable shows the number of arsons reports that the police determined to not actually be arsons. For example, if a house burns down and police think it was arson but later determine that it was an accident, it would be an unfounded arson. 

### Reported arsons

This variable is the sum of actual arsons and unfounded arsons - it is the total number of arsons that were reported or known to the police, even if a later investigation found that it was not actually an arson. Since this is the sum of two already present variables - and is less informative than the two variables are as separate variables - I am not exactly sure why it is included.

### Cleared arsons

This shows the number of arsons where at least one offender is arrested or when an arrest cannot be made for some reason, but the police know who the offender is - the latter option is called "exceptional clearances" or "clearances by exceptional means." There is no way to tell if a clearance is due to an arrest or due to exceptional means.^[NIBRS data does tell more information about the type of arrest, but SRS data does not].

Please note that this data is at the incident-level which means that having multiple people arrested for an incident still only is a clearance for that single incident. If there are multiple people who committed the arson only one needs to be arrested or exceptionally cleared for the incident to be cleared.

Clearances are also reported in the month they occur, not in the month that the initial crime happened. This can lead to cases where there are more clearances than crimes, incorrectly leading to the conclusion that police solve >100% of crimes. Figure \@ref(fig:arsonClearance) shows the number of actual arsons (reports that are founded) and clearances for single-family home arsons in League City, Texas, a city of about 100,000 outside of Houston. In most years there were fewer clearances than arsons, but in four years (1982, 1981, 1992, and 2007) there were more clearances than arsons. 

<div class="figure" style="text-align: center">
<img src="08_arson_files/figure-html/arsonClearance-1.png" alt="The annual number of single-family home arsons and clearances in League City, Texas, 1979-2022." width="90%" />
<p class="caption">(\#fig:arsonClearance)The annual number of single-family home arsons and clearances in League City, Texas, 1979-2022.</p>
</div>

### Cleared for arsons where all offenders are under age 18

This variable is the same for normal clearances but only for arsons where every offender is under the age of 18. In these cases a clearance by arrest can include citing the juvenile offender with an order to go to court to stand trial, even if the juvenile is not actually taken into police custody. As this variable requires that the police know every offender (to be able to determine that they are all under 18), it is likely flawed and not a very useful variable to use. 

### Uninhabited building arsons

This data also includes the number of arsons that occur in uninhabited structures. These structures must be uninhabited in the long-term, not simply having no one inside them when the arson occurs. The FBI defines these are structures that are "uninhabited, abandoned, deserted, or not normally in use" at the time of the arson. For example, a vacation home whose owners are not living in at the time would be "not normally in use" so would be an uninhabited building. A business that is closed when the fire started, but is open during the day, is not an uninhabited building. 

### Estimated damage cost

The final variable is the estimated cost of the arson. This is how much the police estimates the value (in dollars) of the damaged or destroyed property is. Since this is the value of property damage, injuries to people (including non-physical injuries such as trauma or mental health costs) are not included. Since this is estimated damage it may be inaccurate to some degree. This variable is the sum of monthly estimated cost so while you can get the average cost by dividing this by the number of actual offenses, this average may be significantly off due to having extremely small or large values in your data. This value may be $0 since arsons include attempted arsons which may cause little or no damage. Please note that this value is not inflation-adjusted so you will have to adjust the value yourself. 

## Data errors

Like the other SRS data, there are some cases where there are obvious data entry errors leading to impossible numbers of reported arsons or the price of an arson. As an example, Figure \@ref(fig:residenceArson) shows the annual number of single-family home arsons in Byron City, Illinois, which has a population of slightly over 3,600 people. Every year with data available there are zero arsons reported until 2003 when 469 arsons are reported. Since it is exceedingly unlikely that suddenly an eighth of the city each suffered different arson attacks, and the city never again had a residence arson, this is almost certainly a data entry error. As arsons are relatively rare, having errors - and especially ones like this - can drastically change the results of your analysis so it is important to check your data carefully for more errors. 

<div class="figure" style="text-align: center">
<img src="08_arson_files/figure-html/residenceArson-1.png" alt="Annual single-family home arsons in Byron  City, Illinois. The sudden spike to over 400 arsons in a single year is an example of data errors in this dataset, 1979-2022. " width="90%" />
<p class="caption">(\#fig:residenceArson)Annual single-family home arsons in Byron  City, Illinois. The sudden spike to over 400 arsons in a single year is an example of data errors in this dataset, 1979-2022. </p>
</div>

There are also cases where it is less clear when a value is a data error or is simply due to an outlier - but real - value. For example, Figure \@ref(fig:arsonCost) shows the annual average cost of a single-family home fire in Los Angeles, California. In most years the value is low. Since an arson can cause little or no damage, these low values likely mean that on average only part of the house was damaged, not the entire house. In 2009, however, the average damage is about $540,000 per arson. Is this a data entry error that simply inputs a damage value that is too high? It certainly appears to be a data error since it is a sudden huge jump in damage value. However, it could also be that some extraordinarily expensive homes were destroyed that year. In 2009 Los Angeles only reported 63 single-family home arsons so having one, or a few, super mansions - which LA has plenty of - destroyed could mean that this huge value is real. 

<div class="figure" style="text-align: center">
<img src="08_arson_files/figure-html/arsonCost-1.png" alt="The annual cost per arson for single family homes in Los Angeles, California, 1979-2022." width="90%" />
<p class="caption">(\#fig:arsonCost)The annual cost per arson for single family homes in Los Angeles, California, 1979-2022.</p>
</div>
