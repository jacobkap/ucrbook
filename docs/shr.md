# Supplementary Homicide Reports (SHR) {#shr}



The Supplementary Homicide Reports dataset - often abbreviated to SHR -  is the most detailed of the UCR datasets and provides information about the circumstances and participants (victim and offender demographics and relationship status) for homicides.^[If you're familiar with the National Incident-Based Reporting System (NIBRS) data that is replacing UCR, this dataset is the closest UCR data to it, though it is still less detailed than NIBRS data.] For each homicide incident it tells you the age, gender, race, and ethnicity of each victim and offender as well as the relationship between the first victim and each of the offenders (but not the other victims in cases where there are multiple victims). It also tells you the weapon used by each offender and the circumstance of the killing, such as a "lovers triangle" or a gang-related murder. As with other UCR data, it also tells you the agency it occurred in and the month and year when the crime happened. 





```
## [1] 30.96352
```

<div class="figure">
<img src="shr_files/figure-html/shrOffenderAge-1.png" alt="The age of homicide offenders, based on the first offender in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old." width="672" />
<p class="caption">(\#fig:shrOffenderAge)The age of homicide offenders, based on the first offender in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old.</p>
</div>



```
## [1] 32.87052
```

<div class="figure">
<img src="shr_files/figure-html/shrVictimAge-1.png" alt="The age of homicide offenders, based on the first offender in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old." width="672" />
<p class="caption">(\#fig:shrVictimAge)The age of homicide offenders, based on the first offender in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old.</p>
</div>




<div class="figure">

```{=html}
<div id="htmlwidget-eaf6cd700d0c635df454" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-eaf6cd700d0c635df454">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"],["Handgun","Knife Or Cutting Instrument","Firearm, Type Not Stated","Personal Weapons - Includes Beating","Shotgun","Other Or Unknown Weapon","Blunt Object","Rifle","Strangulation - Includes Hanging","Fire","Asphyxiation - Includes Death By Gas","Other Gun","Narcotics/Drugs - Includes Sleeping Pills","Drowning","Other Or Type Unknown","Poison - Does Not Include Gas","Explosives","Pushed Or Thrown Out of Window","Narcotics Or Drugs"],[359188,109670,52638,42763,36072,35073,33291,26314,9619,5089,4420,2668,2058,1367,586,467,374,251,48],[0.497520624525594,0.151906764401155,0.0729102604590861,0.0592321415709545,0.0499642637501454,0.0485805229127537,0.0461122284460549,0.0364482045997263,0.0133235266415128,0.00704890602751414,0.00612225675802958,0.00369551607023143,0.00285058923258481,0.00189346719190643,0.000811683814526093,0.000646853824886835,0.00051803711029481,0.000347666616802132,6.64860462410452e-05]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Weapon<\/th>\n      <th># of Incidents<\/th>\n      <th>% of Incidents<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":100,"columnDefs":[{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 0, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatPercentage(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render"],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:shrWeapon)The weapon used in a homicide incident. In cases where there are multiple offenders, shows only the primary weapon for the first offender.</p>
</div>

<div class="figure">

```{=html}
<div id="htmlwidget-23530461dfa031880a19" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-23530461dfa031880a19">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"],["Unknown","Acquaintance","Stranger","Other - Known To Victim","Wife","Friend","Girlfriend","Husband","Other Family","Son","Boyfriend","Neighbor","Daughter","Brother","Father","Mother","In-Law","Common-Law Wife","Common-Law Husband","Ex-Wife","Stepfather","Homosexual Relationship","Stepson","Sister","Ex-Husband","Stepdaughter","Employer","Employee","Stepmother"],[263237,147741,111955,33426,26353,26143,19194,11700,10400,10342,9041,7569,7436,6403,5059,4578,4392,3209,2690,2205,1693,1663,1381,1344,876,747,530,422,227],[0.364616403215708,0.204639894952047,0.155071777227421,0.0462992204511078,0.0365022245122971,0.0362113480599926,0.0265861077406379,0.0162059737712548,0.0144053100188931,0.0143249727130185,0.0125229238346935,0.0104840184166348,0.0102997966635086,0.00886896154336275,0.00700735224861349,0.00634110666023968,0.00608347323105563,0.00444486921640654,0.00372598884142524,0.00305420274919801,0.0023450182559602,0.00230346447705954,0.0019128589553934,0.00186160929474926,0.00121337034389907,0.00103468909462627,0.000734116760578207,0.000584523156535855,0.000314423593681609]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Relationship<\/th>\n      <th># of Incidents<\/th>\n      <th>% of Incidents<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":100,"columnDefs":[{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 0, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatPercentage(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render"],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:shrRelationship)The relationship between the first victim and the first offender in a homicide incident.</p>
</div>

<div class="figure">

```{=html}
<div id="htmlwidget-4ef18697ed521a035890" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-4ef18697ed521a035890">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34"],["Other Arguments","Unknown","Other Non-Felony Type - Not Specified","Robbery","Circumstances Undetermined","Narcotic Drug Laws","Juvenile Gang Killings","Felon Killed By Police","Brawl Due To Influence of Alcohol","Argument Over Money Or Property","Other Felony Type - Not Specified","All Suspected Felony Type","Felon Killed By Private Citizen","Lovers Triangle","Burglary","Brawl Due To Influence of Narcotics","Gangland Killings","All Other Manslaughter By Negligence Except Traffic Deaths","Rape","Other Negligent Handling of Gun Which Resulted In Death of Another","Arson","Other Sex Offenses","Child Killed By Babysitter","Children Playing With Gun","Motor Vehicle Theft","Institutional Killings","Gambling","Larceny","Prostitution And Commercialized Vice","Other - Not Specified","Sniper Attack","Victim Shot In Hunting Accident","Gun Cleaning Death - Other Than Self-Inflicted","Abortion"],[197905,163388,90203,57312,27448,26489,23292,16394,15174,14667,13902,12743,12376,10372,6052,4704,4693,4339,4086,3266,2982,1408,1297,1272,1259,1055,1031,753,601,554,474,329,125,10],[0.274123733473693,0.226313274373056,0.124942690333885,0.0793844491692696,0.0380189901032613,0.0366906524644888,0.0322623986259531,0.0227077864963883,0.0210179304804316,0.0203156706442922,0.0192560478146145,0.0176506845994556,0.0171423426667867,0.0143665463913956,0.00838279394145064,0.00651564155660671,0.00650040514990546,0.00601006987970164,0.00565963252557292,0.00452382766238893,0.00413045134392033,0.00195026005775983,0.00179651086286541,0.00176188266581712,0.00174387600335201,0.00146130991543794,0.00142806684627158,0.00104300129509457,0.000832461857040951,0.000767360846590161,0.000656550616035626,0.000455707073155529,0.000173140985241462,1.3851278819317e-05]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Circumstance<\/th>\n      <th># of Incidents<\/th>\n      <th>% of Incidents<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":100,"columnDefs":[{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 0, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatPercentage(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render"],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:shrCircumstance)The circumstance of the homicide for the first offender in a homicide incident.</p>
</div>

<div class="figure">

```{=html}
<div id="htmlwidget-a0ccd52ca9edf40f0e10" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-a0ccd52ca9edf40f0e10">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7"],["Felon Killed In Commission of A Crime","Felon Attacked Police Officer","Felon Attacked A Civilian","Not Enough Information To Determine","Felon Resisted Arrest","Felon Attacked Fellow Police Officer","Felon Attempted Flight From A Crime"],[10320,8553,4498,2423,1226,951,799],[0.358706986444213,0.297288842544317,0.15634341327772,0.0842196732707682,0.0426138338547098,0.0330552659019812,0.0277719847062913]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Subcircumstance<\/th>\n      <th># of Incidents<\/th>\n      <th>% of Incidents<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":100,"columnDefs":[{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 0, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatPercentage(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render"],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:shrSubCircumstance)The circumstance for the first offender in a homicide incident in cases where the offender is killed. This includes incidents where the only person who dies in the offender.</p>
</div>



While highly detailed compared to other UCR data, there are a number of limitations for this data. 

Since this data is voluntary to 

<div class="figure">
<img src="shr_files/figure-html/shrVsOffenses-1.png" alt="The annual number of murders from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset. Numbers differ because agencies voluntarily report and may not report to both datasets. " width="672" />
<p class="caption">(\#fig:shrVsOffenses)The annual number of murders from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset. Numbers differ because agencies voluntarily report and may not report to both datasets. </p>
</div>


This    
If this "most detailed" dataset sounds disappointing - and it is! - 

## A brief history of the data

The data is available from the FBI starting in 1975 though, unlike all later years, this year only has information on a single victim and a single offender. For this reason I only release data starting in 1976 where up to 11 victims and 11 offenders are included. This data has been released every year since and the most recent year available is 2019. 

### Changes in definitions

## What does the data look like?

### Raw data



## What variables are in the data?

### Key variables

## Known issues with the data

## Final thoughts
