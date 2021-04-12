# Supplementary Homicide Reports (SHR) {#shr}



The Supplementary Homicide Reports dataset - often abbreviated to SHR -  is the most detailed of the UCR datasets and provides information about the circumstances and participants (victim and offender demographics and relationship status) for homicides.^[If you're familiar with the National Incident-Based Reporting System (NIBRS) data that is replacing UCR, this dataset is the closest UCR data to it, though it is still less detailed than NIBRS data.] For each homicide incident it tells you the age, gender, race, and ethnicity of each victim and offender as well as the relationship between the first victim and each of the offenders (but not the other victims in cases where there are multiple victims). It also tells you the weapon used by each offender and the circumstance of the killing, such as a "lovers triangle" or a gang-related murder. As with other UCR data, it also tells you the agency it occurred in and the month and year when the crime happened. 





## Agencies reporting

This data only has a report when the agency has a murder that year and since murder is rare it is difficult to measure underreporting. One way we can look at reporting is to compare murders in the SHR data with that of other datasets. We'll look at two of them: the Offenses Known and Clearances by Arrest which is covered in detail in Chapter \@ref(https://wonder.cdc.gov/), and the Center for Disease Control and Prevention (CDC) detail on national deaths from homicide.^[CDC WONDER data is available here: https://wonder.cdc.gov/] Both this dataset and the Offenses Known and Clearances by Arrest data are UCR datasets so you may think that the numbers of murders from each dataset should be the same. That is a perfectly reasonable assumption, but since this is UCR data we're talking about, you'd be wrong. Police agencies are free to report to either, both, or neither dataset so while the number of murders are close for each dataset, they are never equal. CDC WONDER data aggregates mortality data (among other data) from state death certificates which reduces the issue of voluntary reporting that we have in UCR data.

Figure \@ref(fig:shrVsOffenses) shows the annual number of murder victims from each of these datasets starting in 1976 for the UCR data and in 1999 for the CDC data.^[1975 is actually the first year that the Supplementary Homicide Reports data is available but that dataset only has info for a single victim and offender - all later years has info for up to 11 victims and offenders - so 1976 is often used as the first year of data]. For the UCR data, in every year the numbers are fairly similar and the trends are the same over time, but the number of murders is never equal. The numbers have actually gotten worse over time with the difference between the datasets increasing and the Offenses Known data having consistently more murders reported than the SHR data since the late 1990s. Compared to the CDC data, however, both UCR datasets - and in particular the SHR data - undercount the number of murders. While trends are the same, UCR data reports thousands fewer murders per year than the CDC data, indicating how much of an issue underreporting is in this data.

<div class="figure">
<img src="shr_files/figure-html/shrVsOffenses-1.png" alt="The annual number of murders from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset. Numbers differ because agencies voluntarily report and may not report to both datasets. " width="672" />
<p class="caption">(\#fig:shrVsOffenses)The annual number of murders from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset. Numbers differ because agencies voluntarily report and may not report to both datasets. </p>
</div>
## Important variables

There data has demographic information for up to 11 victims and 11 offenders, as well as the information on the weapon used by each offender, the relationship between the first victim and each offender, and the circumstance of the murder. The data also has the traditional UCR set of variables about the agency: their ORI code, population, state, region and the month and year of this data. One key variable that is missing is the outcome of the homicide: there is no information on whether any of the offenders were arrested. 

While there is information on up to 11 victims and offenders, in most cases, there is only a single victim and a single offender in each incident. To see how the breakdown for the number of victims in each incident looks, Figure \@ref(fig:numberSHRVictims) shows the percent of incidents with each possible number of victims.^[There is one incident where there are a reported 12 victims. For simplicity of the graph, this incident is not included.] In nearly all incidents - 96.1% - there was only a single victim. This drops to 3.2% of incidents for two victims, 0.5% for three victims, and only about 0.2% of incidents have four or more victims. 

<div class="figure">
<img src="shr_files/figure-html/numberSHRVictims-1.png" alt="The percent of incidents from 1976-2018 that have 1-11 victims." width="672" />
<p class="caption">(\#fig:numberSHRVictims)The percent of incidents from 1976-2018 that have 1-11 victims.</p>
</div>

Figure \@ref(fig:numberSHROffenders) shows the breakdown of the number of offenders per homicide incident.^[There is one incident where there are a reported 22 offenders and one with 12 offenders. For simplicity of the graph, these incidents are not included.] It's a little less concentrated than with victims but the vast majority of homicides are committed by one offender - or at least the police only report one offender. About 88% of homicides have only one offender, 8.2% have two, 2.4% have three, and fewer than 1% have four. Fewer than 0.5% of homicides have more than four offenders. However, this is all a bit misleading. In cases where there is no information about the offender, including how many offenders there is, the data simply days that there is a single offender. So the number of homicides with a single offender is an overcount while the number with more offenders is an overcount. 

The variable "situation" says what type of victim-offender number combination the incident is - e.g. "multiple victims/single offender", "single victim/multiple offenders", etc. - and does indicate if the number of offenders is unknown (though curiously there are over 4,000 instances where the number of offenders is unknown but they still say there are two offenders) so you can use this variable to determine if the police don't know how many offenders there is. You're still limited, of course, in that the number of offenders is always what the police think there are, and they may be wrong. So use this variable - and anything that comes from it like the percent of offenders of a certain race - with caution.  

<div class="figure">
<img src="shr_files/figure-html/numberSHROffenders-1.png" alt="The percent of incidents from 1976-2018 that have 1-11 offenders." width="672" />
<p class="caption">(\#fig:numberSHROffenders)The percent of incidents from 1976-2018 that have 1-11 offenders.</p>
</div>


### Offender age



```
## [1] 30.96352
```

<div class="figure">
<img src="shr_files/figure-html/shrOffenderAge-1.png" alt="The age of homicide offenders, based on the first offender in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old." width="672" />
<p class="caption">(\#fig:shrOffenderAge)The age of homicide offenders, based on the first offender in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old.</p>
</div>

### Victim age


```
## [1] 32.87052
```

<div class="figure">
<img src="shr_files/figure-html/shrVictimAge-1.png" alt="The age of homicide offenders, based on the first offender in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old." width="672" />
<p class="caption">(\#fig:shrVictimAge)The age of homicide offenders, based on the first offender in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old.</p>
</div>


### Weapon used

<div class="figure">

```{=html}
<div id="htmlwidget-7645dbab90243aa994e2" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-7645dbab90243aa994e2">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"],["Handgun","Knife Or Cutting Instrument","Firearm, Type Not Stated","Personal Weapons - Includes Beating","Shotgun","Other Or Unknown Weapon","Blunt Object","Rifle","Strangulation - Includes Hanging","Fire","Asphyxiation - Includes Death By Gas","Other Gun","Narcotics/Drugs - Includes Sleeping Pills","Drowning","Other Or Type Unknown","Poison - Does Not Include Gas","Explosives","Pushed Or Thrown Out of Window","Narcotics Or Drugs"],[359188,109670,52638,42763,36072,35073,33291,26314,9619,5089,4420,2668,2058,1367,586,467,374,251,48],[0.497520624525594,0.151906764401155,0.0729102604590861,0.0592321415709545,0.0499642637501454,0.0485805229127537,0.0461122284460549,0.0364482045997263,0.0133235266415128,0.00704890602751414,0.00612225675802958,0.00369551607023143,0.00285058923258481,0.00189346719190643,0.000811683814526093,0.000646853824886835,0.00051803711029481,0.000347666616802132,6.64860462410452e-05]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Weapon<\/th>\n      <th># of Incidents<\/th>\n      <th>% of Incidents<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":100,"columnDefs":[{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 0, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatPercentage(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render"],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:shrWeapon)The weapon used in a homicide incident. In cases where there are multiple offenders, shows only the primary weapon for the first offender.</p>
</div>

### Relationship between first victim and offenders

An interesting and highly useful variable is the relationship between the first victim and each offender. 

<div class="figure">

```{=html}
<div id="htmlwidget-bc89aeec1a54e84a2458" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-bc89aeec1a54e84a2458">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"],["Unknown","Acquaintance","Stranger","Other - Known To Victim","Wife","Friend","Girlfriend","Husband","Other Family","Son","Boyfriend","Neighbor","Daughter","Brother","Father","Mother","In-Law","Common-Law Wife","Common-Law Husband","Ex-Wife","Stepfather","Homosexual Relationship","Stepson","Sister","Ex-Husband","Stepdaughter","Employer","Employee","Stepmother"],[263237,147741,111955,33426,26353,26143,19194,11700,10400,10342,9041,7569,7436,6403,5059,4578,4392,3209,2690,2205,1693,1663,1381,1344,876,747,530,422,227],[0.364616403215708,0.204639894952047,0.155071777227421,0.0462992204511078,0.0365022245122971,0.0362113480599926,0.0265861077406379,0.0162059737712548,0.0144053100188931,0.0143249727130185,0.0125229238346935,0.0104840184166348,0.0102997966635086,0.00886896154336275,0.00700735224861349,0.00634110666023968,0.00608347323105563,0.00444486921640654,0.00372598884142524,0.00305420274919801,0.0023450182559602,0.00230346447705954,0.0019128589553934,0.00186160929474926,0.00121337034389907,0.00103468909462627,0.000734116760578207,0.000584523156535855,0.000314423593681609]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Relationship<\/th>\n      <th># of Incidents<\/th>\n      <th>% of Incidents<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":100,"columnDefs":[{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 0, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatPercentage(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render"],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:shrRelationship)The relationship between the first victim and the first offender in a homicide incident.</p>
</div>

### Homicide circumstance

<div class="figure">

```{=html}
<div id="htmlwidget-49cd22252301cd6ecf41" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-49cd22252301cd6ecf41">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34"],["Other Arguments","Unknown","Other Non-Felony Type - Not Specified","Robbery","Circumstances Undetermined","Narcotic Drug Laws","Juvenile Gang Killings","Felon Killed By Police","Brawl Due To Influence of Alcohol","Argument Over Money Or Property","Other Felony Type - Not Specified","All Suspected Felony Type","Felon Killed By Private Citizen","Lovers Triangle","Burglary","Brawl Due To Influence of Narcotics","Gangland Killings","All Other Manslaughter By Negligence Except Traffic Deaths","Rape","Other Negligent Handling of Gun Which Resulted In Death of Another","Arson","Other Sex Offenses","Child Killed By Babysitter","Children Playing With Gun","Motor Vehicle Theft","Institutional Killings","Gambling","Larceny","Prostitution And Commercialized Vice","Other - Not Specified","Sniper Attack","Victim Shot In Hunting Accident","Gun Cleaning Death - Other Than Self-Inflicted","Abortion"],[197905,163388,90203,57312,27448,26489,23292,16394,15174,14667,13902,12743,12376,10372,6052,4704,4693,4339,4086,3266,2982,1408,1297,1272,1259,1055,1031,753,601,554,474,329,125,10],[0.274123733473693,0.226313274373056,0.124942690333885,0.0793844491692696,0.0380189901032613,0.0366906524644888,0.0322623986259531,0.0227077864963883,0.0210179304804316,0.0203156706442922,0.0192560478146145,0.0176506845994556,0.0171423426667867,0.0143665463913956,0.00838279394145064,0.00651564155660671,0.00650040514990546,0.00601006987970164,0.00565963252557292,0.00452382766238893,0.00413045134392033,0.00195026005775983,0.00179651086286541,0.00176188266581712,0.00174387600335201,0.00146130991543794,0.00142806684627158,0.00104300129509457,0.000832461857040951,0.000767360846590161,0.000656550616035626,0.000455707073155529,0.000173140985241462,1.3851278819317e-05]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Circumstance<\/th>\n      <th># of Incidents<\/th>\n      <th>% of Incidents<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":100,"columnDefs":[{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 0, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatPercentage(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render"],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:shrCircumstance)The circumstance of the homicide for the first offender in a homicide incident.</p>
</div>

### Homicide subcircumstance

<div class="figure">

```{=html}
<div id="htmlwidget-e403aa24e0752563b055" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-e403aa24e0752563b055">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7"],["Felon Killed In Commission of A Crime","Felon Attacked Police Officer","Felon Attacked A Civilian","Not Enough Information To Determine","Felon Resisted Arrest","Felon Attacked Fellow Police Officer","Felon Attempted Flight From A Crime"],[10320,8553,4498,2423,1226,951,799],[0.358706986444213,0.297288842544317,0.15634341327772,0.0842196732707682,0.0426138338547098,0.0330552659019812,0.0277719847062913]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Subcircumstance<\/th>\n      <th># of Incidents<\/th>\n      <th>% of Incidents<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":100,"columnDefs":[{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 0, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatPercentage(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render"],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:shrSubCircumstance)The circumstance for the first offender in a homicide incident in cases where the offender is killed. This includes incidents where the only person who dies in the offender.</p>
</div>

