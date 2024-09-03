# Victim Segment





The Victim Segment provides data at the victim-level and includes information about who the victim is and their relationship to offenders. This data tells us what "type" of victim it is with the type meaning if they are a police officer, a civilian ("Individual" and basically any person who isn't a police officer), a business, the government, etc. It also includes the standard demographics variables in other segments - age, race, sex, ethnicity - as well as whether the victim is a resident (i.e. do they live there?) of the jurisdiction where they were victimized. We also learn from this data what types of injuries (if any) the victim suffered as a result of the crime. This is limited to physical injuries - excluding important outcomes such as mental duress or PTSD - but allows for a much better measure of harm from crime than simply assuming (or using past studies that tend to be old and only look at the cost of crime) what harm comes from certain offenses. There are seven possible injury types (including no injury at all) and victims can report up to five of these injuries so we have a fairly detailed measure of victim injury.

One highly interesting variable in this segment is the relationship between the victim and the offender (for up to 10 offenders). This includes, for example, if the victim was the offender's wife, their child, employee, or if the stranger was unknown to them, with 27 total possible relationship categories. You can use this to determine which incidents were crimes by strangers, identify domestic violence, or simply learn who tends to commit crimes against certain types of victims. This variable is only available when the victim is a police officer or an "individual." This makes some sense though there could actually be cases where non-human victims (e.g. businesses, religious organizations) do have a relationship with the offender such as an employee stealing from a store. Related to the victim-offender relationship, this segment provides a bit of information about the motive for the crime. For aggravated assaults and homicides, there is a variable with the "circumstance" of the offense which is essentially the reason why the crime occurred. For example, possible circumstances are arguments between people, hunting accidents, child playing with weapon, and domestic violence. 

In addition to the variables detailed below this segment has the traditional agency and incident identifiers: the ORI code, the agency state, the year of this data, and the incident number. It also has a "victim sequence number" which is a number identifying the victim in an incident since some incidents have multiple victims. 

## Crime category

The first variable we'll look at is the crime the victim experienced. This is a bit different than the offenses in the Offense Segment as not all victims in an incident are victimized by all of the crimes involved. For example, if a couple is assaulted and the woman is raped, the woman would experience rape and assault while the man only experiences assault. NIBRS allows for up to 10 offenses per victim and these are supposed to be ranked in order of seriousness. So the first variable has the most serious offense, the second has the second most serious offense, and so on. This is true is most cases but some have more minor crimes presented before more serious crimes. This seems to just be a data entry issue and nothing systematic but you should still check all offense variables if you're interested in finding the most serious crime per victim. 

There are 52 possible offenses included in this segment and Table \@ref(tab:victimCrimeCategory) shows how frequent each offense is. Though there are 10 possible offenses per victim, this table only looks at the first offense. The most common offense is simple assault, affecting 12.7% of victims or 944k people. This is followed by damage, vandalism, or destruction of property for 11% of victims. About 9.6% of victims experience drugs/narcotic violations, and these victims are likely also the offenders in the case (all incidents must have a victim recorded so in drug crimes the victims are also the offenders in most cases). Theft crimes, broken into some subcategories like "all other larceny" and "theft from motor vehicle" make up the three of the top six crimes (ranks 3, 5, and 6) people are victimized by. And the only remaining crime that accounts for 5% or more of offenses is burglary at 6.4%.



Table: (\#tab:victimCrimeCategory)The number and percent of crimes committed against each victim. For victims with multiple crimes committed against them, this shows the most serious crime.

|Crime Category                                                      | \# of Victims| \% of Victims|
|:-------------------------------------------------------------------|-------------:|-------------:|
|Assault Offenses - Simple Assault                                   |     1,963,108|       15.51\%|
|Larceny/Theft Offenses - All Other Larceny                          |     1,349,448|       10.67\%|
|Destruction/Damage/Vandalism of Property                            |     1,204,569|        9.52\%|
|Drug/Narcotic Offenses - Drug/Narcotic Violations                   |       993,317|        7.85\%|
|Larceny/Theft Offenses - Theft From Motor Vehicle                   |       959,554|        7.58\%|
|Burglary/Breaking And Entering                                      |       757,933|        5.99\%|
|Larceny/Theft Offenses - Shoplifting                                |       747,655|        5.91\%|
|Motor Vehicle Theft                                                 |       703,215|        5.56\%|
|Assault Offenses - Aggravated Assault                               |       669,067|        5.29\%|
|Assault Offenses - Intimidation                                     |       537,389|        4.25\%|
|Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories   |       387,566|        3.06\%|
|Fraud Offenses - False Pretenses/Swindle/Confidence Game            |       333,517|        2.64\%|
|Larceny/Theft Offenses - Theft From Building                        |       276,139|        2.18\%|
|Weapon Law Violations - Weapon Law Violations                       |       240,037|        1.90\%|
|Robbery                                                             |       194,500|        1.54\%|
|Fraud Offenses - Identity Theft                                     |       177,323|        1.40\%|
|Fraud Offenses - Credit Card/Atm Fraud                              |       159,970|        1.26\%|
|Drug/Narcotic Offenses - Drug Equipment Violations                  |       159,409|        1.26\%|
|Counterfeiting/Forgery                                              |       143,052|        1.13\%|
|Stolen Property Offenses (Receiving, Selling, Etc.)                 |       111,630|        0.88\%|
|Sex Offenses - Fondling (Incident Liberties/Child Molest)           |        87,715|        0.69\%|
|Sex Offenses - Rape                                                 |        76,759|        0.61\%|
|Fraud Offenses - Impersonation                                      |        75,089|        0.59\%|
|Kidnapping/Abduction                                                |        43,094|        0.34\%|
|Pornography/Obscene Material                                        |        39,629|        0.31\%|
|Fraud Offenses - Wire Fraud                                         |        36,975|        0.29\%|
|Arson                                                               |        35,241|        0.28\%|
|Embezzlement                                                        |        32,065|        0.25\%|
|Larceny/Theft Offenses - Pocket-Picking                             |        21,080|        0.17\%|
|Animal Cruelty                                                      |        20,100|        0.16\%|
|Extortion/Blackmail                                                 |        19,953|        0.16\%|
|Sex Offenses - Sodomy                                               |        17,447|        0.14\%|
|Murder/Nonnegligent Manslaughter                                    |        16,414|        0.13\%|
|Larceny/Theft Offenses - Purse-Snatching                            |        11,048|        0.09\%|
|Sex Offenses - Statutory Rape                                       |         7,984|        0.06\%|
|Sex Offenses - Sexual Assault With An Object                        |         7,425|        0.06\%|
|Prostitution Offenses - Prostitution                                |         7,113|        0.06\%|
|Fraud Offenses - Hacking/Computer Invasion                          |         6,380|        0.05\%|
|Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device |         5,630|        0.04\%|
|Fraud Offenses - Welfare Fraud                                      |         4,415|        0.03\%|
|Prostitution Offenses - Assisting Or Promoting Prostitution         |         2,378|        0.02\%|
|Prostitution Offenses - Purchasing Prostitution                     |         2,184|        0.02\%|
|Negligent Manslaughter                                              |         1,750|        0.01\%|
|Human Trafficking - Commercial Sex Acts                             |         1,749|        0.01\%|
|Sex Offenses - Incest                                               |         1,277|        0.01\%|
|Gambling Offenses - Operating/Promoting/Assisting Gambling          |           822|        0.01\%|
|Justifiable Homicide - Not A Crime                                  |           634|        0.01\%|
|Gambling Offenses - Betting/Wagering                                |           600|        0.00\%|
|Bribery                                                             |           567|        0.00\%|
|Human Trafficking - Involuntary Servitude                           |           506|        0.00\%|
|Gambling Offenses - Gambling Equipment Violations                   |           313|        0.00\%|
|Commerce Violations - Federal Liquor Offenses                       |           145|        0.00\%|
|Fugitive Offenses - Flight To Avoid Prosecution                     |            66|        0.00\%|
|Sex Offenses - Failure To Register As A Sex Offender                |            27|        0.00\%|
|Fraud Offenses - Money Laundering                                   |             7|        0.00\%|
|Weapon Law Violations - Explosives                                  |             4|        0.00\%|
|Fugitive Offenses - Harboring Escappee/Concealing From Arrest       |             3|        0.00\%|
|Immigration Violations - Illegal Entry Into The United States       |             3|        0.00\%|
|Gambling Offenses - Sports Tampering                                |             2|        0.00\%|
|Fugitive Offenses - Flight To Avoid Deportation                     |             1|        0.00\%|
|Weapon Law Violations - Violation of National Firearm Act of 1934   |             1|        0.00\%|
|Total                                                               |    12,652,993|         100\%|



## Victim type

I spoke above as if all victims are people who are victimized. This isn't entirely true. Some victims may be organizations, businesses, or other inanimate objects. NIBRS has nine different types of victims (including "unknown" type and "other" type) in the data and it tells us which type each victim is. 

Figure \@ref(fig:victimType) shows each of the victim types and how commonly they appear in the data. Two key ones are "individual" at 69.4% of victims and law enforcement officer at 0.5% of victims. Law enforcement officers who are victimized are only classified as law enforcement officers when they are the victims of murder, aggravated or simple assault, or intimidation. Otherwise they're labeled as "individual" victims. So an individual is a person who is either not a law enforcement officer or who is an officer but isn't victimized by one of the approved crimes. These two are special types of victims as all other variables in this segment apply only to them. This is because non-humans cannot have demographic information, injuries (injury to property would be detailed in the Property Segment in Chapter \@ref(property)), or relationships.^[Businesses may have some form of demographic information if you think about demographics of the owners or managers. However, that information is not available. If the business was targeted due to the owner's demographics then that may be considered a hate crime and be reported in the Offense Segment.]

The next most common type is business at 15.6% of victims, "society/public" at 12.9% of victims, and the government in 1% of victims. When the victim is society/public that means that the offense is a "victimless crime" or one where there is no specific victim. This includes drug offenses, animal cruelty (animals cannon be victims in this data), prostitution-related offenses (purchasing, promoting, and being a prostitute), pornography/obscene materials, and weapon offenses. The remaining categories - financial institution, other victim type, unknown victim type, and religion organization - are each under 0.25% of victims. 

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimType-1.png" alt="The distribution of the type of victim. Victim types are mutually exclusive." width="90%" />
<p class="caption">(\#fig:victimType)The distribution of the type of victim. Victim types are mutually exclusive.</p>
</div>

## Injury

An important variable that's completely missing in UCR data is how injured the victim was. NIBRS has eight different categories of victim injuries ranging from no injury to serious injuries such as "possible internal injury" or "apparent broken bones". NIBRS includes five variables for victim injuries so up to five of the seven injury types (if there is no injury, that will take up the first variable and no others will be recorded) per victim. These injuries should be thought of as suspected injuries based on observations by the officer or what the victim says. These do not need to be confirmed by a doctor. Therefore there is some imprecision on the exact victim injury. For example, "possible internal injury" means only the possibility, even if the victim doesn't turn out to have internal injuries.

However, it is still a useful measure of victim injury and is highly necessary given that UCR data doesn't provide any indication about injury. As academics continue to argue about which crimes are serious, this variable can provide information as to exactly how injured victims are from the crime. Not all crimes have this information. The FBI only includes this info for what they consider violent crimes which are listed below (since victims may have up to 10 offenses recorded, only one offense has to be among the below list for injury to be recorded). 

* Aggravated assault
* Extortion/blackmail
* Fondling
* Human trafficking - commercial sex acts
* Human trafficking - involuntary servitude
* Kidnapping/abduction
* Rape
* Robbery
* Sexual assault with an object
* Simple assault
* Sodomy

Even though there are up to five victim injuries recorded, for the below graphs I'm just looking at the first variable. Injuries are sorted by seriousness with the first recorded injury more serious than the second, and so on, so this will look at the most serious injuries victims received. As with most variables in this data, only "individual" and law enforcement officer victims have this info. 

Figure \@ref(fig:victimInjury) shows the eight injury categories and how common they are for all victims with this information reported. The most common type is "none" at 52.6% of injuries which means the victim didn't suffer any injuries at all. This is followed by 42.0% of victims suffering "apparent minor injuries." The six serious injuries are far lesson common and given that nearly a third of victims suffer none or minor injuries are hard to see on the graph. To make it easier to see, Figure \@ref(fig:victimInjuryExcludeNone) shows the breakdown in victim injury excluding those who didn't suffer an injury or those who suffered a minor injury. 

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimInjury-1.png" alt="The distribution of the injury sustained by the victim. Only individual and law enforcement officer victims have this variable available." width="90%" />
<p class="caption">(\#fig:victimInjury)The distribution of the injury sustained by the victim. Only individual and law enforcement officer victims have this variable available.</p>
</div>

For the group who suffered one of the six more serious injury types, 32.1% suffered an "other major injury" which is a serious injury other than one of the other categories. This is followed by 25.8% having a serious laceration (a laceration is a cut), 21.6% having a possible internal injury, and 12.5% having an apparent broken bone. About 6.5% of these victims became unconscious at some point in the incident, and 1.5% lost at least one tooth. 

Trends for law enforcement officer victims (not shown) are nearly identical for those with an injury but have more victims reporting no injury at all relative to non-law enforcement officer victims.

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimInjuryExcludeNone-1.png" alt="The distribution of the injury sustained by the victim for those who had an injury other than 'none' or 'apparent minor injuries'." width="90%" />
<p class="caption">(\#fig:victimInjuryExcludeNone)The distribution of the injury sustained by the victim for those who had an injury other than 'none' or 'apparent minor injuries'.</p>
</div>

## Relationship to offender

One interesting variable in this segment is that we know the relationship between the victim and the offender. There are 27 possible relationship types (including “unknown” relationship) which can be broken into three broad categories: legal family members, people known to the victim but who aren’t family, and people not known to the victim. These relationship categories are mutually exclusive. If, for example, there were two possible relationship categories that apply, such as the victim was both the friend and the neighbor of the offender, only a single category would be reported. 

Table \@ref(tab:victimRelationship) shows each of the relationship categories and how frequently they occur. The most common relationship category, accounting for 19.8% of relationships was that the relationship was unknown. This is followed by 14.4% of victims being the boyfriend or girlfriend (we can find out which by looking at their sex) of the offender. Then victims were the acquaintance of or a stranger to the offender at 13% and 12.8%, respectively. The only other categories that account for over 5% of victims are the victim being "otherwise known" to the offender at 9.5% and being the spouse of the offender at 5.4%. One relationship to note is that when the victim "was child" that means they were the offender's biological or adopted child. This doesn't mean that they are actually a child (<18 years old). 

If you're familiar with the FBI's [Supplementary Homicide Report](https://ucrbook.com/shr.html) data, this variable  - and the two following variables - is also in that dataset. 



Table: (\#tab:victimRelationship)The distribution of the relationship between the victim and the offender. Only individual and law enforcement officer victims have this variable available.

|Crime Category                                          | \# of Victims| \% of Victims|
|:-------------------------------------------------------|-------------:|-------------:|
|Relationship Unknown                                    |     1,117,979|       24.31\%|
|Victim Was Stranger                                     |       669,425|       14.56\%|
|Victim Was Boyfriend/Girlfriend                         |       538,762|       11.72\%|
|Victim Was Acquaintance                                 |       505,720|       11.00\%|
|Victim Was Otherwise Known                              |       384,883|        8.37\%|
|Victim Was Spouse                                       |       209,028|        4.55\%|
|Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) |       172,218|        3.75\%|
|Victim Was Parent                                       |       163,978|        3.57\%|
|Victim Was Child                                        |       128,085|        2.79\%|
|Victim Was Other Family Member                          |       113,811|        2.48\%|
|Victim Was Sibling                                      |       102,790|        2.24\%|
|Victim Was Friend                                       |       100,191|        2.18\%|
|Victim Was Offender                                     |        93,715|        2.04\%|
|Victim Was Neighbor                                     |        86,725|        1.89\%|
|Victim Was Ex-Spouse                                    |        52,407|        1.14\%|
|Victim Was Common-Law Spouse                            |        25,507|        0.55\%|
|Victim Was In-Law                                       |        19,763|        0.43\%|
|Victim Was Step-Child                                   |        19,401|        0.42\%|
|Victim Was Grandparent                                  |        19,054|        0.41\%|
|Victim Was Step-Parent                                  |        15,982|        0.35\%|
|Victim Was Employee                                     |        14,920|        0.32\%|
|Victim Was Child of Boyfriend/Girlfriend                |        14,423|        0.31\%|
|Victim Was Employer                                     |        13,567|        0.30\%|
|Victim Was Grandchild                                   |         8,776|        0.19\%|
|Victim Was Step-Sibling                                 |         4,616|        0.10\%|
|Victim Was Babysittee (The Baby)                        |         2,399|        0.05\%|
|Total                                                   |     4,598,125|         100\%|



We also know the relationship between victim and offender when the victim is a law enforcement officer. As shown in Table \@ref(tab:victimRelationshipPolice), most of the time the officer didn't know the offender, with 58.9% of victimizations being this relationship type. This is followed by 18.7% where the officer knew the offender, including if they were familiar with the person by arresting or stopping them previously. In about 18.5% we don't know the relationship as it is unknown and in 3.2% the officer and the offender were acquaintances. There are also a number of unlikely (and some impossible) relationships like the three in which the officer was the offender's child and the one in which the officer was a baby who was abused by their babysitter. These seem to be clear indications that there are some data errors with this variable. 



Table: (\#tab:victimRelationshipPolice)The distribution of the relationship between the victim and the offender for law enforcement officer victims.

|Crime Category                                          | \# of Victims| \% of Victims|
|:-------------------------------------------------------|-------------:|-------------:|
|Victim Was Stranger                                     |        40,978|       56.20\%|
|Relationship Unknown                                    |        16,873|       23.14\%|
|Victim Was Otherwise Known                              |        12,381|       16.98\%|
|Victim Was Acquaintance                                 |         2,151|        2.95\%|
|Victim Was Employee                                     |           158|        0.22\%|
|Victim Was Boyfriend/Girlfriend                         |           110|        0.15\%|
|Victim Was Spouse                                       |            55|        0.08\%|
|Victim Was Other Family Member                          |            31|        0.04\%|
|Victim Was In-Law                                       |            27|        0.04\%|
|Victim Was Parent                                       |            26|        0.04\%|
|Victim Was Neighbor                                     |            19|        0.03\%|
|Victim Was Sibling                                      |            18|        0.02\%|
|Victim Was Friend                                       |            17|        0.02\%|
|Victim Was Step-Sibling                                 |            13|        0.02\%|
|Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) |            11|        0.02\%|
|Victim Was Employer                                     |             8|        0.01\%|
|Victim Was Offender                                     |             8|        0.01\%|
|Victim Was Ex-Spouse                                    |             8|        0.01\%|
|Victim Was Common-Law Spouse                            |             6|        0.01\%|
|Victim Was Child                                        |             6|        0.01\%|
|Victim Was Step-Child                                   |             5|        0.01\%|
|Victim Was Babysittee (The Baby)                        |             3|        0.00\%|
|Victim Was Step-Parent                                  |             3|        0.00\%|
|Victim Was Grandparent                                  |             1|        0.00\%|
|Victim Was Child of Boyfriend/Girlfriend                |             1|        0.00\%|
|Total                                                   |        72,917|         100\%|



## Aggravated assault and homicide circumstances

In cases of aggravated assault or homicide we have some information about the motive of the offender. There can be up to two motives, what NIBRS calls circumstances, for each of these offenses. Table \@ref(tab:victimAggAssault) shows all of the possible circumstances in the data, and shows the frequency only of the first circumstance. The most common circumstance is that there was an argument, and this accounts for 42.7% of these victims. The next most common is 24% which had unknown circumstances followed by 18.7% with "other" circumstances. The next most common group is "lovers' quarrel" which the FBI relabeled as "domestic violence" beginning in 2019. This group accounts for 9.4% of victims. Assault on law enforcement officers is the next most common group at 2.8% of victims. All other groups are less common than 2% of victims. 



Table: (\#tab:victimAggAssault)The distribution of circumstances for aggravated assault and homicides.

|Circumstance                          |            Crime Category| \# of Victims|\% of Victims |
|:-------------------------------------|-------------------------:|-------------:|:-------------|
|Argument                              | Aggravated Assault/Murder|       263,394|37.82\%       |
|Unknown Circumstances                 | Aggravated Assault/Murder|       176,578|25.35\%       |
|Other Circumstances                   | Aggravated Assault/Murder|       135,511|19.46\%       |
|Domestic Violence                     | Aggravated Assault/Murder|        83,118|11.93\%       |
|Assault On Law Enforcement Officer(S) | Aggravated Assault/Murder|        19,495|2.80\%        |
|Other Felony Involved                 | Aggravated Assault/Murder|         9,213|1.32\%        |
|Gangland                              | Aggravated Assault/Murder|         2,938|0.42\%        |
|Drug Dealing                          | Aggravated Assault/Murder|         2,326|0.33\%        |
|Juvenile Gang                         | Aggravated Assault/Murder|         1,509|0.22\%        |
|Other Negligent Killings              |    Negligent Manslaughter|         1,433|0.21\%        |
|Criminal Killed By Private Citizen    |      Justifiable Homicide|           409|0.06\%        |
|Other Negligent Weapon Handling       |    Negligent Manslaughter|           270|0.04\%        |
|Criminal Killed By Police Officer     |      Justifiable Homicide|           225|0.03\%        |
|Mercy Killing                         | Aggravated Assault/Murder|            47|0.01\%        |
|Child Playing With Weapon             |    Negligent Manslaughter|            40|0.01\%        |
|Gun-Cleaning Accident                 |    Negligent Manslaughter|             4|0.00\%        |
|Hunting Accident                      |    Negligent Manslaughter|             3|0.00\%        |
|Total                                 | Aggravated Assault/Murder|       696,513|100\%         |



## Justifiable homicide circumstance

We know a little bit more in cases of justifiable homicides. Here, we know the circumstances behind the homicide. Figure \@ref(fig:victimJustifiableHomicide) shows the circumstance breakdown for all 308 justifiable homicides reported in 2019. The most common reason, at 34.4% of justifiable homicides is because the offender attacked a civilian. In 21% of justifiable homicides the offender attacked a police officer and was killed by the same officer. In 6.5% the offender attacked a police officer and was killed by a different officer. This is followed by 28% being killed during the commission of a crime. In 4.9% of justifiable homicides, the circumstance is unknown. 3.6% had the offender killed while fleeing from a crime and 1% were killed while resisting arrest.

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimJustifiableHomicide-1.png" alt="The distribution of circumstances for justifiable homicides (N = 308 in 2022 for all agencies reporting)." width="90%" />
<p class="caption">(\#fig:victimJustifiableHomicide)The distribution of circumstances for justifiable homicides (N = 308 in 2022 for all agencies reporting).</p>
</div>

## Demographics

As only people have demographics, these variables only apply when the victim is an individual or a law enforcement officer. The demographics here cover victim age, race, sex, ethnicity, and whether they live in the jurisdiction of the agency where they were victimized. For the following graphs I'll be using all victims, not separating by if they are an "individual" or a law enforcement officer. 

### Residence status

This segment tells us if the victim is a resident of the jurisdiction they were victimized in. This basically means whether or not they live in the city where the crime happened. It has nothing to do with residence status or citizenship status in the United States. The FBI defines residence as their legal permanent address though it's unclear how that is handled for people without this info (though this is far less likely to be a problem here than for arrestees which also report this variable) and when people live permanently in a different spot than their legal address. This variable is useful when trying to figure out if victims are those who live in the area or live outside of it, such as tourists or workers who live nearby. Since crime rates are usually crimes per residents in the jurisdiction, this can be used to determine how reliable that denominator is. If many victims are residents then it makes much more sense than if few are.   

Table \@ref(fig:victimResidenceStatus) shows the residence status for all individual or law enforcement officer victims. The vast majority, 67%, of victims are residents of the jurisdiction where they were victimized while 12.5% were not residents. 20.4% of victims have an unknown resident status.    

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimResidenceStatus-1.png" alt="The distribution of residence status for all victims reported to NIBRS in 2022. Residence status is residence in the police agency's jurisdiction (e.g. do you live in the city you were victimized in?). It is unrelated to citizenship or immigration status." width="90%" />
<p class="caption">(\#fig:victimResidenceStatus)The distribution of residence status for all victims reported to NIBRS in 2022. Residence status is residence in the police agency's jurisdiction (e.g. do you live in the city you were victimized in?). It is unrelated to citizenship or immigration status.</p>
</div>

One proposed measure to improve policing is to require police officers (or at least newly hired officers) live in the city where they work. The idea here is that people will do a better job if it affects the place they consider home.^[Since crime is generally concentrated in a small number of impoverished parts of town, and police likely won't live in these parts, this probably won't be very effective.] Luckily for us, NIBRS includes law enforcement officers in their measure of whether the victim lives in the jurisdiction where they were victimized. Since law enforcement officers are only recorded to be victims when on the job, this is one measure of where officers live.

Figure \@ref(fig:victimResidenceStatusPolice) shows the residence status for law enforcement officer victims. Most law enforcement officer victims reside in their jurisdiction with being 53.2% residents and 13.3% being non-residents. However, there is a lot of uncertainty as 33.5% have an unknown residence status. 

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimResidenceStatusPolice-1.png" alt="The distribution of residence status for all Law Enforcement Officer victims." width="90%" />
<p class="caption">(\#fig:victimResidenceStatusPolice)The distribution of residence status for all Law Enforcement Officer victims.</p>
</div>

### Age

This variable is the age of the victim when the crime occurred, regardless of when they reported the crime. Age is given as how many years old the victim is, with a few exceptions. Victims older than 98 are grouped together as "over 98 years old" while victims younger than 1 years old are broken down into "under 24 hours (neonate)", "1-6 days old", and "7-364 days old". About 1.4% of victim ages are unknown. 

Figure \@ref(fig:victimAge) shows the percent of victims at each age available. This is pretty similar to the age of offenders shown in Figure \@ref(fig:offenderAge) with a peak in the mid to late 20s with a long decline after. The most common victim age is 27 followed by 28, 29, and 30. Relative to offender ages, there are far more young victims. About 2.8% of victims, or 145k victims, in 2019 were aged 14 or younger. However, remember that this is for all victims of any crime so age trends may differ by which crime you're looking at.

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimAge-1.png" alt="The age of all victims reported in the 2022 NIBRS data." width="90%" />
<p class="caption">(\#fig:victimAge)The age of all victims reported in the 2022 NIBRS data.</p>
</div>

### Sex

As with the Offender and the Arrestee Segments, we know the sex of the victim. The only choices are female, male, and unknown sex. There is no option for transgender or any other identify. Since the victim can tell the police their sex, and the police can see them clearly in most cases (though this may not be true if the victim reports a crime over the phone by calling 911 but then doesn't stay to be interviewed) so is more reliable than in the Offender Segment which may include guesses about the offender. The most common victim sex is female at 50.8% of victims, followed closely by male at 48.4%. Only about 0.8% of victims have an unknown sex. It's interesting that female victims are so common since most criminology research finds that male victims are so common. I think this is likely due to criminologists primarily focusing on murder and index violent crimes as their measure of crime, which ignores many other crimes.^[Murder and other violent crimes are mainly men hurting/killing other men, except in domestic violence which is primarily men hurting/killing women.]  

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimSex-1.png" alt="The sex of all victims reported in the 2022 NIBRS data." width="90%" />
<p class="caption">(\#fig:victimSex)The sex of all victims reported in the 2022 NIBRS data.</p>
</div>

### Race

For each victim we also know their race. The only possible races are White, Black, American Indian/Alaskan Native, Asian, and Native Hawaiian/Other Pacific Islander. These categories are mutually exclusive so people cannot be labeled as mixed race, they must be put into one of the categories. Since the police generally can talk to the victim it is possible that they ask the victim what race they are rather than just guess based on appearance. However, this may differ based on agency and the officer taking the report so may be inconsistent. 

Figure \@ref(fig:victimRace) shows the breakdown in victims by race. Most victims are White at about 67.8% of victims, followed by Black victims at 23.4%. 5.6% have an unknown race. The remaining victims are made up of 1.9% Asian victims, 0,7% American Indian/Alaskan Native victims, and 0.5% Native Hawaiian/Pacific Islander.

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimRace-1.png" alt="The race of all victims reported in the 2022 NIBRS data." width="90%" />
<p class="caption">(\#fig:victimRace)The race of all victims reported in the 2022 NIBRS data.</p>
</div>

### Ethnicity

The final demographics variable for victims is their ethnicity, which is whether they are Hispanic or not. Ethnicity is an optional variable so agencies don't have to ever report it. This means that some agencies never report it, some always report it, and some report it only sometimes. The "sometimes report" agencies are probably the most dangerous to use since it's unclear when they report it, which could lead to biased data (such as only reporting it when the suspect is confirmed Hispanic or not, which may not be how other agencies define it). 

There’s also the question of reliability of the ethnicity data. Someone being Hispanic or not is likely just what the arrestees calls themselves or what the arresting officer perceives them to be. Both are important ways of measuring ethnicity but get at different things. Perception is more important for studies of bias, self-identification for differences among groups of people such as arrest rates by ethnicity. And the subjectivity of who is classified as Hispanic means that this measurement may differ by agency and by officer, making it imprecise.

Figure \@ref(fig:victimEthnicity) shows the breakdown in arrests by victim ethnicity for all victims in 2019. Most arrestees - 62.2% - are not Hispanic. Only 10.5% are reported to be Hispanic but a much higher percent of arrestees - 27.2% - have an unknown ethnicity. Given that over a quarter of victims don't have ethnicity data, if you'd like to use this variable I recommend that you carefully examine the data to ensure that the agencies you're looking at (if you don't use all agencies in the data) have a much higher reporting rate. 

<div class="figure" style="text-align: center">
<img src="15_nibrs_victim_files/figure-html/victimEthnicity-1.png" alt="The ethnicity of all victims reported in the 2022 NIBRS data." width="90%" />
<p class="caption">(\#fig:victimEthnicity)The ethnicity of all victims reported in the 2022 NIBRS data.</p>
</div>



