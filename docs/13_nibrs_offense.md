# Offense Segment {#offenseSegment}





This segment provides information about the offense that occurred, and each incident can have multiple offenses. This data tells you which offense occurred and for a subset of offenses it also provides a more detailed subcategory of offense, allowing a deeper dive into what exactly happened. For example, for animal abuse there are four subcategories of offenses: simple/gross neglect of an animal, intentional abuse or torture, animal sexual abuse (bestiality), and organized fighting of animals such as dog or cock fights. This segment also says what date the crime occurred on, where the crime occurred - in categories such as residence or sidewalk rather than exact coordinates in a city - whether the offender is suspected of using drugs, alcohol, or "computer equipment" (which includes cell phones) during the crime, and which weapon was used. In cases where the weapon was a firearm it says whether that weapon was fully automatic or not. It also provides information on if the crime was a hate crime by including a variable on the bias motivation (if any) of the offender. This is based on evidence that the crime was motivated, at least in part, by the victim's group (e.g. race, sexuality, religion, etc.). There are 34 possible bias motivations and while hate crimes could potentially be motivated by bias against multiple groups, this data only allows for a single bias motivation.

In addition to the variables detailed below this segment has the traditional agency and incident identifiers: the ORI code, the agency state, the year of this data, and the incident number. It also has the date of the incident, which is also included in the Administrative Segment.^[Potentially some offenses could occur after the incident date. For example, if an incident happened at 11:50pm and it had multiple crimes involved, some of them may occur the follow day, such as at 12:01am.] 

## Crime category

The first important variable in the Offense Segment is figuring out exactly what offense was committed. This tells you what crime occurred in the incident. There can be multiple crimes in a single incident so this provides info about each crime that occurred. To figure out which offenses belong together, just look at the incident number and the ORI. Within ORI, each incident number is a unique identifier for an incident. Each crime is mutually exclusive and crimes which are elements of another crime are counted only as the crime they are elements of. For example, robberies are basically theft plus assault/intimidation - it is the use of force or threat of force (assault or intimidation) to take property (theft). A case of robbery in this data would only count as robbery, not as robbery and theft and assault/intimidation. If there are these crimes together in an incident that's because that crime *also* occurred separately. For example, if someone is robbed and after the robbery is over (i.e. they hand over their belongings) they are then punched repeatedly, that could potentially be classified as a robbery and an assault. 

Table \@ref(tab:offenseCrimeCategories) shows each possible crime in the data and how common it was in 2019. It's sorted by frequency instead of alphabetically so it's easier to see which crimes are most common. There were about 7.4 million crimes reported to NIBRS in 2019.  The most common crime is simple assault - which is an assault that didn't use a weapon and didn't result in serious injury - at 12.7% of crimes, or about 944k crimes. If you think this is odd because property crimes are more common than violent crimes, you'd be right. NIBRS data is pretty specific in its crime categories so it splits up certain crimes into a number of different categories. Theft is the most common crime committed in the United States. In NIBRS it's broken into several different types of theft so you need to combine them together to actually measure theft in its entirety. Of the top 6 most common crimes, theft crimes make up ranks 3, 5, and 6 (all other larceny, theft from motor vehicle, and shoplifting). 

Though each agency is supposed to report the same crimes - using the exact same definition of the crimes so the data is consistent - that isn't always true in practice. For example, animal cruelty became a NIBRS crime in 2018 (before that it wasn't an option so agencies could not report it) and likely most agencies in the US have had at least one animal abuse crime since then. In 2018, however, reporting was concentrated in a small number of states, meaning that not all agencies reported that offense. The concentration in certain states suggests that this low reporting is due to agencies in certain states deciding (or not being able to, such as if having older reporting systems which don't have animal cruelty as an option) not to report that offense at all. Reporting has increased in 2019 (though still remains highly concentrated), suggesting that over time more agencies begin reporting crimes as they are added. Therefore, I strongly suggest examining your data over time and across geographic areas to see if there are any biases before using it. 



Table: (\#tab:offenseCrimeCategories)The number and percent of crimes reported from all agencies in 2022, by crime category.

|Crime Category                                                      | \# of Offenses| \% of Offenses|
|:-------------------------------------------------------------------|--------------:|--------------:|
|Assault Offenses - Simple Assault                                   |      1,725,221|        13.57\%|
|Destruction/Damage/Vandalism of Property                            |      1,499,936|        11.80\%|
|Larceny/Theft Offenses - All Other Larceny                          |      1,341,444|        10.55\%|
|Drug/Narcotic Offenses - Drug/Narcotic Violations                   |        993,308|         7.81\%|
|Larceny/Theft Offenses - Theft From Motor Vehicle                   |        851,640|         6.70\%|
|Larceny/Theft Offenses - Shoplifting                                |        733,952|         5.77\%|
|Motor Vehicle Theft                                                 |        721,788|         5.68\%|
|Burglary/Breaking And Entering                                      |        673,144|         5.30\%|
|Assault Offenses - Aggravated Assault                               |        540,892|         4.25\%|
|Assault Offenses - Intimidation                                     |        474,517|         3.73\%|
|Drug/Narcotic Offenses - Drug Equipment Violations                  |        467,075|         3.67\%|
|Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories   |        378,447|         2.98\%|
|Fraud Offenses - False Pretenses/Swindle/Confidence Game            |        337,056|         2.65\%|
|Weapon Law Violations - Weapon Law Violations                       |        326,104|         2.57\%|
|Larceny/Theft Offenses - Theft From Building                        |        279,349|         2.20\%|
|Fraud Offenses - Credit Card/Atm Fraud                              |        190,962|         1.50\%|
|Fraud Offenses - Identity Theft                                     |        186,144|         1.46\%|
|Robbery                                                             |        149,999|         1.18\%|
|Counterfeiting/Forgery                                              |        147,991|         1.16\%|
|Stolen Property Offenses (Receiving, Selling, Etc.)                 |        115,472|         0.91\%|
|Sex Offenses - Fondling (Incident Liberties/Child Molest)           |         80,711|         0.63\%|
|Fraud Offenses - Impersonation                                      |         79,049|         0.62\%|
|Sex Offenses - Rape                                                 |         76,495|         0.60\%|
|Pornography/Obscene Material                                        |         39,885|         0.31\%|
|Kidnapping/Abduction                                                |         39,148|         0.31\%|
|Fraud Offenses - Wire Fraud                                         |         38,373|         0.30\%|
|Embezzlement                                                        |         32,487|         0.26\%|
|Arson                                                               |         30,178|         0.24\%|
|Larceny/Theft Offenses - Pocket-Picking                             |         21,078|         0.17\%|
|Animal Cruelty                                                      |         20,527|         0.16\%|
|Extortion/Blackmail                                                 |         20,305|         0.16\%|
|Sex Offenses - Sodomy                                               |         18,353|         0.14\%|
|Murder/Nonnegligent Manslaughter                                    |         14,994|         0.12\%|
|Larceny/Theft Offenses - Purse-Snatching                            |         11,278|         0.09\%|
|Fraud Offenses - Hacking/Computer Invasion                          |          8,151|         0.06\%|
|Sex Offenses - Sexual Assault With An Object                        |          7,871|         0.06\%|
|Sex Offenses - Statutory Rape                                       |          7,752|         0.06\%|
|Prostitution Offenses - Prostitution                                |          7,670|         0.06\%|
|Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device |          5,500|         0.04\%|
|Fraud Offenses - Welfare Fraud                                      |          4,580|         0.04\%|
|Prostitution Offenses - Assisting Or Promoting Prostitution         |          2,961|         0.02\%|
|Prostitution Offenses - Purchasing Prostitution                     |          2,380|         0.02\%|
|Human Trafficking - Commercial Sex Acts                             |          1,818|         0.01\%|
|Negligent Manslaughter                                              |          1,588|         0.01\%|
|Sex Offenses - Incest                                               |          1,175|         0.01\%|
|Gambling Offenses - Operating/Promoting/Assisting Gambling          |            909|         0.01\%|
|Bribery                                                             |            652|         0.01\%|
|Gambling Offenses - Betting/Wagering                                |            649|         0.01\%|
|Justifiable Homicide - Not A Crime                                  |            617|         0.00\%|
|Gambling Offenses - Gambling Equipment Violations                   |            560|         0.00\%|
|Human Trafficking - Involuntary Servitude                           |            416|         0.00\%|
|Commerce Violations - Federal Liquor Offenses                       |            145|         0.00\%|
|Fugitive Offenses - Flight To Avoid Prosecution                     |             68|         0.00\%|
|Sex Offenses - Failure To Register As A Sex Offender                |             27|         0.00\%|
|Fraud Offenses - Money Laundering                                   |              7|         0.00\%|
|Weapon Law Violations - Explosives                                  |              4|         0.00\%|
|Fugitive Offenses - Harboring Escappee/Concealing From Arrest       |              3|         0.00\%|
|Immigration Violations - Illegal Entry Into The United States       |              3|         0.00\%|
|Gambling Offenses - Sports Tampering                                |              3|         0.00\%|
|Fugitive Offenses - Flight To Avoid Deportation                     |              1|         0.00\%|
|Weapon Law Violations - Violation of National Firearm Act of 1934   |              1|         0.00\%|
|Total                                                               |     12,712,813|          100\%|



## Offense subtype

In addition to the broader crime committed, NIBRS does allow for a "subtype" of crime variable which gives us a bit more information about what crime occurred (the variable is technically called the "type of criminal activity"). This is especially useful for certain crimes where it's not clear exactly what they're referring to from the crime category alone. For example, for drug crimes we generally differentiate possession from sale or manufacturing. NIBRS combines everything into "drug/narcotic violations (crimes for drug materials such as syringes are classified as "drug equipment violations"). So we need to use the subtype variable to figure out what type of drug crime it is. Looking at the subtype we can see if the arrest is for ``distributing/selling", ``operating/promoting/assisting", ``possessing/concealing", ``transporting/transmitting/importing", or ``using/consuming". There can be up to three subtypes per offense, so potentially an arrest can be related to something such as both possessing and selling drugs. 

There are also some unexpected subtypes related to certain offenses. For example, there are a few dozen drug offenses that also have the subtype of "exploiting children". This subtype is generally for cases where a child is abused, but happens here for drug offenses that don't have any associated child abuse (or for some of them, doesn't have any other crime at all) offense. The reason, I believe, for this category is that these offenses occurred in public so could have been viewed by children, and were labeled as exploiting children for that reason. If you're studying crimes against children, pulling from this variable would likely overcount crimes so - as always - you should make sure that the data you carefully check your data for odd things like this.^[Whether children viewing a crime, even a drug crime, would count as a crime against children would, of course, depend on your definition.]

This data is only available for the below subset of crimes, and isn't always present even for these crimes.

* Aggravated Assault
* Animal Cruelty
* Counterfeiting/Forgery
* Drug Equipment Violations
* Drug/Narcotic Violations
* Fondling (Incident Liberties/Child Molest)
* Gambling Equipment Violations
* Intimidation
* Kidnapping/Abduction
* Murder/Non-negligent Manslaughter
* Negligent Manslaughter
* Pornography/Obscene Material
* Rape
* Robbery
* Sexual Assault With An Object
* Simple Assault
* Sodomy
* Stolen Property Offenses (Receiving, Selling, Etc.)
* Weapon Law Violations



Table: (\#tab:offenseCrimeSubcategories)The number and percent of crime subtypes. This breakdown is only available for a subset of offenses.

|Crime Subcategory                                                                                                                            | \# of Offenses| \% of Offenses|
|:--------------------------------------------------------------------------------------------------------------------------------------------|--------------:|--------------:|
|None/Unknown Gang Involvement (Mutually Exclusive)                                                                                           |      1,707,560|        44.55\%|
|Possessing/Concealing                                                                                                                        |      1,625,157|        42.40\%|
|Using/Consuming                                                                                                                              |        187,874|         4.90\%|
|Distributing/Selling                                                                                                                         |        120,107|         3.13\%|
|Buying/Receiving                                                                                                                             |         66,675|         1.74\%|
|Cultivating/Manufacturing/Publishing                                                                                                         |         38,428|         1.00\%|
|Operating/Promoting/Assisting                                                                                                                |         23,630|         0.62\%|
|Transporting/Transmitting/Importing                                                                                                          |         15,816|         0.41\%|
|Simple/Gross Neglect (Unintentionally, Intentionally, Or Knowingly Failing To Provide Food, Water, Shelter, Veterinary Care, Hoarding, Etc.) |         13,144|         0.34\%|
|Exploiting Children                                                                                                                          |         12,861|         0.34\%|
|Other Gang                                                                                                                                   |         10,516|         0.27\%|
|Intentional Abuse And Torture (Tormenting, Mutilating, Poisoning, Or Abandonment)                                                            |          6,835|         0.18\%|
|Juvenile Gang Involvement                                                                                                                    |          3,790|         0.10\%|
|Animal Sexual Abuse (Bestiality)                                                                                                             |            293|         0.01\%|
|Organized Abuse (Dog Fighting And Cock Fighting)                                                                                             |            255|         0.01\%|
|Total                                                                                                                                        |      3,832,941|          100\%|



We'll look in more detail about the subtype of offenses for animal cruelty. Table \@ref(tab:offenseCrimeSubcategories) shows each possible subtype for animal cruelty and how often they occur. There were about 10,000 cases of animal cruelty reporting to NIBRS in 2019 and over two-thirds are for neglect of the animal. Over a quarter are for torturing or abandoning the poor animal. And the remaining small share of offenses are for sexual abuse of the animal or for forcing them to fight other animals. These subtypes provide a lot more information about the crime that occurred, but still have some uncertainties. We don't, for example, know the type of animal involved or the severity of the abuse (other than that it was serious enough for police to become involved). Still, this is a large improvement in our understanding of this crime (and others which have subtypes), and a colossal improvement when compared with UCR data. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:offenseCrimeSubcategoriesAnimalAbuse)(\#tab:offenseCrimeSubcategoriesAnimalAbuse)The number and percent of crime subtypes for animal abuse.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Crime Subcategory </th>
   <th style="text-align:right;"> \# of Offenses </th>
   <th style="text-align:right;"> \% of Offenses </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Simple/Gross Neglect (Unintentionally, Intentionally, Or Knowingly Failing To Provide Food, Water, Shelter, Veterinary Care, Hoarding, Etc.) </td>
   <td style="text-align:right;"> 13,144 </td>
   <td style="text-align:right;"> 64.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Intentional Abuse And Torture (Tormenting, Mutilating, Poisoning, Or Abandonment) </td>
   <td style="text-align:right;"> 6,835 </td>
   <td style="text-align:right;"> 33.30\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Animal Sexual Abuse (Bestiality) </td>
   <td style="text-align:right;"> 293 </td>
   <td style="text-align:right;"> 1.43\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Organized Abuse (Dog Fighting And Cock Fighting) </td>
   <td style="text-align:right;"> 255 </td>
   <td style="text-align:right;"> 1.24\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 20,527 </td>
   <td style="text-align:right;"> 100\% </td>
  </tr>
</tbody>
</table>



## Offense completed

For each offense, this segment also tells you if the offense was completed or only attempted. Some offenses, such as simple and aggravated assault or homicide, are only labeled as completed. This is because an attempted murder, for example, would be classified as aggravated assault. Since crimes in NIBRS are mutually exclusive, there cannot be both attempted murder and aggravated assault, so only aggravated assault is included. This does limit the data as it is important to know when an aggravated assault is done with the intent to kill the victim and when it's just to seriously harm the victim (though measuring this would likely be extremely imprecise since it requires knowing the motives of the offender). For other crimes, we do know if each crime was completed or not. In the vast majority of offenses they are completed.^[This is likely in part due to completed crimes being easier to detect than attempted crimes. For example, if someone breaks into your house you'll likely discover that and alert the police. If someone tries to break in but fails (even something such as trying your front door to see if it is locked and then leaving because it could be considered attempted burglary) there is much less evidence so it probably doesn't come to the police's attention as much.] Table \@ref(tab:offensesCompleted) shows the percent of each crime category in 2019 NIBRS data that was completed or was only attempted.



Table: (\#tab:offensesCompleted)The percent of crimes completed or attempted, by crime category.

|Crime Category                                                      | \% Completed| % Attempted|
|:-------------------------------------------------------------------|------------:|-----------:|
|Animal Cruelty                                                      |     97.25 \%|     2.75 \%|
|Arson                                                               |      95.1 \%|      4.9 \%|
|Assault Offenses - Aggravated Assault                               |       100 \%|        0 \%|
|Assault Offenses - Intimidation                                     |       100 \%|        0 \%|
|Assault Offenses - Simple Assault                                   |       100 \%|        0 \%|
|Bribery                                                             |      83.9 \%|     16.1 \%|
|Burglary/Breaking And Entering                                      |     93.55 \%|     6.45 \%|
|Commerce Violations - Federal Liquor Offenses                       |     64.83 \%|    35.17 \%|
|Counterfeiting/Forgery                                              |     95.72 \%|     4.28 \%|
|Destruction/Damage/Vandalism of Property                            |     99.43 \%|     0.57 \%|
|Drug/Narcotic Offenses - Drug Equipment Violations                  |     99.81 \%|     0.19 \%|
|Drug/Narcotic Offenses - Drug/Narcotic Violations                   |     99.63 \%|     0.37 \%|
|Embezzlement                                                        |     98.73 \%|     1.27 \%|
|Extortion/Blackmail                                                 |     60.81 \%|    39.19 \%|
|Fraud Offenses - Credit Card/Atm Fraud                              |     94.19 \%|     5.81 \%|
|Fraud Offenses - False Pretenses/Swindle/Confidence Game            |     92.36 \%|     7.64 \%|
|Fraud Offenses - Hacking/Computer Invasion                          |     89.18 \%|    10.82 \%|
|Fraud Offenses - Identity Theft                                     |     95.33 \%|     4.67 \%|
|Fraud Offenses - Impersonation                                      |     92.43 \%|     7.57 \%|
|Fraud Offenses - Money Laundering                                   |     85.71 \%|    14.29 \%|
|Fraud Offenses - Welfare Fraud                                      |     90.15 \%|     9.85 \%|
|Fraud Offenses - Wire Fraud                                         |     92.04 \%|     7.96 \%|
|Fugitive Offenses - Flight To Avoid Prosecution                     |     30.88 \%|    69.12 \%|
|Fugitive Offenses - Harboring Escappee/Concealing From Arrest       |       100 \%|        0 \%|
|Gambling Offenses - Betting/Wagering                                |     83.36 \%|    16.64 \%|
|Gambling Offenses - Gambling Equipment Violations                   |     91.43 \%|     8.57 \%|
|Gambling Offenses - Operating/Promoting/Assisting Gambling          |      85.7 \%|     14.3 \%|
|Gambling Offenses - Sports Tampering                                |     66.67 \%|    33.33 \%|
|Human Trafficking - Commercial Sex Acts                             |     91.09 \%|     8.91 \%|
|Human Trafficking - Involuntary Servitude                           |     91.11 \%|     8.89 \%|
|Immigration Violations - Illegal Entry Into The United States       |       100 \%|        0 \%|
|Justifiable Homicide - Not A Crime                                  |       100 \%|        0 \%|
|Kidnapping/Abduction                                                |     94.82 \%|     5.18 \%|
|Larceny/Theft Offenses - All Other Larceny                          |      98.8 \%|      1.2 \%|
|Larceny/Theft Offenses - Pocket-Picking                             |     98.83 \%|     1.17 \%|
|Larceny/Theft Offenses - Purse-Snatching                            |     98.19 \%|     1.81 \%|
|Larceny/Theft Offenses - Shoplifting                                |     98.68 \%|     1.32 \%|
|Larceny/Theft Offenses - Theft From Building                        |     99.27 \%|     0.73 \%|
|Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device |     89.76 \%|    10.24 \%|
|Larceny/Theft Offenses - Theft From Motor Vehicle                   |     92.84 \%|     7.16 \%|
|Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories   |     97.81 \%|     2.19 \%|
|Motor Vehicle Theft                                                 |     94.69 \%|     5.31 \%|
|Murder/Nonnegligent Manslaughter                                    |       100 \%|        0 \%|
|Negligent Manslaughter                                              |       100 \%|        0 \%|
|Pornography/Obscene Material                                        |     97.17 \%|     2.83 \%|
|Prostitution Offenses - Assisting Or Promoting Prostitution         |     94.97 \%|     5.03 \%|
|Prostitution Offenses - Prostitution                                |     95.62 \%|     4.38 \%|
|Prostitution Offenses - Purchasing Prostitution                     |     90.29 \%|     9.71 \%|
|Robbery                                                             |     90.17 \%|     9.83 \%|
|Sex Offenses - Failure To Register As A Sex Offender                |       100 \%|        0 \%|
|Sex Offenses - Fondling (Incident Liberties/Child Molest)           |     97.12 \%|     2.88 \%|
|Sex Offenses - Incest                                               |     96.43 \%|     3.57 \%|
|Sex Offenses - Rape                                                 |      96.7 \%|      3.3 \%|
|Sex Offenses - Sexual Assault With An Object                        |     97.33 \%|     2.67 \%|
|Sex Offenses - Sodomy                                               |     97.16 \%|     2.84 \%|
|Sex Offenses - Statutory Rape                                       |      97.3 \%|      2.7 \%|
|Stolen Property Offenses (Receiving, Selling, Etc.)                 |     98.73 \%|     1.27 \%|
|Weapon Law Violations - Violation of National Firearm Act of 1934   |       100 \%|        0 \%|
|Weapon Law Violations - Weapon Law Violations                       |     98.81 \%|     1.19 \%|



## Drug, alcohol, or computer use

Intoxication, mainly by alcohol, is known to be a major correlate (and cause) of crime. Drunk people commit a lot of crime (even though most drunk people never commit crime). Drunk people are also better targets for crime so are chosen by certain offenders who want an easy victim. NIBRS tries to capture this by telling us if the offender is *suspected of using* drugs (just "drugs" as we don't know which drug was involved, though we could look in the Property Segment to see what drug [if any] was seized by the police), alcohol, or "computer equipment" which also includes cell phones. Computer equipment is more relevant for certain crimes such as fraud or pornography/obscene materials. For each offense there are three variables about usage of any of these so potentially the offender could have used all three. The data doesn't get any more specific than if the offender is *suspected of using* these items. So we don't know how intoxicated they are or what they used the computer equipment for. Just that they're suspected of using it. And suspected is key. We don't know for sure if they used it. If, for example, a victim says that their mugger was drunk, NIBRS will say they're suspected of using alcohol, even though there's no definitive proof such as a blood test or breathalyzer. Unlike some past variables like offense subtype where it applies to only a subset of crimes, this variable is available for every crime. 

Figure \@ref(fig:offenseDrugAlcoholComputer) shows the distribution is suspected usage for all offenses in 2019 NIBRS. This is just from the first suspected use variable for simplicity of the graph, even though there are three variables on this topic. The most common outcome is "Not Applicable" at 87.6% of offenses. Not Applicable actually just means that the offender was not suspected of using drugs, alcohol, or computer equipment. I'm not sure why it's called that but that's how NIBRS calls "none of the above". Since Not Applicable is so common, Figure \@ref(fig:offenseDrugAlcoholComputerAny) shows the distribution when excluding that option.

<div class="figure" style="text-align: center">
<img src="13_nibrs_offense_files/figure-html/offenseDrugAlcoholComputer-1.png" alt="The distribution of drug, alcohol, or computer use for all offenses in 2022" width="90%" />
<p class="caption">(\#fig:offenseDrugAlcoholComputer)The distribution of drug, alcohol, or computer use for all offenses in 2022</p>
</div>

Drug usage is the most common thing offenders are suspected of using. In about 66% of offenses where the offender is suspected of using something (of the drugs, alcohol, or "computer equipment" choices), that something is drugs. Again, we don't know what type of drug was used, only that it wasn't alcohol. Alcohol follows at 28% while computer equipment is only 6.1%. 

<div class="figure" style="text-align: center">
<img src="13_nibrs_offense_files/figure-html/offenseDrugAlcoholComputerAny-1.png" alt="The distribution of drug, alcohol, or computer use for offenses where there was usage of one of these items. For easier viewing of how this variable is distributed, this figure excludes all offenses where there was no drug, alcohol, or computer use or the variable was NA." width="90%" />
<p class="caption">(\#fig:offenseDrugAlcoholComputerAny)The distribution of drug, alcohol, or computer use for offenses where there was usage of one of these items. For easier viewing of how this variable is distributed, this figure excludes all offenses where there was no drug, alcohol, or computer use or the variable was NA.</p>
</div>

## Crime location

NIBRS tells us where each crime happened, giving more of a type of location rather than the precise location (e.g. coordinates) where it happened. Table \@ref(tab:offenseLocation) shows the 46 different location types where each offense could occur, sorted by most common to least common location. The most common place for a crime to occur is in someone's own home, at 40.4% of crimes. This makes a bit of sense as people spend a lot of time at home and certain crimes, such as burglary and domestic violence, happen a lot of the victim's own home. Crimes happening on a road or alley make up the second most common location at 16% and parking lot or garage follows at 8.6%. The remaining locations only make up 5% or fewer of offense locations.

But keep in mind that some locations may be an overly specific location that fits well into a broader category that you're interested in. For example, if you care about crimes that happen in stores you'd look at "Bank/Savings and Loan", "Restaurant", "Bar/Nightclub" among other locations, which combined have a lot more offenses than any one individually. This is a recurring theme of NIBRS data - you have a lot of data and some of it is so specific that you need to do extra work to aggregate data into units you want.



Table: (\#tab:offenseLocation)The location of crimes for all offenses reported in 2022.

|Crime Location                      | \# of Offenses| \% of Offenses|
|:-----------------------------------|--------------:|--------------:|
|Residence/Home                      |      4,782,593|        37.62\%|
|Highway/Road/Alley                  |      2,159,647|        16.99\%|
|Parking Lot/Garage                  |      1,245,424|         9.80\%|
|Other/Unknown                       |        614,236|         4.83\%|
|Department/Discount Store           |        495,673|         3.90\%|
|Commercial/Office Building          |        293,432|         2.31\%|
|Specialty Store (Tv, Fur, Etc.)     |        285,175|         2.24\%|
|Convenience Store                   |        282,025|         2.22\%|
|Grocery/Supermarket                 |        263,737|         2.07\%|
|Hotel/Motel/Etc.                    |        226,396|         1.78\%|
|School - Elementary/Secondary       |        222,077|         1.75\%|
|Restaurant                          |        203,154|         1.60\%|
|Service/Gas Station                 |        190,517|         1.50\%|
|Drug Store/Doctors Office/Hospital  |        138,569|         1.09\%|
|Cyberspace                          |        127,061|         1.00\%|
|Bank/Savings And Loan               |        121,775|         0.96\%|
|Park/Playground                     |        112,826|         0.89\%|
|Bar/Nightclub                       |         87,592|         0.69\%|
|Government/Public Building          |         87,227|         0.69\%|
|Rental Storage Facility             |         82,479|         0.65\%|
|Construction Site                   |         72,579|         0.57\%|
|School - College/University         |         65,940|         0.52\%|
|Jail/Prison                         |         65,250|         0.51\%|
|Air/Bus/Train Terminal              |         58,884|         0.46\%|
|Shopping Mall                       |         57,199|         0.45\%|
|Field/Woods                         |         54,266|         0.43\%|
|Church/Synagogue/Temple             |         42,293|         0.33\%|
|Auto Dealership New/Used            |         42,120|         0.33\%|
|Gambling Facility/Casino/Race Track |         32,557|         0.26\%|
|School/College                      |         30,474|         0.24\%|
|Liquor Store                        |         28,907|         0.23\%|
|Industrial Site                     |         22,938|         0.18\%|
|Community Center                    |         14,362|         0.11\%|
|Camp/Campground                     |         12,287|         0.10\%|
|Shelter - Mission/Homeless          |         11,573|         0.09\%|
|Lake/Waterway                       |         11,237|         0.09\%|
|Farm Facility                       |         10,580|         0.08\%|
|Arena/Stadium/Fairgrounds/Coliseum  |          9,586|         0.08\%|
|Atm Separate From Bank              |          9,214|         0.07\%|
|Abandoned/Condemned Structure       |          8,757|         0.07\%|
|Amusement Park                      |          7,275|         0.06\%|
|Daycare Facility                    |          7,268|         0.06\%|
|Dock/Wharf/Freight/Model Terminal   |          6,469|         0.05\%|
|Tribal Lands                        |          5,372|         0.04\%|
|Rest Area                           |          3,216|         0.03\%|
|Military Installation               |            595|         0.00\%|
|Total                               |     12,712,813|          100\%|



## Weapons {#offenseWeapons}

Using a weapon during a crime can greatly increase the severity of the offense, as evidenced by increased sanctions for using a weapon (and particularly a gun) and the enormous amount of attention - by the media, the public, and researchers - on gun crimes. Luckily, NIBRS data tells us the weapon used in certain offenses. There can be up to three different weapon types included in an offense. NIBRS data doesn't provide a weapon used for all offenses, just for the ones that they deem to be violent crimes, and thus could involve a weapon. Please note that this is the weapons used in some capacity during the crime, not necessarily to harm the victim.^[The Victim Segment does have data on victim injuries though it doesn't say which weapon caused the injuries] For example, if a gun is involved in a crime, that gun may have been fired and missed the victim, fired and hit the victim, used to beat the victim, or merely brandished. From this data alone we don't know how it was used. 

The list of offenses where there is data on weapon usage is below:

* Aggravated Assault
* Extortion/Blackmail
* Fondling (Incident Liberties/Child Molest)
* Human Trafficking - Commercial Sex Acts
* Human Trafficking - Involuntary Servitude
* Justifiable Homicide
* Kidnapping/Abduction
* Murder/Nonnegligent Manslaughter
* Negligent Manslaughter
* Rape
* Robbery
* Sexual Assault With An Object
* Simple Assault
* Sodomy
* Weapon Law Violations

Table \@ref(tab:offenseWeapon) shows the breakdown in the weapons used in the above offenses. There were about 1.6 million offenses reported in NIBRS in 2019 that could have used a weapon. The most common weapon used was only the offender's body at 57.8% of offenses. The "personal weapons (hands, feet, teeth, etc.) basically means that the offender used or threatened force but wasn't carrying a weapon. So this includes things like punching, kicking, biting, wrestling, and anything you may see in a boxing or MMA match. Strangulation can be done without any weapons but as strangulation is its own weapon, it is not included in the "personal weapons" category. The next most common group is the offender doesn't have any weapons, and doesn't use their body as a weapon, at a little over 10% of offenses, following by the offender using a handgun in 9.4% of offenses. 

"Other" is the next most common category which just means any weapon not already included in the weapon categories. Knife/cutting instrument makes up 4.5% of offenses and is a rather broad category, composed of anything that could cut or pierce someone's body. The most likely weapon in this category is a knife, but can extend to rarer items like broken glass or a sword. The remaining weapon groups are rarer than 4% of offenses, but given that NIBRS covers so many crimes these weapons still occur in hundreds or thousands of cases.



Table: (\#tab:offenseWeapon)The weapon used by an offender in the crime for all offenses reported in 2019. The use means that it was part of the crime though may not have been physically discharged. For example, pointing a gun at someone even without firing the gun is still using it.

|Weapon Used                                                       | \# of Offenses| \% of Offenses|
|:-----------------------------------------------------------------|--------------:|--------------:|
|Personal Weapons (Hands, Feet, Teeth, Etc.)                       |      1,606,675|        53.47\%|
|Handgun                                                           |        338,577|        11.27\%|
|None                                                              |        335,457|        11.17\%|
|Other                                                             |        215,383|         7.17\%|
|Firearm (Type Not Stated)                                         |        148,388|         4.94\%|
|Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.)        |        124,928|         4.16\%|
|Unknown                                                           |         87,932|         2.93\%|
|Blunt Object (Club, Hammer, Etc.)                                 |         61,767|         2.06\%|
|Motor Vehicle                                                     |         29,078|         0.97\%|
|Rifle                                                             |         17,093|         0.57\%|
|Other Firearm                                                     |         12,213|         0.41\%|
|Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) |         11,853|         0.39\%|
|Shotgun                                                           |          8,857|         0.29\%|
|Drugs/Narcotics/Sleeping Pills                                    |          2,362|         0.08\%|
|Explosives                                                        |          1,832|         0.06\%|
|Fire/Incendiary Device                                            |          1,476|         0.05\%|
|Poison (Include Gas)                                              |            664|         0.02\%|
|16                                                                |              1|         0.00\%|
|17                                                                |              1|         0.00\%|
|Total                                                             |      3,004,537|          100\%|



## Automatic weapons

When the weapon involved was a firearm there is a variable which indicates that the firearm was fully automatic. To be clear, this means that when you pull the trigger once the gun will fire multiple bullets. Semi-automatic firearms are **not** automatic firearms. Of course, saying a gun is fully automatic requires either the policing seizing the gun or the gun being fired (and for witnesses to accurately determine that it is fully automatic). Since most crimes are never solved (and even those that lead to an arrest may not lead to the gun being seized - though some guns are seized even without an arrest, such as if the gun is left at the crime scene) and most gun crimes don't actually involve the gun being fired, this variable is likely very imprecise. Still, Figure \@ref(fig:offenseAutomaticWeapon) shows the percent of firearms used in offenses in 2019 that are reported to be fully automatic. Even though there can be up to three weapons used in an offense, this figure only looks at the first weapon. The most common guns to be automatic are rifles and handguns, both with about 4.5% of all uses being of an automatic weapon. The remaining categories are all under 3% of uses. 

<div class="figure" style="text-align: center">
<img src="13_nibrs_offense_files/figure-html/offenseAutomaticWeapon-1.png" alt="The percent of firearms used that were fully automatic, for all offenses in 2022." width="90%" />
<p class="caption">(\#fig:offenseAutomaticWeapon)The percent of firearms used that were fully automatic, for all offenses in 2022.</p>
</div>

## Burglary info

For burglary offenses specifically there are two variables that provide a little more information on the offense. The first variable is the number of "premises" that the burglar entered. This is only available when the location for the offense is either hotel/motel or a rental storage facility. So the "premise" can really be thought of as a room in the building, not that they break into multiple hotels. Figure \@ref(fig:offensePremisesEntered) shows the breakdown in the number of premises entered during a burglary incident. The graph is capped at 10 or more but in 2019 the highest number was 99 buildings entered, which is the maximum value the police can enter, so in reality it may have been higher. The vast majority of hotel/motel and storage facility burglaries only have one room entered, with 85% of these burglaries only being on a single room. This declines enormously to 4.7% burglarizing two rooms and then nearly halves to 2.5% burglarizing three rooms. This trend continues as the number of rooms increase. 

<div class="figure" style="text-align: center">
<img src="13_nibrs_offense_files/figure-html/offensePremisesEntered-1.png" alt="The distribution in the number of premises entered during burglaries. This info is only available for burglaries in a hotel/motel or rental storage facilities." width="90%" />
<p class="caption">(\#fig:offensePremisesEntered)The distribution in the number of premises entered during burglaries. This info is only available for burglaries in a hotel/motel or rental storage facilities.</p>
</div>

The second variable, and one where there is data from every burglary reported regardless of location, says whether the burglar entered the building forcibly or not. A burglary without force is one when the burglary *only* enters through unlocked doors or windows. The *only* means that if they entered through an unlocked door or window and then forced open another door or window, the entire burglary is classified as forcible entry. Forcible entry is any when the burglar has to access a locked door or window *through any means of entering*. This is very broad and includes actions ranging from breaking the window - which people generally think of when it comes to forcible entry - to less obvious uses of force like picking the lock or even using a passcard (e.g. a hotel room card) to unlock the door. The FBI also includes when a burglar enters a building legally and then stays past their allowed time (e.g. walk into a store and hide somewhere until past closing time). 

Figure \@ref(fig:offensesTypeOfEntry) shows the breakdown in burglaries by type of entry. The majority of burglaries, 57.6%, use force at some point in the burglary. 42.4% don't use force at all. There's no option for "unknown" if force was used so my guess is that when in doubt - that is, when there's no evidence of force - the police report that no force is used.  

<div class="figure" style="text-align: center">
<img src="13_nibrs_offense_files/figure-html/offensesTypeOfEntry-1.png" alt="The percent of burglaries reported in 2022 where the burglary entered the structure forcibly or non-forcibly." width="90%" />
<p class="caption">(\#fig:offensesTypeOfEntry)The percent of burglaries reported in 2022 where the burglary entered the structure forcibly or non-forcibly.</p>
</div>

## Hate crime indicator (bias motivation)

For each offense NIBRS indicates whether it had a bias motivation, which is NIBRS way of saying if it was a hate crime or not. For the police to classify an incident as a hate crime, and to assign a particular bias motivation, the police must have some evidence that the crime was motivated by hate. The victim saying that the crime is a hate crime alone is not sufficient - though if large portions of the victim’s community believe that the crime is a hate crime, this is a factor in the police’s assessment. The evidence required is not major, it includes things as explicit as racial slurs said during an incident and less obvious factors like if the crime happened while the victim was celebrating their community (e.g. attending a holiday event) or the crime occurring on an important holiday for that community (e.g. Martin Luther King Day, religious holidays). The FBI also encourages police to consider the totality of the evidence even if none alone strongly suggests that the crime was a hate crime in making their determination about whether the incident was a hate crime or not.

This also means that many (likely most) hate crimes will not be recorded as hate crimes since there is no evidence that the crime is motivated by hate. For example, if a man targeted Asian people for crimes because they are Asian, that would in reality be a hate crime. However, if the offender does not say anything anti-Asian to the victim, which is the mostly likely thing to indicate that this is a hate crime, the crime would not likely be recorded as a hate crime. At the time of this writing (Spring 2021), there are numerous media reports discussing an increase in anti-Asian hate crimes as a result of racism relating to the pandemic. This data would likely undercount both anti-Asian behavior and anti-Asian hate crimes. 

First, if someone walked to an Asian person and called them an anti-Asian slur, that is clearly a hateful act and would be classified as a hate crime under some organization’s collections methods. However, as hateful as this incident is, this alone would not be classified as a hate crime in this dataset as a slur is not a crime. If accompanied by other criminal behavior, or if it continues to the point where it can be considered intimidation, it would then be classified as a hate crime. Second, crimes against Asian victims that are in fact hate crimes, but have no evidence that they are hate crimes would not be classified as hate crimes in this data.

Bias motivation is based on the offender’s perceptions of the victim so even if they are incorrect in who their victim is, if they intended to target someone for their perceived group membership, that is still a hate crime. For example, if a person assaults a man because they think he is gay, that is a hate crime because the assault was motivated by hate towards gay people. Whether the victim is actually gay or not is not relevant - the offender perceived him to be gay so it is an anti-gay hate crime. To make this even more complicated, the offender must have committed the crime because they are motivated, at least to some degree, by their bias against the victim. Being biased against the victim but targeting them for some other reason means that the crime is not a hate crime.

Table \@ref(tab:offenseBiasMotivation) shows the percent of all offenses in 2019 that were classified with or without a bias motivation. Nearly all offenses - 99.14% - are without a bias motivation meaning that they are not considered hate crimes. This still leaves a 63,876 offenses classified as hate crimes. 



Table: (\#tab:offenseBiasMotivation)The number and percent of offenders that had a bias motivation or not for all offenses reported in 2022.

|Bias Motivation    | \# of Offenses| \% of Offenses|
|:------------------|--------------:|--------------:|
|No Bias Motivation |     12,610,154|        99.19\%|
|Bias Motivation    |        102,659|         0.81\%|
|Total              |     12,712,813|          100\%|



Table \@ref(tab:offenseBiasMotivationBiases) shows the breakdown in the bias motivation of hate crimes, for all incidents where the crime is considered a hate crime. The most common bias motivation is anti-Black, which accounts for 29% of all hate crimes in the data. This is followed by anti-White at 12.7% and "anti-male homosexual (gay)" at almost 8% of crimes. The only other biases that make up more than 5% of hate crimes are anti-Hispanic and anti-Jewish.^[Looking at the raw percents is a rather naive measure as it assumes that all groups have equal risk of hate crimes. Certain groups, such as Jews and transgender people, make up a relatively small share of the percent of hate crimes but when considering their percent of the overall population (itself only a slightly better measure as even total population doesn't account for true opportunity to be victimized) are victimized at much higher rates than many other groups.]

Some of these groups are also subsets of larger groups. For example, anti-Muslim, anti-Arab, and anti-Sikh (while Sikhs are not Muslim or Arabic, some Sikhs have been targeted by people who incorrectly believe that they are) are probably all the same bias motivation. Likewise, attacks on LGBT people are in multiple categories, which allows for a more detailed understanding of these hate crimes but requires aggregation to look at them as a group. While this aggregation is easy enough to do, accidentally missing any of the subcategories could vastly undercount offenses against the larger category.  



Table: (\#tab:offenseBiasMotivationBiases)The bias motivation (i.e. if hate crime or not and what type of hate crime) for all offenses reported in 2022 that were classified as hate crimes. For easier viewing of how hate crimes are broken down, this excludes all offenses where there was no bias motivation.

|Bias Motivation                                           | \# of Offenses| \% of Offenses|
|:---------------------------------------------------------|--------------:|--------------:|
|Anti-Black                                                |          2,806|        31.43\%|
|Anti-White                                                |            890|         9.97\%|
|Anti-Gay (Male)                                           |            752|         8.42\%|
|Anti-Jewish                                               |            577|         6.46\%|
|Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) |            571|         6.39\%|
|Anti-Hispanic                                             |            561|         6.28\%|
|Anti-Asian                                                |            304|         3.40\%|
|Anti-Other Race/Ethnicity/National Origin                 |            300|         3.36\%|
|Anti-Transgender                                          |            262|         2.93\%|
|Anti-Multi-Racial Group                                   |            215|         2.41\%|
|Anti-American Indian Or Alaskan Native                    |            187|         2.09\%|
|Anti-Sikh                                                 |            178|         1.99\%|
|Anti-Lesbian (Female)                                     |            149|         1.67\%|
|Anti-Islamic (Muslim)                                     |            121|         1.36\%|
|Anti-Gender Non-Conforming                                |            118|         1.32\%|
|Anti-Other Christian                                      |             94|         1.05\%|
|Anti-Mental Disability                                    |             93|         1.04\%|
|Anti-Other Religion                                       |             84|         0.94\%|
|Anti-Physical Disability                                  |             76|         0.85\%|
|Anti-Arab                                                 |             76|         0.85\%|
|Anti-Catholic                                             |             76|         0.85\%|
|Anti-Eastern Orthodox (Greek, Russian, Etc.)              |             75|         0.84\%|
|Anti-Female                                               |             71|         0.80\%|
|Anti-Protestant                                           |             56|         0.63\%|
|Anti-Multi-Religious Group                                |             42|         0.47\%|
|Anti-Bisexual                                             |             34|         0.38\%|
|Anti-Mormon                                               |             32|         0.36\%|
|Anti-Native Hawaiian Or Other Pacific Islander            |             26|         0.29\%|
|Anti-Heterosexual                                         |             21|         0.24\%|
|Anti-Hindu                                                |             20|         0.22\%|
|Anti-Buddhist                                             |             19|         0.21\%|
|Anti-Male                                                 |             18|         0.20\%|
|Anti-Atheism/Agnosticism                                  |             14|         0.16\%|
|Anti-Jehovahs Witness                                     |             11|         0.12\%|
|Total                                                     |          8,929|          100\%|


