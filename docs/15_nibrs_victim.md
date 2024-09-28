# Victim Segment





The Victim Segment provides data at the victim-level and includes information about who the victim is and their relationship to offenders. This data tells us what "type" of victim it is with the type meaning if they are a police officer, a civilian ("Individual" and basically any person who is not a police officer), a business, the government, etc. It also includes the standard demographics variables in other segments - age, race, sex, ethnicity - as well as whether the victim is a resident (i.e. do they live there?) of the jurisdiction where they were victimized. We also learn from this data what types of injuries (if any) the victim suffered as a result of the crime. This is limited to physical injuries - excluding important outcomes such as mental duress or PTSD - but allows for a much better measure of harm from crime than simply assuming (or using past studies that tend to be old and only look at the cost of crime) what harm comes from certain offenses. There are seven possible injury types (including no injury at all) and victims can report up to five of these injuries so we have a fairly detailed measure of victim injury.

One highly interesting variable in this segment is the relationship between the victim and the offender (for up to 10 offenders). This includes, for example, if the victim was the offender's wife, their child, employee, or if the stranger was unknown to them, with 27 total possible relationship categories. You can use this to determine which incidents were crimes by strangers, identify domestic violence, or simply learn who tends to commit crimes against certain types of victims. This variable is only available when the victim is a police officer or an "individual." This makes some sense though there could actually be cases where non-human victims (e.g. businesses, religious organizations) do have a relationship with the offender such as an employee stealing from a store. Related to the victim-offender relationship, this segment provides a bit of information about the motive for the crime. For aggravated assaults and homicides, there is a variable with the "circumstance" of the offense which is essentially the reason why the crime occurred. For example, possible circumstances are arguments between people, hunting accidents, child playing with weapon, and domestic violence. 

It also has a "victim sequence number" which is a number identifying the victim in an incident since some incidents have multiple victims. 

## Crime category

The first variable we will look at is the crime the victim experienced. This is a bit different than the offenses in the Offense Segment as not all victims in an incident are victimized by all of the crimes involved. For example, if a couple is assaulted and the woman is raped, the woman would experience rape and assault while the man only experiences assault. NIBRS allows for up to 10 offenses per victim and these are supposed to be ranked in order of seriousness. So the first variable has the most serious offense, the second has the second most serious offense, and so on. This is true is most cases but some have more minor crimes presented before more serious crimes. This seems to just be a data entry issue and nothing systematic but you should still check all offense variables if you are interested in finding the most serious crime per victim. 

There are 52 possible offenses included in this segment and Table \@ref(tab:victimCrimeCategory) shows how frequent each offense is. Though there are 10 possible offenses per victim, this table only looks at the first offense. The most common offense is simple assault, affecting 12.7% of victims or 944k people. This is followed by damage, vandalism, or destruction of property for 11% of victims. About 9.6% of victims experience drugs/narcotic violations, and these victims are likely also the offenders in the case (all incidents must have a victim recorded so in drug crimes the victims are also the offenders in most cases). Theft crimes, broken into some subcategories like "all other larceny" and "theft from motor vehicle" make up the three of the top six crimes (ranks 3, 5, and 6) people are victimized by. And the only remaining crime that accounts for 5% or more of offenses is burglary at 6.4%.


\begin{longtable}[t]{l|l|r|r|r|l}
\caption{(\#tab:victimCrimeCategory)The number and percent of crimes committed against each victim, counting all victims and then separately law enforcement officer victims, 2022. For victims with multiple crimes committed against them, this shows the first crime reported.}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims & \# of Officer Victims & \% of Officer Victims\\
\hline
\endfirsthead
\caption[]{(\#tab:victimCrimeCategory)The number and percent of crimes committed against each victim, counting all victims and then separately law enforcement officer victims, 2022. For victims with multiple crimes committed against them, this shows the first crime reported. \textit{(continued)}}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims & \# of Officer Victims & \% of Officer Victims\\
\hline
\endhead
Assault Offenses - Simple Assault & 1991 & 1,963,108 & 15.51\textbackslash{}\% & 47,190 & 64.25\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 1991 & 1,349,448 & 10.67\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 1991 & 1,204,569 & 9.52\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & 1991 & 993,317 & 7.85\textbackslash{}\% & - & -\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 1991 & 959,554 & 7.58\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 757,933 & 5.99\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 1991 & 747,655 & 5.91\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1991 & 703,215 & 5.56\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 1991 & 669,067 & 5.29\textbackslash{}\% & 17,616 & 23.98\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 1991 & 537,389 & 4.25\textbackslash{}\% & 8,584 & 11.69\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 1991 & 387,566 & 3.06\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1991 & 333,517 & 2.64\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 1991 & 276,139 & 2.18\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & 1991 & 240,037 & 1.90\textbackslash{}\% & - & -\\
\hline
Robbery & 1991 & 194,500 & 1.54\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Identity Theft & 2015 & 177,323 & 1.40\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 1991 & 159,970 & 1.26\textbackslash{}\% & - & -\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & 1991 & 159,409 & 1.26\textbackslash{}\% & - & -\\
\hline
Counterfeiting/Forgery & 1991 & 143,052 & 1.13\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 1991 & 111,630 & 0.88\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & 1991 & 87,715 & 0.69\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Rape & 1991 & 76,759 & 0.61\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Impersonation & 1991 & 75,089 & 0.59\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Kidnapping/Abduction & 1991 & 43,094 & 0.34\textbackslash{}\% & 8 & 0.01\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1991 & 39,629 & 0.31\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Wire Fraud & 1991 & 36,975 & 0.29\textbackslash{}\% & - & -\\
\hline
Arson & 1991 & 35,241 & 0.28\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Embezzlement & 1991 & 32,065 & 0.25\textbackslash{}\% & - & -\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 1991 & 21,080 & 0.17\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Animal Cruelty & 2015 & 20,100 & 0.16\textbackslash{}\% & - & -\\
\hline
Extortion/Blackmail & 1991 & 19,953 & 0.16\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Sodomy & 1991 & 17,447 & 0.14\textbackslash{}\% & - & -\\
\hline
Murder/Nonnegligent Manslaughter & 1991 & 16,414 & 0.13\textbackslash{}\% & 55 & 0.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 1991 & 11,048 & 0.09\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Statutory Rape & 1991 & 7,984 & 0.06\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Sexual Assault With An Object & 1991 & 7,425 & 0.06\textbackslash{}\% & - & -\\
\hline
Prostitution Offenses - Prostitution & 1991 & 7,113 & 0.06\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Hacking/Computer Invasion & 2015 & 6,380 & 0.05\textbackslash{}\% & - & -\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & 1991 & 5,630 & 0.04\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Welfare Fraud & 1991 & 4,415 & 0.03\textbackslash{}\% & - & -\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 1991 & 2,378 & 0.02\textbackslash{}\% & - & -\\
\hline
Prostitution Offenses - Purchasing Prostitution & 2013 & 2,184 & 0.02\textbackslash{}\% & - & -\\
\hline
Negligent Manslaughter & 1991 & 1,750 & 0.01\textbackslash{}\% & - & -\\
\hline
Human Trafficking - Commercial Sex Acts & 2013 & 1,749 & 0.01\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Incest & 1991 & 1,277 & 0.01\textbackslash{}\% & - & -\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & 1991 & 822 & 0.01\textbackslash{}\% & - & -\\
\hline
Justifiable Homicide - Not A Crime & 1991 & 634 & 0.01\textbackslash{}\% & - & -\\
\hline
Gambling Offenses - Betting/Wagering & 1991 & 600 & 0.00\textbackslash{}\% & - & -\\
\hline
Bribery & 1991 & 567 & 0.00\textbackslash{}\% & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 2014 & 506 & 0.00\textbackslash{}\% & - & -\\
\hline
Gambling Offenses - Gambling Equipment Violations & 1991 & 313 & 0.00\textbackslash{}\% & - & -\\
\hline
Commerce Violations - Federal Liquor Offenses & 2020 & 145 & 0.00\textbackslash{}\% & - & -\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & 2021 & 66 & 0.00\textbackslash{}\% & - & -\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & 2021 & 27 & 0.00\textbackslash{}\% & - & -\\
\hline
Fraud Offenses - Money Laundering & 2022 & 7 & 0.00\textbackslash{}\% & - & -\\
\hline
Weapon Law Violations - Explosives & 2021 & 4 & 0.00\textbackslash{}\% & - & -\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & 2021 & 3 & 0.00\textbackslash{}\% & - & -\\
\hline
Immigration Violations - Illegal Entry Into The United States & 2020 & 3 & 0.00\textbackslash{}\% & - & -\\
\hline
Gambling Offenses - Sports Tampering & 1994 & 2 & 0.00\textbackslash{}\% & - & -\\
\hline
Fugitive Offenses - Flight To Avoid Deportation & 2021 & 1 & 0.00\textbackslash{}\% & - & -\\
\hline
Weapon Law Violations - Violation of National Firearm Act of 1934 & 2021 & 1 & 0.00\textbackslash{}\% & - & -\\
\hline
Total & - & 12,652,993 & 100\textbackslash{}\% & - & -\\
\hline
\end{longtable}



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsFirstVsAllOffensesMurders-1} 

}

\caption{The share of victims when considering only the 1st offense reported compared to using all offenses, for murder and nonnegligent manslaughter, sex offenses, motor vehicle theft, and destruction of property/vandalism, 1991-2022.}(\#fig:nibrsFirstVsAllOffensesMurders)
\end{figure}


## Victim type

I spoke above as if all victims are people who are victimized. This is not entirely true. Some victims may be organizations, businesses, or other inanimate objects. NIBRS has nine different types of victims (including "unknown" type and "other" type) in the data and it tells us which type each victim is. 

Table \@ref(tab:victimType) shows each of the victim types and how commonly they appear in the data. Two key ones are "individual" at 69.4% of victims and law enforcement officer at 0.5% of victims. Law enforcement officers who are victimized are only classified as law enforcement officers when they are the victims of murder, aggravated or simple assault, or intimidation. Otherwise they are labeled as "individual" victims. So an individual is a person who is either not a law enforcement officer or who is an officer but is not victimized by one of the approved crimes. These two are special types of victims as all other variables in this segment apply only to them. This is because non-humans cannot have demographic information, injuries (injury to property would be detailed in the Property Segment in Chapter \@ref(property)), or relationships.^[Businesses may have some form of demographic information if you think about demographics of the owners or managers. However, that information is not available. If the business was targeted due to the owner's demographics then that may be considered a hate crime and be reported in the Offense Segment.]

The next most common type is business at 15.6% of victims, "society/public" at 12.9% of victims, and the government in 1% of victims. When the victim is society/public that means that the offense is a "victimless crime" or one where there is no specific victim. This includes drug offenses, animal cruelty (animals cannon be victims in this data), prostitution-related offenses (purchasing, promoting, and being a prostitute), pornography/obscene materials, and weapon offenses. The remaining categories - financial institution, other victim type, unknown victim type, and religion organization - are each under 0.25% of victims. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:victimType)The distribution of the type of victim, 2022. Victim types are mutually exclusive.}\\
\hline
Type of Victim & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims\\
\hline
\endfirsthead
\caption[]{(\#tab:victimType)The distribution of the type of victim, 2022. Victim types are mutually exclusive. \textit{(continued)}}\\
\hline
Type of Victim & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims\\
\hline
\endhead
Individual & 1991 & 8,983,510 & 71.00\textbackslash{}\%\\
\hline
Business & 1991 & 1,897,966 & 15.00\textbackslash{}\%\\
\hline
Society/Public & 1991 & 1,466,005 & 11.59\textbackslash{}\%\\
\hline
Government & 1991 & 139,194 & 1.10\textbackslash{}\%\\
\hline
Law Enforcement Officer & 2002 & 73,453 & 0.58\textbackslash{}\%\\
\hline
Other & 1991 & 36,800 & 0.29\textbackslash{}\%\\
\hline
Financial Institution & 1991 & 21,144 & 0.17\textbackslash{}\%\\
\hline
Unknown & 1991 & 17,953 & 0.14\textbackslash{}\%\\
\hline
Religious Organization & 1991 & 16,968 & 0.13\textbackslash{}\%\\
\hline
Total & - & 12,652,993 & 100\textbackslash{}\%\\
\hline
\end{longtable}



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimPercentIndividualOfficer-1} 

}

\caption{Percent of victimizations whose victim type of 'law enforcement officer,' 'business,' or 'invidual,' 1991-2022.}(\#fig:nibrsVictimPercentIndividualOfficer)
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

\caption{The distribution of the injury sustained by the victim, 2022. Only individual and law enforcement officer victims have this variable available.}(\#fig:victimInjury)
\end{figure}

For the group who suffered one of the six more serious injury types, 32.1% suffered an "other major injury" which is a serious injury other than one of the other categories. This is followed by 25.8% having a serious laceration (a laceration is a cut), 21.6% having a possible internal injury, and 12.5% having an apparent broken bone. About 6.5% of these victims became unconscious at some point in the incident, and 1.5% lost at least one tooth. 

Trends for law enforcement officer victims (not shown) are nearly identical for those with an injury but have more victims reporting no injury at all relative to non-law enforcement officer victims.


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseCrimeInjury)The number and percent of victim injury by offense, 2022. This breakdown is only available for a subset of offenses. There can be up to five injuries per victim; in this table we only use the first injury reported. There can be up to 10 offenses per victim; in this table we only use the first offense reported.}\\
\hline
Crime & Injury & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseCrimeInjury)The number and percent of victim injury by offense, 2022. This breakdown is only available for a subset of offenses. There can be up to five injuries per victim; in this table we only use the first injury reported. There can be up to 10 offenses per victim; in this table we only use the first offense reported. \textit{(continued)}}\\
\hline
Crime & Injury & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Assault Offenses - Aggravated Assault & None & 343,460 & 51.33\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Apparent Minor Injuries & 166,056 & 24.82\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other Major Injury & 62,432 & 9.33\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Severe Laceration & 38,791 & 5.80\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Possible Internal Injury & 30,879 & 4.62\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Apparent Broken Bones & 16,887 & 2.52\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Unconsciousness & 8,366 & 1.25\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Loss of Teeth & 2,196 & 0.33\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 669,067 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & None & 983,042 & 50.08\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Apparent Minor Injuries & 980,065 & 49.92\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Severe Laceration & 1 & 0.00\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 1,963,108 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & None & 19,570 & 98.08\textbackslash{}\%\\
\hline
Extortion/Blackmail & Unknown & 289 & 1.45\textbackslash{}\%\\
\hline
Extortion/Blackmail & Apparent Minor Injuries & 67 & 0.34\textbackslash{}\%\\
\hline
Extortion/Blackmail & Other Major Injury & 11 & 0.06\textbackslash{}\%\\
\hline
Extortion/Blackmail & Apparent Broken Bones & 7 & 0.04\textbackslash{}\%\\
\hline
Extortion/Blackmail & Possible Internal Injury & 6 & 0.03\textbackslash{}\%\\
\hline
Extortion/Blackmail & Loss of Teeth & 2 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Unconsciousness & 1 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 19,953 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & None & 1,647 & 94.17\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Apparent Minor Injuries & 68 & 3.89\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Other Major Injury & 16 & 0.91\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Possible Internal Injury & 11 & 0.63\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Unconsciousness & 3 & 0.17\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Severe Laceration & 2 & 0.11\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Loss of Teeth & 1 & 0.06\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Apparent Broken Bones & 1 & 0.06\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 1,749 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & None & 457 & 90.32\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Apparent Minor Injuries & 38 & 7.51\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Possible Internal Injury & 8 & 1.58\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Apparent Broken Bones & 1 & 0.20\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Other Major Injury & 1 & 0.20\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Severe Laceration & 1 & 0.20\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 506 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & None & 24,986 & 57.98\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Apparent Minor Injuries & 14,421 & 33.46\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Possible Internal Injury & 1,296 & 3.01\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other Major Injury & 1,126 & 2.61\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Severe Laceration & 520 & 1.21\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Apparent Broken Bones & 371 & 0.86\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Unconsciousness & 324 & 0.75\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Loss of Teeth & 50 & 0.12\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 43,094 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Unknown & 16,113 & 98.17\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other Major Injury & 244 & 1.49\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & None & 20 & 0.12\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Possible Internal Injury & 14 & 0.09\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Severe Laceration & 12 & 0.07\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Apparent Broken Bones & 5 & 0.03\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Unconsciousness & 3 & 0.02\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Apparent Minor Injuries & 3 & 0.02\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 16,414 & 100\textbackslash{}\%\\
\hline
Robbery & None & 116,438 & 59.87\textbackslash{}\%\\
\hline
Robbery & Apparent Minor Injuries & 39,239 & 20.17\textbackslash{}\%\\
\hline
Robbery & Unknown & 29,607 & 15.22\textbackslash{}\%\\
\hline
Robbery & Other Major Injury & 2,949 & 1.52\textbackslash{}\%\\
\hline
Robbery & Severe Laceration & 2,809 & 1.44\textbackslash{}\%\\
\hline
Robbery & Possible Internal Injury & 1,746 & 0.90\textbackslash{}\%\\
\hline
Robbery & Apparent Broken Bones & 983 & 0.51\textbackslash{}\%\\
\hline
Robbery & Unconsciousness & 573 & 0.29\textbackslash{}\%\\
\hline
Robbery & Loss of Teeth & 156 & 0.08\textbackslash{}\%\\
\hline
Robbery & Total & 194,500 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & None & 81,627 & 93.06\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Apparent Minor Injuries & 4,482 & 5.11\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Possible Internal Injury & 933 & 1.06\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Other Major Injury & 489 & 0.56\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Unconsciousness & 99 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Apparent Broken Bones & 36 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Severe Laceration & 34 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Loss of Teeth & 15 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Total & 87,715 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & None & 56,697 & 73.86\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Apparent Minor Injuries & 13,106 & 17.07\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Possible Internal Injury & 4,976 & 6.48\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other Major Injury & 1,148 & 1.50\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Unconsciousness & 580 & 0.76\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Severe Laceration & 129 & 0.17\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Apparent Broken Bones & 102 & 0.13\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Loss of Teeth & 21 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 76,759 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & None & 5,713 & 76.94\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Apparent Minor Injuries & 1,030 & 13.87\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Possible Internal Injury & 516 & 6.95\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other Major Injury & 110 & 1.48\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Unconsciousness & 34 & 0.46\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Severe Laceration & 11 & 0.15\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Apparent Broken Bones & 8 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Loss of Teeth & 3 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 7,425 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & None & 14,234 & 81.58\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Apparent Minor Injuries & 2,025 & 11.61\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Possible Internal Injury & 913 & 5.23\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other Major Injury & 172 & 0.99\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Unconsciousness & 63 & 0.36\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Severe Laceration & 21 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Apparent Broken Bones & 18 & 0.10\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Loss of Teeth & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 17,447 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Unknown & 7,963 & 99.74\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & None & 15 & 0.19\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Apparent Minor Injuries & 4 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Possible Internal Injury & 2 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Total & 7,984 & 100\textbackslash{}\%\\
\hline
\end{longtable}





\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimAssaultInjury-1} 

}

\caption{Victim injury for assault offenses, by injury severity, 1991-2022. Major injury is all injury types other than 'none' and 'apparent minor injuries' which are 'other major injury,' 'severe laceration,' possible internal injury,' apparent broken bones,' 'unconsciousness,' and 'loss of teeth.'}(\#fig:nibrsVictimAssaultInjury)
\end{figure}

## Relationship to offender

One interesting variable in this segment is that we know the relationship between the victim and the offender. There are 27 possible relationship types (including “unknown” relationship) which can be broken into three broad categories: legal family members, people known to the victim but who aren’t family, and people not known to the victim. These relationship categories are mutually exclusive. If, for example, there were two possible relationship categories that apply, such as the victim was both the friend and the neighbor of the offender, only a single category would be reported. 

Table \@ref(tab:victimRelationship) shows each of the relationship categories and how frequently they occur. The most common relationship category, accounting for 19.8% of relationships was that the relationship was unknown. This is followed by 14.4% of victims being the boyfriend or girlfriend (we can find out which by looking at their sex) of the offender. Then victims were the acquaintance of or a stranger to the offender at 13% and 12.8%, respectively. The only other categories that account for over 5% of victims are the victim being "otherwise known" to the offender at 9.5% and being the spouse of the offender at 5.4%. One relationship to note is that when the victim "was child" that means they were the offender's biological or adopted child. This does not mean that they are actually a child (<18 years old). 



\begin{longtable}[t]{l|l|r|r|r|l}
\caption{(\#tab:victimRelationship)The distribution of the relationship between the victim and the offender. Only individual and law enforcement officer victims have this variable available, 2022.}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims & \textbackslash{}\# of Officer Victims & \textbackslash{}\% of Officer Victims\\
\hline
\endfirsthead
\caption[]{(\#tab:victimRelationship)The distribution of the relationship between the victim and the offender. Only individual and law enforcement officer victims have this variable available, 2022. \textit{(continued)}}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims & \textbackslash{}\# of Officer Victims & \textbackslash{}\% of Officer Victims\\
\hline
\endhead
Relationship Unknown & 1991 & 1,117,979 & 24.31\textbackslash{}\% & 16,873 & 23.14\textbackslash{}\%\\
\hline
Victim Was Stranger & 1991 & 669,425 & 14.56\textbackslash{}\% & 40,978 & 56.20\textbackslash{}\%\\
\hline
Victim Was Boyfriend/Girlfriend & 1991 & 538,762 & 11.72\textbackslash{}\% & 110 & 0.15\textbackslash{}\%\\
\hline
Victim Was Acquaintance & 1991 & 505,720 & 11.00\textbackslash{}\% & 2,151 & 2.95\textbackslash{}\%\\
\hline
Victim Was Otherwise Known & 1991 & 384,883 & 8.37\textbackslash{}\% & 12,381 & 16.98\textbackslash{}\%\\
\hline
Victim Was Spouse & 1991 & 209,028 & 4.55\textbackslash{}\% & 55 & 0.08\textbackslash{}\%\\
\hline
Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 2017 & 172,218 & 3.75\textbackslash{}\% & 11 & 0.02\textbackslash{}\%\\
\hline
Victim Was Parent & 1991 & 163,978 & 3.57\textbackslash{}\% & 26 & 0.04\textbackslash{}\%\\
\hline
Victim Was Child & 1991 & 128,085 & 2.79\textbackslash{}\% & 6 & 0.01\textbackslash{}\%\\
\hline
Victim Was Other Family Member & 1991 & 113,811 & 2.48\textbackslash{}\% & 31 & 0.04\textbackslash{}\%\\
\hline
Victim Was Sibling & 1991 & 102,790 & 2.24\textbackslash{}\% & 18 & 0.02\textbackslash{}\%\\
\hline
Victim Was Friend & 1991 & 100,191 & 2.18\textbackslash{}\% & 17 & 0.02\textbackslash{}\%\\
\hline
Victim Was Offender & 1991 & 93,715 & 2.04\textbackslash{}\% & 8 & 0.01\textbackslash{}\%\\
\hline
Victim Was Neighbor & 1991 & 86,725 & 1.89\textbackslash{}\% & 19 & 0.03\textbackslash{}\%\\
\hline
Victim Was Ex-Spouse & 1991 & 52,407 & 1.14\textbackslash{}\% & 8 & 0.01\textbackslash{}\%\\
\hline
Victim Was Common-Law Spouse & 1991 & 25,507 & 0.55\textbackslash{}\% & 6 & 0.01\textbackslash{}\%\\
\hline
Victim Was In-Law & 1991 & 19,763 & 0.43\textbackslash{}\% & 27 & 0.04\textbackslash{}\%\\
\hline
Victim Was Step-Child & 1991 & 19,401 & 0.42\textbackslash{}\% & 5 & 0.01\textbackslash{}\%\\
\hline
Victim Was Grandparent & 1991 & 19,054 & 0.41\textbackslash{}\% & 1 & 0.00\textbackslash{}\%\\
\hline
Victim Was Step-Parent & 1991 & 15,982 & 0.35\textbackslash{}\% & 3 & 0.00\textbackslash{}\%\\
\hline
Victim Was Employee & 1991 & 14,920 & 0.32\textbackslash{}\% & 158 & 0.22\textbackslash{}\%\\
\hline
Victim Was Child of Boyfriend/Girlfriend & 1991 & 14,423 & 0.31\textbackslash{}\% & 1 & 0.00\textbackslash{}\%\\
\hline
Victim Was Employer & 1991 & 13,567 & 0.30\textbackslash{}\% & 8 & 0.01\textbackslash{}\%\\
\hline
Victim Was Grandchild & 1991 & 8,776 & 0.19\textbackslash{}\% & 0 & 0.00\textbackslash{}\%\\
\hline
Victim Was Step-Sibling & 1991 & 4,616 & 0.10\textbackslash{}\% & 13 & 0.02\textbackslash{}\%\\
\hline
Victim Was Babysittee (The Baby) & 1991 & 2,399 & 0.05\textbackslash{}\% & 3 & 0.00\textbackslash{}\%\\
\hline
Total & - & 4,598,125 & 100\textbackslash{}\% & 72,917 & 100\textbackslash{}\%\\
\hline
\end{longtable}



We also know the relationship between victim and offender when the victim is a law enforcement officer. As shown in Table \@ref(tab:victimRelationshipPolice), most of the time the officer did not know the offender, with 58.9% of victimizations being this relationship type. This is followed by 18.7% where the officer knew the offender, including if they were familiar with the person by arresting or stopping them previously. In about 18.5% we do not know the relationship as it is unknown and in 3.2% the officer and the offender were acquaintances. There are also a number of unlikely (and some impossible) relationships like the three in which the officer was the offender's child and the one in which the officer was a baby who was abused by their babysitter. These seem to be clear indications that there are some data errors with this variable. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseVictimRelationship)The number and percent of victim relationships to offender by offense, 2022. This breakdown is only available for a subset of offenses. There can be up to 10 victim-offender relationships per victim; in this table we only use the first relationship reported. The top five most common relationships are shown, all other relationships are combined into an 'All Other' category. }\\
\hline
Crime & Relationship to Offender & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseVictimRelationship)The number and percent of victim relationships to offender by offense, 2022. This breakdown is only available for a subset of offenses. There can be up to 10 victim-offender relationships per victim; in this table we only use the first relationship reported. The top five most common relationships are shown, all other relationships are combined into an 'All Other' category.  \textit{(continued)}}\\
\hline
Crime & Relationship to Offender & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Arson & Relationship Unknown & 2,798 & 36.94\textbackslash{}\%\\
\hline
Arson & Victim Was Stranger & 1,058 & 13.97\textbackslash{}\%\\
\hline
Arson & Victim Was Acquaintance & 791 & 10.44\textbackslash{}\%\\
\hline
Arson & Victim Was Otherwise Known & 720 & 9.51\textbackslash{}\%\\
\hline
Arson & Victim Was Parent & 428 & 5.65\textbackslash{}\%\\
\hline
Arson & All Other & 1,779 & 23.49\textbackslash{}\%\\
\hline
Arson & Total & 7,574 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Relationship Unknown & 125,660 & 21.86\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Victim Was Stranger & 89,408 & 15.55\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Victim Was Boyfriend/Girlfriend & 80,103 & 13.94\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Victim Was Acquaintance & 66,709 & 11.61\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Victim Was Otherwise Known & 50,231 & 8.74\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & All Other & 162,692 & 28.32\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 574,803 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Victim Was Acquaintance & 79,595 & 16.47\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Relationship Unknown & 74,276 & 15.37\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Victim Was Otherwise Known & 63,911 & 13.22\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Victim Was Stranger & 62,722 & 12.98\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Victim Was Boyfriend/Girlfriend & 37,121 & 7.68\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & All Other & 165,675 & 34.29\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Total & 483,300 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Victim Was Boyfriend/Girlfriend & 359,209 & 19.17\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Victim Was Acquaintance & 207,915 & 11.09\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Relationship Unknown & 189,435 & 10.11\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Victim Was Stranger & 177,632 & 9.48\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Victim Was Otherwise Known & 174,926 & 9.33\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & All Other & 765,140 & 40.82\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 1,874,257 & 100\textbackslash{}\%\\
\hline
Bribery & Victim Was Stranger & 70 & 32.41\textbackslash{}\%\\
\hline
Bribery & Relationship Unknown & 36 & 16.67\textbackslash{}\%\\
\hline
Bribery & Victim Was Otherwise Known & 29 & 13.43\textbackslash{}\%\\
\hline
Bribery & Victim Was Acquaintance & 28 & 12.96\textbackslash{}\%\\
\hline
Bribery & Victim Was Boyfriend/Girlfriend & 12 & 5.56\textbackslash{}\%\\
\hline
Bribery & All Other & 41 & 18.99\textbackslash{}\%\\
\hline
Bribery & Total & 216 & 100\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Relationship Unknown & 70,068 & 48.54\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Victim Was Stranger & 32,762 & 22.70\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Victim Was Acquaintance & 10,869 & 7.53\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Victim Was Otherwise Known & 8,098 & 5.61\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 5,621 & 3.89\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & All Other & 16,937 & 11.76\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Total & 144,355 & 100\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Relationship Unknown & 9,991 & 47.44\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Victim Was Stranger & 5,982 & 28.41\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Victim Was Acquaintance & 1,300 & 6.17\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Victim Was Otherwise Known & 1,047 & 4.97\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Victim Was Parent & 443 & 2.10\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & All Other & 2,296 & 10.9\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Total & 21,059 & 100\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Relationship Unknown & 92,048 & 34.62\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Victim Was Stranger & 40,575 & 15.26\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Victim Was Acquaintance & 24,158 & 9.09\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Victim Was Otherwise Known & 20,892 & 7.86\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Victim Was Boyfriend/Girlfriend & 18,126 & 6.82\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & All Other & 70,107 & 26.38\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Total & 265,906 & 100\textbackslash{}\%\\
\hline
Embezzlement & Victim Was Employer & 767 & 23.29\textbackslash{}\%\\
\hline
Embezzlement & Victim Was Acquaintance & 472 & 14.33\textbackslash{}\%\\
\hline
Embezzlement & Relationship Unknown & 469 & 14.24\textbackslash{}\%\\
\hline
Embezzlement & Victim Was Otherwise Known & 352 & 10.69\textbackslash{}\%\\
\hline
Embezzlement & Victim Was Stranger & 245 & 7.44\textbackslash{}\%\\
\hline
Embezzlement & All Other & 988 & 30.01\textbackslash{}\%\\
\hline
Embezzlement & Total & 3,293 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & Relationship Unknown & 2,442 & 50.08\textbackslash{}\%\\
\hline
Extortion/Blackmail & Victim Was Stranger & 1,013 & 20.78\textbackslash{}\%\\
\hline
Extortion/Blackmail & Victim Was Acquaintance & 494 & 10.13\textbackslash{}\%\\
\hline
Extortion/Blackmail & Victim Was Otherwise Known & 339 & 6.95\textbackslash{}\%\\
\hline
Extortion/Blackmail & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 185 & 3.79\textbackslash{}\%\\
\hline
Extortion/Blackmail & All Other & 403 & 8.25\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 4,876 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Relationship Unknown & 12,346 & 46.38\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Victim Was Stranger & 5,124 & 19.25\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Victim Was Acquaintance & 2,174 & 8.17\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Victim Was Otherwise Known & 1,433 & 5.38\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Victim Was Parent & 1,260 & 4.73\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & All Other & 4,284 & 16.11\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Total & 26,621 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Relationship Unknown & 26,989 & 46.33\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Victim Was Stranger & 14,505 & 24.90\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Victim Was Acquaintance & 5,070 & 8.70\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Victim Was Otherwise Known & 4,700 & 8.07\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Victim Was Friend & 1,156 & 1.98\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & All Other & 5,831 & 10.01\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Total & 58,251 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Relationship Unknown & 556 & 47.28\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Victim Was Stranger & 183 & 15.56\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Victim Was Acquaintance & 94 & 7.99\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 84 & 7.14\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Victim Was Otherwise Known & 63 & 5.36\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & All Other & 196 & 16.7\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Total & 1,176 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Relationship Unknown & 23,475 & 62.93\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Victim Was Stranger & 7,323 & 19.63\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Victim Was Acquaintance & 1,235 & 3.31\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Victim Was Otherwise Known & 1,029 & 2.76\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Victim Was Sibling & 955 & 2.56\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & All Other & 3,286 & 8.79\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Total & 37,303 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Relationship Unknown & 7,764 & 54.13\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Victim Was Stranger & 2,954 & 20.59\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Victim Was Sibling & 1,030 & 7.18\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Victim Was Otherwise Known & 611 & 4.26\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Victim Was Acquaintance & 590 & 4.11\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & All Other & 1,395 & 9.73\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Total & 14,344 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Relationship Unknown & 271 & 61.31\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Victim Was Otherwise Known & 33 & 7.47\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Victim Was Acquaintance & 27 & 6.11\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Victim Was Stranger & 26 & 5.88\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Victim Was Friend & 16 & 3.62\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & All Other & 69 & 15.6\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Total & 442 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Relationship Unknown & 3,167 & 54.64\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Victim Was Stranger & 1,409 & 24.31\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Victim Was Acquaintance & 330 & 5.69\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Victim Was Otherwise Known & 263 & 4.54\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Victim Was Parent & 123 & 2.12\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & All Other & 504 & 8.69\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Total & 5,796 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Relationship Unknown & 427 & 30.54\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Victim Was Acquaintance & 289 & 20.67\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Victim Was Stranger & 269 & 19.24\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Victim Was Otherwise Known & 146 & 10.44\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Victim Was Boyfriend/Girlfriend & 88 & 6.29\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & All Other & 179 & 12.79\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 1,398 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Relationship Unknown & 188 & 43.12\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Victim Was Stranger & 86 & 19.72\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Victim Was Acquaintance & 47 & 10.78\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Victim Was Employee & 32 & 7.34\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Victim Was Otherwise Known & 20 & 4.59\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & All Other & 63 & 14.46\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 436 & 100\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Victim Was Stranger & 290 & 47.62\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Relationship Unknown & 127 & 20.85\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Victim Was Acquaintance & 67 & 11.00\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Victim Was Otherwise Known & 43 & 7.06\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Victim Was Boyfriend/Girlfriend & 20 & 3.28\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & All Other & 62 & 10.18\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Total & 609 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Victim Was Boyfriend/Girlfriend & 12,082 & 29.52\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Relationship Unknown & 4,221 & 10.31\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 3,652 & 8.92\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Victim Was Stranger & 3,464 & 8.46\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Victim Was Acquaintance & 3,321 & 8.11\textbackslash{}\%\\
\hline
Kidnapping/Abduction & All Other & 14,190 & 34.67\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 40,930 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Relationship Unknown & 107,302 & 44.48\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Victim Was Stranger & 50,393 & 20.89\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Victim Was Acquaintance & 24,885 & 10.32\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Victim Was Otherwise Known & 14,940 & 6.19\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Victim Was Friend & 6,680 & 2.77\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & All Other & 37,027 & 15.38\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Total & 241,227 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Relationship Unknown & 2,458 & 50.13\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Victim Was Stranger & 1,235 & 25.19\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Victim Was Acquaintance & 382 & 7.79\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Victim Was Otherwise Known & 221 & 4.51\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Victim Was Friend & 116 & 2.37\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & All Other & 491 & 10.02\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Total & 4,903 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Relationship Unknown & 1,728 & 41.65\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Victim Was Stranger & 1,584 & 38.18\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Victim Was Acquaintance & 261 & 6.29\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Victim Was Otherwise Known & 125 & 3.01\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Victim Was Boyfriend/Girlfriend & 107 & 2.58\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & All Other & 344 & 8.29\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Total & 4,149 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Victim Was Stranger & 7,665 & 55.12\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Relationship Unknown & 5,058 & 36.37\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Victim Was Acquaintance & 437 & 3.14\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Victim Was Otherwise Known & 367 & 2.64\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Victim Was Employee & 123 & 0.88\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & All Other & 257 & 1.85\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Total & 13,907 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Relationship Unknown & 19,538 & 34.11\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Victim Was Stranger & 10,633 & 18.56\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Victim Was Acquaintance & 7,986 & 13.94\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Victim Was Otherwise Known & 5,127 & 8.95\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Victim Was Friend & 2,433 & 4.25\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & All Other & 11,565 & 20.18\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Total & 57,282 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Relationship Unknown & 233 & 49.47\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Victim Was Stranger & 180 & 38.22\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Victim Was Acquaintance & 20 & 4.25\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Victim Was Otherwise Known & 18 & 3.82\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Victim Was Employee & 4 & 0.85\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & All Other & 16 & 3.39\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Total & 471 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Relationship Unknown & 104,788 & 72.36\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Victim Was Stranger & 31,736 & 21.91\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Victim Was Acquaintance & 2,555 & 1.76\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Victim Was Otherwise Known & 1,905 & 1.32\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 806 & 0.56\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & All Other & 3,029 & 2.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Total & 144,819 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Relationship Unknown & 41,437 & 81.49\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Victim Was Stranger & 7,121 & 14.00\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Victim Was Acquaintance & 734 & 1.44\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Victim Was Otherwise Known & 492 & 0.97\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Victim Was Ex-Relationship (Ex-Boyfriend/Ex-Girlfriend) & 196 & 0.39\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & All Other & 871 & 1.72\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Total & 50,851 & 100\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Relationship Unknown & 81,557 & 57.70\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Victim Was Stranger & 28,319 & 20.04\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Victim Was Acquaintance & 9,716 & 6.87\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Victim Was Otherwise Known & 4,680 & 3.31\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Victim Was Parent & 3,824 & 2.71\textbackslash{}\%\\
\hline
Motor Vehicle Theft & All Other & 13,251 & 9.39\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Total & 141,347 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Relationship Unknown & 5,146 & 39.72\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Victim Was Acquaintance & 1,903 & 14.69\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Victim Was Stranger & 1,531 & 11.82\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Victim Was Otherwise Known & 904 & 6.98\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Victim Was Boyfriend/Girlfriend & 711 & 5.49\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & All Other & 2,761 & 21.31\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 12,956 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & Victim Was Stranger & 568 & 34.13\textbackslash{}\%\\
\hline
Negligent Manslaughter & Relationship Unknown & 326 & 19.59\textbackslash{}\%\\
\hline
Negligent Manslaughter & Victim Was Acquaintance & 182 & 10.94\textbackslash{}\%\\
\hline
Negligent Manslaughter & Victim Was Friend & 160 & 9.62\textbackslash{}\%\\
\hline
Negligent Manslaughter & Victim Was Child & 129 & 7.75\textbackslash{}\%\\
\hline
Negligent Manslaughter & All Other & 299 & 17.96\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 1,664 & 100\textbackslash{}\%\\
\hline
Robbery & Relationship Unknown & 54,458 & 41.85\textbackslash{}\%\\
\hline
Robbery & Victim Was Stranger & 50,037 & 38.46\textbackslash{}\%\\
\hline
Robbery & Victim Was Acquaintance & 10,347 & 7.95\textbackslash{}\%\\
\hline
Robbery & Victim Was Otherwise Known & 4,792 & 3.68\textbackslash{}\%\\
\hline
Robbery & Victim Was Boyfriend/Girlfriend & 3,181 & 2.44\textbackslash{}\%\\
\hline
Robbery & All Other & 7,301 & 5.63\textbackslash{}\%\\
\hline
Robbery & Total & 130,116 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Victim Was Acquaintance & 16,257 & 20.60\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Victim Was Otherwise Known & 9,645 & 12.22\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Relationship Unknown & 8,513 & 10.78\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Victim Was Other Family Member & 7,823 & 9.91\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Victim Was Child & 7,366 & 9.33\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & All Other & 29,331 & 37.16\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Total & 78,935 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Child & 429 & 35.02\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Sibling & 308 & 25.14\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Other Family Member & 225 & 18.37\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Grandchild & 50 & 4.08\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Victim Was Step-Child & 47 & 3.84\textbackslash{}\%\\
\hline
Sex Offenses - Incest & All Other & 166 & 13.54\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Total & 1,225 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Victim Was Acquaintance & 16,657 & 24.07\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Relationship Unknown & 9,825 & 14.20\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Victim Was Boyfriend/Girlfriend & 7,261 & 10.49\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Victim Was Otherwise Known & 6,211 & 8.98\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Victim Was Friend & 5,540 & 8.01\textbackslash{}\%\\
\hline
Sex Offenses - Rape & All Other & 23,706 & 34.23\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 69,200 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Victim Was Acquaintance & 1,440 & 21.25\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Relationship Unknown & 834 & 12.31\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Victim Was Otherwise Known & 726 & 10.72\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Victim Was Child & 592 & 8.74\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Victim Was Other Family Member & 547 & 8.07\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & All Other & 2,636 & 38.9\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 6,775 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Victim Was Acquaintance & 3,127 & 19.49\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Relationship Unknown & 2,097 & 13.07\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Victim Was Other Family Member & 1,723 & 10.74\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Victim Was Otherwise Known & 1,627 & 10.14\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Victim Was Child & 1,157 & 7.21\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & All Other & 6,314 & 39.35\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 16,045 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Victim Was Acquaintance & 1,819 & 25.37\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Victim Was Boyfriend/Girlfriend & 1,472 & 20.53\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Victim Was Otherwise Known & 825 & 11.50\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Relationship Unknown & 778 & 10.85\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Victim Was Friend & 565 & 7.88\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & All Other & 1,712 & 23.86\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Total & 7,171 & 100\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Relationship Unknown & 25,124 & 52.19\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Victim Was Stranger & 18,462 & 38.35\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Victim Was Acquaintance & 1,420 & 2.95\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Victim Was Otherwise Known & 1,155 & 2.40\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Victim Was Parent & 380 & 0.79\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & All Other & 1,596 & 3.32\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 48,137 & 100\textbackslash{}\%\\
\hline
\end{longtable}




## Aggravated assault and homicide circumstances

In cases of aggravated assault or homicide we have some information about the motive of the offender. There can be up to two motives, what NIBRS calls circumstances, for each of these offenses. Table \@ref(tab:victimAggAssault) shows all of the possible circumstances in the data, and shows the frequency only of the first circumstance. The most common circumstance is that there was an argument, and this accounts for 42.7% of these victims. The next most common is 24% which had unknown circumstances followed by 18.7% with "other" circumstances. The next most common group is "lovers' quarrel" which the FBI relabeled as "domestic violence" beginning in 2019. This group accounts for 9.4% of victims. Assault on law enforcement officers is the next most common group at 2.8% of victims. All other groups are less common than 2% of victims. 


\begin{longtable}[t]{l|l|r|r|l}
\caption{(\#tab:victimAggAssault)The distribution of circumstances for aggravated assault and homicides, 2022.}\\
\hline
Circumstance & Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims\\
\hline
\endfirsthead
\caption[]{(\#tab:victimAggAssault)The distribution of circumstances for aggravated assault and homicides, 2022. \textit{(continued)}}\\
\hline
Circumstance & Crime Category & First Year & \textbackslash{}\# of Victims & \textbackslash{}\% of Victims\\
\hline
\endhead
Argument & Aggravated Assault/Murder & 1991 & 263,394 & 37.82\textbackslash{}\%\\
\hline
Unknown Circumstances & Aggravated Assault/Murder & 1991 & 176,578 & 25.35\textbackslash{}\%\\
\hline
Other Circumstances & Aggravated Assault/Murder & 1991 & 135,511 & 19.46\textbackslash{}\%\\
\hline
Domestic Violence (Historically Called Lovers Triangle/Quarrel) & Aggravated Assault/Murder & 1991 & 83,118 & 11.93\textbackslash{}\%\\
\hline
Assault On Law Enforcement Officer(s) & Aggravated Assault/Murder & 1991 & 19,495 & 2.80\textbackslash{}\%\\
\hline
Other Felony Involved & Aggravated Assault/Murder & 1991 & 9,213 & 1.32\textbackslash{}\%\\
\hline
Gangland & Aggravated Assault/Murder & 1991 & 2,938 & 0.42\textbackslash{}\%\\
\hline
Drug Dealing & Aggravated Assault/Murder & 1991 & 2,326 & 0.33\textbackslash{}\%\\
\hline
Juvenile Gang & Aggravated Assault/Murder & 1991 & 1,509 & 0.22\textbackslash{}\%\\
\hline
Other Negligent Killings & Negligent Manslaughter & 1991 & 1,433 & 0.21\textbackslash{}\%\\
\hline
Criminal Killed By Private Citizen & Justifiable Homicide & 1991 & 409 & 0.06\textbackslash{}\%\\
\hline
Other Negligent Weapon Handling & Negligent Manslaughter & 1991 & 270 & 0.04\textbackslash{}\%\\
\hline
Criminal Killed By Police Officer & Justifiable Homicide & 1992 & 225 & 0.03\textbackslash{}\%\\
\hline
Mercy Killing & Aggravated Assault/Murder & 1993 & 47 & 0.01\textbackslash{}\%\\
\hline
Child Playing With Weapon & Negligent Manslaughter & 1991 & 40 & 0.01\textbackslash{}\%\\
\hline
Gun-Cleaning Accident & Negligent Manslaughter & 1992 & 4 & 0.00\textbackslash{}\%\\
\hline
Hunting Accident & Negligent Manslaughter & 1991 & 3 & 0.00\textbackslash{}\%\\
\hline
Total & Aggravated Assault/Murder & - & 696,513 & 100\textbackslash{}\%\\
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

\caption{The share of victims by resident status in the reporting agency's jurisdiction, 1991-2022.}(\#fig:nibrsVictimResidentStatus)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimResidentStatusOfficer-1} 

}

\caption{The share of victims by resident status in the reporting agency's jurisdiction for law enforcement officer victims, 1991-2022.}(\#fig:nibrsVictimResidentStatusOfficer)
\end{figure}

### Age

This variable is the age of the victim when the crime occurred, regardless of when they reported the crime. Age is given as how many years old the victim is, with a few exceptions. Victims older than 98 are grouped together as "over 98 years old" while victims younger than 1 years old are broken down into "under 24 hours (neonate)", "1-6 days old", and "7-364 days old". About 1.4% of victim ages are unknown. 

Figure \@ref(fig:victimAge) shows the percent of victims at each age available. This is pretty similar to the age of offenders shown in Figure \@ref(fig:offenderAge) with a peak in the mid to late 20s with a long decline after. The most common victim age is 27 followed by 28, 29, and 30. Relative to offender ages, there are far more young victims. About 2.8% of victims, or 145k victims, in 2019 were aged 14 or younger. However, remember that this is for all victims of any crime so age trends may differ by which crime you are looking at.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/victimAge-1} 

}

\caption{The age of all victims, 2022.}(\#fig:victimAge)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimAge-1} 

}

\caption{The mean and median age of victims, 1991-2022.}(\#fig:nibrsVictimAge)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimAgeMissing-1} 

}

\caption{The percent of victim's age that is unknown, 1991-2022.}(\#fig:nibrsVictimAgeMissing)
\end{figure}

### Sex

As with the Offender and the Arrestee Segments, we know the sex of the victim. The only choices are female, male, and unknown sex. There is no option for transgender or any other identify. Since the victim can tell the police their sex, and the police can see them clearly in most cases (though this may not be true if the victim reports a crime over the phone by calling 911 but then does not stay to be interviewed) so is more reliable than in the Offender Segment which may include guesses about the offender. The most common victim sex is female at 50.8% of victims, followed closely by male at 48.4%. Only about 0.8% of victims have an unknown sex. It is interesting that female victims are so common since most criminology research finds that male victims are so common. I think this is likely due to criminologists primarily focusing on murder and index violent crimes as their measure of crime, which ignores many other crimes.^[Murder and other violent crimes are mainly men hurting/killing other men, except in domestic violence which is primarily men hurting/killing women.]  


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimSex-1} 

}

\caption{The share of victims by sex, 1991-2022.}(\#fig:nibrsVictimSex)
\end{figure}

### Race

For each victim we also know their race. The only possible races are White, Black, American Indian/Alaskan Native, Asian, and Native Hawaiian/Other Pacific Islander. These categories are mutually exclusive so people cannot be labeled as mixed race, they must be put into one of the categories. Since the police generally can talk to the victim it is possible that they ask the victim what race they are rather than just guess based on appearance. However, this may differ based on agency and the officer taking the report so may be inconsistent. 

Figure \@ref(fig:victimRace) shows the breakdown in victims by race. Most victims are White at about 67.8% of victims, followed by Black victims at 23.4%. 5.6% have an unknown race. The remaining victims are made up of 1.9% Asian victims, 0,7% American Indian/Alaskan Native victims, and 0.5% Native Hawaiian/Pacific Islander.





\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimRace-1} 

}

\caption{The share of victims by race, 1991-2022.}(\#fig:nibrsVictimRace)
\end{figure}

### Ethnicity

The final demographics variable for victims is their ethnicity, which is whether they are Hispanic or not. Ethnicity is an optional variable so agencies do not have to ever report it. This means that some agencies never report it, some always report it, and some report it only sometimes. The "sometimes report" agencies are probably the most dangerous to use since it is unclear when they report it, which could lead to biased data (such as only reporting it when the suspect is confirmed Hispanic or not, which may not be how other agencies define it). 

There’s also the question of reliability of the ethnicity data. Someone being Hispanic or not is likely just what the arrestees calls themselves or what the arresting officer perceives them to be. Both are important ways of measuring ethnicity but get at different things. Perception is more important for studies of bias, self-identification for differences among groups of people such as arrest rates by ethnicity. And the subjectivity of who is classified as Hispanic means that this measurement may differ by agency and by officer, making it imprecise.

Figure \@ref(fig:victimEthnicity) shows the breakdown in arrests by victim ethnicity for all victims in 2019. Most arrestees - 62.2% - are not Hispanic. Only 10.5% are reported to be Hispanic but a much higher percent of arrestees - 27.2% - have an unknown ethnicity. Given that over a quarter of victims do not have ethnicity data, if you would like to use this variable I recommend that you carefully examine the data to ensure that the agencies you are looking at (if you do not use all agencies in the data) have a much higher reporting rate. 


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{15_nibrs_victim_files/figure-latex/nibrsVictimEthnicity-1} 

}

\caption{The share of victims by ethnicity, 1991-2022.}(\#fig:nibrsVictimEthnicity)
\end{figure}
