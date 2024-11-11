# Property Segment {#property}





The Property Segment provides a bit more information than would be expected from the name. For each item involved in the crime it tells you what category that items falls into, with 68 total categories (including "other") ranging from explosives and pets to money and alcohol. It also tells you the estimated value of that item. This data covers more than just items stolen during a crime. For each item it tells you what happened to that item such as if it was stolen, damaged, seized by police (such as illegal items like drugs), recovered (from being stolen) by police, or burned during an arson.

For drug offenses it includes the drugs seized by police. For these offenses, the data tells us the type of drug, with 16 different drug categories ranging from specific ones like marijuana or heroin to broader categories such as "other narcotics". There can be up to three different drugs included in this data - if the person has more than three types of drugs seized then the third drug category will simply indicate that there are more than three drugs, so we learn what the first two drugs are but not the third or greater drugs are in these cases. For each drug we also know exactly how much was seized with one variable saying the amount the police found and another saying the units we should we reading that amount as (e.g. pills, grams, plants). 


The Window Property Segment has the same variables as the normal Property Segment but also has 10 variables on each of the offenses committed (up to 10 offenses) during the incident. This is really to try to provide a bit of information that you’d otherwise get from the other segments but don’t since this is a window segment. For the rest of this chapter I’ll be using examples from the Property Segment and not the Window Property.

## Type of property loss {#propertyLoss}

This segment contains information on all property involved in the incident, other than the weapon used by the offender. Property can be involved in multiple ways - such as being stolen, destroyed, or that the stolen property is recovered by the police - so NIBRS breaks this information into seven different categories (eight when including "unknown" type). Figure \@ref(fig:propertyTypeLoss) shows each of these categories as how often they occur. The most common category, at 60.7% of the rows in this segment, is when the item is taken from the victim by the offender. This includes when the offender stole the item, took it by force in a robbery, tricked the victim (e.g. offender committed fraud), and any other way to illegal get the item (e.g. extortion, ransom, bribery). Though it includes all these types of ways to illegally take the item, it is often just called "stolen" property and I will refer to it as such in this chapter just for simplicity of writing.  

The next most common group, at 13.3%, is when the item was seized by the police. This excludes items that were stolen and that the police recovered. It includes all types of property that the offender illegally had but is primary for drug crimes where the drug or drug equipment was seized. This segment also includes property damaged, destroyed, or vandalized by the offender and this type makes up 11.2% of the data. Following this, about 9% of rows are for recovered property which is when one of the previously stolen items is recovered by the police.

Next is "none" which only means that no property was stolen or damaged but that it could have been. For example, if someone tries to grab a person's purse but fails, that would be considered "none" since the purse was not actually taken. The remaining types are when the item was a counterfeit/forgery, at 1.2%, was burned (such as during an arson) at 0.2%, or when the type of loss is unknown at 0.2% 

<div class="figure" style="text-align: center">
<img src="17_nibrs_property_files/figure-html/propertyTypeLoss-1.png" alt="The type of loss or if the item is recovered, 2023." width="100%" height="100%" />
<p class="caption">(\#fig:propertyTypeLoss)The type of loss or if the item is recovered, 2023.</p>
</div>


## Description of property

There are 68 different categories of properties (including the catch-all "other" category for anything not explicitly in a different category) that NIBRS covers. This also includes "identity - intangible" which means that someone stole the victim's identity. Identity is not property since it is not a physical thing but is nonetheless included here (items related to one's identity such as social security cards are included in a different category called "identity documents"). Each of these categories can appear in any of the seven different types of property loss discussed above. For simplicity of writing, and because Table \@ref(tab:propertyStolenDescription) covers items stolen, I will be talking below about items lost by being stolen, though everything does apply to other types of loss too. 

The property included in NIBRS can move from very broad categories like "merchandise" to more specific items such as livestock, aircraft, and pets. The property categories are mutually exclusive so a single item cannon be counted in different categories. If, for example, laptop is stolen that could potentially go in "computer hardware/software" or "office-type equipment" but it would not be in both, it would only be recorded in one of the two. In cases where multiple items of the same type are stolen - such as someone stealing multiple laptops in a single crime - we do not actually know how many items were stolen. Just that at least one item of that category was stolen in the incident. We then know the total estimated value of the items stolen in that incident which we can use to estimate the number of items stolen (as long as the know the average value per item in that category) though this would be a very imprecise measure. The exception to this is for stolen vehicles where we know exactly how many were stolen and how many were recovered.

Table \@ref(tab:propertyStolenDescription) shows each of the 68 different types of property in NIBRS and shows the number of incidents where they were stolen for all incidents in the 2022 NIBRS data. Multiple different categories of property can be stolen in a single incident. The most common type of property stolen, at 14.3% of all property is "other" which is not really that helpful to us. We know it is not one of the other 67 categories but not exactly what was stolen. Next, are money at 11.8% and then purses/handbags/wallets at 5.6%. This makes a lot of sense. People steal things for financial gain and the easiest way to get that gain is stealing money directly (or wallets and purses which often have money inside). Stealing property that you then have to sell or trade to get what you want (money or other property) is a lot harder, which is likely why it is less common. 

There are about 4.8 million rows in the Property Segment where the item was stolen (the other 3.1 million rows are about property that was seized by police, recovered, damaged, or one of the other types of property loss detailed in Section \@ref(propertyLoss)). As such, even items stolen very rarely can occur thousands or tens of thousands of times. For example, pets were the property stolen about 0.14% of the time and that tiny percent still accounts of 6,821 incidents with a pet stolen. Given the huge number of rows in this data - and as more agencies report to NIBRS this will grow quickly - it can be possible to study specific types of property, such as pets stolen, that would not be possible with a more narrow dataset (both in terms of how specific the items they include are, and the size of the data). 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:propertyStolenDescription)The number and percent of property stolen (including forcibly taken such as during a robbery) and property seized by police (excludes recovering property that was stolen), and recovered by police, 2023. Each incident can have multiple items stolen.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Property </th>
   <th style="text-align:left;"> First Year </th>
   <th style="text-align:right;"> # (%) of Property Stolen </th>
   <th style="text-align:right;"> # (%) of Property Seized </th>
   <th style="text-align:right;"> # (%) of Property Recovered </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Other </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1,282,806 (15.79\%) </td>
   <td style="text-align:right;"> 38,456 (2.54\%) </td>
   <td style="text-align:right;"> 128,422 (10.64\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Money </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 897,846 (11.05\%) </td>
   <td style="text-align:right;"> 21,170 (1.40\%) </td>
   <td style="text-align:right;"> 20,041 (1.66\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Automobile </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 669,545 (8.24\%) </td>
   <td style="text-align:right;"> 3,708 (0.24\%) </td>
   <td style="text-align:right;"> 398,894 (33.06\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Clothes/Furs </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 413,932 (5.10\%) </td>
   <td style="text-align:right;"> 1,261 (0.08\%) </td>
   <td style="text-align:right;"> 74,705 (6.19\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Vehicle Parts/Accessories </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 406,893 (5.01\%) </td>
   <td style="text-align:right;"> 2,023 (0.13\%) </td>
   <td style="text-align:right;"> 36,507 (3.03\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Purses/Handbags/Wallets </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 394,348 (4.86\%) </td>
   <td style="text-align:right;"> 2,953 (0.19\%) </td>
   <td style="text-align:right;"> 26,582 (2.20\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Merchandise </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 348,664 (4.29\%) </td>
   <td style="text-align:right;"> 444 (0.03\%) </td>
   <td style="text-align:right;"> 105,031 (8.71\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Credit/Debit Cards </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 334,601 (4.12\%) </td>
   <td style="text-align:right;"> 1,881 (0.12\%) </td>
   <td style="text-align:right;"> 17,232 (1.43\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Consumable Goods </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 328,566 (4.05\%) </td>
   <td style="text-align:right;"> 1,898 (0.13\%) </td>
   <td style="text-align:right;"> 68,355 (5.67\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tools - Power/Hand </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 303,989 (3.74\%) </td>
   <td style="text-align:right;"> 1,097 (0.07\%) </td>
   <td style="text-align:right;"> 25,449 (2.11\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Portible Electronic Communications </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 279,217 (3.44\%) </td>
   <td style="text-align:right;"> 8,278 (0.55\%) </td>
   <td style="text-align:right;"> 28,544 (2.37\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Identity Documents </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 271,321 (3.34\%) </td>
   <td style="text-align:right;"> 4,047 (0.27\%) </td>
   <td style="text-align:right;"> 13,283 (1.10\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Household Goods </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 227,841 (2.81\%) </td>
   <td style="text-align:right;"> 1,206 (0.08\%) </td>
   <td style="text-align:right;"> 30,413 (2.52\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Computer Hardware/Software </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 198,248 (2.44\%) </td>
   <td style="text-align:right;"> 1,456 (0.10\%) </td>
   <td style="text-align:right;"> 13,005 (1.08\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Identity - Intangible </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 170,718 (2.10\%) </td>
   <td style="text-align:right;"> 220 (0.01\%) </td>
   <td style="text-align:right;"> 2,130 (0.18\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Firearms </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 163,339 (2.01\%) </td>
   <td style="text-align:right;"> 16,915 (1.12\%) </td>
   <td style="text-align:right;"> 23,384 (1.94\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Jewelry/Precious Metals/Gems </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 148,039 (1.82\%) </td>
   <td style="text-align:right;"> 335 (0.02\%) </td>
   <td style="text-align:right;"> 11,568 (0.96\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bicycles </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 132,699 (1.63\%) </td>
   <td style="text-align:right;"> 203 (0.01\%) </td>
   <td style="text-align:right;"> 14,306 (1.19\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Radios/Tv/Vcr/Dvd Players </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 129,190 (1.59\%) </td>
   <td style="text-align:right;"> 427 (0.03\%) </td>
   <td style="text-align:right;"> 9,027 (0.75\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Documents - Personal Or Business </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 102,307 (1.26\%) </td>
   <td style="text-align:right;"> 3,996 (0.26\%) </td>
   <td style="text-align:right;"> 6,576 (0.55\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Alcohol </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 95,581 (1.18\%) </td>
   <td style="text-align:right;"> 1,416 (0.09\%) </td>
   <td style="text-align:right;"> 13,489 (1.12\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Trucks </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 91,891 (1.13\%) </td>
   <td style="text-align:right;"> 262 (0.02\%) </td>
   <td style="text-align:right;"> 51,915 (4.30\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Motor Vehicles </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 62,001 (0.76\%) </td>
   <td style="text-align:right;"> 280 (0.02\%) </td>
   <td style="text-align:right;"> 22,072 (1.83\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Negotiable Instruments </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 52,111 (0.64\%) </td>
   <td style="text-align:right;"> 1,390 (0.09\%) </td>
   <td style="text-align:right;"> 2,516 (0.21\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Office-Type Equipment </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 51,959 (0.64\%) </td>
   <td style="text-align:right;"> 1,944 (0.13\%) </td>
   <td style="text-align:right;"> 5,129 (0.43\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lawn/Yard/Garden Equipment </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 47,029 (0.58\%) </td>
   <td style="text-align:right;"> 17 (0.00\%) </td>
   <td style="text-align:right;"> 3,978 (0.33\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Trailers </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 42,657 (0.53\%) </td>
   <td style="text-align:right;"> 44 (0.00\%) </td>
   <td style="text-align:right;"> 9,277 (0.77\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Drugs/Narcotics </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 42,073 (0.52\%) </td>
   <td style="text-align:right;"> 973,582 (64.20\%) </td>
   <td style="text-align:right;"> 1,708 (0.14\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Recreational/Sports Equipment </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 41,355 (0.51\%) </td>
   <td style="text-align:right;"> 70 (0.00\%) </td>
   <td style="text-align:right;"> 4,269 (0.35\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Building Materials </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 40,958 (0.50\%) </td>
   <td style="text-align:right;"> 38 (0.00\%) </td>
   <td style="text-align:right;"> 2,819 (0.23\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Photographic/Optical Equipment </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 28,705 (0.35\%) </td>
   <td style="text-align:right;"> 211 (0.01\%) </td>
   <td style="text-align:right;"> 1,774 (0.15\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Camping/Hunting/Fishing Equipment/Supplies </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 27,738 (0.34\%) </td>
   <td style="text-align:right;"> 105 (0.01\%) </td>
   <td style="text-align:right;"> 3,247 (0.27\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nonnegotiable Instruments </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 26,281 (0.32\%) </td>
   <td style="text-align:right;"> 1,057 (0.07\%) </td>
   <td style="text-align:right;"> 1,530 (0.13\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Heavy Construction/Industrial Equipment </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 25,738 (0.32\%) </td>
   <td style="text-align:right;"> 418 (0.03\%) </td>
   <td style="text-align:right;"> 2,783 (0.23\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fuel </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 22,461 (0.28\%) </td>
   <td style="text-align:right;"> 24 (0.00\%) </td>
   <td style="text-align:right;"> 970 (0.08\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Collections/Collectibles </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 20,624 (0.25\%) </td>
   <td style="text-align:right;"> 55 (0.00\%) </td>
   <td style="text-align:right;"> 2,408 (0.20\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pending Inventory (Of Property) </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 19,125 (0.24\%) </td>
   <td style="text-align:right;"> 132 (0.01\%) </td>
   <td style="text-align:right;"> 369 (0.03\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Recordings - Audio/Visual </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 18,181 (0.22\%) </td>
   <td style="text-align:right;"> 1,459 (0.10\%) </td>
   <td style="text-align:right;"> 1,566 (0.13\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Metals, Non-Precious </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 17,811 (0.22\%) </td>
   <td style="text-align:right;"> 59 (0.00\%) </td>
   <td style="text-align:right;"> 1,096 (0.09\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Firearm Accessories </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 17,482 (0.22\%) </td>
   <td style="text-align:right;"> 4,833 (0.32\%) </td>
   <td style="text-align:right;"> 2,050 (0.17\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Weapons - Other </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 17,472 (0.22\%) </td>
   <td style="text-align:right;"> 2,823 (0.19\%) </td>
   <td style="text-align:right;"> 2,073 (0.17\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Recreational Vehicles </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 14,960 (0.18\%) </td>
   <td style="text-align:right;"> 41 (0.00\%) </td>
   <td style="text-align:right;"> 4,963 (0.41\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Medical/Medical Lab Equipment </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 13,977 (0.17\%) </td>
   <td style="text-align:right;"> 382 (0.03\%) </td>
   <td style="text-align:right;"> 1,196 (0.10\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Musical Instruments </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 12,467 (0.15\%) </td>
   <td style="text-align:right;"> 14 (0.00\%) </td>
   <td style="text-align:right;"> 998 (0.08\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pets </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 11,628 (0.14\%) </td>
   <td style="text-align:right;"> 13 (0.00\%) </td>
   <td style="text-align:right;"> 1,490 (0.12\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Farm Equipment </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 8,355 (0.10\%) </td>
   <td style="text-align:right;"> 78 (0.01\%) </td>
   <td style="text-align:right;"> 1,096 (0.09\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Artistic Supplies/Accessories </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 6,733 (0.08\%) </td>
   <td style="text-align:right;"> 46 (0.00\%) </td>
   <td style="text-align:right;"> 1,286 (0.11\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chemicals </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 5,881 (0.07\%) </td>
   <td style="text-align:right;"> 146 (0.01\%) </td>
   <td style="text-align:right;"> 899 (0.07\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gambling Equipment </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 4,598 (0.06\%) </td>
   <td style="text-align:right;"> 682 (0.04\%) </td>
   <td style="text-align:right;"> 351 (0.03\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Explosives </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 4,458 (0.05\%) </td>
   <td style="text-align:right;"> 1,370 (0.09\%) </td>
   <td style="text-align:right;"> 410 (0.03\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Drug/Narcotic Equipment </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 4,325 (0.05\%) </td>
   <td style="text-align:right;"> 411,222 (27.12\%) </td>
   <td style="text-align:right;"> 393 (0.03\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Watercraft </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 3,831 (0.05\%) </td>
   <td style="text-align:right;"> 7 (0.00\%) </td>
   <td style="text-align:right;"> 765 (0.06\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Watercraft Equipment/Parts/Accessories </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 2,933 (0.04\%) </td>
   <td style="text-align:right;"> 3 (0.00\%) </td>
   <td style="text-align:right;"> 248 (0.02\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Law Enforcement Equipment </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 2,816 (0.03\%) </td>
   <td style="text-align:right;"> 82 (0.01\%) </td>
   <td style="text-align:right;"> 361 (0.03\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Livestock </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 2,275 (0.03\%) </td>
   <td style="text-align:right;"> 10 (0.00\%) </td>
   <td style="text-align:right;"> 223 (0.02\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Logging Equipment </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1,504 (0.02\%) </td>
   <td style="text-align:right;"> 1 (0.00\%) </td>
   <td style="text-align:right;"> 114 (0.01\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Structures - Other </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1,351 (0.02\%) </td>
   <td style="text-align:right;"> 28 (0.00\%) </td>
   <td style="text-align:right;"> 107 (0.01\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Crops </td>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1,255 (0.02\%) </td>
   <td style="text-align:right;"> 15 (0.00\%) </td>
   <td style="text-align:right;"> 134 (0.01\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Buses </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1,197 (0.01\%) </td>
   <td style="text-align:right;"> 4 (0.00\%) </td>
   <td style="text-align:right;"> 672 (0.06\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Aircraft Parts/Accessories </td>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 943 (0.01\%) </td>
   <td style="text-align:right;"> 14 (0.00\%) </td>
   <td style="text-align:right;"> 89 (0.01\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Structures - Single Occupancy Dwellings </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 676 (0.01\%) </td>
   <td style="text-align:right;"> 10 (0.00\%) </td>
   <td style="text-align:right;"> 33 (0.00\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Structures - Storage </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 564 (0.01\%) </td>
   <td style="text-align:right;"> 16 (0.00\%) </td>
   <td style="text-align:right;"> 54 (0.00\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Aircraft </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 530 (0.01\%) </td>
   <td style="text-align:right;"> 25 (0.00\%) </td>
   <td style="text-align:right;"> 59 (0.00\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Structures - Other Commercial/Business </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 442 (0.01\%) </td>
   <td style="text-align:right;"> 6 (0.00\%) </td>
   <td style="text-align:right;"> 28 (0.00\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Structures - Other Dwellings </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 406 (0.00\%) </td>
   <td style="text-align:right;"> 3 (0.00\%) </td>
   <td style="text-align:right;"> 20 (0.00\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Special Category </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 232 (0.00\%) </td>
   <td style="text-align:right;"> 3 (0.00\%) </td>
   <td style="text-align:right;"> 15 (0.00\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Structures - Industrial Manufacturing </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 230 (0.00\%) </td>
   <td style="text-align:right;"> 1 (0.00\%) </td>
   <td style="text-align:right;"> 23 (0.00\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Structures - Public/Community </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 179 (0.00\%) </td>
   <td style="text-align:right;"> 3 (0.00\%) </td>
   <td style="text-align:right;"> 19 (0.00\%) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> - </td>
   <td style="text-align:right;"> 8,122,088 (100\%) </td>
   <td style="text-align:right;"> 1,516,418 (100\%) </td>
   <td style="text-align:right;"> 1,206,538 (100\%) </td>
  </tr>
</tbody>
</table>



As seen in Table \@ref(tab:propertySeizedDescription), all of the 68 different types of properties available in NIBRS can and, in 2022, were seized by police during an incident at least once. This includes atypical property like building material, musical instruments, and pets (and leads me to think that at least some of this is incorrectly labeled as property seized by the police). The vast majority of property seized by police, however, is drugs. 63.2% of the property seized were drugs themselves while 27.3% were equipment related to the drugs. The remaining items were mostly "other" (i.e. anything not explicitly categorized here) at 2.6%, money at 2%, firearms at 0.9%, and then a bunch of very rarely seized items. 


## Value of stolen property

For all types of property loss other than the property being seized by the police (and when the type is "unknown") there is data on the estimated value of that property. This is estimates by the police but is supposed to be the current value of the item (e.g. a stolen car is what it currently sells for, not what the buyer bought it for) and is the cost it will take for the victim to replace the item. To be a bit more specific, this variable is the sum of items stolen in this category. For example, if someone burglarizes a house and steals three rings from the victim, this would not count as three thefts of a ring. It would be recorded as loss of jewelry and the value would be the total value of all three rings.

The police can take the victim's estimation into consideration but are not supposed to immediately accept it as victims may exaggerate values (especially for insurance purposes). When items are recovered, the police put in the value at the time of recovery which may be substantially different than at the time of the loss if the item is damaged or destroyed.

We can use this variable to look at the value of items lost by the victim. Figure \@ref(fig:propertyValuePropertyLevel) looks at the value per item stolen in a crime (if incidents have multiple items stolen, this counts them all separately). This includes items lost by theft, robbery, and burglary so is part of the "Stolen/Robbed/Etc." category of types of property loss. It excludes items damaged or destroyed or burned (there is information about the value of property in these incidents but these are not shown in the figure). To make this graph a bit simpler I have rounded all values to the nearest \$100 so items valued at \$0 mean that they are worth between \$1 and \$50. 

<div class="figure" style="text-align: center">
<img src="17_nibrs_property_files/figure-html/propertyValuePropertyLevel-1.png" alt="The distribution of the value of property stolen. Each value is rounded to the nearest 100. The x-axis is set on the log scale as this distribution is hugely skewed. Values over 1,0000,00 are set to 1,000,000." width="100%" height="100%" />
<p class="caption">(\#fig:propertyValuePropertyLevel)The distribution of the value of property stolen. Each value is rounded to the nearest 100. The x-axis is set on the log scale as this distribution is hugely skewed. Values over 1,0000,00 are set to 1,000,000.</p>
</div>

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:nibrsPropertyStolenValue)Annual mean, median, and maximum values (in dollars) of property stolen and recovered, 1991-2023.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Year </th>
   <th style="text-align:right;"> Mean Value Stolen </th>
   <th style="text-align:right;"> Median Value Stolen </th>
   <th style="text-align:left;"> Max Value Stolen </th>
   <th style="text-align:right;"> Mean Value Recovered </th>
   <th style="text-align:right;"> Median Value Recovered </th>
   <th style="text-align:left;"> Max Value Recovered </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1,051 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 15,016,780 </td>
   <td style="text-align:right;"> 1,727 </td>
   <td style="text-align:right;"> 125 </td>
   <td style="text-align:left;"> 12,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 3,242 </td>
   <td style="text-align:right;"> 148 </td>
   <td style="text-align:left;"> 580,000,682 </td>
   <td style="text-align:right;"> 1,414 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:left;"> 1,790,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1993 </td>
   <td style="text-align:right;"> 14,701 </td>
   <td style="text-align:right;"> 129 </td>
   <td style="text-align:left;"> 900,000,000 </td>
   <td style="text-align:right;"> 23,215 </td>
   <td style="text-align:right;"> 95 </td>
   <td style="text-align:left;"> 900,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1994 </td>
   <td style="text-align:right;"> 41,258 </td>
   <td style="text-align:right;"> 129 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 64,414 </td>
   <td style="text-align:right;"> 85 </td>
   <td style="text-align:left;"> 999,999,999 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1995 </td>
   <td style="text-align:right;"> 2,074 </td>
   <td style="text-align:right;"> 134 </td>
   <td style="text-align:left;"> 450,000,000 </td>
   <td style="text-align:right;"> 6,196 </td>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:left;"> 450,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 2,560 </td>
   <td style="text-align:right;"> 147 </td>
   <td style="text-align:left;"> 800,000,085 </td>
   <td style="text-align:right;"> 1,750 </td>
   <td style="text-align:right;"> 85 </td>
   <td style="text-align:left;"> 3,500,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1997 </td>
   <td style="text-align:right;"> 1,640 </td>
   <td style="text-align:right;"> 135 </td>
   <td style="text-align:left;"> 450,000,000 </td>
   <td style="text-align:right;"> 1,830 </td>
   <td style="text-align:right;"> 92 </td>
   <td style="text-align:left;"> 1,300,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1998 </td>
   <td style="text-align:right;"> 1,898 </td>
   <td style="text-align:right;"> 146 </td>
   <td style="text-align:left;"> 480,000,000 </td>
   <td style="text-align:right;"> 1,978 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:left;"> 1,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1999 </td>
   <td style="text-align:right;"> 1,791 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 245,000,120 </td>
   <td style="text-align:right;"> 2,621 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:left;"> 100,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2000 </td>
   <td style="text-align:right;"> 1,252 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 100,001,280 </td>
   <td style="text-align:right;"> 2,379 </td>
   <td style="text-align:right;"> 124 </td>
   <td style="text-align:left;"> 838,466 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2001 </td>
   <td style="text-align:right;"> 8,128 </td>
   <td style="text-align:right;"> 143 </td>
   <td style="text-align:left;"> 890,000,000 </td>
   <td style="text-align:right;"> 4,397 </td>
   <td style="text-align:right;"> 125 </td>
   <td style="text-align:left;"> 500,000,001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2002 </td>
   <td style="text-align:right;"> 1,742 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 300,000,000 </td>
   <td style="text-align:right;"> 3,438 </td>
   <td style="text-align:right;"> 125 </td>
   <td style="text-align:left;"> 300,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2003 </td>
   <td style="text-align:right;"> 1,814 </td>
   <td style="text-align:right;"> 140 </td>
   <td style="text-align:left;"> 400,000,000 </td>
   <td style="text-align:right;"> 2,384 </td>
   <td style="text-align:right;"> 119 </td>
   <td style="text-align:left;"> 7,501,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2004 </td>
   <td style="text-align:right;"> 1,833 </td>
   <td style="text-align:right;"> 130 </td>
   <td style="text-align:left;"> 939,000,000 </td>
   <td style="text-align:right;"> 4,918 </td>
   <td style="text-align:right;"> 120 </td>
   <td style="text-align:left;"> 939,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2005 </td>
   <td style="text-align:right;"> 2,164 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 575,152,425 </td>
   <td style="text-align:right;"> 3,687 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 298,000,001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2006 </td>
   <td style="text-align:right;"> 1,315 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 100,003,300 </td>
   <td style="text-align:right;"> 2,656 </td>
   <td style="text-align:right;"> 174 </td>
   <td style="text-align:left;"> 5,726,400 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2007 </td>
   <td style="text-align:right;"> 1,850 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 950,000,000 </td>
   <td style="text-align:right;"> 2,650 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 100,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 3,031 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 4,434 </td>
   <td style="text-align:right;"> 120 </td>
   <td style="text-align:left;"> 999,999,999 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2009 </td>
   <td style="text-align:right;"> 1,179 </td>
   <td style="text-align:right;"> 155 </td>
   <td style="text-align:left;"> 100,000,000 </td>
   <td style="text-align:right;"> 1,719 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:left;"> 5,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2010 </td>
   <td style="text-align:right;"> 1,150 </td>
   <td style="text-align:right;"> 170 </td>
   <td style="text-align:left;"> 10,000,000 </td>
   <td style="text-align:right;"> 1,606 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:left;"> 2,199,999 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:right;"> 1,462 </td>
   <td style="text-align:right;"> 180 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 1,516 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:left;"> 2,001,850 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2012 </td>
   <td style="text-align:right;"> 1,222 </td>
   <td style="text-align:right;"> 175 </td>
   <td style="text-align:left;"> 100,000,000 </td>
   <td style="text-align:right;"> 1,554 </td>
   <td style="text-align:right;"> 103 </td>
   <td style="text-align:left;"> 18,805,960 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2013 </td>
   <td style="text-align:right;"> 1,792 </td>
   <td style="text-align:right;"> 168 </td>
   <td style="text-align:left;"> 950,000,000 </td>
   <td style="text-align:right;"> 1,788 </td>
   <td style="text-align:right;"> 108 </td>
   <td style="text-align:left;"> 100,000,020 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2014 </td>
   <td style="text-align:right;"> 1,271 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 100,000,350 </td>
   <td style="text-align:right;"> 1,667 </td>
   <td style="text-align:right;"> 109 </td>
   <td style="text-align:left;"> 1,800,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:right;"> 1,257 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 20,000,000 </td>
   <td style="text-align:right;"> 1,867 </td>
   <td style="text-align:right;"> 115 </td>
   <td style="text-align:left;"> 2,500,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 2,063 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 2,199 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 4,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 1,581 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 361,000,000 </td>
   <td style="text-align:right;"> 2,526 </td>
   <td style="text-align:right;"> 164 </td>
   <td style="text-align:left;"> 5,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 2,298 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 2,936 </td>
   <td style="text-align:right;"> 178 </td>
   <td style="text-align:left;"> 24,000,000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 13,226 </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 13,121 </td>
   <td style="text-align:right;"> 179 </td>
   <td style="text-align:left;"> 999,999,999 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2020 </td>
   <td style="text-align:right;"> 243,308 </td>
   <td style="text-align:right;"> 174 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 149,418 </td>
   <td style="text-align:right;"> 249 </td>
   <td style="text-align:left;"> 999,999,999 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2021 </td>
   <td style="text-align:right;"> 280,898 </td>
   <td style="text-align:right;"> 205 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 242,885 </td>
   <td style="text-align:right;"> 400 </td>
   <td style="text-align:left;"> 999,999,999 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2022 </td>
   <td style="text-align:right;"> 23,306 </td>
   <td style="text-align:right;"> 250 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 46,453 </td>
   <td style="text-align:right;"> 489 </td>
   <td style="text-align:left;"> 999,999,998 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2023 </td>
   <td style="text-align:right;"> 42,640 </td>
   <td style="text-align:right;"> 250 </td>
   <td style="text-align:left;"> 999,999,999 </td>
   <td style="text-align:right;"> 52,336 </td>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:left;"> 999,999,999 </td>
  </tr>
</tbody>
</table>



<div class="figure" style="text-align: center">
<img src="17_nibrs_property_files/figure-html/nibrsPropertyMaxValuePercent-1.png" alt="Annual percent of the value of all property stolen that is made up of the value that is the maximum dollar amount reported in that year, 1991-2023." width="100%" height="100%" />
<p class="caption">(\#fig:nibrsPropertyMaxValuePercent)Annual percent of the value of all property stolen that is made up of the value that is the maximum dollar amount reported in that year, 1991-2023.</p>
</div>

## Date property was recovered

This segment tells us both when the incident happened and, for stolen property, when the item was recovered. We can use this to look at how long it generally takes for property to be recovered (though most property stolen is never recovered). Figure \@ref(fig:propertyDaysUntilRecovered) shows the number of days it takes for property to be recovered. Though this data gives us the exact date, allowing for the precise number of days from property loss to recovery, this graph groups days greater than nine days to simplify the graph. The maximum number of days in the 2022 NIBRS data is 450 days so showing all days would be a rather unhelpful graph.   

The majority - 60.8% - of property lost is recovered on the same day, which is shown as zero days. We saw in Figure \@ref(fig:arrestsDaysUntilArrest) that the vast majority of arrests happen on the same day as the incident so it makes sense the most property would too.^[I would expect most property to be recovered on the arrestee's body.] A smaller and smaller share of property is recovered as the number of days from the incident increase, a trend also found in the time to arrest graph. The lesson here seems to be that if you are a victim of a crime and had something taken, unless it is recovered very quickly it is unlikely to be recovered at all. 

<div class="figure" style="text-align: center">
<img src="17_nibrs_property_files/figure-html/propertyDaysUntilRecovered-1.png" alt="The distribution of the number of days from the incident to the property recovered date. Zero days means that the arrest occurred on the same day as the incident." width="100%" height="100%" />
<p class="caption">(\#fig:propertyDaysUntilRecovered)The distribution of the number of days from the incident to the property recovered date. Zero days means that the arrest occurred on the same day as the incident.</p>
</div>

## Drugs

This segment also provides information about drugs seized by the police. This also includes cases where the police would have seized the drugs if the offender did not destroy it somehow, such as flushing it down the toilet. For each drug seized there is information on what type of drug it was and how much of the drug was seized. There can be up to three drugs seized in an incident and data is available for each type of drug. The exception, however, is when there are more than three drugs seized in an incident. In that case, information on the third drug just says that there were more than three drugs involved. So you would have information on the first two drugs but none on the third through however many (and it does not say how many) drugs. For the below table and figure I only look at the first drug seized, so the numbers shown are undercounts. 

The ordering of drugs when there are multiple drugs is based on how much drugs were recovered and the seriousness of the drugs. For example, heroin is probably considered more serious than marijuana, but overall ranking of drugs is a subjective assessment depending on the department. Is heroin more serious than meth? That decision likely varies by the agency and their situation in regard to what drugs they often seize. 

### Suspected drug type

The drugs in NIBRS are the "suspected drug types" which means that they are what the police believe the drugs to be, even if there is not definitive proof (such as a crime lab testing for what type of drug it is) that the drug is what they say it is. There are 15 possible drug types in NIBRS (16 when including "unknown drug type") and each is shown in Table \@ref(tab:propertyDrugs) along with how often they occur in the data. Some of these drug types are specific enough to only include a single drug while others are groups of drug types, such as hallucinogens or stimulants (and they include all of these types other than specifically stated drugs).

+ Amphetamines/Methamphetamines
+ Barbiturates
+ Cocaine (All Forms Except Crack)
+ Crack Cocaine
+ Hashish
+ Heroin
+ LSD
+ Marijuana
+ Morphine
+ Opium
+ Other Depressants: Glutethimide Or Doriden, Methaqualone Or Quaalude, Pentazocine Or Talwin, Etc.
+ Other Drugs: Antidepressants (Elavil, Triavil, Tofranil, Etc.), Aromatic Hydrocarbons, Propoxyphene Or Darvon, Tranquilizers (Chlordiazepoxide Or Librium, Diazepam Or Valium, Etc.), Etc.
+ Other Hallucinogrens: BMDA (White Acid), DMT, MDA, MDMA, Mescaline Or Peyote, Psilocybin, STP, Etc.
+ Other Narcotics: Codeine, Demerol, Dihydromorphinone Or Dilaudid, Hydrocodone Or Percodan, Methadone, Etc.
+ Other Stimulants: Adipex, Fastine And Ionamin (Derivatives of Phentermine), Benzedrine, Didrex, Methylphenidate Or Ritalin, Phenmetrazine Or Preludin, Tenuate, Etc.
+ PCP
+ Unknown Type Drug

Not too surprising, marijuana is the most common drug seized at 47% - or 455k incidents with it seized - of the data. This is followed by amphetamines/methamphetamines (including what we'd normally just call meth) at 20.7% and then heroin at 8.5%. Interestingly, cocaine and crack cocaine (which are always separate categories) both occur in 5.09% of drugs seized. Given the large disparity in sentences for these types of drugs, and that "crack wars" were a major purported cause of violent crime in the 1980s and 1990s, I expected crack cocaine to be much more common than normal cocaine. The remaining drug types are all less than 5% of drugs seized each and has some groupings of drug types (e.g. stimulants) rather than specific drug types (though some of these categories, such as LSD, are specific drugs). 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:propertyDrugs)The number and percent of drugs seized by police by type of drug, for all drugs seized in 2022.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Drug Type </th>
   <th style="text-align:right;"> First Year </th>
   <th style="text-align:right;"> \# of Drugs </th>
   <th style="text-align:left;"> \% of Drugs </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Marijuana </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 525,007 </td>
   <td style="text-align:left;"> 39.59\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Amphetamines/Methamphetamines </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 328,267 </td>
   <td style="text-align:left;"> 24.76\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Narcotics </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 106,271 </td>
   <td style="text-align:left;"> 8.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cocaine (All Forms Except Crack) </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 87,404 </td>
   <td style="text-align:left;"> 6.59\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Crack Cocaine </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 76,357 </td>
   <td style="text-align:left;"> 5.76\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Drugs </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 60,096 </td>
   <td style="text-align:left;"> 4.53\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Heroin </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 52,198 </td>
   <td style="text-align:left;"> 3.94\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Unknown Type Drug </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 37,221 </td>
   <td style="text-align:left;"> 2.81\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Opium </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 15,450 </td>
   <td style="text-align:left;"> 1.17\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Hallucinogens </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 11,965 </td>
   <td style="text-align:left;"> 0.90\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Depressants </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 7,889 </td>
   <td style="text-align:left;"> 0.59\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hashish </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 7,112 </td>
   <td style="text-align:left;"> 0.54\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Stimulants </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 4,923 </td>
   <td style="text-align:left;"> 0.37\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PCP </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1,671 </td>
   <td style="text-align:left;"> 0.13\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Barbiturates </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,507 </td>
   <td style="text-align:left;"> 0.11\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LSD </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,349 </td>
   <td style="text-align:left;"> 0.10\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Morphine </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1,278 </td>
   <td style="text-align:left;"> 0.10\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> 1,325,965 </td>
   <td style="text-align:left;"> 100\% </td>
  </tr>
</tbody>
</table>




<div class="figure" style="text-align: center">
<img src="17_nibrs_property_files/figure-html/nibrsPropertyDrugType-1.png" alt="Annual percent of drug seizures by drug type, for the 1st drug reported, 1991-2023." width="100%" height="100%" />
<p class="caption">(\#fig:nibrsPropertyDrugType)Annual percent of drug seizures by drug type, for the 1st drug reported, 1991-2023.</p>
</div>

### Amount of drugs

For each drug type we know exactly how much was seized (at least we do other than for the 6.7% where the amount is "not reported"). Since different drug types are measured in different ways, this data also tells us what units the amount seized is in. So you'll need to look at both the amount and the units to understand how much drugs were actually seized. The possible units are listed below:   

* Dosage Unit/Items (Pills, Etc.)
* Fluid Ounce
* Gallon                   
* Gram
* Kilogram       
* Liter                   
* Milliliter
* Number of Plants           
* Ounce
* Pound

Once you know the units you can look at the amount of drugs seized. The amount is specific up to the thousandths place though the integer and the numbers after the decimal point are actually in different columns in the data. For example, if police seized 1.257 grams of heroin, the 1 gram and the 0.257 grams would be in separate columns. As an example, we will look at Figure \@ref(fig:propertyMarijuanaGramMeasures) which shows the number of grams seized for marijuana. This is only looking at the column with the amount in integers, so parts of a gram are excluded (but are available in the data). This also excludes any case where the marijuana seized was measured in a unit other than gram, such as number of plants, ounces, or pounds. Even though the data shows the number of grams as actual integers, not grouped at all, I do group the larger values together to make the graph simpler. 

So with those caveats, we can see what amounts of marijuana, measured in grams, are most frequently seized. Generally, the amount of marijuana seized is in small amounts with 22.5% being 1-2 grams (since we do not include the parts of a gram we can only say that it is 1 to 1.999 grams) and 18.6% being less than one gram. As the amount of drugs increase, the percent of seizures that involve this number of drugs decreases. It's a bit curious that they include grams for values over 28 since 28.3495 grams is one ounce so it would make sense to just start reporting in units of ounces instead of just increasingly large number of grams.

<div class="figure" style="text-align: center">
<img src="17_nibrs_property_files/figure-html/propertyMarijuanaGramMeasures-1.png" alt="For drugs seized that are measured in grams, this figure shows the distribution in the number of grams seized. Values over 10 grams are grouped together for easier interpretation of lower values of drugs seized." width="100%" height="100%" />
<p class="caption">(\#fig:propertyMarijuanaGramMeasures)For drugs seized that are measured in grams, this figure shows the distribution in the number of grams seized. Values over 10 grams are grouped together for easier interpretation of lower values of drugs seized.</p>
</div>

