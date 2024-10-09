# Victim Segment





The Victim Segment provides data at the victim-level and includes information about who the victim is and their relationship to offenders. This data tells us what "type" of victim it is with the type meaning if they are a police officer, a civilian ("Individual" and basically any person who is not a police officer), a business, the government, etc. It also includes the standard demographics variables in other segments - age, race, sex, ethnicity - as well as whether the victim is a resident (i.e. do they live there?) of the jurisdiction where they were victimized. We also learn from this data what types of injuries (if any) the victim suffered as a result of the crime. This is limited to physical injuries - excluding important outcomes such as mental duress or PTSD - but allows for a much better measure of harm from crime than simply assuming (or using past studies that tend to be old and only look at the cost of crime) what harm comes from certain offenses. There are seven possible injury types (including no injury at all) and victims can report up to five of these injuries so we have a fairly detailed measure of victim injury.

One highly interesting variable in this segment is the relationship between the victim and the offender (for up to 10 offenders). This includes, for example, if the victim was the offender's wife, their child, employee, or if the stranger was unknown to them, with 27 total possible relationship categories. You can use this to determine which incidents were crimes by strangers, identify domestic violence, or simply learn who tends to commit crimes against certain types of victims. This variable is only available when the victim is a police officer or an "individual." This makes some sense though there could actually be cases where non-human victims (e.g. businesses, religious organizations) do have a relationship with the offender such as an employee stealing from a store. Related to the victim-offender relationship, this segment provides a bit of information about the motive for the crime. For aggravated assaults and homicides, there is a variable with the "circumstance" of the offense which is essentially the reason why the crime occurred. For example, possible circumstances are arguments between people, hunting accidents, child playing with weapon, and domestic violence. 

It also has a "victim sequence number" which is a number identifying the victim in an incident since some incidents have multiple victims. 

## Crime category

The first variable we will look at is the crime the victim experienced. This is a bit different than the offenses in the Offense Segment as not all victims in an incident are victimized by all of the crimes involved. For example, if a couple is assaulted and the woman is raped, the woman would experience rape and assault while the man only experiences assault. NIBRS allows for up to 10 offenses per victim and these are supposed to be ranked in order of seriousness. So the first variable has the most serious offense, the second has the second most serious offense, and so on. This is true is most cases but some have more minor crimes presented before more serious crimes. This seems to just be a data entry issue and nothing systematic but you should still check all offense variables if you are interested in finding the most serious crime per victim. 

There are 52 possible offenses included in this segment and Table \@ref(tab:victimCrimeCategory) shows how frequent each offense is. Though there are 10 possible offenses per victim, this table only looks at the first offense. The most common offense is simple assault, affecting 12.7% of victims or 944k people. This is followed by damage, vandalism, or destruction of property for 11% of victims. About 9.6% of victims experience drugs/narcotic violations, and these victims are likely also the offenders in the case (all incidents must have a victim recorded so in drug crimes the victims are also the offenders in most cases). Theft crimes, broken into some subcategories like "all other larceny" and "theft from motor vehicle" make up the three of the top six crimes (ranks 3, 5, and 6) people are victimized by. And the only remaining crime that accounts for 5% or more of offenses is burglary at 6.4%.


\begin{longtable}[t]{l|l|r|r|r|l}
\caption{(\#tab:victimCrimeCategory)The number and percent of crimes committed against each victim, counting all victims and then separately law enforcement officer victims, 2023. For victims with multiple crimes committed against them, this shows the first crime reported.}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims & \# of Officer Victims & \% of Officer Victims\\
\hline
\endfirsthead
\caption[]{(\#tab:victimCrimeCategory)The number and percent of crimes committed against each victim, counting all victims and then separately law enforcement officer victims, 2023. For victims with multiple crimes committed against them, this shows the first crime reported. \textit{(continued)}}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims & \# of Officer Victims & \% of Officer Victims\\
\hline
\endhead
Assault Offenses - Simple Assault & 1991 & 2,195,115 & 15.77\textbackslash{}\% & 55,194 & 64.25\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 1991 & 1,429,317 & 10.27\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 1991 & 1,323,048 & 9.51\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & 1991 & 1,059,465 & 7.61\textbackslash{}\% & - & -\\
\hline
Larceny/Theft Offenses - Shoplifting & 1991 & 985,502 & 7.08\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 1991 & 978,366 & 7.03\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1991 & 872,932 & 6.27\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 766,014 & 5.50\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 1991 & 734,379 & 5.28\textbackslash{}\% & 19,812 & 23.06\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 1991 & 695,310 & 5.00\textbackslash{}\% & 10,838 & 12.62\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1991 & 364,120 & 2.62\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 1991 & 305,819 & 2.20\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & 1991 & 270,726 & 1.95\textbackslash{}\% & - & -\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 1991 & 269,802 & 1.94\textbackslash{}\% & - & -\\
\hline
Robbery & 1991 & 232,340 & 1.67\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Identity Theft & 2015 & 195,639 & 1.41\textbackslash{}\% & - & -\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & 1991 & 171,174 & 1.23\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 1991 & 161,428 & 1.16\textbackslash{}\% & - & -\\
\hline
Counterfeiting/Forgery & 1991 & 148,349 & 1.07\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 1991 & 119,368 & 0.86\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & 1991 & 92,650 & 0.67\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 1991 & 79,989 & 0.57\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Rape & 1991 & 78,648 & 0.57\textbackslash{}\% & - & -\\
\hline
Kidnapping/Abduction & 1991 & 49,193 & 0.35\textbackslash{}\% & 14 & 0.02\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1991 & 45,160 & 0.32\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Wire Fraud & 1991 & 42,649 & 0.31\textbackslash{}\% & - & -\\
\hline
Arson & 1991 & 37,275 & 0.27\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Embezzlement & 1991 & 33,078 & 0.24\textbackslash{}\% & - & -\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 1991 & 26,829 & 0.19\textbackslash{}\% & - & -\\
\hline
Extortion/Blackmail & 1991 & 26,361 & 0.19\textbackslash{}\% & - & -\\
\hline
Animal Cruelty & 2015 & 21,898 & 0.16\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Sodomy & 1991 & 19,352 & 0.14\textbackslash{}\% & - & -\\
\hline
Murder/Nonnegligent Manslaughter & 1991 & 16,144 & 0.12\textbackslash{}\% & 47 & 0.05\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 1991 & 12,261 & 0.09\textbackslash{}\% & - & -\\
\hline
Prostitution Offenses - Prostitution & 1991 & 8,545 & 0.06\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Statutory Rape & 1991 & 8,088 & 0.06\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Sexual Assault With An Object & 1991 & 7,318 & 0.05\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Hacking/Computer Invasion & 2015 & 6,883 & 0.05\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Welfare Fraud & 1991 & 5,972 & 0.04\textbackslash{}\% & - & -\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & 1991 & 5,044 & 0.04\textbackslash{}\% & - & -\\
\hline
Prostitution Offenses - Purchasing Prostitution & 2013 & 2,780 & 0.02\textbackslash{}\% & - & -\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 1991 & 2,711 & 0.02\textbackslash{}\% & - & -\\
\hline
Negligent Manslaughter & 1991 & 2,018 & 0.01\textbackslash{}\% & - & -\\
\hline
Human Trafficking - Commercial Sex Acts & 2013 & 1,969 & 0.01\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Incest & 1991 & 1,253 & 0.01\textbackslash{}\% & - & -\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & 1991 & 998 & 0.01\textbackslash{}\% & - & -\\
\hline
Bribery & 1991 & 712 & 0.01\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & 1991 & 691 & 0.00\textbackslash{}\% & - & -\\
\hline
Gambling Offenses - Betting/Wagering & 1991 & 625 & 0.00\textbackslash{}\% & - & -\\
\hline
Human Trafficking - Involuntary Servitude & 2014 & 592 & 0.00\textbackslash{}\% & - & -\\
\hline
Gambling Offenses - Gambling Equipment Violations & 1991 & 487 & 0.00\textbackslash{}\% & - & -\\
\hline
Commerce Violations - Federal Liquor Offenses & 2020 & 110 & 0.00\textbackslash{}\% & - & -\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & 2021 & 100 & 0.00\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & 2019 & 41 & 0.00\textbackslash{}\% & - & -\\
\hline
Gambling Offenses - Sports Tampering & 1994 & 7 & 0.00\textbackslash{}\% & - & -\\
\hline
Immigration Violations - Illegal Entry Into The United States & 2020 & 3 & 0.00\textbackslash{}\% & - & -\\
\hline
Commerce Violations - Wildlife Trafficking & 2023 & 2 & 0.00\textbackslash{}\% & - & -\\
\hline
Weapon Law Violations - Explosives & 2021 & 1 & 0.00\textbackslash{}\% & - & -\\
\hline
Commerce Violations - Federal Tobacco Offenses & 2021 & 1 & 0.00\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Money Laundering & 2022 & 1 & 0.00\textbackslash{}\% & - & -\\
\hline
Total & - & 13,916,652 & 100\textbackslash{}\% & - & -\\
\hline
\end{longtable}



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsFirstVsAllOffensesMurders-1} 

}

\caption{The share of victims when considering only the 1st offense reported compared to using all offenses, for murder and nonnegligent manslaughter, sex offenses, motor vehicle theft, and destruction of property/vandalism, 1991-2023.}(\#fig:nibrsFirstVsAllOffensesMurders)
\end{figure}


## Victim type

I spoke above as if all victims are people who are victimized. This is not entirely true. Some victims may be organizations, businesses, or other inanimate objects. NIBRS has nine different types of victims (including "unknown" type and "other" type) in the data and it tells us which type each victim is. 

Table \@ref(tab:victimType) shows each of the victim types and how commonly they appear in the data. Two key ones are "individual" at 69.4% of victims and law enforcement officer at 0.5% of victims. Law enforcement officers who are victimized are only classified as law enforcement officers when they are the victims of murder, aggravated or simple assault, or intimidation. Otherwise they are labeled as "individual" victims. So an individual is a person who is either not a law enforcement officer or who is an officer but is not victimized by one of the approved crimes. These two are special types of victims as all other variables in this segment apply only to them. This is because non-humans cannot have demographic information, injuries (injury to property would be detailed in the Property Segment in Chapter \@ref(property)), or relationships.^[Businesses may have some form of demographic information if you think about demographics of the owners or managers. However, that information is not available. If the business was targeted due to the owner's demographics then that may be considered a hate crime and be reported in the Offense Segment.]

The next most common type is business at 15.6% of victims, "society/public" at 12.9% of victims, and the government in 1% of victims. When the victim is society/public that means that the offense is a "victimless crime" or one where there is no specific victim. This includes drug offenses, animal cruelty (animals cannon be victims in this data), prostitution-related offenses (purchasing, promoting, and being a prostitute), pornography/obscene materials, and weapon offenses. The remaining categories - financial institution, other victim type, unknown victim type, and religion organization - are each under 0.25% of victims. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:victimType)The distribution of the type of victim, 2023. Victim types are mutually exclusive.}\\
\hline
Type of Victim & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims\\
\hline
\endfirsthead
\caption[]{(\#tab:victimType)The distribution of the type of victim, 2023. Victim types are mutually exclusive. \textit{(continued)}}\\
\hline
Type of Victim & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims\\
\hline
\endhead
Individual & 1991 & 9,828,448 & 70.62\textbackslash{}\%\\
\hline
Business & 1991 & 2,167,742 & 15.58\textbackslash{}\%\\
\hline
Society/Public & 1991 & 1,584,720 & 11.39\textbackslash{}\%\\
\hline
Government & 1991 & 155,343 & 1.12\textbackslash{}\%\\
\hline
Law Enforcement Officer & 2002 & 85,905 & 0.62\textbackslash{}\%\\
\hline
Other & 1991 & 39,381 & 0.28\textbackslash{}\%\\
\hline
Financial Institution & 1991 & 21,677 & 0.16\textbackslash{}\%\\
\hline
Unknown & 1991 & 18,041 & 0.13\textbackslash{}\%\\
\hline
Religious Organization & 1991 & 15,395 & 0.11\textbackslash{}\%\\
\hline
Total & - & 13,916,652 & 100\textbackslash{}\%\\
\hline
\end{longtable}



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimPercentIndividualOfficer-1} 

}

\caption{Percent of victimizations whose victim type of 'law enforcement officer,' 'business,' or 'invidual,' 1991-2023.}(\#fig:nibrsVictimPercentIndividualOfficer)
\end{figure}

## Injury

An important variable that is completely missing in UCR data is how injured the victim was. NIBRS has eight different categories of victim injuries ranging from no injury to serious injuries such as "possible internal injury" or "apparent broken bones". NIBRS includes five variables for victim injuries so up to five of the seven injury types (if there is no injury, that will take up the first variable and no others will be recorded) per victim. These injuries should be thought of as suspected injuries based on observations by the officer or what the victim says. These do not need to be confirmed by a doctor. Therefore there is some imprecision on the exact victim injury. For example, "possible internal injury" means only the possibility, even if the victim does not turn out to have internal injuries.

However, it is still a useful measure of victim injury and is highly necessary given that UCR data does not provide any indication about injury. As academics continue to argue about which crimes are serious, this variable can provide information as to exactly how injured victims are from the crime. Not all crimes have this information. The FBI only includes this information for what they consider violent crimes which are listed below (since victims may have up to 10 offenses recorded, only one offense has to be among the below list for injury to be recorded). 

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

Even though there are up to five victim injuries recorded, for the below graphs I am just looking at the first variable. Injuries are sorted by seriousness with the first recorded injury more serious than the second, and so on, so this will look at the most serious injuries victims received. As with most variables in this data, only "individual" and law enforcement officer victims have this info. 

Figure \@ref(fig:victimInjury) shows the eight injury categories and how common they are for all victims with this information reported. The most common type is "none" at 52.6% of injuries which means the victim did not suffer any injuries at all. This is followed by 42.0% of victims suffering "apparent minor injuries." The six serious injuries are far lesson common and given that nearly a third of victims suffer none or minor injuries are hard to see on the graph. To make it easier to see, Figure \@ref(fig:victimInjuryExcludeNone) shows the breakdown in victim injury excluding those who did not suffer an injury or those who suffered a minor injury. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/victimInjury-1} 

}

\caption{The distribution of the injury sustained by the victim, 2023. Only individual and law enforcement officer victims have this variable available.}(\#fig:victimInjury)
\end{figure}

For the group who suffered one of the six more serious injury types, 32.1% suffered an "other major injury" which is a serious injury other than one of the other categories. This is followed by 25.8% having a serious laceration (a laceration is a cut), 21.6% having a possible internal injury, and 12.5% having an apparent broken bone. About 6.5% of these victims became unconscious at some point in the incident, and 1.5% lost at least one tooth. 

Trends for law enforcement officer victims (not shown) are nearly identical for those with an injury but have more victims reporting no injury at all relative to non-law enforcement officer victims.


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseCrimeInjury)The number and percent of victim injury by offense, 2023. This breakdown is only available for a subset of offenses. There can be up to five injuries per victim; in this table we only use the first injury reported. There can be up to 10 offenses per victim; in this table we only use the first offense reported.}\\
\hline
Crime & Injury & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseCrimeInjury)The number and percent of victim injury by offense, 2023. This breakdown is only available for a subset of offenses. There can be up to five injuries per victim; in this table we only use the first injury reported. There can be up to 10 offenses per victim; in this table we only use the first offense reported. \textit{(continued)}}\\
\hline
Crime & Injury & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Assault Offenses - Aggravated Assault & None & 360,659 & 49.11\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Apparent Minor Injuries & 194,088 & 26.43\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other Major Injury & 69,039 & 9.40\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Severe Laceration & 44,958 & 6.12\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Possible Internal Injury & 35,753 & 4.87\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Apparent Broken Bones & 18,040 & 2.46\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Unconsciousness & 9,336 & 1.27\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Loss of Teeth & 2,506 & 0.34\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 734,379 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Apparent Minor Injuries & 1,109,178 & 50.53\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & None & 1,085,936 & 49.47\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Other Major Injury & 1 & 0.00\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 2,195,115 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & None & 25,868 & 98.13\textbackslash{}\%\\
\hline
Extortion/Blackmail & Unknown & 378 & 1.43\textbackslash{}\%\\
\hline
Extortion/Blackmail & Apparent Minor Injuries & 82 & 0.31\textbackslash{}\%\\
\hline
Extortion/Blackmail & Other Major Injury & 18 & 0.07\textbackslash{}\%\\
\hline
Extortion/Blackmail & Loss of Teeth & 5 & 0.02\textbackslash{}\%\\
\hline
Extortion/Blackmail & Unconsciousness & 4 & 0.02\textbackslash{}\%\\
\hline
Extortion/Blackmail & Severe Laceration & 3 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Apparent Broken Bones & 2 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Possible Internal Injury & 1 & 0.00\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 26,361 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & None & 1,819 & 92.38\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Apparent Minor Injuries & 98 & 4.98\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Possible Internal Injury & 25 & 1.27\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Other Major Injury & 15 & 0.76\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Apparent Broken Bones & 8 & 0.41\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Unconsciousness & 2 & 0.10\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Loss of Teeth & 2 & 0.10\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 1,969 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & None & 541 & 91.39\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Apparent Minor Injuries & 40 & 6.76\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Other Major Injury & 6 & 1.01\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Possible Internal Injury & 3 & 0.51\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Apparent Broken Bones & 2 & 0.34\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 592 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & None & 28,007 & 56.93\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Apparent Minor Injuries & 16,718 & 33.98\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Possible Internal Injury & 1,598 & 3.25\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other Major Injury & 1,424 & 2.89\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Severe Laceration & 589 & 1.20\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Apparent Broken Bones & 411 & 0.84\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Unconsciousness & 400 & 0.81\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Loss of Teeth & 46 & 0.09\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 49,193 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Unknown & 15,826 & 98.03\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other Major Injury & 225 & 1.39\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Possible Internal Injury & 28 & 0.17\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & None & 23 & 0.14\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Unconsciousness & 15 & 0.09\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Severe Laceration & 14 & 0.09\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Apparent Broken Bones & 7 & 0.04\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Apparent Minor Injuries & 6 & 0.04\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 16,144 & 100\textbackslash{}\%\\
\hline
Robbery & None & 137,133 & 59.02\textbackslash{}\%\\
\hline
Robbery & Apparent Minor Injuries & 50,658 & 21.80\textbackslash{}\%\\
\hline
Robbery & Unknown & 33,999 & 14.63\textbackslash{}\%\\
\hline
Robbery & Other Major Injury & 3,366 & 1.45\textbackslash{}\%\\
\hline
Robbery & Severe Laceration & 3,271 & 1.41\textbackslash{}\%\\
\hline
Robbery & Possible Internal Injury & 2,088 & 0.90\textbackslash{}\%\\
\hline
Robbery & Apparent Broken Bones & 1,050 & 0.45\textbackslash{}\%\\
\hline
Robbery & Unconsciousness & 587 & 0.25\textbackslash{}\%\\
\hline
Robbery & Loss of Teeth & 188 & 0.08\textbackslash{}\%\\
\hline
Robbery & Total & 232,340 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & None & 85,691 & 92.49\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Apparent Minor Injuries & 5,193 & 5.60\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Possible Internal Injury & 1,089 & 1.18\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Other Major Injury & 510 & 0.55\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Unconsciousness & 82 & 0.09\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Apparent Broken Bones & 38 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Severe Laceration & 33 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Loss of Teeth & 14 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Total & 92,650 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & None & 57,292 & 72.85\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Apparent Minor Injuries & 13,731 & 17.46\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Possible Internal Injury & 5,547 & 7.05\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other Major Injury & 1,256 & 1.60\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Unconsciousness & 574 & 0.73\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Severe Laceration & 132 & 0.17\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Apparent Broken Bones & 92 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Loss of Teeth & 24 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 78,648 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & None & 5,457 & 74.57\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Apparent Minor Injuries & 1,165 & 15.92\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Possible Internal Injury & 565 & 7.72\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other Major Injury & 84 & 1.15\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Unconsciousness & 24 & 0.33\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Severe Laceration & 12 & 0.16\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Apparent Broken Bones & 9 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Loss of Teeth & 2 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 7,318 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & None & 15,728 & 81.27\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Apparent Minor Injuries & 2,321 & 11.99\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Possible Internal Injury & 987 & 5.10\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other Major Injury & 196 & 1.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Unconsciousness & 72 & 0.37\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Severe Laceration & 30 & 0.16\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Apparent Broken Bones & 16 & 0.08\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Loss of Teeth & 2 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 19,352 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Unknown & 8,054 & 99.58\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & None & 30 & 0.37\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Apparent Minor Injuries & 4 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Total & 8,088 & 100\textbackslash{}\%\\
\hline
\end{longtable}





\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimAssaultInjury-1} 

}

\caption{Victim injury for assault offenses, by injury severity, 1991-2023. Major injury is all injury types other than 'none' and 'apparent minor injuries' which are 'other major injury,' 'severe laceration,' possible internal injury,' apparent broken bones,' 'unconsciousness,' and 'loss of teeth.'}(\#fig:nibrsVictimAssaultInjury)
\end{figure}

## Relationship to offender

One interesting variable in this segment is that we know the relationship between the victim and the offender. There are 27 possible relationship types (including “unknown” relationship) which can be broken into three broad categories: legal family members, people known to the victim but who aren’t family, and people not known to the victim. These relationship categories are mutually exclusive. If, for example, there were two possible relationship categories that apply, such as the victim was both the friend and the neighbor of the offender, only a single category would be reported. 

Table \@ref(tab:victimRelationship) shows each of the relationship categories and how frequently they occur. The most common relationship category, accounting for 19.8% of relationships was that the relationship was unknown. This is followed by 14.4% of victims being the boyfriend or girlfriend (we can find out which by looking at their sex) of the offender. Then victims were the acquaintance of or a stranger to the offender at 13% and 12.8%, respectively. The only other categories that account for over 5% of victims are the victim being "otherwise known" to the offender at 9.5% and being the spouse of the offender at 5.4%. One relationship to note is that when the victim "was child" that means they were the offender's biological or adopted child. This does not mean that they are actually a child (<18 years old). 



\begin{longtable}[t]{l|l|r|r|r|l}
\caption{(\#tab:victimRelationship)The distribution of the relationship between the victim and the offender. Only individual and law enforcement officer victims have this variable available, 2023.}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims & \textbackslash{}\# of Officer Victims & \textbackslash{}\% of Officer Victims\\
\hline
\endfirsthead
\caption[]{(\#tab:victimRelationship)The distribution of the relationship between the victim and the offender. Only individual and law enforcement officer victims have this variable available, 2023. \textit{(continued)}}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims & \textbackslash{}\# of Officer Victims & \textbackslash{}\% of Officer Victims\\
\hline
\endhead
Relationship Unknown & 1991 & 1,363,398 & 25.31\textbackslash{}\% & 18,636 & 21.84\textbackslash{}\%\\
\hline
Victim Was Stranger & 1991 & 885,609 & 16.44\textbackslash{}\% & 49,927 & 58.52\textbackslash{}\%\\
\hline
Victim Was Boyfriend/Girlfriend & 1991 & 577,023 & 10.71\textbackslash{}\% & 119 & 0.14\textbackslash{}\%\\
\hline
Victim Was Acquaintance & 1991 & 564,856 & 10.49\textbackslash{}\% & 2,460 & 2.88\textbackslash{}\%\\
\hline
Victim Was Otherwise Known & 1991 & 427,730 & 7.94\textbackslash{}\% & 13,625 & 15.97\textbackslash{}\%\\
\hline
Victim Was Spouse & 1991 & 233,719 & 4.34\textbackslash{}\% & 46 & 0.05\textbackslash{}\%\\
\hline
Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 2017 & 192,551 & 3.57\textbackslash{}\% & 19 & 0.02\textbackslash{}\%\\
\hline
Victim Was Parent & 1991 & 191,072 & 3.55\textbackslash{}\% & 27 & 0.03\textbackslash{}\%\\
\hline
Victim Was Child & 1991 & 145,138 & 2.69\textbackslash{}\% & 5 & 0.01\textbackslash{}\%\\
\hline
Victim Was Other Family Member & 1991 & 125,412 & 2.33\textbackslash{}\% & 45 & 0.05\textbackslash{}\%\\
\hline
Victim Was Sibling (Brother Or Sister) & 1991 & 120,732 & 2.24\textbackslash{}\% & 16 & 0.02\textbackslash{}\%\\
\hline
Victim Was Friend & 1991 & 105,166 & 1.95\textbackslash{}\% & 11 & 0.01\textbackslash{}\%\\
\hline
Victim Was Offender & 1991 & 100,034 & 1.86\textbackslash{}\% & 6 & 0.01\textbackslash{}\%\\
\hline
Victim Was Neighbor & 1991 & 95,074 & 1.77\textbackslash{}\% & 24 & 0.03\textbackslash{}\%\\
\hline
Victim Was Ex-Spouse & 1991 & 86,707 & 1.61\textbackslash{}\% & 24 & 0.03\textbackslash{}\%\\
\hline
Victim Was Common-Law Spouse & 1991 & 26,392 & 0.49\textbackslash{}\% & 11 & 0.01\textbackslash{}\%\\
\hline
Victim Was In-Law & 1991 & 23,378 & 0.43\textbackslash{}\% & 45 & 0.05\textbackslash{}\%\\
\hline
Victim Was Step-Child & 1991 & 21,505 & 0.40\textbackslash{}\% & 3 & 0.00\textbackslash{}\%\\
\hline
Victim Was Grandparent & 1991 & 21,361 & 0.40\textbackslash{}\% & 7 & 0.01\textbackslash{}\%\\
\hline
Victim Was Step-Parent & 1991 & 17,322 & 0.32\textbackslash{}\% & 3 & 0.00\textbackslash{}\%\\
\hline
Victim Was Employee & 1991 & 16,410 & 0.30\textbackslash{}\% & 229 & 0.27\textbackslash{}\%\\
\hline
Victim Was Employer & 1991 & 14,967 & 0.28\textbackslash{}\% & 8 & 0.01\textbackslash{}\%\\
\hline
Victim Was Child of Boyfriend/Girlfriend & 1991 & 13,662 & 0.25\textbackslash{}\% & 2 & 0.00\textbackslash{}\%\\
\hline
Victim Was Grandchild & 1991 & 9,814 & 0.18\textbackslash{}\% & 0 & 0.00\textbackslash{}\%\\
\hline
Victim Was Step-Sibling (Stepbrother Or Stepsister) & 1991 & 4,775 & 0.09\textbackslash{}\% & 13 & 0.02\textbackslash{}\%\\
\hline
Victim Was Babysittee (The Baby) & 1991 & 2,498 & 0.05\textbackslash{}\% & 2 & 0.00\textbackslash{}\%\\
\hline
Victim Was Cohabitant & 2022 & 17 & 0.00\textbackslash{}\% & 0 & 0.00\textbackslash{}\%\\
\hline
Victim Was Foster Child & 2023 & 2 & 0.00\textbackslash{}\% & 0 & 0.00\textbackslash{}\%\\
\hline
Victim Was Foster Parent & 2023 & 2 & 0.00\textbackslash{}\% & 0 & 0.00\textbackslash{}\%\\
\hline
Total & - & 5,386,326 & 100\textbackslash{}\% & 85,313 & 100\textbackslash{}\%\\
\hline
\end{longtable}



We also know the relationship between victim and offender when the victim is a law enforcement officer. As shown in Table \@ref(tab:victimRelationshipPolice), most of the time the officer did not know the offender, with 58.9% of victimizations being this relationship type. This is followed by 18.7% where the officer knew the offender, including if they were familiar with the person by arresting or stopping them previously. In about 18.5% we do not know the relationship as it is unknown and in 3.2% the officer and the offender were acquaintances. There are also a number of unlikely (and some impossible) relationships like the three in which the officer was the offender's child and the one in which the officer was a baby who was abused by their babysitter. These seem to be clear indications that there are some data errors with this variable. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseVictimRelationship)The number and percent of victim relationships to offender by offense, 2023. This breakdown is only available for a subset of offenses. There can be up to 10 victim-offender relationships per victim; in this table we only use the first relationship reported. The top five most common relationships are shown, all other relationships are combined into an 'All Other' category. }\\
\hline
Crime & Relationship to Offender & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseVictimRelationship)The number and percent of victim relationships to offender by offense, 2023. This breakdown is only available for a subset of offenses. There can be up to 10 victim-offender relationships per victim; in this table we only use the first relationship reported. The top five most common relationships are shown, all other relationships are combined into an 'All Other' category.  \textit{(continued)}}\\
\hline
Crime & Relationship to Offender & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Arson & Relationship Unknown & 3,384 & 38.88\textbackslash{}\%\\
\hline
Arson & Victim Was Stranger & 1,187 & 13.64\textbackslash{}\%\\
\hline
Arson & Victim Was Acquaintance & 857 & 9.85\textbackslash{}\%\\
\hline
Arson & Victim Was Otherwise Known & 768 & 8.82\textbackslash{}\%\\
\hline
Arson & Victim Was Parent & 509 & 5.85\textbackslash{}\%\\
\hline
Arson & All Other & 1,998 & 22.94\textbackslash{}\%\\
\hline
Arson & Total & 8,703 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Relationship Unknown & 130,972 & 20.44\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Victim Was Stranger & 110,612 & 17.26\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Victim Was Boyfriend/Girlfriend & 86,718 & 13.53\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Victim Was Acquaintance & 72,366 & 11.29\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Victim Was Otherwise Known & 54,343 & 8.48\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & All Other & 185,872 & 28.99\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 640,883 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Victim Was Stranger & 110,982 & 17.47\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Relationship Unknown & 100,315 & 15.79\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Victim Was Acquaintance & 99,324 & 15.64\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Victim Was Otherwise Known & 72,784 & 11.46\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Victim Was Boyfriend/Girlfriend & 40,247 & 6.34\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & All Other & 211,541 & 33.32\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Total & 635,193 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Victim Was Boyfriend/Girlfriend & 382,337 & 18.24\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Victim Was Acquaintance & 232,009 & 11.07\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Victim Was Stranger & 226,920 & 10.83\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Relationship Unknown & 205,105 & 9.79\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Victim Was Otherwise Known & 194,410 & 9.28\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & All Other & 855,156 & 40.8\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 2,095,937 & 100\textbackslash{}\%\\
\hline
Bribery & Victim Was Stranger & 92 & 29.87\textbackslash{}\%\\
\hline
Bribery & Victim Was Otherwise Known & 48 & 15.58\textbackslash{}\%\\
\hline
Bribery & Relationship Unknown & 46 & 14.94\textbackslash{}\%\\
\hline
Bribery & Victim Was Acquaintance & 31 & 10.06\textbackslash{}\%\\
\hline
Bribery & Victim Was Ex-Spouse & 19 & 6.17\textbackslash{}\%\\
\hline
Bribery & All Other & 72 & 23.36\textbackslash{}\%\\
\hline
Bribery & Total & 308 & 100\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Relationship Unknown & 79,200 & 48.71\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Victim Was Stranger & 38,700 & 23.80\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Victim Was Acquaintance & 11,187 & 6.88\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Victim Was Otherwise Known & 8,708 & 5.36\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 6,076 & 3.74\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & All Other & 18,740 & 11.53\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Total & 162,611 & 100\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Relationship Unknown & 11,272 & 47.62\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Victim Was Stranger & 6,933 & 29.29\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Victim Was Acquaintance & 1,364 & 5.76\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Victim Was Otherwise Known & 1,155 & 4.88\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Victim Was Parent & 392 & 1.66\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & All Other & 2,557 & 10.78\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Total & 23,673 & 100\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Relationship Unknown & 125,739 & 38.32\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Victim Was Stranger & 53,892 & 16.43\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Victim Was Acquaintance & 26,496 & 8.08\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Victim Was Otherwise Known & 23,036 & 7.02\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Victim Was Boyfriend/Girlfriend & 19,365 & 5.90\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & All Other & 79,580 & 24.26\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Total & 328,108 & 100\textbackslash{}\%\\
\hline
Embezzlement & Victim Was Employer & 799 & 19.95\textbackslash{}\%\\
\hline
Embezzlement & Victim Was Acquaintance & 580 & 14.48\textbackslash{}\%\\
\hline
Embezzlement & Relationship Unknown & 573 & 14.30\textbackslash{}\%\\
\hline
Embezzlement & Victim Was Otherwise Known & 447 & 11.16\textbackslash{}\%\\
\hline
Embezzlement & Victim Was Stranger & 405 & 10.11\textbackslash{}\%\\
\hline
Embezzlement & All Other & 1,202 & 29.99\textbackslash{}\%\\
\hline
Embezzlement & Total & 4,006 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & Relationship Unknown & 3,999 & 52.53\textbackslash{}\%\\
\hline
Extortion/Blackmail & Victim Was Stranger & 1,741 & 22.87\textbackslash{}\%\\
\hline
Extortion/Blackmail & Victim Was Acquaintance & 715 & 9.39\textbackslash{}\%\\
\hline
Extortion/Blackmail & Victim Was Otherwise Known & 425 & 5.58\textbackslash{}\%\\
\hline
Extortion/Blackmail & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 226 & 2.97\textbackslash{}\%\\
\hline
Extortion/Blackmail & All Other & 507 & 6.7\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 7,613 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Relationship Unknown & 13,475 & 46.29\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Victim Was Stranger & 5,746 & 19.74\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Victim Was Acquaintance & 2,428 & 8.34\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Victim Was Otherwise Known & 1,626 & 5.59\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Victim Was Parent & 1,256 & 4.31\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & All Other & 4,581 & 15.74\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Total & 29,112 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Relationship Unknown & 31,220 & 45.82\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Victim Was Stranger & 17,750 & 26.05\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Victim Was Acquaintance & 6,011 & 8.82\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Victim Was Otherwise Known & 5,257 & 7.72\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Victim Was Friend & 1,234 & 1.81\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & All Other & 6,665 & 9.78\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Total & 68,137 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Relationship Unknown & 656 & 47.13\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Victim Was Stranger & 225 & 16.16\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Victim Was Acquaintance & 113 & 8.12\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 100 & 7.18\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Victim Was Otherwise Known & 91 & 6.54\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & All Other & 207 & 14.88\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Total & 1,392 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Relationship Unknown & 30,814 & 65.57\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Victim Was Stranger & 8,814 & 18.76\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Victim Was Acquaintance & 1,331 & 2.83\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Victim Was Otherwise Known & 1,210 & 2.57\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Victim Was Sibling (Brother Or Sister) & 1,082 & 2.30\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & All Other & 3,741 & 7.97\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Total & 46,992 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Relationship Unknown & 8,505 & 51.08\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Victim Was Stranger & 3,844 & 23.09\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Victim Was Sibling (Brother Or Sister) & 1,278 & 7.68\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Victim Was Acquaintance & 697 & 4.19\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Victim Was Otherwise Known & 677 & 4.07\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & All Other & 1,648 & 9.89\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Total & 16,649 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Relationship Unknown & 236 & 45.83\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Victim Was Acquaintance & 54 & 10.49\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Victim Was Otherwise Known & 48 & 9.32\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Victim Was Stranger & 47 & 9.13\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Victim Was Friend & 24 & 4.66\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & All Other & 106 & 20.58\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Total & 515 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Relationship Unknown & 3,694 & 52.85\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Victim Was Stranger & 1,701 & 24.34\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Victim Was Acquaintance & 452 & 6.47\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Victim Was Otherwise Known & 370 & 5.29\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Victim Was Parent & 176 & 2.52\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & All Other & 596 & 8.52\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Total & 6,989 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Relationship Unknown & 373 & 24.35\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Victim Was Acquaintance & 356 & 23.24\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Victim Was Stranger & 274 & 17.89\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Victim Was Otherwise Known & 200 & 13.05\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Victim Was Boyfriend/Girlfriend & 106 & 6.92\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & All Other & 223 & 14.57\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 1,532 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Relationship Unknown & 183 & 36.53\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Victim Was Acquaintance & 96 & 19.16\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Victim Was Stranger & 81 & 16.17\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Victim Was Otherwise Known & 48 & 9.58\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Victim Was Employee & 29 & 5.79\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & All Other & 64 & 12.78\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 501 & 100\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Victim Was Stranger & 285 & 42.04\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Relationship Unknown & 155 & 22.86\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Victim Was Acquaintance & 71 & 10.47\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Victim Was Otherwise Known & 71 & 10.47\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Victim Was Friend & 15 & 2.21\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & All Other & 81 & 11.95\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Total & 678 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Victim Was Boyfriend/Girlfriend & 13,924 & 29.66\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Relationship Unknown & 4,577 & 9.75\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 4,304 & 9.17\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Victim Was Stranger & 3,964 & 8.44\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Victim Was Spouse & 3,906 & 8.32\textbackslash{}\%\\
\hline
Kidnapping/Abduction & All Other & 16,271 & 34.66\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 46,946 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Relationship Unknown & 155,863 & 49.01\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Victim Was Stranger & 69,009 & 21.70\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Victim Was Acquaintance & 27,241 & 8.57\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Victim Was Otherwise Known & 17,341 & 5.45\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Victim Was Friend & 6,820 & 2.14\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & All Other & 41,728 & 13.14\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Total & 318,002 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Relationship Unknown & 4,386 & 51.20\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Victim Was Stranger & 2,717 & 31.72\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Victim Was Acquaintance & 522 & 6.09\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Victim Was Otherwise Known & 251 & 2.93\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 116 & 1.35\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & All Other & 574 & 6.69\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Total & 8,566 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Victim Was Stranger & 2,185 & 41.86\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Relationship Unknown & 2,181 & 41.78\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Victim Was Acquaintance & 268 & 5.13\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Victim Was Otherwise Known & 141 & 2.70\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Victim Was Boyfriend/Girlfriend & 101 & 1.93\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & All Other & 344 & 6.61\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Total & 5,220 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Victim Was Stranger & 12,151 & 58.10\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Relationship Unknown & 7,490 & 35.81\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Victim Was Otherwise Known & 459 & 2.19\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Victim Was Acquaintance & 417 & 1.99\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Victim Was Employee & 103 & 0.49\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & All Other & 294 & 1.39\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Total & 20,914 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Relationship Unknown & 38,177 & 46.22\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Victim Was Stranger & 15,605 & 18.89\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Victim Was Acquaintance & 8,397 & 10.17\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Victim Was Otherwise Known & 5,573 & 6.75\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Victim Was Friend & 2,391 & 2.89\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & All Other & 12,462 & 15.09\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Total & 82,605 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Relationship Unknown & 317 & 54.84\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Victim Was Stranger & 205 & 35.47\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Victim Was Acquaintance & 20 & 3.46\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Victim Was Otherwise Known & 16 & 2.77\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Victim Was Other Family Member & 4 & 0.69\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & All Other & 16 & 2.76\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Total & 578 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Relationship Unknown & 127,318 & 73.41\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Victim Was Stranger & 37,404 & 21.57\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Victim Was Acquaintance & 2,530 & 1.46\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Victim Was Otherwise Known & 2,001 & 1.15\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 882 & 0.51\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & All Other & 3,300 & 1.9\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Total & 173,435 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Relationship Unknown & 36,681 & 83.48\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Victim Was Stranger & 5,138 & 11.69\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Victim Was Acquaintance & 635 & 1.45\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Victim Was Otherwise Known & 434 & 0.99\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 249 & 0.57\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & All Other & 803 & 1.81\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Total & 43,940 & 100\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Relationship Unknown & 118,493 & 62.46\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Victim Was Stranger & 38,363 & 20.22\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Victim Was Acquaintance & 9,676 & 5.10\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Victim Was Otherwise Known & 5,018 & 2.65\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Victim Was Parent & 4,173 & 2.20\textbackslash{}\%\\
\hline
Motor Vehicle Theft & All Other & 13,990 & 7.37\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Total & 189,713 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Relationship Unknown & 5,029 & 39.02\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Victim Was Acquaintance & 2,057 & 15.96\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Victim Was Stranger & 1,464 & 11.36\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Victim Was Otherwise Known & 931 & 7.22\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Victim Was Boyfriend/Girlfriend & 684 & 5.31\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & All Other & 2,724 & 21.13\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 12,889 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & Victim Was Stranger & 713 & 36.89\textbackslash{}\%\\
\hline
Negligent Manslaughter & Relationship Unknown & 366 & 18.93\textbackslash{}\%\\
\hline
Negligent Manslaughter & Victim Was Friend & 199 & 10.29\textbackslash{}\%\\
\hline
Negligent Manslaughter & Victim Was Acquaintance & 193 & 9.98\textbackslash{}\%\\
\hline
Negligent Manslaughter & Victim Was Child & 140 & 7.24\textbackslash{}\%\\
\hline
Negligent Manslaughter & All Other & 322 & 16.68\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 1,933 & 100\textbackslash{}\%\\
\hline
Robbery & Victim Was Stranger & 69,531 & 43.00\textbackslash{}\%\\
\hline
Robbery & Relationship Unknown & 61,648 & 38.13\textbackslash{}\%\\
\hline
Robbery & Victim Was Acquaintance & 11,434 & 7.07\textbackslash{}\%\\
\hline
Robbery & Victim Was Otherwise Known & 5,585 & 3.45\textbackslash{}\%\\
\hline
Robbery & Victim Was Boyfriend/Girlfriend & 4,053 & 2.51\textbackslash{}\%\\
\hline
Robbery & All Other & 9,436 & 5.82\textbackslash{}\%\\
\hline
Robbery & Total & 161,687 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Victim Was Acquaintance & 16,449 & 19.72\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Victim Was Otherwise Known & 10,379 & 12.44\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Relationship Unknown & 9,653 & 11.57\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Victim Was Stranger & 8,974 & 10.76\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Victim Was Child & 7,701 & 9.23\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & All Other & 30,267 & 36.29\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Total & 83,423 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Child & 445 & 36.78\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Sibling (Brother Or Sister) & 325 & 26.86\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Other Family Member & 222 & 18.35\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Grandchild & 48 & 3.97\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Step-Child & 43 & 3.55\textbackslash{}\%\\
\hline
Sex Offenses - Incest & All Other & 127 & 10.52\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Total & 1,210 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Victim Was Acquaintance & 16,663 & 23.78\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Relationship Unknown & 9,492 & 13.55\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Victim Was Boyfriend/Girlfriend & 7,271 & 10.38\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Victim Was Otherwise Known & 6,445 & 9.20\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Victim Was Friend & 5,248 & 7.49\textbackslash{}\%\\
\hline
Sex Offenses - Rape & All Other & 24,943 & 35.61\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 70,062 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Victim Was Acquaintance & 1,271 & 19.24\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Relationship Unknown & 875 & 13.24\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Victim Was Otherwise Known & 842 & 12.74\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Victim Was Child & 550 & 8.32\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Victim Was Other Family Member & 518 & 7.84\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & All Other & 2,551 & 38.6\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 6,607 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Victim Was Acquaintance & 3,576 & 20.08\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Relationship Unknown & 2,425 & 13.62\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Victim Was Otherwise Known & 2,020 & 11.34\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Victim Was Other Family Member & 1,685 & 9.46\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Victim Was Stranger & 1,238 & 6.95\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & All Other & 6,864 & 38.55\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 17,808 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Victim Was Acquaintance & 1,787 & 24.71\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Victim Was Boyfriend/Girlfriend & 1,611 & 22.28\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Victim Was Otherwise Known & 799 & 11.05\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Relationship Unknown & 747 & 10.33\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Victim Was Friend & 554 & 7.66\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & All Other & 1,734 & 23.97\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Total & 7,232 & 100\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Relationship Unknown & 27,746 & 51.36\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Victim Was Stranger & 21,070 & 39.00\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Victim Was Acquaintance & 1,542 & 2.85\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Victim Was Otherwise Known & 1,281 & 2.37\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Victim Was Parent & 471 & 0.87\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & All Other & 1,914 & 3.53\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 54,024 & 100\textbackslash{}\%\\
\hline
\end{longtable}




## Aggravated assault and homicide circumstances

In cases of aggravated assault or homicide we have some information about the motive of the offender. There can be up to two motives, what NIBRS calls circumstances, for each of these offenses. Table \@ref(tab:victimAggAssault) shows all of the possible circumstances in the data, and shows the frequency only of the first circumstance. The most common circumstance is that there was an argument, and this accounts for 42.7% of these victims. The next most common is 24% which had unknown circumstances followed by 18.7% with "other" circumstances. The next most common group is "lovers' quarrel" which the FBI relabeled as "domestic violence" beginning in 2019. This group accounts for 9.4% of victims. Assault on law enforcement officers is the next most common group at 2.8% of victims. All other groups are less common than 2% of victims. 


\begin{longtable}[t]{l|l|r|r|l}
\caption{(\#tab:victimAggAssault)The distribution of circumstances for aggravated assault and homicides, 2023.}\\
\hline
Circumstance & Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims\\
\hline
\endfirsthead
\caption[]{(\#tab:victimAggAssault)The distribution of circumstances for aggravated assault and homicides, 2023. \textit{(continued)}}\\
\hline
Circumstance & Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims\\
\hline
\endhead
Argument & Aggravated Assault/Murder & 1991 & 294,313 & 38.57\textbackslash{}\%\\
\hline
Unknown Circumstances & Aggravated Assault/Murder & 1991 & 184,583 & 24.19\textbackslash{}\%\\
\hline
Other Circumstances & Aggravated Assault/Murder & 1991 & 143,124 & 18.75\textbackslash{}\%\\
\hline
Domestic Violence (Historically Called Lovers Triangle/Quarrel) & Aggravated Assault/Murder & 1991 & 99,067 & 12.98\textbackslash{}\%\\
\hline
Assault On Law Enforcement Officer(s) & Aggravated Assault/Murder & 1991 & 22,595 & 2.96\textbackslash{}\%\\
\hline
Other Felony Involved & Aggravated Assault/Murder & 1991 & 9,620 & 1.26\textbackslash{}\%\\
\hline
Gangland (Organized Crime Involvement) & Aggravated Assault/Murder & 1991 & 3,066 & 0.40\textbackslash{}\%\\
\hline
Drug Dealing & Aggravated Assault/Murder & 1991 & 2,136 & 0.28\textbackslash{}\%\\
\hline
Juvenile Gang & Aggravated Assault/Murder & 1991 & 1,905 & 0.25\textbackslash{}\%\\
\hline
Other Negligent Killings & Negligent Manslaughter & 1991 & 1,670 & 0.22\textbackslash{}\%\\
\hline
Criminal Killed By Private Citizen & Justifiable Homicide & 1991 & 443 & 0.06\textbackslash{}\%\\
\hline
Other Negligent Weapon Handling & Negligent Manslaughter & 1991 & 298 & 0.04\textbackslash{}\%\\
\hline
Criminal Killed By Police Officer & Justifiable Homicide & 1992 & 248 & 0.03\textbackslash{}\%\\
\hline
Child Playing With Weapon & Negligent Manslaughter & 1991 & 38 & 0.00\textbackslash{}\%\\
\hline
Mercy Killing (Not Applicable To Aggravated Assault) & Aggravated Assault/Murder & 1993 & 16 & 0.00\textbackslash{}\%\\
\hline
Gun-Cleaning Accident & Negligent Manslaughter & 1992 & 10 & 0.00\textbackslash{}\%\\
\hline
Hunting Accident & Negligent Manslaughter & 1991 & 2 & 0.00\textbackslash{}\%\\
\hline
Total & Aggravated Assault/Murder & - & 763,134 & 100\textbackslash{}\%\\
\hline
\end{longtable}



## Justifiable homicide circumstance

We know a little bit more in cases of justifiable homicides. Here, we know the circumstances behind the homicide. Figure \@ref(fig:victimJustifiableHomicide) shows the circumstance breakdown for all 308 justifiable homicides reported in 2019. The most common reason, at 34.4% of justifiable homicides is because the offender attacked a civilian. In 21% of justifiable homicides the offender attacked a police officer and was killed by the same officer. In 6.5% the offender attacked a police officer and was killed by a different officer. This is followed by 28% being killed during the commission of a crime. In 4.9% of justifiable homicides, the circumstance is unknown. 3.6% had the offender killed while fleeing from a crime and 1% were killed while resisting arrest.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/victimJustifiableHomicide-1} 

}

\caption{The distribution of circumstances for justifiable homicides (N = 308 in 2022 for all agencies reporting).}(\#fig:victimJustifiableHomicide)
\end{figure}

## Demographics

As only people have demographics, these variables only apply when the victim is an individual or a law enforcement officer. The demographics here cover victim age, race, sex, ethnicity, and whether they live in the jurisdiction of the agency where they were victimized. For the following graphs I will be using all victims, not separating by if they are an "individual" or a law enforcement officer. 

### Residence status

This segment tells us if the victim is a resident of the jurisdiction they were victimized in. This basically means whether or not they live in the city where the crime happened. It has nothing to do with residence status or citizenship status in the United States. The FBI defines residence as their legal permanent address though it is unclear how that is handled for people without this information (though this is far less likely to be a problem here than for arrestees which also report this variable) and when people live permanently in a different spot than their legal address. This variable is useful when trying to figure out if victims are those who live in the area or live outside of it, such as tourists or workers who live nearby. Since crime rates are usually crimes per residents in the jurisdiction, this can be used to determine how reliable that denominator is. If many victims are residents then it makes much more sense than if few are.   

Table \@ref(fig:victimResidenceStatus) shows the residence status for all individual or law enforcement officer victims. The vast majority, 67%, of victims are residents of the jurisdiction where they were victimized while 12.5% were not residents. 20.4% of victims have an unknown resident status.    

One proposed measure to improve policing is to require police officers (or at least newly hired officers) live in the city where they work. The idea here is that people will do a better job if it affects the place they consider home.^[Since crime is generally concentrated in a small number of impoverished parts of town, and police likely would not live in these parts, this probably would not be very effective.] Luckily for us, NIBRS includes law enforcement officers in their measure of whether the victim lives in the jurisdiction where they were victimized. Since law enforcement officers are only recorded to be victims when on the job, this is one measure of where officers live.


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimResidentStatus-1} 

}

\caption{The share of victims by resident status in the reporting agency's jurisdiction, 1991-2023.}(\#fig:nibrsVictimResidentStatus)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimResidentStatusOfficer-1} 

}

\caption{The share of victims by resident status in the reporting agency's jurisdiction for law enforcement officer victims, 1991-2023.}(\#fig:nibrsVictimResidentStatusOfficer)
\end{figure}

### Age

This variable is the age of the victim when the crime occurred, regardless of when they reported the crime. Age is given as how many years old the victim is, with a few exceptions. Victims older than 98 are grouped together as "over 98 years old" while victims younger than 1 years old are broken down into "under 24 hours (neonate)", "1 to 6 days old (newborn)", and "between 6 days and 1 year old (baby)". About 1.4% of victim ages are unknown. 

Figure \@ref(fig:victimAge) shows the percent of victims at each age available. This is pretty similar to the age of offenders shown in Figure \@ref(fig:offenderAge) with a peak in the mid to late 20s with a long decline after. The most common victim age is 27 followed by 28, 29, and 30. Relative to offender ages, there are far more young victims. About 2.8% of victims, or 145k victims, in 2019 were aged 14 or younger. However, remember that this is for all victims of any crime so age trends may differ by which crime you are looking at.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/victimAge-1} 

}

\caption{The age of all victims, 2023.}(\#fig:victimAge)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimAge-1} 

}

\caption{The mean and median age of victims, 1991-2023.}(\#fig:nibrsVictimAge)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimAgeMissing-1} 

}

\caption{The percent of victim's age that is unknown, 1991-2023.}(\#fig:nibrsVictimAgeMissing)
\end{figure}

### Sex

As with the Offender and the Arrestee Segments, we know the sex of the victim. The only choices are female, male, and unknown sex. There is no option for transgender or any other identify. Since the victim can tell the police their sex, and the police can see them clearly in most cases (though this may not be true if the victim reports a crime over the phone by calling 911 but then does not stay to be interviewed) so is more reliable than in the Offender Segment which may include guesses about the offender. The most common victim sex is female at 50.8% of victims, followed closely by male at 48.4%. Only about 0.8% of victims have an unknown sex. It is interesting that female victims are so common since most criminology research finds that male victims are so common. I think this is likely due to criminologists primarily focusing on murder and index violent crimes as their measure of crime, which ignores many other crimes.^[Murder and other violent crimes are mainly men hurting/killing other men, except in domestic violence which is primarily men hurting/killing women.]  


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimSex-1} 

}

\caption{The share of victims by sex, 1991-2023.}(\#fig:nibrsVictimSex)
\end{figure}

### Race

For each victim we also know their race. The only possible races are White, Black, American Indian/Alaskan Native, Asian, and Native Hawaiian/Other Pacific Islander. These categories are mutually exclusive so people cannot be labeled as mixed race, they must be put into one of the categories. Since the police generally can talk to the victim it is possible that they ask the victim what race they are rather than just guess based on appearance. However, this may differ based on agency and the officer taking the report so may be inconsistent. 

Figure \@ref(fig:victimRace) shows the breakdown in victims by race. Most victims are White at about 67.8% of victims, followed by Black victims at 23.4%. 5.6% have an unknown race. The remaining victims are made up of 1.9% Asian victims, 0,7% American Indian/Alaskan Native victims, and 0.5% Native Hawaiian/Pacific Islander.





\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimRace-1} 

}

\caption{The share of victims by race, 1991-2023.}(\#fig:nibrsVictimRace)
\end{figure}

### Ethnicity

The final demographics variable for victims is their ethnicity, which is whether they are Hispanic or not. Ethnicity is an optional variable so agencies do not have to ever report it. This means that some agencies never report it, some always report it, and some report it only sometimes. The "sometimes report" agencies are probably the most dangerous to use since it is unclear when they report it, which could lead to biased data (such as only reporting it when the suspect is confirmed Hispanic or not, which may not be how other agencies define it). 

There’s also the question of reliability of the ethnicity data. Someone being Hispanic or not is likely just what the arrestees calls themselves or what the arresting officer perceives them to be. Both are important ways of measuring ethnicity but get at different things. Perception is more important for studies of bias, self-identification for differences among groups of people such as arrest rates by ethnicity. And the subjectivity of who is classified as Hispanic means that this measurement may differ by agency and by officer, making it imprecise.

Figure \@ref(fig:victimEthnicity) shows the breakdown in arrests by victim ethnicity for all victims in 2019. Most arrestees - 62.2% - are not Hispanic. Only 10.5% are reported to be Hispanic but a much higher percent of arrestees - 27.2% - have an unknown ethnicity. Given that over a quarter of victims do not have ethnicity data, if you would like to use this variable I recommend that you carefully examine the data to ensure that the agencies you are looking at (if you do not use all agencies in the data) have a much higher reporting rate. 


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimEthnicity-1} 

}

\caption{The share of victims by ethnicity, 1991-2023.}(\#fig:nibrsVictimEthnicity)
\end{figure}
