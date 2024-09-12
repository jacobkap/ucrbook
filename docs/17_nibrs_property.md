# Property and Window Property Segment {#property}





The Property Segment provides a bit more info than would be expected from the name. For each item involved in the crime it tells you what category that items falls into, with 68 total categories (including "other") ranging from explosives and pets to money and alcohol. It also tells you the estimated value of that item. This data covers more than just items stolen during a crime. For each item it tells you what happened to that item such as if it was stolen, damaged, seized by police (such as illegal items like drugs), recovered (from being stolen) by police, or burned during an arson.

For drug offenses it includes the drugs seized by police. For these offenses, the data tells us the type of drug, with 16 different drug categories ranging from specific ones like marijuana or heroin to broader categories such as "other narcotics". There can be up to three different drugs included in this data - if the person has more than three types of drugs seized then the third drug category will simply indicate that there are more than three drugs, so we learn what the first two drugs are but not the third or greater drugs are in these cases. For each drug we also know exactly how much was seized with one variable saying the amount the police found and another saying the units we should we reading that amount as (e.g. pills, grams, plants). 

In addition to the variables detailed below, this segment has the traditional agency and incident identifiers: the ORI code, the agency state, the year of this data, the incident number, and the incident date.

The Window Property Segment has the same variables as the normal Property Segment but also has 10 variables on each of the offenses committed (up to 10 offenses) during the incident. This is really to try to provide a bit of information that you’d otherwise get from the other segments but don’t since this is a window segment. For the rest of this chapter I’ll be using examples from the Property Segment and not the Window Property.

## Type of property loss {#propertyLoss}

This segment contains information on all property involved in the incident, other than the weapon used by the offender. Property can be involved in multiple ways - such as being stolen, destroyed, or that the stolen property is recovered by the police - so NIBRS breaks this info into seven different categories (eight when including "unknown" type). Figure \@ref(fig:propertyTypeLoss) shows each of these categories as how often they occur. The most common category, at 60.7% of the rows in this segment, is when the item is taken from the victim by the offender. This includes when the offender stole the item, took it by force in a robbery, tricked the victim (e.g. offender committed fraud), and any other way to illegal get the item (e.g. extortion, ransom, bribery). Though it includes all these types of ways to illegally take the item, it is often just called "stolen" property and I'll refer to it as such in this chapter just for simplicity of writing.  

The next most common group, at 13.3%, is when the item was seized by the police. This excludes items that were stolen and that the police recovered. It includes all types of property that the offender illegally had but is primary for drug crimes where the drug or drug equipment was seized. This segment also includes property damaged, destroyed, or vandalized by the offender and this type makes up 11.2% of the data. Following this, about 9% of rows are for recovered property which is when one of the previously stolen items is recovered by the police.

Next is "none" which only means that no property was stolen or damaged but that it could have been. For example, if someone tries to grab a person's purse but fails, that would be considered "none" since the purse wasn't actually taken. The remaining types are when the item was a counterfeit/forgery, at 1.2%, was burned (such as during an arson) at 0.2%, or when the type of loss is unknown at 0.2% 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/propertyTypeLoss-1} 

}

\caption{The type of loss or if the item is recovered.}(\#fig:propertyTypeLoss)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/nibrsPropertyAgenciesReporting-1} 

}

\caption{The annual number of agencies reporting data in the NIBRS Property Segment, 1991-2022.}(\#fig:nibrsPropertyAgenciesReporting)
\end{figure}

## Description of property

There are 68 different categories of properties (including the catch-all "other" category for anything not explicitly in a different category) that NIBRS covers. This also includes "identity - intangible" which means that someone stole the victim's identity. Identity isn't property since it's not a physical thing but is nonetheless included here (items related to one's identity such as social security cards are included in a different category called "identity documents"). Each of these categories can appear in any of the seven different types of property loss discussed above. For simplicity of writing, and because Table \@ref(tab:propertyStolenDescription) covers items stolen, I'll be talking below about items lost by being stolen, though everything does apply to other types of loss too. 

The property included in NIBRS can move from very broad categories like "merchandise" to more specific items such as livestock, aircraft, and pets. The property categories are mutually exclusive so a single item cannon be counted in different categories. If, for example, laptop is stolen that could potentially go in "computer hardware/software" or "office-type equipment" but it wouldn't be in both, it would only be recorded in one of the two. In cases where multiple items of the same type are stolen - such as someone stealing multiple laptops in a single crime - we don't actually know how many items were stolen. Just that at least one item of that category was stolen in the incident. We then know the total estimated value of the items stolen in that incident which we can use to estimate the number of items stolen (as long as the know the average value per item in that category) though this would be a very imprecise measure. The exception to this is for stolen vehicles where we know exactly how many were stolen and how many were recovered.

Table \@ref(tab:propertyStolenDescription) shows each of the 68 different types of property in NIBRS and shows the number of incidents where they were stolen for all incidents in the 2022 NIBRS data. Multiple different categories of property can be stolen in a single incident. The most common type of property stolen, at 14.3% of all property is "other" which isn't really that helpful to us. We know it's not one of the other 67 categories but not exactly what was stolen. Next, are money at 11.8% and then purses/handbags/wallets at 5.6%. This makes a lot of sense. People steal things for financial gain and the easiest way to get that gain is stealing money directly (or wallets and purses which often have money inside). Stealing property that you then have to sell or trade to get what you want (money or other property) is a lot harder, which is likely why it's less common. 

There are about 4.8 million rows in the Property Segment where the item was stolen (the other 3.1 million rows are about property that was seized by police, recovered, damaged, or one of the other types of property loss detailed in Section \@ref(propertyLoss)). As such, even items stolen very rarely can occur thousands or tens of thousands of times. For example, pets were the property stolen about 0.14% of the time and that tiny percent still accounts of 6,821 incidents with a pet stolen. Given the huge number of rows in this data - and as more agencies report to NIBRS this will grow quickly - it can be possible to study specific types of property, such as pets stolen, that wouldn't be possible with a more narrow dataset (both in terms of how specific the items they include are, and the size of the data). 


\begin{longtable}[t]{l|r|r|l}
\caption{(\#tab:propertyStolenDescription)The number and percent of property stolen (including forcibly taken such as during a robbery) in a crime, for all offenses in 2022. Each incident can have multiple items stolen.}\\
\hline
Property & First Year & \# of Property Stolen & \% of Property Stolen\\
\hline
\endfirsthead
\caption[]{(\#tab:propertyStolenDescription)The number and percent of property stolen (including forcibly taken such as during a robbery) in a crime, for all offenses in 2022. Each incident can have multiple items stolen. \textit{(continued)}}\\
\hline
Property & First Year & \# of Property Stolen & \% of Property Stolen\\
\hline
\endhead
Other & 1991 & 1,149,292 & 15.09\textbackslash{}\%\\
\hline
Money & 1991 & 824,234 & 10.82\textbackslash{}\%\\
\hline
Automobiles & 1991 & 570,623 & 7.49\textbackslash{}\%\\
\hline
Vehicle Parts/Accessories & 1991 & 535,780 & 7.03\textbackslash{}\%\\
\hline
Purses/Handbags/Wallets & 1991 & 377,761 & 4.96\textbackslash{}\%\\
\hline
Clothes/Furs & 1991 & 348,984 & 4.58\textbackslash{}\%\\
\hline
Credit/Debit Cards & 1991 & 313,888 & 4.12\textbackslash{}\%\\
\hline
Tools - Power/Hand & 1991 & 309,668 & 4.07\textbackslash{}\%\\
\hline
Merchandise & 1991 & 289,078 & 3.79\textbackslash{}\%\\
\hline
Consumable Goods & 1991 & 253,272 & 3.32\textbackslash{}\%\\
\hline
Identity Documents & 2009 & 252,837 & 3.32\textbackslash{}\%\\
\hline
Portible Electronic Communications & 2009 & 244,450 & 3.21\textbackslash{}\%\\
\hline
Computer Hardware/Software & 1991 & 201,441 & 2.64\textbackslash{}\%\\
\hline
Household Goods & 1991 & 200,120 & 2.63\textbackslash{}\%\\
\hline
Firearms & 1991 & 170,635 & 2.24\textbackslash{}\%\\
\hline
Identity - Intangible & 2009 & 162,824 & 2.14\textbackslash{}\%\\
\hline
Radios/Tvs/Vcrs & 1991 & 144,002 & 1.89\textbackslash{}\%\\
\hline
Jewelry/Precious Metals & 1991 & 141,635 & 1.86\textbackslash{}\%\\
\hline
Bicycles & 1991 & 123,395 & 1.62\textbackslash{}\%\\
\hline
Documents - Personal Or Business & 2009 & 94,572 & 1.24\textbackslash{}\%\\
\hline
Trucks & 1991 & 93,364 & 1.23\textbackslash{}\%\\
\hline
Alcohol & 1991 & 75,575 & 0.99\textbackslash{}\%\\
\hline
Other Motor Vehicles & 1991 & 59,593 & 0.78\textbackslash{}\%\\
\hline
Negotiable Instruments & 1991 & 54,250 & 0.71\textbackslash{}\%\\
\hline
Office-Type Equipment & 1991 & 53,825 & 0.71\textbackslash{}\%\\
\hline
Lawn/Yard/Garden Equipment & 2009 & 47,867 & 0.63\textbackslash{}\%\\
\hline
Trailers & 2009 & 45,526 & 0.60\textbackslash{}\%\\
\hline
Building Materials & 2009 & 43,258 & 0.57\textbackslash{}\%\\
\hline
Drugs/Narcotics & 1991 & 42,540 & 0.56\textbackslash{}\%\\
\hline
Recreational/Sports Equipment & 2009 & 40,414 & 0.53\textbackslash{}\%\\
\hline
Nonnegotiable Instruments & 1991 & 31,060 & 0.41\textbackslash{}\%\\
\hline
Fuel & 2009 & 30,233 & 0.40\textbackslash{}\%\\
\hline
Camping/Hunting/Fishing Equipment/Supplies & 2009 & 28,371 & 0.37\textbackslash{}\%\\
\hline
Photographic/Optical Equipment & 2009 & 27,502 & 0.36\textbackslash{}\%\\
\hline
Heavy Construction/Industrial Equipment & 1991 & 24,878 & 0.33\textbackslash{}\%\\
\hline
Metals, Non-Precious & 2009 & 18,589 & 0.24\textbackslash{}\%\\
\hline
Collections/Collectibles & 2009 & 18,126 & 0.24\textbackslash{}\%\\
\hline
Firearm Accessories & 2009 & 18,115 & 0.24\textbackslash{}\%\\
\hline
Weapons - Other & 2009 & 17,843 & 0.23\textbackslash{}\%\\
\hline
Pending Inventory (Of Property) & 1991 & 17,818 & 0.23\textbackslash{}\%\\
\hline
Recordings - Audio/Visual & 1991 & 17,146 & 0.23\textbackslash{}\%\\
\hline
Medical/Medical Lab Equipment & 2009 & 13,153 & 0.17\textbackslash{}\%\\
\hline
Musical Instruments & 2009 & 12,275 & 0.16\textbackslash{}\%\\
\hline
Recreational Vehicles & 1991 & 11,395 & 0.15\textbackslash{}\%\\
\hline
Pets & 2009 & 11,368 & 0.15\textbackslash{}\%\\
\hline
Farm Equipment & 1991 & 8,892 & 0.12\textbackslash{}\%\\
\hline
Artistic Supplies/Accessories & 2009 & 6,265 & 0.08\textbackslash{}\%\\
\hline
Chemicals & 2009 & 5,326 & 0.07\textbackslash{}\%\\
\hline
Explosives & 2010 & 4,542 & 0.06\textbackslash{}\%\\
\hline
Gambling Equipment & 1991 & 4,482 & 0.06\textbackslash{}\%\\
\hline
Watercraft & 1991 & 4,064 & 0.05\textbackslash{}\%\\
\hline
Drug/Narcotic Equipment & 1991 & 4,000 & 0.05\textbackslash{}\%\\
\hline
Watercraft Equipment/Parts/Accessories & 2009 & 3,186 & 0.04\textbackslash{}\%\\
\hline
Law Enforcement Equipment & 2009 & 2,773 & 0.04\textbackslash{}\%\\
\hline
Livestock & 1991 & 2,242 & 0.03\textbackslash{}\%\\
\hline
Logging Equipment & 2009 & 1,470 & 0.02\textbackslash{}\%\\
\hline
Structures - Other & 1991 & 1,311 & 0.02\textbackslash{}\%\\
\hline
Crops & 2010 & 1,199 & 0.02\textbackslash{}\%\\
\hline
Buses & 1991 & 1,121 & 0.01\textbackslash{}\%\\
\hline
Aircraft Parts/Accessories & 2009 & 1,053 & 0.01\textbackslash{}\%\\
\hline
Structures - Single Occupancy Dwellings & 1991 & 624 & 0.01\textbackslash{}\%\\
\hline
Structures - Storage & 1991 & 546 & 0.01\textbackslash{}\%\\
\hline
Aircraft & 1991 & 491 & 0.01\textbackslash{}\%\\
\hline
Structures - Commercial/Business & 1991 & 438 & 0.01\textbackslash{}\%\\
\hline
Structures - Other Dwellings & 1991 & 348 & 0.00\textbackslash{}\%\\
\hline
Special Category & 1991 & 281 & 0.00\textbackslash{}\%\\
\hline
Structures - Industrial Manufacturing & 1991 & 224 & 0.00\textbackslash{}\%\\
\hline
Structures - Public/Community & 1991 & 207 & 0.00\textbackslash{}\%\\
\hline
Total & - & 7,617,660 & 100\textbackslash{}\%\\
\hline
\end{longtable}



As seen in Table \@ref(tab:propertySeizedDescription), all of the 68 different types of properties available in NIBRS can and, in 2022, were seized by police during an incident at least once. This includes atypical property like building material, musical instruments, and pets (and leads me to think that at least some of this is incorrectly labeled as property seized by the police). The vast majority of property seized by police, however, is drugs. 63.2% of the property seized were drugs themselves while 27.3% were equipment related to the drugs. The remaining items were mostly "other" (i.e. anything not explicitly categorized here) at 2.6%, money at 2%, firearms at 0.9%, and then a bunch of very rarely seized items. 


\begin{longtable}[t]{l|r|r}
\caption{(\#tab:propertySeizedDescription)The number and percent of property seized by police (excludes recovering property that was stolen, for all offenses in 2022. Each incident can have multiple items seized.}\\
\hline
Property & \# of Property Seized & \% of Property Seized\\
\hline
\endfirsthead
\caption[]{(\#tab:propertySeizedDescription)The number and percent of property seized by police (excludes recovering property that was stolen, for all offenses in 2022. Each incident can have multiple items seized. \textit{(continued)}}\\
\hline
Property & \# of Property Seized & \% of Property Seized\\
\hline
\endhead
Drugs/Narcotics & 916,616 & 63.68\textbackslash{}\%\\
\hline
Drug/Narcotic Equipment & 391,785 & 27.22\textbackslash{}\%\\
\hline
Other & 37,857 & 2.63\textbackslash{}\%\\
\hline
Money & 21,762 & 1.51\textbackslash{}\%\\
\hline
Firearms & 17,471 & 1.21\textbackslash{}\%\\
\hline
Portible Electronic Communications & 7,798 & 0.54\textbackslash{}\%\\
\hline
Firearm Accessories & 4,740 & 0.33\textbackslash{}\%\\
\hline
Automobiles & 4,037 & 0.28\textbackslash{}\%\\
\hline
Documents - Personal Or Business & 3,580 & 0.25\textbackslash{}\%\\
\hline
Identity Documents & 3,477 & 0.24\textbackslash{}\%\\
\hline
Purses/Handbags/Wallets & 2,852 & 0.20\textbackslash{}\%\\
\hline
Weapons - Other & 2,699 & 0.19\textbackslash{}\%\\
\hline
Credit/Debit Cards & 1,981 & 0.14\textbackslash{}\%\\
\hline
Consumable Goods & 1,954 & 0.14\textbackslash{}\%\\
\hline
Office-Type Equipment & 1,899 & 0.13\textbackslash{}\%\\
\hline
Vehicle Parts/Accessories & 1,712 & 0.12\textbackslash{}\%\\
\hline
Negotiable Instruments & 1,521 & 0.11\textbackslash{}\%\\
\hline
Recordings - Audio/Visual & 1,505 & 0.10\textbackslash{}\%\\
\hline
Computer Hardware/Software & 1,494 & 0.10\textbackslash{}\%\\
\hline
Alcohol & 1,433 & 0.10\textbackslash{}\%\\
\hline
Clothes/Furs & 1,350 & 0.09\textbackslash{}\%\\
\hline
Household Goods & 1,300 & 0.09\textbackslash{}\%\\
\hline
Explosives & 1,267 & 0.09\textbackslash{}\%\\
\hline
Tools - Power/Hand & 1,131 & 0.08\textbackslash{}\%\\
\hline
Nonnegotiable Instruments & 1,106 & 0.08\textbackslash{}\%\\
\hline
Merchandise & 525 & 0.04\textbackslash{}\%\\
\hline
Gambling Equipment & 503 & 0.03\textbackslash{}\%\\
\hline
Radios/Tvs/Vcrs & 467 & 0.03\textbackslash{}\%\\
\hline
Heavy Construction/Industrial Equipment & 407 & 0.03\textbackslash{}\%\\
\hline
Other Motor Vehicles & 363 & 0.03\textbackslash{}\%\\
\hline
Jewelry/Precious Metals & 358 & 0.02\textbackslash{}\%\\
\hline
Medical/Medical Lab Equipment & 329 & 0.02\textbackslash{}\%\\
\hline
Trucks & 274 & 0.02\textbackslash{}\%\\
\hline
Photographic/Optical Equipment & 231 & 0.02\textbackslash{}\%\\
\hline
Identity - Intangible & 217 & 0.02\textbackslash{}\%\\
\hline
Chemicals & 181 & 0.01\textbackslash{}\%\\
\hline
Bicycles & 160 & 0.01\textbackslash{}\%\\
\hline
Pending Inventory (Of Property) & 142 & 0.01\textbackslash{}\%\\
\hline
Camping/Hunting/Fishing Equipment/Supplies & 96 & 0.01\textbackslash{}\%\\
\hline
Collections/Collectibles & 94 & 0.01\textbackslash{}\%\\
\hline
Recreational/Sports Equipment & 81 & 0.01\textbackslash{}\%\\
\hline
Law Enforcement Equipment & 68 & 0.00\textbackslash{}\%\\
\hline
Metals, Non-Precious & 54 & 0.00\textbackslash{}\%\\
\hline
Farm Equipment & 54 & 0.00\textbackslash{}\%\\
\hline
Artistic Supplies/Accessories & 53 & 0.00\textbackslash{}\%\\
\hline
Building Materials & 49 & 0.00\textbackslash{}\%\\
\hline
Trailers & 45 & 0.00\textbackslash{}\%\\
\hline
Structures - Other & 40 & 0.00\textbackslash{}\%\\
\hline
Recreational Vehicles & 34 & 0.00\textbackslash{}\%\\
\hline
Crops & 29 & 0.00\textbackslash{}\%\\
\hline
Lawn/Yard/Garden Equipment & 29 & 0.00\textbackslash{}\%\\
\hline
Fuel & 23 & 0.00\textbackslash{}\%\\
\hline
Structures - Storage & 20 & 0.00\textbackslash{}\%\\
\hline
Aircraft & 17 & 0.00\textbackslash{}\%\\
\hline
Musical Instruments & 16 & 0.00\textbackslash{}\%\\
\hline
Pets & 11 & 0.00\textbackslash{}\%\\
\hline
Aircraft Parts/Accessories & 10 & 0.00\textbackslash{}\%\\
\hline
Livestock & 9 & 0.00\textbackslash{}\%\\
\hline
Structures - Public/Community & 8 & 0.00\textbackslash{}\%\\
\hline
Structures - Commercial/Business & 7 & 0.00\textbackslash{}\%\\
\hline
Buses & 6 & 0.00\textbackslash{}\%\\
\hline
Watercraft Equipment/Parts/Accessories & 6 & 0.00\textbackslash{}\%\\
\hline
Structures - Industrial Manufacturing & 4 & 0.00\textbackslash{}\%\\
\hline
Structures - Single Occupancy Dwellings & 4 & 0.00\textbackslash{}\%\\
\hline
Logging Equipment & 4 & 0.00\textbackslash{}\%\\
\hline
Watercraft & 3 & 0.00\textbackslash{}\%\\
\hline
Structures - Other Dwellings & 3 & 0.00\textbackslash{}\%\\
\hline
Special Category & 2 & 0.00\textbackslash{}\%\\
\hline
Total & 1,439,363 & 100\textbackslash{}\%\\
\hline
\end{longtable}



## Value of stolen property

For all types of property loss other than the property being seized by the police (and when the type is "unknown") there is data on the estimated value of that property. This is estimates by the police but is supposed to be the current value of the item (e.g. a stolen car is what it currently sells for, not what the buyer bought it for) and is the cost it'll take for the victim to replace the item. To be a bit more specific, this variable is the sum of items stolen in this category. For example, if someone burglarizes a house and steals three rings from the victim, this would not count as three thefts of a ring. It would be recorded as loss of jewelry and the value would be the total value of all three rings.

The police can take the victim's estimation into consideration but aren't supposed to immediately accept it as victims may exaggerate values (especially for insurance purposes). When items are recovered, the police put in the value at the time of recovery which may be substantially different than at the time of the loss if the item is damaged or destroyed.

We can use this variable to look at the value of items lost by the victim. Figure \@ref(fig:propertyValuePropertyLevel) looks at the value per item stolen in a crime (if incidents have multiple items stolen, this counts them all separately). This includes items lost by theft, robbery, and burglary so is part of the "Stolen/Robbed/Etc." category of types of property loss. It excludes items damaged or destroyed or burned (there is info about the value of property in these incidents but these are not shown in the figure). To make this graph a bit simpler I've rounded all values to the nearest \$100 so items valued at \$0 mean that they are worth between \$1 and \$50. I've also capped the largest value to \$1,000,000 and set the x-axis on the log scale since the data skews very much to the right. The average item lost was worth \$3,217 and the median was worth \$150. Most items lost were relative cheap with 34.9% worth under \$50 and 13.5% worth between \$51 and \$149. There is a sharp decline in the frequency of property stolen as the value increases. So while some extremely valuable items are lost during crimes, they are much less common than relatively low-value items. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/propertyValuePropertyLevel-1} 

}

\caption{The distribution of the value of property stolen. Values are capped at 1,000,000 and each value is rounded to the nearest 100. The x-axis is set on the log scale as this distribution is hugely right skewed.}(\#fig:propertyValuePropertyLevel)
\end{figure}

Since multiple items can be stolen in a single incident, to better understand the cost of crime for the victim we probably want to add up all of the property to the incident-level. Figure \@ref(fig:propertyValuePropertyLevel) does this and shows the cost of property stolen per incident. The trend is nearly identical to Figure \@ref(tab:propertySeizedDescription) but the value is a bit higher than before. Now fewer than a quarter of incidents result in a loss of <\$50 and the average cost per incident is \$4,731 (median = \$300).

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/propertyValueIncidentLevel-1} 

}

\caption{The incident-level distribution of the value of property stolen. As values are aggregated to the incident-level, these are higher than the above graph which shows each item individually. Values are capped at 1,000,000 and each value is rounded to the nearest 100. The x-axis is set on the log scale as this distribution is hugely right skewed.}(\#fig:propertyValueIncidentLevel)
\end{figure}



\begin{longtable}[t]{l|r|r|l|r|r|l}
\caption{(\#tab:nibrsPropertyStolenValue)Annual mean, median, and maximum values (in dollars) of property stolen and recovered, 1991-2022.}\\
\hline
Year & Mean Value Stolen & Median Value Stolen & Max Value Stolen & Mean Value Recovered & Median Value Recovered & Max Value Recovered\\
\hline
\endfirsthead
\caption[]{(\#tab:nibrsPropertyStolenValue)Annual mean, median, and maximum values (in dollars) of property stolen and recovered, 1991-2022. \textit{(continued)}}\\
\hline
Year & Mean Value Stolen & Median Value Stolen & Max Value Stolen & Mean Value Recovered & Median Value Recovered & Max Value Recovered\\
\hline
\endhead
1,991 & 1,051 & 150 & 15,016,780 & 1,727 & 125 & 12,000,000\\
\hline
1,992 & 3,242 & 148 & 580,000,682 & 1,414 & 100 & 1,790,000\\
\hline
1,993 & 14,701 & 129 & 900,000,000 & 23,215 & 95 & 900,000,000\\
\hline
1,994 & 41,258 & 129 & 999,999,999 & 64,414 & 85 & 999,999,999\\
\hline
1,995 & 2,074 & 134 & 450,000,000 & 6,196 & 81 & 450,000,000\\
\hline
1,996 & 2,560 & 147 & 800,000,085 & 1,750 & 85 & 3,500,000\\
\hline
1,997 & 1,640 & 135 & 450,000,000 & 1,830 & 92 & 1,300,000\\
\hline
1,998 & 1,898 & 146 & 480,000,000 & 1,978 & 100 & 1,000,000\\
\hline
1,999 & 1,791 & 150 & 245,000,120 & 2,621 & 100 & 100,000,000\\
\hline
2,000 & 1,252 & 150 & 100,001,280 & 2,379 & 124 & 838,466\\
\hline
2,001 & 8,128 & 143 & 890,000,000 & 4,397 & 125 & 500,000,001\\
\hline
2,002 & 1,742 & 150 & 300,000,000 & 3,438 & 125 & 300,000,000\\
\hline
2,003 & 1,814 & 140 & 400,000,000 & 2,384 & 119 & 7,501,000\\
\hline
2,004 & 1,833 & 130 & 939,000,000 & 4,918 & 120 & 939,000,000\\
\hline
2,005 & 2,164 & 150 & 575,152,425 & 3,687 & 150 & 298,000,001\\
\hline
2,006 & 1,315 & 150 & 100,003,300 & 2,656 & 174 & 5,726,400\\
\hline
2,007 & 1,850 & 150 & 950,000,000 & 2,650 & 150 & 100,000,000\\
\hline
2,008 & 3,031 & 150 & 999,999,999 & 4,434 & 120 & 999,999,999\\
\hline
2,009 & 1,179 & 155 & 100,000,000 & 1,719 & 100 & 5,000,000\\
\hline
2,010 & 1,150 & 170 & 10,000,000 & 1,606 & 100 & 2,199,999\\
\hline
2,011 & 1,462 & 180 & 999,999,999 & 1,516 & 100 & 2,001,850\\
\hline
2,012 & 1,222 & 175 & 100,000,000 & 1,554 & 103 & 18,805,960\\
\hline
2,013 & 1,792 & 168 & 950,000,000 & 1,788 & 108 & 100,000,020\\
\hline
2,014 & 1,271 & 150 & 100,000,350 & 1,667 & 109 & 1,800,000\\
\hline
2,015 & 1,257 & 150 & 20,000,000 & 1,867 & 115 & 2,500,000\\
\hline
2,016 & 2,063 & 150 & 999,999,999 & 2,199 & 150 & 4,000,000\\
\hline
2,017 & 1,561 & 150 & 361,000,000 & 2,520 & 160 & 5,000,000\\
\hline
2,018 & 2,009 & 150 & 313,600,000 & 2,911 & 172 & 24,000,000\\
\hline
2,019 & 3,217 & 150 & 999,999,999 & 5,543 & 168 & 999,999,999\\
\hline
2,020 & 229,834 & 170 & 999,999,999 & 129,068 & 223 & 999,999,999\\
\hline
2,021 & 284,937 & 207 & 999,999,999 & 250,610 & 400 & 999,999,999\\
\hline
2,022 & 72,129 & 250 & 999,999,999 & 81,535 & 462 & 999,999,999\\
\hline
\end{longtable}



\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/nibrsPropertyMaxValuePercent-1} 

}

\caption{Annual percent of the value of all property stolen that is made up of the value that is the maximum dollar amount reported in that year, 1991-2022.}(\#fig:nibrsPropertyMaxValuePercent)
\end{figure}

## Date property was recovered

This segment tells us both when the incident happened and, for stolen property, when the item was recovered. We can use this to look at how long it generally takes for property to be recovered (though most property stolen is never recovered). Figure \@ref(fig:propertyDaysUntilRecovered) shows the number of days it takes for property to be recovered. Though this data gives us the exact date, allowing for the precise number of days from property loss to recovery, this graph groups days greater than nine days to simplify the graph. The maximum number of days in the 2022 NIBRS data is 450 days so showing all days would be a rather unhelpful graph.   

The majority - 60.8% - of property lost is recovered on the same day, which is shown as zero days. We saw in Figure \@ref(fig:arrestsDaysUntilArrest) that the vast majority of arrests happen on the same day as the incident so it makes sense the most property would too.^[I'd expect most property to be recovered on the arrestee's body.] A smaller and smaller share of property is recovered as the number of days from the incident increase, a trend also found in the time to arrest graph. The lesson here seems to be that if you're a victim of a crime and had something taken, unless it's recovered very quickly it's unlikely to be recovered at all. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/propertyDaysUntilRecovered-1} 

}

\caption{The distribution of the number of days from the incident to the property recovered date. In 2022 the maximum days from incident to arrest was 456 days. Zero days means that the arrest occurred on the same day as the incident. }(\#fig:propertyDaysUntilRecovered)
\end{figure}

## Drugs

This segment also provides information about drugs seized by the police. This also includes cases where the police would have seized the drugs if the offender didn't destroy it somehow, such as flushing it down the toilet. For each drug seized there is information on what type of drug it was and how much of the drug was seized. There can be up to three drugs seized in an incident and data is available for each type of drug. The exception, however, is when there are more than three drugs seized in an incident. In that case, info on the third drug just says that there were more than three drugs involved. So you'd have info on the first two drugs but none on the third through however many (and it doesn't say how many) drugs. For the below table and figure I only look at the first drug seized, so the numbers shown are undercounts. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/nibrsPropertySeizures-1} 

}

\caption{The annual number of drug seizures reported, 1991-2022.}(\#fig:nibrsPropertySeizures)
\end{figure}

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


\begin{longtable}[t]{l|r|r|l}
\caption{(\#tab:propertyDrugs)The number and percent of drugs seized by police by type of drug, for all drugs seized in 2022.}\\
\hline
Drug Type & First Year & \textbackslash{}\# of Drugs & \textbackslash{}\% of Drugs\\
\hline
\endfirsthead
\caption[]{(\#tab:propertyDrugs)The number and percent of drugs seized by police by type of drug, for all drugs seized in 2022. \textit{(continued)}}\\
\hline
Drug Type & First Year & \textbackslash{}\# of Drugs & \textbackslash{}\% of Drugs\\
\hline
\endhead
Marijuana & 1991 & 557,044 & 44.09\textbackslash{}\%\\
\hline
Amphetamines/Methamphetamines & 1991 & 301,759 & 23.88\textbackslash{}\%\\
\hline
Other Narcotics & 1991 & 78,941 & 6.25\textbackslash{}\%\\
\hline
Cocaine (All Forms Except Crack) & 1991 & 73,157 & 5.79\textbackslash{}\%\\
\hline
Heroin & 1991 & 68,859 & 5.45\textbackslash{}\%\\
\hline
Crack Cocaine & 1991 & 64,853 & 5.13\textbackslash{}\%\\
\hline
Other Drugs & 1991 & 47,748 & 3.78\textbackslash{}\%\\
\hline
Unknown Type Drug & 1991 & 26,787 & 2.12\textbackslash{}\%\\
\hline
Opium & 1992 & 11,881 & 0.94\textbackslash{}\%\\
\hline
Other Hallucinogrens & 1991 & 8,799 & 0.70\textbackslash{}\%\\
\hline
Hashish & 1991 & 6,963 & 0.55\textbackslash{}\%\\
\hline
Other Depressants & 1991 & 6,825 & 0.54\textbackslash{}\%\\
\hline
Other Stimulants & 1991 & 3,996 & 0.32\textbackslash{}\%\\
\hline
Barbiturates & 1991 & 1,582 & 0.13\textbackslash{}\%\\
\hline
PCP & 1993 & 1,510 & 0.12\textbackslash{}\%\\
\hline
LSD & 1991 & 1,461 & 0.12\textbackslash{}\%\\
\hline
Morphine & 1992 & 1,271 & 0.10\textbackslash{}\%\\
\hline
Total & - & 1,263,436 & 100\textbackslash{}\%\\
\hline
\end{longtable}




\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/nibrsPropertyDrugType-1} 

}

\caption{Annual percent of drug seizures by drug type, for the 1st drug reported, 1991-2022.}(\#fig:nibrsPropertyDrugType)
\end{figure}

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

Once you know the units you can look at the amount of drugs seized. The amount is specific up to the thousandths place though the integer and the numbers after the decimal point are actually in different columns in the data. For example, if police seized 1.257 grams of heroin, the 1 gram and the 0.257 grams would be in separate columns. As an example, we'll look at Figure \@ref(fig:propertyMarijuanaGramMeasures) which shows the number of grams seized for marijuana. This is only looking at the column with the amount in integers, so parts of a gram are excluded (but are available in the data). This also excludes any case where the marijuana seized was measured in a unit other than gram, such as number of plants, ounces, or pounds. Even though the data shows the number of grams as actual integers, not grouped at all, I do group the larger values together to make the graph simpler. 

So with those caveats, we can see what amounts of marijuana, measured in grams, are most frequently seized. Generally, the amount of marijuana seized is in small amounts with 22.5% being 1-2 grams (since we don't include the parts of a gram we can only say that it is 1 to 1.999 grams) and 18.6% being less than one gram. As the amount of drugs increase, the percent of seizures that involve this number of drugs decreases. It's a bit curious that they include grams for values over 28 since 28.3495 grams is one ounce so it'd make sense to just start reporting in units of ounces instead of just increasingly large number of grams.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{17_nibrs_property_files/figure-latex/propertyMarijuanaGramMeasures-1} 

}

\caption{For drugs seized that are measured in grams, this figure shows the distribution in the number of grams seized. Values over 10 grams are grouped together for easier interpretation of lower values of drugs seized.}(\#fig:propertyMarijuanaGramMeasures)
\end{figure}

