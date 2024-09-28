---
always_allow_html: true
header-includes:
- \usepackage{pdflscape}
- \usepackage{booktabs}
---

# Arrestee and Group B Arrestee {#arrestee}





The Arrestee Segment has information on the person arrested in an incident and has a number of variables that look at same as in previous segments but with subtle differences. This segment covers the arrestee's age, sex, and race, ethnicity, and residency status (of the city, not as a United States citizen). Age, sex, and race are also in the Offender Segment but can differ as not all offenders are arrested. It also says the crime the arrestee was arrested for (which in some cases is different than the crime committed in the offense since an arrest can clear multiple incidents), the weapon carried during the arrest (which may be different than the weapon used during the offense) and if this weapon (if it is a firearm) was an automatic weapon. There are a few completely new variables including the date of the arrest and the type of arrest. The type of arrest is simply whether the person was arrested by police who viewed the crime, if the arrest followed an arrest warrant or a previous arrest (i.e. arrested for a different crime and then police find out you also committed this one so they consider you arrested for this one too), and whether the person was cited by police and ordered to appear in court but not formally taken into custody. Finally, for juvenile arrestees it says whether arrestees were "handled within the department" which means they were released without formal sanctions or were "referred to other authorities" such as juvenile or criminal court, a welfare agency, or probation or parole department (for those on probation or parole). 

This chapter also covers the Group B Arrestee Segment. The Arrestee Segment covers arrests for Group A offenses and there are corresponding Offense, Offender, and Victim segments for these incidents. Group B offenses, however, only have information about the arrest so incidents in this segment do not have any corresponding segments with it. Since Group B only has arrests without any associated incident, instead of the incident number variable like other segments have, this segment has an "arrest transaction incident number" which works the same as a normal incident number. Likewise, the Window Arrestee Segment is not associated with any other segments as the "window" part means that they are only partial reports. The Window Arrestee Segment has the same variables as the normal Arrestee Segment but also has 10 variables on each of the offenses committed (up to 10 offenses) during the incident. This is really to try to provide a bit of information that you would otherwise get from the other segments but do not since this is a window segment.

It also has an "arrestee sequence number" which is an identifier for an arrestee in an incident since incidents can have multiple people arrested. This is just the number of each arrestee and to my knowledge is not associated with how involved the arrestee is. Being the 1st arrestee, for example, does not mean that individual played a greater role in the crime than the 2nd arrestee.


## Crimes arrested for

This segment tells us which offense the arrestee was arrested for. There are a couple of caveats with this data. First, there can be up to 10 crimes per incident but this segment only tells you the most serious offense (based on the agency's decision of which is most serious). This can be solved partially by merging this segment with the Offense Segment and getting all of the offenses related to the incident. It is only partially solved because the crime the person is arrested for may not necessarily be the crime involved in the incident. This is because a person can be arrested for a certain crime (e.g. shoplifting) and then the police find out that there are also responsible for a more serious crime (e.g. aggravated assault). Their arrest crime is shoplifting and they will be associated with the incident for the aggravated assault.

One interesting part of this segment is that while it is associated with Group A offenses, as someone may be arrested for a crime other than the crime in the incident, arrests can include Group B offenses. So the Group B Arrestee Segment can really be thought of as an arrest for a Group B offense where the arrestee is not associated with a previous Group A incident (other than ones that already led to an arrest since that incident would then be considered clear and the present arrest would not be associated with it). We will look first at the crimes people were arrested for in the main Arrestee Segment, which includes both Group A and Group B offenses as possible arrest crimes, and then at the Group B Arrestee Segment which only includes Group B offenses.

### Arrestee Segment arrest crimes

Table \@ref(tab:arresteeCrime) shows the number and percent of arrests for all arrests associated with a Group A crime incident. Perhaps unsurprising, drug crimes are the most common arrest making up a quarter of all arrests (30% when including drug equipment crimes). Simple assault (assault without a weapon or without seriously injuring the victim) is the next most common at 19% of arrests, and aggravated assault is the 4th most common arrest crime at 6.3% of arrests. Theft, which NIBRS breaks into a number of subcategories of theft such as shoplifting and "all other larceny" is among the most common arrest crimes, making up ranks 3 and 6 of the top 6, as well as several other subcategories later on. The remaining crimes are all relatively rare, consisting of under 5% of arrests each. This is due to how the top crimes are broad categories (e.g. drug offenses ranges from simple possession to large scale sales but is all grouped into "drug/narcotic violations" here) while other crimes are specific (e.g. purse-snatching is a very specific form of theft).  


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:arresteeCrime)The number and percent of arrests for Group A crimes for all arrests reported to NIBRS in 2022.}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:arresteeCrime)The number and percent of arrests for Group A crimes for all arrests reported to NIBRS in 2022. \textit{(continued)}}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Drug/Narcotic Offenses - Drug/Narcotic Violations & 1991 & 651,593 & 22.44\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & 1991 & 625,914 & 21.55\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 1991 & 262,281 & 9.03\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 1991 & 217,608 & 7.49\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & 1991 & 142,720 & 4.91\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & 1991 & 123,203 & 4.24\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 1991 & 121,677 & 4.19\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 1991 & 113,049 & 3.89\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 1991 & 85,136 & 2.93\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 82,832 & 2.85\textbackslash{}\%\\
\hline
All Other Offenses & 1991 & 71,084 & 2.45\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 1991 & 57,907 & 1.99\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1991 & 52,882 & 1.82\textbackslash{}\%\\
\hline
Robbery & 1991 & 38,048 & 1.31\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1991 & 31,922 & 1.10\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 1991 & 23,673 & 0.82\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 1991 & 20,107 & 0.69\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 1991 & 18,030 & 0.62\textbackslash{}\%\\
\hline
Driving Under The Influence & 1991 & 16,410 & 0.57\textbackslash{}\%\\
\hline
Disorderly Conduct & 1991 & 13,700 & 0.47\textbackslash{}\%\\
\hline
Kidnapping/Abduction & 1991 & 12,869 & 0.44\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 1991 & 11,225 & 0.39\textbackslash{}\%\\
\hline
Trespass of Real Property & 1991 & 10,687 & 0.37\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & 1991 & 10,298 & 0.35\textbackslash{}\%\\
\hline
Sex Offenses - Rape & 1991 & 8,956 & 0.31\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & 1991 & 8,284 & 0.29\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 1991 & 7,281 & 0.25\textbackslash{}\%\\
\hline
Embezzlement & 1991 & 6,689 & 0.23\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & 2015 & 6,414 & 0.22\textbackslash{}\%\\
\hline
Arson & 1991 & 6,338 & 0.22\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & 1991 & 5,843 & 0.20\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 1991 & 5,621 & 0.19\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1991 & 5,187 & 0.18\textbackslash{}\%\\
\hline
Liquor Law Violations & 1991 & 4,142 & 0.14\textbackslash{}\%\\
\hline
Animal Cruelty & 2015 & 3,904 & 0.13\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & 1991 & 3,629 & 0.12\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 1991 & 3,323 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & 1991 & 2,081 & 0.07\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 1991 & 1,559 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & 1991 & 1,472 & 0.05\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & 2013 & 1,274 & 0.04\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & 1991 & 1,191 & 0.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 1991 & 959 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & 1991 & 912 & 0.03\textbackslash{}\%\\
\hline
Negligent Manslaughter & 1991 & 858 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & 1991 & 500 & 0.02\textbackslash{}\%\\
\hline
Extortion/Blackmail & 1991 & 458 & 0.02\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 2013 & 374 & 0.01\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & 1991 & 365 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & 1991 & 360 & 0.01\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & 1991 & 279 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Incest & 1991 & 207 & 0.01\textbackslash{}\%\\
\hline
Bribery & 1991 & 200 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & 2015 & 125 & 0.00\textbackslash{}\%\\
\hline
Failure To Appear & 2021 & 119 & 0.00\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & 1991 & 112 & 0.00\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & 1991 & 102 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 2014 & 80 & 0.00\textbackslash{}\%\\
\hline
Runaway & 1991 & 42 & 0.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & 2021 & 24 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & 2021 & 11 & 0.00\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & 2020 & 9 & 0.00\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & 1992 & 3 & 0.00\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & 2022 & 1 & 0.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & 2022 & 1 & 0.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
Perjury & 2022 & 1 & 0.00\textbackslash{}\%\\
\hline
Federal Resource Violations & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
Total & - & 2,904,147 & 100\textbackslash{}\%\\
\hline
\end{longtable}



### Group B Segment arrest crimes

Table \@ref(tab:GroupBarresteeCrime) shows the number and percent of arrests for all arrests associated with a Group B crime incident. The offense categories overlap with Table \@ref(tab:arresteeCrime) but these are for separate arrests, a single arrest cannot be in both segments. Unhelpfully, the most common Group B offense is "All other offenses" which means that it is a crime that is not covered in either the Group A or the Group B crime categories. However, this can also include Group A or Group B crimes if they are not completed. So an attempted or a conspiracy to commit a Group A or B crime can go in this category. At 57% of Group B arrests, this very vague category covers a huge amount of arrests. The next most common Group B arrest is driving under the influence of drugs or alcohol, and this occurred in 18.4% - or 352k times - of arrests.

Trespassing makes up 5.7% of arrests and this is unlawfully entering someone's property, including a building. The difference between this and burglary is that this is entering without any intent to commit theft or a felony. Disorderly conduct is a broad category ranging from indecent exposure (which should be its own sex offense but is not for some reason) to "profanity" and noise violations, and it makes up 6.2% of arrests. So be cautious with this offense as it ranges from very minor to quite serious and there is no distinguishing what actually happened. Drunkenness and liquor law violations make up 6% and 3.6% of arrests, respectively. The difference is that drunkenness is when someone is seriously drunk in public (to the point where they cannot control their own body) and liquor law violations are about illegal making or selling of liquor. So basically bootlegging, selling alcohol without a license (or to people not allowed to drink, like minors), or avoiding paying tax on alcohol sales. "Family Offenses, Nonviolent" is also a rather vague category and includes "nonviolent abuse" (which I guess means emotional abusive) as well as neglecting the child in a few different ways like not paying alimony and deserting the child. Since these are arrests, the actions have to reach the level of criminal behavior, simply being an awful parent (or even leaving the child, as long as they have another adult to watch them) is not this offense. Runaways is an offense that only applies to people under age 18. The remaining categories are all rare and none are more than 1% of arrests.


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:GroupBarresteeCrime)The number and percent of arrests for Group B crimes for all arrests reported to NIBRS in 2022.}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:GroupBarresteeCrime)The number and percent of arrests for Group B crimes for all arrests reported to NIBRS in 2022. \textit{(continued)}}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
All Other Offenses & 1991 & 1,470,699 & 58.45\textbackslash{}\%\\
\hline
Driving Under The Influence & 1991 & 565,429 & 22.47\textbackslash{}\%\\
\hline
Trespass of Real Property & 1991 & 177,586 & 7.06\textbackslash{}\%\\
\hline
Disorderly Conduct & 1991 & 176,937 & 7.03\textbackslash{}\%\\
\hline
Liquor Law Violations & 1991 & 72,044 & 2.86\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & 1991 & 33,545 & 1.33\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & 1991 & 16,266 & 0.65\textbackslash{}\%\\
\hline
Failure To Appear & 2021 & 1,816 & 0.07\textbackslash{}\%\\
\hline
Runaway & 1991 & 1,629 & 0.06\textbackslash{}\%\\
\hline
Federal Resource Violations & 2021 & 15 & 0.00\textbackslash{}\%\\
\hline
Perjury & 2022 & 1 & 0.00\textbackslash{}\%\\
\hline
Total & - & 2,515,967 & 100\textbackslash{}\%\\
\hline
\end{longtable}



## Arrest date

For each arrest we know the exact date of the arrest. As with the incident date, there is evidence that when agencies do not know the exact arrest date, they put down the first of the month. However, this is far less of a problem than with the incident date, likely because since the agency is doing the arresting they know exactly when they do it. Instead of looking at arrests by day of the month, we will use both the arrest date and the incident date to look at how long it takes for crimes to get solved. 

Figure \@ref(fig:arrestsDaysUntilArrest) shows how long it takes for arrests to be made. The shortest time is zero days which means the arrest and the incident happened on the same day and the longest is 461 days after the incident. About 76.5% of arrests happen on the same day as the incident while 6.6% happen on the next day. 1.4% happen the following day and 1% on the day after this. This trend of a lower probability of the case being solved as the time from the incident increases continues throughout the figure. Including dates up to 461 days is a bit ridiculous since it is impossible to see trends among the early dates other than zero days, but it is a good demonstration of how massively concentrated arrests are that occur on the same day of the incident. The lesson here is that if an arrest is not made on the day of the incident (such as at the scene of the crime), it is very unlikely that'll it'll be made at all (and most crimes never lead to an arrest). 


Figure \@ref(fig:arrestsDaysUntilArrestBarplot) groups the larger number of days together to make it easier to see trends early after the incident. Here we can see much better how the percent of arrests move quickly downwards after zero days. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/arrestsDaysUntilArrestBarplot-1} 

}

\caption{The number of days from the incident to the arrest date. Values over 10 days are grouped to better see the distribution for arrests that took fewer than 10 days. Zero days means that the arrest occurred on the same day as the incident.}(\#fig:arrestsDaysUntilArrestBarplot)
\end{figure}

## Weapons

In the Offense Segment we get information on what weapon (if any) was used during the crime. Here, we see what weapon the person arrested was carrying *when they were arrested.* There is probably a very large overlap here, especially given that the vast majority of arrests happen on the same day as the offense, so probably happen at the scene of the crime (and we will see exactly which ones do happen there later on in this chapter). Compared to the weapons covered in the Offense Segment - see Section \@ref(offenseWeapons) for more - the weapons here are only a narrow subset, and cover mostly firearms. This is partly because the most common "weapon" in the Offense Segment is that the offender used their body as a weapon (e.g. punching, kicking) and everyone arrested has a body so it does not make sense to count that as a weapon. Each arrestee can carry up to two weapons, but we will only look at the first weapon for the below graphs. Please note that this is weapons found on the arrestee, and does not mean that they used the weapon during the arrest. 

Figure \@ref(fig:arresteeWeapon) shows the breakdown in the weapon carried by the arrestee during the arrest. In 94% of arrests, the arrestee was not carrying any weapon. Since this graph shows arrests for all crimes, it makes a good deal of sense. Most crimes are non-violent so we would expect those people to not carry a weapon. Since so few arrestees have weapons, we will look at the breakdown among those who were carrying a weapon in Figure \@ref(fig:arresteeWeaponArmed). 

To see the weapons carried when the arrestee had a weapon, Figure \@ref(fig:arresteeWeaponArmed) shows the breakdown in which weapon they carried. About 43.8% of people arrested who had a weapon were carrying a handgun followed by 30% with some kind of "lethal cutting instrument" like a knife. While rifles, and especially "assault rifles", are what people (and especially politicians and the media) focus on when talking about violent crime, handguns are actually the most common gun to be used in a crime so it makes sense that handguns are the most frequently found weapon. "Firearm (type not stated)"  basically means that the type of firearm used is unknown so can belong in one of the firearm categories and makes up 9% of weapons. Blunt instruments (including bats, clubs, and brass knuckles) follow at 6.9% of weapons. And the remaining weapons included are "other firearm" (so any other than ones specified) at 5.8%, rifle at 2.3%, and shotgun at 2%. 


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeMurderWeapon-1} 

}

\caption{The share of murder and nonnegligent manslaughter arrestees by weapon carried at arrest, 1991-2022.}(\#fig:nibrsArresteeMurderWeapon)
\end{figure}



\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:arresteeoffenseWeapon)The number and percent of arrestees by offense and weapon, using the first weapon reported, 2022.}\\
\hline
Offense & Type of Arrest & \textbackslash{}\# of arrestees & \textbackslash{}\% of arrestees\\
\hline
\endfirsthead
\caption[]{(\#tab:arresteeoffenseWeapon)The number and percent of arrestees by offense and weapon, using the first weapon reported, 2022. \textit{(continued)}}\\
\hline
Offense & Type of Arrest & \textbackslash{}\# of arrestees & \textbackslash{}\% of arrestees\\
\hline
\endhead
All Other Offenses & Unarmed & 62,249 & 94.26\textbackslash{}\%\\
\hline
All Other Offenses & Shotgun & 56 & 0.08\textbackslash{}\%\\
\hline
All Other Offenses & Firearm & 427 & 0.65\textbackslash{}\%\\
\hline
All Other Offenses & Club/Blackjack/Brass Knuckles & 203 & 0.31\textbackslash{}\%\\
\hline
All Other Offenses & Other Firearm & 145 & 0.22\textbackslash{}\%\\
\hline
All Other Offenses & Rifle & 111 & 0.17\textbackslash{}\%\\
\hline
All Other Offenses & Handgun & 1,697 & 2.57\textbackslash{}\%\\
\hline
All Other Offenses & Lethal Cutting Instrument & 1,152 & 1.74\textbackslash{}\%\\
\hline
All Other Offenses & Total & 66,040 & 100\textbackslash{}\%\\
\hline
Animal Cruelty & Other Firearm & 9 & 0.25\textbackslash{}\%\\
\hline
Animal Cruelty & Rifle & 6 & 0.17\textbackslash{}\%\\
\hline
Animal Cruelty & Firearm & 5 & 0.14\textbackslash{}\%\\
\hline
Animal Cruelty & Lethal Cutting Instrument & 39 & 1.10\textbackslash{}\%\\
\hline
Animal Cruelty & Unarmed & 3,451 & 97.40\textbackslash{}\%\\
\hline
Animal Cruelty & Handgun & 21 & 0.59\textbackslash{}\%\\
\hline
Animal Cruelty & Shotgun & 2 & 0.06\textbackslash{}\%\\
\hline
Animal Cruelty & Club/Blackjack/Brass Knuckles & 10 & 0.28\textbackslash{}\%\\
\hline
Animal Cruelty & Total & 3,543 & 100\textbackslash{}\%\\
\hline
Arson & Unarmed & 5,751 & 96.97\textbackslash{}\%\\
\hline
Arson & Shotgun & 4 & 0.07\textbackslash{}\%\\
\hline
Arson & Rifle & 3 & 0.05\textbackslash{}\%\\
\hline
Arson & Handgun & 28 & 0.47\textbackslash{}\%\\
\hline
Arson & Other Firearm & 14 & 0.24\textbackslash{}\%\\
\hline
Arson & Club/Blackjack/Brass Knuckles & 13 & 0.22\textbackslash{}\%\\
\hline
Arson & Lethal Cutting Instrument & 108 & 1.82\textbackslash{}\%\\
\hline
Arson & Firearm & 10 & 0.17\textbackslash{}\%\\
\hline
Arson & Total & 5,931 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Rifle & 901 & 0.43\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Shotgun & 712 & 0.34\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Club/Blackjack/Brass Knuckles & 5,070 & 2.42\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Firearm & 3,216 & 1.54\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Lethal Cutting Instrument & 18,857 & 9.01\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Unarmed & 165,692 & 79.14\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Handgun & 13,443 & 6.42\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other Firearm & 1,478 & 0.71\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 209,369 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Unarmed & 76,746 & 92.17\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Other Firearm & 507 & 0.61\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Club/Blackjack/Brass Knuckles & 498 & 0.60\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Firearm & 463 & 0.56\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Lethal Cutting Instrument & 2,782 & 3.34\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Shotgun & 148 & 0.18\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Rifle & 146 & 0.18\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Handgun & 1,978 & 2.38\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Total & 83,268 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Firearm & 966 & 0.16\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Unarmed & 576,424 & 97.59\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Lethal Cutting Instrument & 4,764 & 0.81\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Other Firearm & 3,020 & 0.51\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Shotgun & 251 & 0.04\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Handgun & 2,851 & 0.48\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Club/Blackjack/Brass Knuckles & 2,164 & 0.37\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Rifle & 192 & 0.03\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 590,632 & 100\textbackslash{}\%\\
\hline
Bribery & Handgun & 6 & 3.09\textbackslash{}\%\\
\hline
Bribery & Unarmed & 185 & 95.36\textbackslash{}\%\\
\hline
Bribery & Firearm & 1 & 0.52\textbackslash{}\%\\
\hline
Bribery & Lethal Cutting Instrument & 1 & 0.52\textbackslash{}\%\\
\hline
Bribery & Other Firearm & 1 & 0.52\textbackslash{}\%\\
\hline
Bribery & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Bribery & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Bribery & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Bribery & Total & 194 & 100\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Handgun & 879 & 1.24\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Rifle & 83 & 0.12\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Unarmed & 67,653 & 95.39\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Shotgun & 64 & 0.09\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Club/Blackjack/Brass Knuckles & 308 & 0.43\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Firearm & 262 & 0.37\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Other Firearm & 218 & 0.31\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Lethal Cutting Instrument & 1,457 & 2.05\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Total & 70,924 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Unarmed & 7 & 100.00\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Total & 7 & 100\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Other Firearm & 7 & 0.04\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Firearm & 58 & 0.31\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Handgun & 375 & 2.00\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Club/Blackjack/Brass Knuckles & 21 & 0.11\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Unarmed & 18,123 & 96.77\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Rifle & 15 & 0.08\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Shotgun & 15 & 0.08\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Lethal Cutting Instrument & 113 & 0.60\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Total & 18,727 & 100\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Unarmed & 826 & 95.71\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Handgun & 20 & 2.32\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Firearm & 2 & 0.23\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Lethal Cutting Instrument & 12 & 1.39\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Club/Blackjack/Brass Knuckles & 1 & 0.12\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Other Firearm & 1 & 0.12\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Rifle & 1 & 0.12\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Total & 863 & 100\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Club/Blackjack/Brass Knuckles & 962 & 0.91\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Rifle & 68 & 0.06\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Handgun & 644 & 0.61\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Shotgun & 47 & 0.04\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Other Firearm & 253 & 0.24\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Firearm & 230 & 0.22\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Unarmed & 102,329 & 96.33\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Lethal Cutting Instrument & 1,700 & 1.60\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Total & 106,233 & 100\textbackslash{}\%\\
\hline
Disorderly Conduct & Firearm & 71 & 0.60\textbackslash{}\%\\
\hline
Disorderly Conduct & Club/Blackjack/Brass Knuckles & 51 & 0.43\textbackslash{}\%\\
\hline
Disorderly Conduct & Other Firearm & 33 & 0.28\textbackslash{}\%\\
\hline
Disorderly Conduct & Rifle & 21 & 0.18\textbackslash{}\%\\
\hline
Disorderly Conduct & Handgun & 199 & 1.69\textbackslash{}\%\\
\hline
Disorderly Conduct & Lethal Cutting Instrument & 196 & 1.66\textbackslash{}\%\\
\hline
Disorderly Conduct & Unarmed & 11,206 & 95.07\textbackslash{}\%\\
\hline
Disorderly Conduct & Shotgun & 10 & 0.08\textbackslash{}\%\\
\hline
Disorderly Conduct & Total & 11,787 & 100\textbackslash{}\%\\
\hline
Driving Under The Influence & Handgun & 890 & 5.45\textbackslash{}\%\\
\hline
Driving Under The Influence & Rifle & 30 & 0.18\textbackslash{}\%\\
\hline
Driving Under The Influence & Club/Blackjack/Brass Knuckles & 26 & 0.16\textbackslash{}\%\\
\hline
Driving Under The Influence & Shotgun & 21 & 0.13\textbackslash{}\%\\
\hline
Driving Under The Influence & Firearm & 187 & 1.15\textbackslash{}\%\\
\hline
Driving Under The Influence & Other Firearm & 17 & 0.10\textbackslash{}\%\\
\hline
Driving Under The Influence & Lethal Cutting Instrument & 152 & 0.93\textbackslash{}\%\\
\hline
Driving Under The Influence & Unarmed & 15,005 & 91.90\textbackslash{}\%\\
\hline
Driving Under The Influence & Total & 16,328 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Shotgun & 96 & 0.07\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Firearm & 447 & 0.34\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Club/Blackjack/Brass Knuckles & 238 & 0.18\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Other Firearm & 201 & 0.15\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Lethal Cutting Instrument & 2,249 & 1.69\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Unarmed & 128,051 & 96.10\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Rifle & 107 & 0.08\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Handgun & 1,862 & 1.40\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Total & 133,251 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Club/Blackjack/Brass Knuckles & 837 & 0.14\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Other Firearm & 801 & 0.14\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Lethal Cutting Instrument & 7,328 & 1.25\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Shotgun & 582 & 0.10\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Unarmed & 546,117 & 93.30\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Firearm & 4,471 & 0.76\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Handgun & 24,040 & 4.11\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Rifle & 1,167 & 0.20\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Total & 585,343 & 100\textbackslash{}\%\\
\hline
Embezzlement & Firearm & 9 & 0.14\textbackslash{}\%\\
\hline
Embezzlement & Unarmed & 6,381 & 99.25\textbackslash{}\%\\
\hline
Embezzlement & Handgun & 24 & 0.37\textbackslash{}\%\\
\hline
Embezzlement & Other Firearm & 2 & 0.03\textbackslash{}\%\\
\hline
Embezzlement & Shotgun & 2 & 0.03\textbackslash{}\%\\
\hline
Embezzlement & Lethal Cutting Instrument & 10 & 0.16\textbackslash{}\%\\
\hline
Embezzlement & Rifle & 1 & 0.02\textbackslash{}\%\\
\hline
Embezzlement & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Embezzlement & Total & 6,429 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & Lethal Cutting Instrument & 5 & 1.18\textbackslash{}\%\\
\hline
Extortion/Blackmail & Unarmed & 408 & 96.00\textbackslash{}\%\\
\hline
Extortion/Blackmail & Handgun & 12 & 2.82\textbackslash{}\%\\
\hline
Extortion/Blackmail & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Extortion/Blackmail & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Extortion/Blackmail & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Extortion/Blackmail & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Extortion/Blackmail & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 425 & 100\textbackslash{}\%\\
\hline
Failure To Appear & Handgun & 5 & 4.39\textbackslash{}\%\\
\hline
Failure To Appear & Lethal Cutting Instrument & 2 & 1.75\textbackslash{}\%\\
\hline
Failure To Appear & Unarmed & 105 & 92.11\textbackslash{}\%\\
\hline
Failure To Appear & Club/Blackjack/Brass Knuckles & 1 & 0.88\textbackslash{}\%\\
\hline
Failure To Appear & Firearm & 1 & 0.88\textbackslash{}\%\\
\hline
Failure To Appear & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Failure To Appear & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Failure To Appear & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Failure To Appear & Total & 114 & 100\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Lethal Cutting Instrument & 58 & 1.67\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Handgun & 45 & 1.29\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Other Firearm & 4 & 0.11\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Rifle & 4 & 0.11\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Unarmed & 3,333 & 95.69\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Club/Blackjack/Brass Knuckles & 25 & 0.72\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Shotgun & 2 & 0.06\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Firearm & 12 & 0.34\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Total & 3,483 & 100\textbackslash{}\%\\
\hline
Federal Resource Violations & Unarmed & 1 & 100.00\textbackslash{}\%\\
\hline
Federal Resource Violations & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Federal Resource Violations & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Federal Resource Violations & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Federal Resource Violations & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Federal Resource Violations & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Federal Resource Violations & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Federal Resource Violations & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Federal Resource Violations & Total & 1 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Unarmed & 6,618 & 98.03\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Other Firearm & 6 & 0.09\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Handgun & 53 & 0.79\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Lethal Cutting Instrument & 46 & 0.68\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Firearm & 27 & 0.40\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Shotgun & 1 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Total & 6,751 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Other Firearm & 35 & 0.12\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Unarmed & 29,383 & 97.92\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Handgun & 278 & 0.93\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Club/Blackjack/Brass Knuckles & 23 & 0.08\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Lethal Cutting Instrument & 154 & 0.51\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Shotgun & 13 & 0.04\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Firearm & 110 & 0.37\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Rifle & 11 & 0.04\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Total & 30,007 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Unarmed & 114 & 100.00\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Total & 114 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Lethal Cutting Instrument & 94 & 1.56\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Other Firearm & 9 & 0.15\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Unarmed & 5,784 & 95.87\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Firearm & 16 & 0.27\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Club/Blackjack/Brass Knuckles & 13 & 0.22\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Handgun & 116 & 1.92\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Rifle & 1 & 0.02\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Total & 6,033 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Rifle & 9 & 0.08\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Shotgun & 4 & 0.04\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Firearm & 37 & 0.34\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Handgun & 169 & 1.56\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Lethal Cutting Instrument & 142 & 1.31\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Club/Blackjack/Brass Knuckles & 14 & 0.13\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Other Firearm & 12 & 0.11\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Unarmed & 10,412 & 96.42\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Total & 10,799 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Unarmed & 107 & 99.07\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Lethal Cutting Instrument & 1 & 0.93\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Total & 108 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Unarmed & 327 & 97.90\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Handgun & 3 & 0.90\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Lethal Cutting Instrument & 3 & 0.90\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Rifle & 1 & 0.30\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Total & 334 & 100\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Unarmed & 22 & 95.65\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Lethal Cutting Instrument & 1 & 4.35\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Total & 23 & 100\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Unarmed & 1 & 100.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Total & 1 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Handgun & 4 & 1.50\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Unarmed & 261 & 98.12\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Shotgun & 1 & 0.38\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Total & 266 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Unarmed & 70 & 98.59\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Firearm & 1 & 1.41\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Total & 71 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Handgun & 5 & 2.56\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Unarmed & 190 & 97.44\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Total & 195 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Unarmed & 2 & 66.67\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Handgun & 1 & 33.33\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Total & 3 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Unarmed & 336 & 96.28\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Firearm & 2 & 0.57\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Handgun & 10 & 2.87\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Other Firearm & 1 & 0.29\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 349 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Unarmed & 67 & 98.53\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Handgun & 1 & 1.47\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 68 & 100\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Unarmed & 1 & 100.00\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Total & 1 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Club/Blackjack/Brass Knuckles & 47 & 0.38\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Handgun & 422 & 3.41\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Lethal Cutting Instrument & 398 & 3.22\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Rifle & 37 & 0.30\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Shotgun & 23 & 0.19\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Firearm & 118 & 0.95\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Unarmed & 11,219 & 90.72\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other Firearm & 103 & 0.83\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 12,367 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Club/Blackjack/Brass Knuckles & 94 & 0.09\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Firearm & 470 & 0.43\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Rifle & 42 & 0.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Shotgun & 31 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Unarmed & 107,118 & 97.08\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Other Firearm & 100 & 0.09\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Handgun & 1,411 & 1.28\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Lethal Cutting Instrument & 1,075 & 0.97\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Total & 110,341 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Firearm & 8 & 0.26\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Lethal Cutting Instrument & 30 & 0.98\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Club/Blackjack/Brass Knuckles & 3 & 0.10\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Unarmed & 2,991 & 98.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Handgun & 16 & 0.52\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Other Firearm & 1 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Shotgun & 1 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Total & 3,050 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Unarmed & 874 & 98.42\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Lethal Cutting Instrument & 6 & 0.68\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Handgun & 5 & 0.56\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Firearm & 2 & 0.23\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Other Firearm & 1 & 0.11\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Total & 888 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Handgun & 690 & 0.30\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Shotgun & 46 & 0.02\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Unarmed & 229,751 & 98.48\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Lethal Cutting Instrument & 2,381 & 1.02\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Firearm & 158 & 0.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Club/Blackjack/Brass Knuckles & 152 & 0.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Rifle & 13 & 0.01\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Other Firearm & 117 & 0.05\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Total & 233,308 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Rifle & 9 & 0.05\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Club/Blackjack/Brass Knuckles & 5 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Shotgun & 5 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Firearm & 26 & 0.16\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Other Firearm & 18 & 0.11\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Unarmed & 16,445 & 98.36\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Lethal Cutting Instrument & 108 & 0.65\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Handgun & 104 & 0.62\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Total & 16,720 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Handgun & 6 & 1.42\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Lethal Cutting Instrument & 6 & 1.42\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Unarmed & 410 & 96.70\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Club/Blackjack/Brass Knuckles & 2 & 0.47\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Total & 424 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Handgun & 511 & 2.58\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Club/Blackjack/Brass Knuckles & 42 & 0.21\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Other Firearm & 37 & 0.19\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Lethal Cutting Instrument & 298 & 1.50\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Unarmed & 18,789 & 94.82\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Rifle & 16 & 0.08\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Shotgun & 13 & 0.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Firearm & 109 & 0.55\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Total & 19,815 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Lethal Cutting Instrument & 66 & 1.48\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Handgun & 62 & 1.39\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Unarmed & 4,309 & 96.46\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Club/Blackjack/Brass Knuckles & 4 & 0.09\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Rifle & 4 & 0.09\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Shotgun & 2 & 0.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Firearm & 19 & 0.43\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Other Firearm & 1 & 0.02\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Total & 4,467 & 100\textbackslash{}\%\\
\hline
Liquor Law Violations & Rifle & 9 & 0.29\textbackslash{}\%\\
\hline
Liquor Law Violations & Club/Blackjack/Brass Knuckles & 6 & 0.19\textbackslash{}\%\\
\hline
Liquor Law Violations & Other Firearm & 3 & 0.10\textbackslash{}\%\\
\hline
Liquor Law Violations & Unarmed & 2,973 & 94.53\textbackslash{}\%\\
\hline
Liquor Law Violations & Lethal Cutting Instrument & 19 & 0.60\textbackslash{}\%\\
\hline
Liquor Law Violations & Firearm & 18 & 0.57\textbackslash{}\%\\
\hline
Liquor Law Violations & Handgun & 116 & 3.69\textbackslash{}\%\\
\hline
Liquor Law Violations & Shotgun & 1 & 0.03\textbackslash{}\%\\
\hline
Liquor Law Violations & Total & 3,145 & 100\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Club/Blackjack/Brass Knuckles & 66 & 0.14\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Other Firearm & 65 & 0.14\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Lethal Cutting Instrument & 542 & 1.14\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Unarmed & 45,725 & 95.81\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Rifle & 38 & 0.08\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Shotgun & 34 & 0.07\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Firearm & 224 & 0.47\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Handgun & 1,031 & 2.16\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Total & 47,725 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Rifle & 74 & 1.04\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Unarmed & 5,119 & 71.98\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Shotgun & 40 & 0.56\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other Firearm & 34 & 0.48\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Lethal Cutting Instrument & 326 & 4.58\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Firearm & 321 & 4.51\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Club/Blackjack/Brass Knuckles & 32 & 0.45\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Handgun & 1,166 & 16.39\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 7,112 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & Unarmed & 742 & 90.82\textbackslash{}\%\\
\hline
Negligent Manslaughter & Rifle & 6 & 0.73\textbackslash{}\%\\
\hline
Negligent Manslaughter & Handgun & 37 & 4.53\textbackslash{}\%\\
\hline
Negligent Manslaughter & Shotgun & 3 & 0.37\textbackslash{}\%\\
\hline
Negligent Manslaughter & Other Firearm & 2 & 0.24\textbackslash{}\%\\
\hline
Negligent Manslaughter & Firearm & 15 & 1.84\textbackslash{}\%\\
\hline
Negligent Manslaughter & Lethal Cutting Instrument & 11 & 1.35\textbackslash{}\%\\
\hline
Negligent Manslaughter & Club/Blackjack/Brass Knuckles & 1 & 0.12\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 817 & 100\textbackslash{}\%\\
\hline
Perjury & Unarmed & 1 & 100.00\textbackslash{}\%\\
\hline
Perjury & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Perjury & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Perjury & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Perjury & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Perjury & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Perjury & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Perjury & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Perjury & Total & 1 & 100\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Firearm & 8 & 0.17\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Unarmed & 4,734 & 99.14\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Shotgun & 2 & 0.04\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Lethal Cutting Instrument & 15 & 0.31\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Handgun & 13 & 0.27\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Club/Blackjack/Brass Knuckles & 1 & 0.02\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Other Firearm & 1 & 0.02\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Rifle & 1 & 0.02\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Total & 4,775 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Firearm & 8 & 0.55\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Other Firearm & 5 & 0.34\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Lethal Cutting Instrument & 3 & 0.21\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Handgun & 21 & 1.44\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Unarmed & 1,424 & 97.33\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Club/Blackjack/Brass Knuckles & 1 & 0.07\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Shotgun & 1 & 0.07\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Total & 1,463 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Firearm & 50 & 0.92\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Unarmed & 5,311 & 98.24\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Shotgun & 3 & 0.06\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Handgun & 28 & 0.52\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Lethal Cutting Instrument & 13 & 0.24\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Rifle & 1 & 0.02\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Total & 5,406 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Lethal Cutting Instrument & 4 & 0.33\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Firearm & 2 & 0.16\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Handgun & 13 & 1.06\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Unarmed & 1,208 & 98.45\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Total & 1,227 & 100\textbackslash{}\%\\
\hline
Robbery & Rifle & 81 & 0.26\textbackslash{}\%\\
\hline
Robbery & Firearm & 748 & 2.37\textbackslash{}\%\\
\hline
Robbery & Shotgun & 54 & 0.17\textbackslash{}\%\\
\hline
Robbery & Club/Blackjack/Brass Knuckles & 334 & 1.06\textbackslash{}\%\\
\hline
Robbery & Other Firearm & 310 & 0.98\textbackslash{}\%\\
\hline
Robbery & Handgun & 3,060 & 9.71\textbackslash{}\%\\
\hline
Robbery & Unarmed & 25,087 & 79.59\textbackslash{}\%\\
\hline
Robbery & Lethal Cutting Instrument & 1,847 & 5.86\textbackslash{}\%\\
\hline
Robbery & Total & 31,521 & 100\textbackslash{}\%\\
\hline
Runaway & Unarmed & 38 & 97.44\textbackslash{}\%\\
\hline
Runaway & Handgun & 1 & 2.56\textbackslash{}\%\\
\hline
Runaway & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Total & 39 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Unarmed & 9 & 81.82\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Lethal Cutting Instrument & 1 & 9.09\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Other Firearm & 1 & 9.09\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Total & 11 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Club/Blackjack/Brass Knuckles & 5 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Lethal Cutting Instrument & 38 & 0.37\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Handgun & 32 & 0.31\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Other Firearm & 27 & 0.26\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Shotgun & 2 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Firearm & 11 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Unarmed & 10,075 & 98.87\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Total & 10,190 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Unarmed & 198 & 99.50\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Handgun & 1 & 0.50\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Total & 199 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Unarmed & 8,596 & 97.70\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Lethal Cutting Instrument & 72 & 0.82\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Shotgun & 6 & 0.07\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Handgun & 53 & 0.60\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other Firearm & 40 & 0.45\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Rifle & 2 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Firearm & 18 & 0.20\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Club/Blackjack/Brass Knuckles & 11 & 0.13\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 8,798 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Unarmed & 871 & 97.65\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Lethal Cutting Instrument & 7 & 0.78\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Handgun & 5 & 0.56\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other Firearm & 5 & 0.56\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Club/Blackjack/Brass Knuckles & 2 & 0.22\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Firearm & 2 & 0.22\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 892 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Firearm & 5 & 0.25\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other Firearm & 3 & 0.15\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Club/Blackjack/Brass Knuckles & 2 & 0.10\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Handgun & 17 & 0.83\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Lethal Cutting Instrument & 15 & 0.74\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Unarmed & 1,997 & 97.94\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 2,039 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Other Firearm & 5 & 0.36\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Firearm & 3 & 0.21\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Handgun & 3 & 0.21\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Lethal Cutting Instrument & 3 & 0.21\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Unarmed & 1,393 & 98.93\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Shotgun & 1 & 0.07\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Total & 1,408 & 100\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Lethal Cutting Instrument & 720 & 1.39\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Firearm & 704 & 1.36\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Shotgun & 67 & 0.13\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Unarmed & 44,912 & 86.90\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Handgun & 4,851 & 9.39\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Rifle & 175 & 0.34\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Other Firearm & 142 & 0.27\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Club/Blackjack/Brass Knuckles & 110 & 0.21\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 51,681 & 100\textbackslash{}\%\\
\hline
Trespass of Real Property & Other Firearm & 9 & 0.10\textbackslash{}\%\\
\hline
Trespass of Real Property & Unarmed & 8,902 & 96.80\textbackslash{}\%\\
\hline
Trespass of Real Property & Handgun & 71 & 0.77\textbackslash{}\%\\
\hline
Trespass of Real Property & Shotgun & 5 & 0.05\textbackslash{}\%\\
\hline
Trespass of Real Property & Firearm & 35 & 0.38\textbackslash{}\%\\
\hline
Trespass of Real Property & Club/Blackjack/Brass Knuckles & 28 & 0.30\textbackslash{}\%\\
\hline
Trespass of Real Property & Rifle & 2 & 0.02\textbackslash{}\%\\
\hline
Trespass of Real Property & Lethal Cutting Instrument & 144 & 1.57\textbackslash{}\%\\
\hline
Trespass of Real Property & Total & 9,196 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Unarmed & 1 & 100.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Club/Blackjack/Brass Knuckles & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Total & 1 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Firearm & 8,673 & 7.51\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Handgun & 50,272 & 43.53\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Lethal Cutting Instrument & 5,489 & 4.75\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Unarmed & 44,570 & 38.59\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Rifle & 1,962 & 1.70\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Club/Blackjack/Brass Knuckles & 1,931 & 1.67\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Other Firearm & 1,484 & 1.28\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Shotgun & 1,120 & 0.97\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Total & 115,501 & 100\textbackslash{}\%\\
\hline
\end{longtable}



## Automatic weapons

This variable tells you if the weapon the arrestee was carrying was a gun whether that gun was fully automatic. To be clear, this means that when you pull the trigger once the gun will fire multiple bullets. Semi-automatic firearms are not automatic firearms. The Offense Segment also has a variable indicating if the offender used an automatic weapon but there they did not necessarily recover the gun so it is much less reliable than in this segment where the police have the gun and are able to test it.^[It is not clear whether they actually test it or simply go by the design of the gun, such as if the model allows for fully automatic firing.] The percent of guns that are fully automatic are fairly similar between the weapons seized at arrest, as shown in Figure \@ref(fig:arresteeAutomaticWeapon) and those used in the offense as shown in Figure \@ref(fig:offenseAutomaticWeapon) in Chapter \@ref(offenseSegment). Figure \@ref(fig:arresteeAutomaticWeapon) shows that about 5.6% of rifles seized by police during an arrest were fully automatic. About 4.9% of handguns are automatic while "firearm (type not stated) are automatic in 4.3% of cases. Shotguns and  "other firearm" category are the least likely to be automatic at about 2.5% and 1.1% of weapons, respectively. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/arresteeAutomaticWeapon-1} 

}

\caption{The percent of firearms the arrestee was carrying that were fully automatic, for the first weapon reported, 1991-2022.}(\#fig:arresteeAutomaticWeapon)
\end{figure}

## Type of arrest

While arrests are sometimes talked about as if they are a homogeneous group (likely in big part because UCR data does not differentiate types of arrests), NIBRS data breaks them down into three different types of arrests. Figure \@ref(fig:arresteeTypeOfArrest) shows the distribution in the type of arrest for all arrestees in the 2022 NIBRS data. The most common type is "On-View" which means that the person is arrested at the scene by an officer. For example, if police respond to a bank robbery and nab the robbers as they run out of the bank, this is an on-view arrest. On-view arrests make up the majority - 50.9% - of arrests.

The next type of arrest is a "warrant/previous incident report" and this makes up 26.8% of arrests. In these cases the police had an arrest warrant and found the person and arrested them based on that warrant. This also includes when a person is arrested and found to have been involved in previous incidents. Then these previous incidents would be considered cleared from this single arrest. In these cases NIBRS has an indicator variable, called the "multiple arrestee indicator" to tell us that this individual is responsible for multiple incidents cleared so we avoid counting them twice (as their demographics will be the same each time). In this variable it says "count arrestee" if this is their only arrest or if this is the first arrest that is counted in cases where multiple incidents are cleared by the arrest, and "multiple" otherwise. 

Finally, people can get a "summoned/cited" arrest which is not really an arrest at all. This is when they are given a subpoena that says that must go to court to be tried for a crime, but they are not formally arrested and taken into police custody (i.e. they are never handcuffed, taken to a police precinct or to jail). About 22.2% of arrests are this form of arrest.



\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:arresteeoffenseArrestType)The number and percent of arrestees by offense and type of arrest, 2022.}\\
\hline
Offense & Type of Arrest & \textbackslash{}\# of arrestees & \textbackslash{}\% of arrestees\\
\hline
\endfirsthead
\caption[]{(\#tab:arresteeoffenseArrestType)The number and percent of arrestees by offense and type of arrest, 2022. \textit{(continued)}}\\
\hline
Offense & Type of Arrest & \textbackslash{}\# of arrestees & \textbackslash{}\% of arrestees\\
\hline
\endhead
All Other Offenses & On-View Arrest & 31,444 & 47.36\textbackslash{}\%\\
\hline
All Other Offenses & Taken Into Custody & 26,068 & 39.26\textbackslash{}\%\\
\hline
All Other Offenses & Summoned/Cited & 8,883 & 13.38\textbackslash{}\%\\
\hline
All Other Offenses & Total & 66,395 & 100\textbackslash{}\%\\
\hline
Animal Cruelty & Summoned/Cited & 1,727 & 48.55\textbackslash{}\%\\
\hline
Animal Cruelty & Taken Into Custody & 952 & 26.76\textbackslash{}\%\\
\hline
Animal Cruelty & On-View Arrest & 878 & 24.68\textbackslash{}\%\\
\hline
Animal Cruelty & Total & 3,557 & 100\textbackslash{}\%\\
\hline
Arson & On-View Arrest & 3,119 & 52.44\textbackslash{}\%\\
\hline
Arson & Taken Into Custody & 2,030 & 34.13\textbackslash{}\%\\
\hline
Arson & Summoned/Cited & 799 & 13.43\textbackslash{}\%\\
\hline
Arson & Total & 5,948 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & On-View Arrest & 123,764 & 59.15\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Taken Into Custody & 72,867 & 34.83\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Summoned/Cited & 12,604 & 6.02\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 209,235 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & On-View Arrest & 41,480 & 49.77\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Taken Into Custody & 29,240 & 35.09\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Summoned/Cited & 12,616 & 15.14\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Total & 83,336 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & On-View Arrest & 327,203 & 55.18\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Taken Into Custody & 175,712 & 29.63\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Summoned/Cited & 90,087 & 15.19\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 593,002 & 100\textbackslash{}\%\\
\hline
Bribery & On-View Arrest & 122 & 62.89\textbackslash{}\%\\
\hline
Bribery & Taken Into Custody & 62 & 31.96\textbackslash{}\%\\
\hline
Bribery & Summoned/Cited & 10 & 5.15\textbackslash{}\%\\
\hline
Bribery & Total & 194 & 100\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & On-View Arrest & 37,958 & 53.17\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Taken Into Custody & 27,586 & 38.64\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Summoned/Cited & 5,845 & 8.19\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Total & 71,389 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Taken Into Custody & 5 & 71.43\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & On-View Arrest & 2 & 28.57\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Total & 7 & 100\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & On-View Arrest & 9,403 & 50.02\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Taken Into Custody & 5,878 & 31.27\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Summoned/Cited & 3,518 & 18.71\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Total & 18,799 & 100\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & On-View Arrest & 448 & 50.91\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Summoned/Cited & 306 & 34.77\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Taken Into Custody & 126 & 14.32\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Total & 880 & 100\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & On-View Arrest & 46,607 & 43.77\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Taken Into Custody & 29,988 & 28.16\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Summoned/Cited & 29,895 & 28.07\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Total & 106,490 & 100\textbackslash{}\%\\
\hline
Disorderly Conduct & On-View Arrest & 6,121 & 51.51\textbackslash{}\%\\
\hline
Disorderly Conduct & Summoned/Cited & 3,431 & 28.87\textbackslash{}\%\\
\hline
Disorderly Conduct & Taken Into Custody & 2,332 & 19.62\textbackslash{}\%\\
\hline
Disorderly Conduct & Total & 11,884 & 100\textbackslash{}\%\\
\hline
Driving Under The Influence & On-View Arrest & 11,792 & 72.13\textbackslash{}\%\\
\hline
Driving Under The Influence & Taken Into Custody & 2,719 & 16.63\textbackslash{}\%\\
\hline
Driving Under The Influence & Summoned/Cited & 1,838 & 11.24\textbackslash{}\%\\
\hline
Driving Under The Influence & Total & 16,349 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & On-View Arrest & 57,268 & 42.73\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Summoned/Cited & 55,005 & 41.04\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Taken Into Custody & 21,755 & 16.23\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Total & 134,028 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & On-View Arrest & 341,625 & 58.09\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Taken Into Custody & 123,884 & 21.07\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Summoned/Cited & 122,561 & 20.84\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Total & 588,070 & 100\textbackslash{}\%\\
\hline
Embezzlement & Taken Into Custody & 2,391 & 37.10\textbackslash{}\%\\
\hline
Embezzlement & On-View Arrest & 2,239 & 34.74\textbackslash{}\%\\
\hline
Embezzlement & Summoned/Cited & 1,815 & 28.16\textbackslash{}\%\\
\hline
Embezzlement & Total & 6,445 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & Taken Into Custody & 205 & 47.90\textbackslash{}\%\\
\hline
Extortion/Blackmail & On-View Arrest & 147 & 34.35\textbackslash{}\%\\
\hline
Extortion/Blackmail & Summoned/Cited & 76 & 17.76\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 428 & 100\textbackslash{}\%\\
\hline
Failure To Appear & Taken Into Custody & 88 & 77.19\textbackslash{}\%\\
\hline
Failure To Appear & On-View Arrest & 21 & 18.42\textbackslash{}\%\\
\hline
Failure To Appear & Summoned/Cited & 5 & 4.39\textbackslash{}\%\\
\hline
Failure To Appear & Total & 114 & 100\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & On-View Arrest & 1,455 & 41.65\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Taken Into Custody & 1,340 & 38.36\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Summoned/Cited & 698 & 19.98\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Total & 3,493 & 100\textbackslash{}\%\\
\hline
Federal Resource Violations & Taken Into Custody & 1 & 100.00\textbackslash{}\%\\
\hline
Federal Resource Violations & Total & 1 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Taken Into Custody & 3,035 & 44.72\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & On-View Arrest & 2,087 & 30.75\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Summoned/Cited & 1,664 & 24.52\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Total & 6,786 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & On-View Arrest & 11,641 & 38.67\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Summoned/Cited & 9,578 & 31.82\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Taken Into Custody & 8,886 & 29.52\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Total & 30,105 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & On-View Arrest & 53 & 46.49\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Taken Into Custody & 35 & 30.70\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Summoned/Cited & 26 & 22.81\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Total & 114 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & On-View Arrest & 3,275 & 54.19\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Taken Into Custody & 1,993 & 32.97\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Summoned/Cited & 776 & 12.84\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Total & 6,044 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & On-View Arrest & 6,328 & 58.36\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Taken Into Custody & 2,954 & 27.24\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Summoned/Cited & 1,561 & 14.40\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Total & 10,843 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Taken Into Custody & 47 & 43.52\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Summoned/Cited & 33 & 30.56\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & On-View Arrest & 28 & 25.93\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Total & 108 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Taken Into Custody & 157 & 47.01\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & On-View Arrest & 94 & 28.14\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Summoned/Cited & 83 & 24.85\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Total & 334 & 100\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Taken Into Custody & 17 & 73.91\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Summoned/Cited & 5 & 21.74\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & On-View Arrest & 1 & 4.35\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Total & 23 & 100\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Taken Into Custody & 1 & 100.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Total & 1 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Summoned/Cited & 179 & 66.54\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & On-View Arrest & 63 & 23.42\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Taken Into Custody & 27 & 10.04\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Total & 269 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & On-View Arrest & 36 & 48.65\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Taken Into Custody & 20 & 27.03\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Summoned/Cited & 18 & 24.32\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Total & 74 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & On-View Arrest & 91 & 47.15\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Summoned/Cited & 63 & 32.64\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Taken Into Custody & 39 & 20.21\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Total & 193 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Taken Into Custody & 1 & 50.00\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & On-View Arrest & 1 & 50.00\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Total & 2 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & On-View Arrest & 159 & 45.69\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Taken Into Custody & 157 & 45.11\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Summoned/Cited & 32 & 9.20\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 348 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & On-View Arrest & 38 & 55.88\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Taken Into Custody & 29 & 42.65\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Summoned/Cited & 1 & 1.47\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 68 & 100\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Taken Into Custody & 1 & 100.00\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Total & 1 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & On-View Arrest & 6,796 & 54.97\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Taken Into Custody & 4,911 & 39.72\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Summoned/Cited & 656 & 5.31\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 12,363 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & On-View Arrest & 41,027 & 36.99\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Summoned/Cited & 35,189 & 31.73\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Taken Into Custody & 34,692 & 31.28\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Total & 110,908 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Summoned/Cited & 1,130 & 36.95\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & On-View Arrest & 986 & 32.24\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Taken Into Custody & 942 & 30.80\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Total & 3,058 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & On-View Arrest & 374 & 41.88\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Taken Into Custody & 278 & 31.13\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Summoned/Cited & 241 & 26.99\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Total & 893 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Summoned/Cited & 102,432 & 43.51\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & On-View Arrest & 85,986 & 36.52\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Taken Into Custody & 47,022 & 19.97\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Total & 235,440 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Summoned/Cited & 5,874 & 34.97\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Taken Into Custody & 5,842 & 34.78\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & On-View Arrest & 5,082 & 30.25\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Total & 16,798 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Taken Into Custody & 161 & 37.79\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & On-View Arrest & 157 & 36.85\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Summoned/Cited & 108 & 25.35\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Total & 426 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & On-View Arrest & 9,975 & 49.99\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Taken Into Custody & 7,241 & 36.29\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Summoned/Cited & 2,737 & 13.72\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Total & 19,953 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & On-View Arrest & 2,079 & 45.84\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Taken Into Custody & 1,701 & 37.51\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Summoned/Cited & 755 & 16.65\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Total & 4,535 & 100\textbackslash{}\%\\
\hline
Liquor Law Violations & Summoned/Cited & 1,749 & 55.07\textbackslash{}\%\\
\hline
Liquor Law Violations & On-View Arrest & 1,033 & 32.53\textbackslash{}\%\\
\hline
Liquor Law Violations & Taken Into Custody & 394 & 12.41\textbackslash{}\%\\
\hline
Liquor Law Violations & Total & 3,176 & 100\textbackslash{}\%\\
\hline
Motor Vehicle Theft & On-View Arrest & 27,160 & 56.55\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Taken Into Custody & 16,713 & 34.80\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Summoned/Cited & 4,158 & 8.66\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Total & 48,031 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Taken Into Custody & 3,969 & 55.78\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & On-View Arrest & 2,983 & 41.92\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Summoned/Cited & 164 & 2.30\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 7,116 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & On-View Arrest & 374 & 45.83\textbackslash{}\%\\
\hline
Negligent Manslaughter & Taken Into Custody & 356 & 43.63\textbackslash{}\%\\
\hline
Negligent Manslaughter & Summoned/Cited & 86 & 10.54\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 816 & 100\textbackslash{}\%\\
\hline
Perjury & Taken Into Custody & 1 & 100.00\textbackslash{}\%\\
\hline
Perjury & Total & 1 & 100\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Taken Into Custody & 2,071 & 43.30\textbackslash{}\%\\
\hline
Pornography/Obscene Material & On-View Arrest & 1,578 & 32.99\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Summoned/Cited & 1,134 & 23.71\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Total & 4,783 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & On-View Arrest & 626 & 42.33\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Taken Into Custody & 577 & 39.01\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Summoned/Cited & 276 & 18.66\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Total & 1,479 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & On-View Arrest & 2,511 & 46.29\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Summoned/Cited & 1,570 & 28.95\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Taken Into Custody & 1,343 & 24.76\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Total & 5,424 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & On-View Arrest & 587 & 47.72\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Summoned/Cited & 472 & 38.37\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Taken Into Custody & 171 & 13.90\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Total & 1,230 & 100\textbackslash{}\%\\
\hline
Robbery & On-View Arrest & 16,676 & 53.35\textbackslash{}\%\\
\hline
Robbery & Taken Into Custody & 13,015 & 41.64\textbackslash{}\%\\
\hline
Robbery & Summoned/Cited & 1,566 & 5.01\textbackslash{}\%\\
\hline
Robbery & Total & 31,257 & 100\textbackslash{}\%\\
\hline
Runaway & Summoned/Cited & 18 & 46.15\textbackslash{}\%\\
\hline
Runaway & On-View Arrest & 12 & 30.77\textbackslash{}\%\\
\hline
Runaway & Taken Into Custody & 9 & 23.08\textbackslash{}\%\\
\hline
Runaway & Total & 39 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Taken Into Custody & 8 & 72.73\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Summoned/Cited & 2 & 18.18\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & On-View Arrest & 1 & 9.09\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Total & 11 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Taken Into Custody & 4,231 & 41.47\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & On-View Arrest & 3,891 & 38.14\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Summoned/Cited & 2,080 & 20.39\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Total & 10,202 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Taken Into Custody & 106 & 53.54\textbackslash{}\%\\
\hline
Sex Offenses - Incest & On-View Arrest & 67 & 33.84\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Summoned/Cited & 25 & 12.63\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Total & 198 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Taken Into Custody & 4,422 & 50.18\textbackslash{}\%\\
\hline
Sex Offenses - Rape & On-View Arrest & 3,288 & 37.31\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Summoned/Cited & 1,102 & 12.51\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 8,812 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Taken Into Custody & 444 & 49.66\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & On-View Arrest & 355 & 39.71\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Summoned/Cited & 95 & 10.63\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 894 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Taken Into Custody & 1,024 & 50.12\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & On-View Arrest & 759 & 37.15\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Summoned/Cited & 260 & 12.73\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 2,043 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Taken Into Custody & 658 & 46.67\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & On-View Arrest & 521 & 36.95\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Summoned/Cited & 231 & 16.38\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Total & 1,410 & 100\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & On-View Arrest & 31,668 & 61.16\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Taken Into Custody & 14,589 & 28.17\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Summoned/Cited & 5,524 & 10.67\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 51,781 & 100\textbackslash{}\%\\
\hline
Trespass of Real Property & On-View Arrest & 4,695 & 50.67\textbackslash{}\%\\
\hline
Trespass of Real Property & Taken Into Custody & 2,294 & 24.76\textbackslash{}\%\\
\hline
Trespass of Real Property & Summoned/Cited & 2,276 & 24.57\textbackslash{}\%\\
\hline
Trespass of Real Property & Total & 9,265 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Taken Into Custody & 1 & 100.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Total & 1 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & On-View Arrest & 74,065 & 64.48\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Taken Into Custody & 26,882 & 23.40\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Summoned/Cited & 13,926 & 12.12\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Total & 114,873 & 100\textbackslash{}\%\\
\hline
Federal Resource Violations & On-View Arrest & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & On-View Arrest & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & On-View Arrest & 0 & 0\textbackslash{}\%\\
\hline
Perjury & On-View Arrest & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & On-View Arrest & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Summoned/Cited & 0 & 0\textbackslash{}\%\\
\hline
Federal Resource Violations & Summoned/Cited & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Summoned/Cited & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & Summoned/Cited & 0 & 0\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & Summoned/Cited & 0 & 0\textbackslash{}\%\\
\hline
Perjury & Summoned/Cited & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Summoned/Cited & 0 & 0\textbackslash{}\%\\
\hline
\end{longtable}



## Disposition for juvenile arrestees

For juvenile arrestees - those under age 18 *at the time of the arrest* (and, by definition they would also be under age 18 during the incident) - there is some information about the outcome of the arrest.^[There are a few people older than 18 with this variable but it is so rare that I think that they are just incorrectly inputted ages.] There are two possible outcomes (which NIBRS calls "dispositions"): being referred to other (that is, other than the arresting agency) authorities or handled within the arresting agency. Figure \@ref(fig:arresteeJuvenileDisposition) shows this breakdown and being referred to other authorities is the most common outcome at 72.6% of juvenile arrests. This is a very broad category and the "other authorities" can range from juvenile or adult court (so the police recommend that they be prosecuted) to welfare agencies and being sent to other police agencies (such as if they committed a crime elsewhere and are being extradited). The other category, being handled within the department, means that the police release the juvenile without any formal action taken (but they may give the juvenile a warning). In these cases the juvenile is released to an adult (including but not limited to family members or guardians) and the case is essentially dropped. In about 0.001% of juvenile arrests the disposition is unknown.^[A juvenile can potentially get multiple dispositions, such as if they are initially released but later the police recommend them for prosecution. It is not clear which outcome is recorded in these cases. In UCR data, however, only the initial disposition is recorded so that is likely how it also is in NIBRS.] 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/arresteeJuvenileDisposition-1} 

}

\caption{For juvenile arrestees (under age 18), the distribution of case outcomes, 1991-2022.}(\#fig:arresteeJuvenileDisposition)
\end{figure}

## Demographics

This segment provides several variables related to who the arrestee is. Age, race, and sex overlap with the Offender Segment but this segment also adds ethnicity and whether they live in the jurisdiction of the agency (i.e. the city the police patrols) they were arrested by.

### Residence status

The first variable we will look at is the residence status for the arrestee. This is residence in the jurisdiction that arrested them and it has nothing to do with residence status or citizenship status in the United States. People tend to commit crimes (and are the victims of crimes) very close to where they live, so this provides some evidence for that. We do not know where the arrestee lives, but know if they live in the jurisdiction or not. This is useful because some areas (e.g. Las Vegas, Washington DC, urban city centers where people commute to work) likely have a lot more people moving into those areas during the day but who live else compared to places like rural towns or suburbs. So it is helpful to be able to distinguish locals arrested with people who may be tourists or come into town just to commit the crime.^[In a ride-along I was on, a woman who lived over an hour from the city I was in was caught shoplifting clothes.] 

One thing to be cautious about is that residence status may be an imprecise measure of where someone actually lives. How it is defined may differ by agency which could affect comparability across agencies. For example, if it is defined as official residence (such as address on a driver's license) that may be incorrect for a sizable share of the population (e.g. many college students live far from where their driver's license address is).^[One another ride-along, a man from Florida was arrested for stealing from a local store (in California).] If residence status is based on asking the arrestee, they may of course lie to the police. There's also the question of how to label people who are truly transient such as homeless people who may move from city to city. The FBI defines residence as their legal permanent address though it is unclear how that is handled for people without this information and when people live permanently in a different spot than their legal address.  

Figure \@ref(fig:arresteeResidenceStatus) shows the percent of arrestees in 2022 who were residents or not (or whose status was unknown) of the jurisdiction that arrested them. Most people were arrested near where they live, with 56.9% of arrestees being residents, compared with 23.3% not being residents. However, about one-fifth of arrestees had an unknown residence status so the percents of resident and non-resident may change dramatically if we did not have any unknowns. 



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeResidentStatus-1} 

}

\caption{Annual resident status (i.e. if they live in the arresting jurisdiction) of arrestees, 1991-2022.}(\#fig:nibrsArresteeResidentStatus)
\end{figure}

### Age

This variable is the age at the arrest, which may be different than age during the crime. As in the Offender Segment we are given the exact age (in years) but agencies can input a range of possible ages with the FBI giving us the average of this range (rounding down, not to the nearest integer) in the data. In Figure \@ref(fig:offenderAge) in the Offense Segment, this can be seen in the sudden spikes in the percent of offenders of a certain age and that some of the most common ages are divisible by five (e.g. 20, 25, 30). There are also far fewer unknown ages in this data with only 0.1% of arrestees having a missing age. This is reasonable as a person arrested is present for the police to learn their age from something like a driver's license or past criminal records, or estimate the age by looking at the arrestee. Like in the Offender Segment, age as a specific year is cutoff at 98 with all older ages grouped simply as "over 98 years old".

Figure \@ref(fig:arresteeAge) shows the percent of arrestees at every age available. Relative to Figure \@ref(fig:offenderAge), this graph is far smoother, indicating that there was less estimating ages and more knowing the actual age. While the trend is the same for both of these graphs, the arrestee data does not have any odd spikes with certain ages. Age we see that the percent of people arrested increases as they age, peaking in the early twenties before declining and then peaking age even higher in the late 20s. After this, there is a long steady decline as the arrestee ages.     


```
#> [1] 33.27171
#> [1] 32
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/arresteeAge-1} 

}

\caption{The age of all arrestees reported in the 2022 NIBRS data.}(\#fig:arresteeAge)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeAge-1} 

}

\caption{The mean and median age of arrestees, 1991-2022.}(\#fig:nibrsArresteeAge)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeAgeMissing-1} 

}

\caption{The percent of arrestee's age that is unknown, 1991-2022.}(\#fig:nibrsArresteeAgeMissing)
\end{figure}


### Sex

We also know the sex of the arrestee. The only options for this variable are male and female and there is never missing data so the police always choose one of these two choices. There is no option for transgender or any other identity. Figure \@ref(fig:arresteeSex) shows the distribution of arrestees by sex. The vast majority, 70.5% of arrestees are male and the remaining 29.5% are female. This is a higher rate of female arrestees than you might expect - past research has found that crime is largely a male-phenomenon, even greater than found here (though "crime" in most criminology research is only murder or violent index crimes) - and that is because there are differences in sex involvement by type of crime. For rape, as an example, 97.8% of arrestees in 2022 were male. Shoplifting was an even 50% split between female and male arrestees.



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeSex-1} 

}

\caption{The share of arrestees by sex, 1991-2022.}(\#fig:nibrsArresteeSex)
\end{figure}

### Race

For each arrestee we know their race, with possible races being White, Black, American Indian/Alaskan Native, Asian, and Native Hawaiian/Pacific Islander. Unlike sex, the police can say that the race is unknown.^[I have been told that measuring race at all is itself racist so should never been done, even in research. This from a group of people who also said they have no need to actually evaluate police racial bias properly (i.e. using a regression with control variables) since they already knew the answer. Luckily I am no longer a postdoc.] As each arrestee is visible to the police, and can self-report race or provide official records (e.g. criminal history or jail admission data) which may say their race, there is far less uncertainty for arrestee race than offender race where 38.5% of the data is missing. As with any measure of race there is still some degree of uncertainty since people's race are not always obvious and may not fit tidily into each of the mutually exclusive groups available in NIBRS data (e.g. there is no option for mixed race). 

Figure \@ref(fig:arresteeRace) shows the breakdown for the races of each arrestee. White arrestees are most common at 64.2% of arrestees, following by Black arrestees at 29.8%. Only 3.1% of arrestees have an unknown race. The remaining small share of arrestees is made up of American Indian/Alaskan Native at 1.6%, Asian at 1%, and Native Hawaiian/Pacific Islander at 0.3% of arrestees.



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeRace-1} 

}

\caption{The share of arrestees by race, 1991-2022.}(\#fig:nibrsArresteeRace)
\end{figure}

### Ethnicity

Finally, there is data on the race of the arrestee so we know if they are Hispanic or not. Ethnicity is so poorly used in the UCR data (e.g. UCR stopped collecting it for arrests for most years available and most agencies still do not report it) that I recommended in the [UCR book](https://ucrbook.com/) against ever using it. For NIBRS, there is far less data missing so it is not as much of a problem to use ethnicity as it is with UCR data. The issue remains as to what agencies are actually reporting this data or in which scenarios this variable is reported or not even in agencies that generally do report it. 

Ethnicity is an optional variable so agencies are never required to report it. This means that there is a greater chance that it'll be used only in non-random situations (which would make the data biased in some unknown way). There's also the question of reliability of the ethnicity data. Someone being Hispanic or not is likely just what the arrestees calls themselves or what the arresting officer perceives them to be. Both are important ways of measuring ethnicity but get at different things. Perception is more important for studies of bias, self-identification for differences among groups of people such as arrest rates by ethnicity. And the subjectivity of who is classified as Hispanic means that this measurement may differ by agency and by officer, making it imprecise.

Figure \@ref(fig:arresteeEthnicity) shows the breakdown in arrests by arrestee ethnicity. Most arrestees - 72.5% - are not Hispanic. Only 10% are reported to be Hispanic but an even higher percent of arrestees - 16.8% - have an unknown ethnicity so the true percent or Hispanic or non-Hispanic arrestee may be different than shown here. 



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeEthnicity-1} 

}

\caption{The share of arrestees by ethnicity, 1991-2022.}(\#fig:nibrsArresteeEthnicity)
\end{figure}
