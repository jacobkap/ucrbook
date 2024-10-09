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
Assault Offenses - Simple Assault & 1991 & 728,805 & 21.64\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & 1991 & 698,760 & 20.75\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 1991 & 349,672 & 10.38\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 1991 & 264,141 & 7.84\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & 1991 & 154,922 & 4.60\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 1991 & 142,759 & 4.24\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & 1991 & 138,286 & 4.11\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 1991 & 133,395 & 3.96\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 1991 & 107,256 & 3.18\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 93,699 & 2.78\textbackslash{}\%\\
\hline
All Other Offenses & 1991 & 83,387 & 2.48\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 1991 & 64,989 & 1.93\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1991 & 61,858 & 1.84\textbackslash{}\%\\
\hline
Robbery & 1991 & 53,027 & 1.57\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1991 & 34,190 & 1.02\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 1991 & 27,967 & 0.83\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 1991 & 25,802 & 0.77\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 1991 & 20,803 & 0.62\textbackslash{}\%\\
\hline
Driving Under The Influence & 1991 & 16,785 & 0.50\textbackslash{}\%\\
\hline
Disorderly Conduct & 1991 & 15,554 & 0.46\textbackslash{}\%\\
\hline
Kidnapping/Abduction & 1991 & 14,768 & 0.44\textbackslash{}\%\\
\hline
Trespass of Real Property & 1991 & 13,618 & 0.40\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & 1991 & 11,780 & 0.35\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 1991 & 11,388 & 0.34\textbackslash{}\%\\
\hline
Sex Offenses - Rape & 1991 & 9,346 & 0.28\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & 1991 & 8,486 & 0.25\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & 1991 & 7,994 & 0.24\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 1991 & 7,633 & 0.23\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & 2015 & 7,523 & 0.22\textbackslash{}\%\\
\hline
Arson & 1991 & 7,097 & 0.21\textbackslash{}\%\\
\hline
Embezzlement & 1991 & 7,045 & 0.21\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1991 & 6,266 & 0.19\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 1991 & 4,749 & 0.14\textbackslash{}\%\\
\hline
Liquor Law Violations & 1991 & 4,631 & 0.14\textbackslash{}\%\\
\hline
Animal Cruelty & 2015 & 4,554 & 0.14\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & 1991 & 4,185 & 0.12\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 1991 & 3,909 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & 1991 & 2,353 & 0.07\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 1991 & 2,089 & 0.06\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & 2013 & 1,705 & 0.05\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & 1991 & 1,586 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & 1991 & 1,577 & 0.05\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 1991 & 1,323 & 0.04\textbackslash{}\%\\
\hline
Negligent Manslaughter & 1991 & 1,006 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & 1991 & 870 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & 1991 & 654 & 0.02\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & 1991 & 652 & 0.02\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & 1991 & 570 & 0.02\textbackslash{}\%\\
\hline
Extortion/Blackmail & 1991 & 460 & 0.01\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 2013 & 453 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & 1991 & 364 & 0.01\textbackslash{}\%\\
\hline
Bribery & 1991 & 269 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Incest & 1991 & 228 & 0.01\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & 1991 & 226 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & 2015 & 175 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & 1991 & 133 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 2014 & 78 & 0.00\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & 2021 & 67 & 0.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & 2021 & 58 & 0.00\textbackslash{}\%\\
\hline
Runaway & 1991 & 38 & 0.00\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & 2020 & 33 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & 2019 & 21 & 0.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & 2022 & 1 & 0.00\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & 2023 & 1 & 0.00\textbackslash{}\%\\
\hline
Total & - & 3,368,019 & 100\textbackslash{}\%\\
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
All Other Offenses & 1991 & 1,581,018 & 57.33\textbackslash{}\%\\
\hline
Driving Under The Influence & 1991 & 630,034 & 22.85\textbackslash{}\%\\
\hline
Trespass of Real Property & 1991 & 210,758 & 7.64\textbackslash{}\%\\
\hline
Disorderly Conduct & 1991 & 199,858 & 7.25\textbackslash{}\%\\
\hline
Liquor Law Violations & 1991 & 77,463 & 2.81\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & 1991 & 34,581 & 1.25\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & 1991 & 19,959 & 0.72\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & 2021 & 2,132 & 0.08\textbackslash{}\%\\
\hline
Runaway & 1991 & 1,769 & 0.06\textbackslash{}\%\\
\hline
Perjury & 2022 & 6 & 0.00\textbackslash{}\%\\
\hline
Federal Resource Violations & 2021 & 3 & 0.00\textbackslash{}\%\\
\hline
Total & - & 2,757,581 & 100\textbackslash{}\%\\
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

\caption{The share of murder and nonnegligent manslaughter arrestees by weapon carried at arrest, 1991-2023.}(\#fig:nibrsArresteeMurderWeapon)
\end{figure}



\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:arresteeoffenseWeapon)The number and percent of arrestees by offense and weapon, using the first weapon reported, 2023.}\\
\hline
Offense & Type of Arrest & \textbackslash{}\# of arrestees & \textbackslash{}\% of arrestees\\
\hline
\endfirsthead
\caption[]{(\#tab:arresteeoffenseWeapon)The number and percent of arrestees by offense and weapon, using the first weapon reported, 2023. \textit{(continued)}}\\
\hline
Offense & Type of Arrest & \textbackslash{}\# of arrestees & \textbackslash{}\% of arrestees\\
\hline
\endhead
All Other Offenses & Shotgun & 76 & 0.10\textbackslash{}\%\\
\hline
All Other Offenses & Unarmed & 72,425 & 94.04\textbackslash{}\%\\
\hline
All Other Offenses & Firearm & 565 & 0.73\textbackslash{}\%\\
\hline
All Other Offenses & Blunt Object & 250 & 0.32\textbackslash{}\%\\
\hline
All Other Offenses & Handgun & 2,066 & 2.68\textbackslash{}\%\\
\hline
All Other Offenses & Other Firearm & 140 & 0.18\textbackslash{}\%\\
\hline
All Other Offenses & Rifle & 136 & 0.18\textbackslash{}\%\\
\hline
All Other Offenses & Lethal Cutting Instrument & 1,357 & 1.76\textbackslash{}\%\\
\hline
All Other Offenses & Total & 77,015 & 100\textbackslash{}\%\\
\hline
Animal Cruelty & Blunt Object & 8 & 0.20\textbackslash{}\%\\
\hline
Animal Cruelty & Other Firearm & 6 & 0.15\textbackslash{}\%\\
\hline
Animal Cruelty & Rifle & 6 & 0.15\textbackslash{}\%\\
\hline
Animal Cruelty & Shotgun & 4 & 0.10\textbackslash{}\%\\
\hline
Animal Cruelty & Lethal Cutting Instrument & 34 & 0.85\textbackslash{}\%\\
\hline
Animal Cruelty & Unarmed & 3,932 & 97.76\textbackslash{}\%\\
\hline
Animal Cruelty & Handgun & 22 & 0.55\textbackslash{}\%\\
\hline
Animal Cruelty & Firearm & 10 & 0.25\textbackslash{}\%\\
\hline
Animal Cruelty & Total & 4,022 & 100\textbackslash{}\%\\
\hline
Arson & Unarmed & 6,455 & 97.13\textbackslash{}\%\\
\hline
Arson & Rifle & 4 & 0.06\textbackslash{}\%\\
\hline
Arson & Handgun & 32 & 0.48\textbackslash{}\%\\
\hline
Arson & Shotgun & 3 & 0.05\textbackslash{}\%\\
\hline
Arson & Blunt Object & 19 & 0.29\textbackslash{}\%\\
\hline
Arson & Lethal Cutting Instrument & 113 & 1.70\textbackslash{}\%\\
\hline
Arson & Firearm & 10 & 0.15\textbackslash{}\%\\
\hline
Arson & Other Firearm & 10 & 0.15\textbackslash{}\%\\
\hline
Arson & Total & 6,646 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Rifle & 935 & 0.37\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Blunt Object & 9,759 & 3.84\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Shotgun & 749 & 0.29\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Firearm & 3,618 & 1.42\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Lethal Cutting Instrument & 27,473 & 10.81\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Unarmed & 194,701 & 76.60\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Handgun & 15,307 & 6.02\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other Firearm & 1,641 & 0.65\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 254,183 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Unarmed & 96,990 & 92.23\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Blunt Object & 684 & 0.65\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Firearm & 615 & 0.58\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Other Firearm & 573 & 0.54\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Lethal Cutting Instrument & 3,747 & 3.56\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Handgun & 2,237 & 2.13\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Rifle & 174 & 0.17\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Shotgun & 144 & 0.14\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Total & 105,164 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Unarmed & 671,810 & 97.70\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Lethal Cutting Instrument & 5,501 & 0.80\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Handgun & 3,190 & 0.46\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Other Firearm & 3,033 & 0.44\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Shotgun & 278 & 0.04\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Blunt Object & 2,492 & 0.36\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Rifle & 193 & 0.03\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Firearm & 1,152 & 0.17\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 687,649 & 100\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Unarmed & 58 & 92.06\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Handgun & 3 & 4.76\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Lethal Cutting Instrument & 2 & 3.17\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Total & 63 & 100\textbackslash{}\%\\
\hline
Bribery & Handgun & 4 & 1.55\textbackslash{}\%\\
\hline
Bribery & Lethal Cutting Instrument & 3 & 1.16\textbackslash{}\%\\
\hline
Bribery & Unarmed & 247 & 95.74\textbackslash{}\%\\
\hline
Bribery & Firearm & 2 & 0.78\textbackslash{}\%\\
\hline
Bribery & Other Firearm & 2 & 0.78\textbackslash{}\%\\
\hline
Bribery & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Bribery & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Bribery & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Bribery & Total & 258 & 100\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Handgun & 950 & 1.19\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Rifle & 80 & 0.10\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Unarmed & 76,398 & 95.50\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Shotgun & 63 & 0.08\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Blunt Object & 346 & 0.43\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Firearm & 290 & 0.36\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Other Firearm & 203 & 0.25\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Lethal Cutting Instrument & 1,664 & 2.08\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Total & 79,994 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Unarmed & 21 & 100.00\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Blunt Object & 0 & 0\textbackslash{}\%\\
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
Commerce Violations - Federal Liquor Offenses & Total & 21 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Rifle & 1 & 100.00\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Unarmed & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Total & 1 & 100\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Firearm & 83 & 0.31\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Shotgun & 5 & 0.02\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Handgun & 333 & 1.26\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Unarmed & 25,869 & 97.73\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Other Firearm & 18 & 0.07\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Blunt Object & 17 & 0.06\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Lethal Cutting Instrument & 133 & 0.50\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Rifle & 12 & 0.05\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Total & 26,470 & 100\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Firearm & 4 & 0.34\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Other Firearm & 3 & 0.26\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Handgun & 23 & 1.96\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Blunt Object & 2 & 0.17\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Lethal Cutting Instrument & 11 & 0.94\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Unarmed & 1,131 & 96.34\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Total & 1,174 & 100\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Handgun & 677 & 0.54\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Shotgun & 67 & 0.05\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Rifle & 66 & 0.05\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Other Firearm & 275 & 0.22\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Firearm & 226 & 0.18\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Unarmed & 120,680 & 96.44\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Lethal Cutting Instrument & 1,964 & 1.57\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Blunt Object & 1,180 & 0.94\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Total & 125,135 & 100\textbackslash{}\%\\
\hline
Disorderly Conduct & Blunt Object & 54 & 0.41\textbackslash{}\%\\
\hline
Disorderly Conduct & Other Firearm & 45 & 0.34\textbackslash{}\%\\
\hline
Disorderly Conduct & Firearm & 41 & 0.31\textbackslash{}\%\\
\hline
Disorderly Conduct & Lethal Cutting Instrument & 240 & 1.82\textbackslash{}\%\\
\hline
Disorderly Conduct & Handgun & 175 & 1.33\textbackslash{}\%\\
\hline
Disorderly Conduct & Rifle & 17 & 0.13\textbackslash{}\%\\
\hline
Disorderly Conduct & Unarmed & 12,582 & 95.56\textbackslash{}\%\\
\hline
Disorderly Conduct & Shotgun & 12 & 0.09\textbackslash{}\%\\
\hline
Disorderly Conduct & Total & 13,166 & 100\textbackslash{}\%\\
\hline
Driving Under The Influence & Handgun & 948 & 5.67\textbackslash{}\%\\
\hline
Driving Under The Influence & Blunt Object & 38 & 0.23\textbackslash{}\%\\
\hline
Driving Under The Influence & Rifle & 32 & 0.19\textbackslash{}\%\\
\hline
Driving Under The Influence & Shotgun & 19 & 0.11\textbackslash{}\%\\
\hline
Driving Under The Influence & Other Firearm & 18 & 0.11\textbackslash{}\%\\
\hline
Driving Under The Influence & Firearm & 163 & 0.98\textbackslash{}\%\\
\hline
Driving Under The Influence & Lethal Cutting Instrument & 161 & 0.96\textbackslash{}\%\\
\hline
Driving Under The Influence & Unarmed & 15,335 & 91.75\textbackslash{}\%\\
\hline
Driving Under The Influence & Total & 16,714 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Firearm & 465 & 0.32\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Blunt Object & 275 & 0.19\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Lethal Cutting Instrument & 2,667 & 1.84\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Other Firearm & 189 & 0.13\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Unarmed & 139,232 & 96.05\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Shotgun & 139 & 0.10\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Rifle & 114 & 0.08\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Handgun & 1,883 & 1.30\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Total & 144,964 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Other Firearm & 872 & 0.14\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Lethal Cutting Instrument & 8,854 & 1.40\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Shotgun & 596 & 0.09\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Unarmed & 590,136 & 93.62\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Firearm & 4,181 & 0.66\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Handgun & 23,570 & 3.74\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Blunt Object & 1,074 & 0.17\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Rifle & 1,056 & 0.17\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Total & 630,339 & 100\textbackslash{}\%\\
\hline
Embezzlement & Firearm & 7 & 0.10\textbackslash{}\%\\
\hline
Embezzlement & Unarmed & 6,719 & 99.20\textbackslash{}\%\\
\hline
Embezzlement & Other Firearm & 3 & 0.04\textbackslash{}\%\\
\hline
Embezzlement & Handgun & 28 & 0.41\textbackslash{}\%\\
\hline
Embezzlement & Shotgun & 2 & 0.03\textbackslash{}\%\\
\hline
Embezzlement & Lethal Cutting Instrument & 13 & 0.19\textbackslash{}\%\\
\hline
Embezzlement & Blunt Object & 1 & 0.01\textbackslash{}\%\\
\hline
Embezzlement & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Embezzlement & Total & 6,773 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & Handgun & 7 & 1.62\textbackslash{}\%\\
\hline
Extortion/Blackmail & Lethal Cutting Instrument & 5 & 1.16\textbackslash{}\%\\
\hline
Extortion/Blackmail & Unarmed & 416 & 96.52\textbackslash{}\%\\
\hline
Extortion/Blackmail & Firearm & 2 & 0.46\textbackslash{}\%\\
\hline
Extortion/Blackmail & Other Firearm & 1 & 0.23\textbackslash{}\%\\
\hline
Extortion/Blackmail & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Extortion/Blackmail & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Extortion/Blackmail & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 431 & 100\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Lethal Cutting Instrument & 73 & 1.82\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Handgun & 63 & 1.57\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Other Firearm & 5 & 0.12\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Shotgun & 4 & 0.10\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Unarmed & 3,821 & 95.17\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Rifle & 3 & 0.07\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Firearm & 25 & 0.62\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Blunt Object & 21 & 0.52\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Total & 4,015 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Unarmed & 6,942 & 98.65\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Other Firearm & 6 & 0.09\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Blunt Object & 5 & 0.07\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Lethal Cutting Instrument & 35 & 0.50\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Handgun & 30 & 0.43\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Shotgun & 3 & 0.04\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Rifle & 2 & 0.03\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Firearm & 14 & 0.20\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Total & 7,037 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Firearm & 69 & 0.22\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Other Firearm & 34 & 0.11\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Unarmed & 31,469 & 98.11\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Handgun & 290 & 0.90\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Blunt Object & 29 & 0.09\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Shotgun & 18 & 0.06\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Lethal Cutting Instrument & 152 & 0.47\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Rifle & 13 & 0.04\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Total & 32,074 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Unarmed & 155 & 97.48\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Handgun & 1 & 0.63\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Lethal Cutting Instrument & 1 & 0.63\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Other Firearm & 1 & 0.63\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Shotgun & 1 & 0.63\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Total & 159 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Unarmed & 6,781 & 96.28\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Rifle & 3 & 0.04\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Shotgun & 3 & 0.04\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Firearm & 17 & 0.24\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Blunt Object & 11 & 0.16\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Handgun & 109 & 1.55\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Lethal Cutting Instrument & 109 & 1.55\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Other Firearm & 10 & 0.14\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Total & 7,043 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Rifle & 6 & 0.05\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Shotgun & 5 & 0.05\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Firearm & 21 & 0.19\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Blunt Object & 20 & 0.18\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Handgun & 162 & 1.48\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Other Firearm & 15 & 0.14\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Lethal Cutting Instrument & 137 & 1.25\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Unarmed & 10,612 & 96.67\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Total & 10,978 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Unarmed & 117 & 99.15\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Rifle & 1 & 0.85\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Total & 118 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Unarmed & 341 & 99.71\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Handgun & 1 & 0.29\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Total & 342 & 100\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Unarmed & 50 & 98.04\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Rifle & 1 & 1.96\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Total & 51 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Handgun & 5 & 1.67\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Unarmed & 293 & 97.99\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Rifle & 1 & 0.33\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Total & 299 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Unarmed & 202 & 100.00\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Firearm & 0 & 0\textbackslash{}\%\\
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
Gambling Offenses - Gambling Equipment Violations & Total & 202 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Unarmed & 474 & 99.37\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Firearm & 1 & 0.21\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Handgun & 1 & 0.21\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Rifle & 1 & 0.21\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Total & 477 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Unarmed & 415 & 98.34\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Handgun & 3 & 0.71\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Shotgun & 2 & 0.47\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Firearm & 1 & 0.24\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Lethal Cutting Instrument & 1 & 0.24\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 422 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Unarmed & 58 & 100.00\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 58 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Blunt Object & 57 & 0.40\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Handgun & 485 & 3.43\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Lethal Cutting Instrument & 407 & 2.88\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Rifle & 28 & 0.20\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Shotgun & 18 & 0.13\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Unarmed & 12,952 & 91.52\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Firearm & 105 & 0.74\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other Firearm & 100 & 0.71\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 14,152 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Other Firearm & 87 & 0.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Shotgun & 49 & 0.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Rifle & 48 & 0.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Firearm & 441 & 0.34\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Unarmed & 126,210 & 97.43\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Blunt Object & 104 & 0.08\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Handgun & 1,515 & 1.17\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Lethal Cutting Instrument & 1,088 & 0.84\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Total & 129,542 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Other Firearm & 5 & 0.12\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Lethal Cutting Instrument & 44 & 1.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Unarmed & 4,162 & 98.00\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Blunt Object & 4 & 0.09\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Firearm & 3 & 0.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Handgun & 27 & 0.64\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Rifle & 1 & 0.02\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Shotgun & 1 & 0.02\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Total & 4,247 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Firearm & 5 & 0.40\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Handgun & 4 & 0.32\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Blunt Object & 2 & 0.16\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Lethal Cutting Instrument & 12 & 0.97\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Unarmed & 1,219 & 98.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Other Firearm & 1 & 0.08\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Total & 1,243 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Rifle & 8 & 0.00\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Shotgun & 78 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Handgun & 745 & 0.24\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Unarmed & 304,798 & 98.69\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Firearm & 226 & 0.07\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Lethal Cutting Instrument & 2,697 & 0.87\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Blunt Object & 187 & 0.06\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Other Firearm & 117 & 0.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Total & 308,856 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Blunt Object & 9 & 0.05\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Rifle & 8 & 0.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Firearm & 22 & 0.11\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Unarmed & 19,062 & 98.50\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Other Firearm & 15 & 0.08\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Lethal Cutting Instrument & 120 & 0.62\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Handgun & 107 & 0.55\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Shotgun & 10 & 0.05\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Total & 19,353 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Lethal Cutting Instrument & 7 & 1.19\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Unarmed & 576 & 97.96\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Handgun & 3 & 0.51\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Blunt Object & 2 & 0.34\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Total & 588 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Shotgun & 7 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Handgun & 589 & 2.74\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Blunt Object & 32 & 0.15\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Lethal Cutting Instrument & 302 & 1.41\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Other Firearm & 29 & 0.14\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Rifle & 22 & 0.10\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Unarmed & 20,332 & 94.73\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Firearm & 151 & 0.70\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Total & 21,464 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Blunt Object & 6 & 0.18\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Other Firearm & 6 & 0.18\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Handgun & 46 & 1.34\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Lethal Cutting Instrument & 36 & 1.05\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Unarmed & 3,309 & 96.64\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Firearm & 20 & 0.58\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Rifle & 1 & 0.03\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Total & 3,424 & 100\textbackslash{}\%\\
\hline
Liquor Law Violations & Other Firearm & 6 & 0.17\textbackslash{}\%\\
\hline
Liquor Law Violations & Rifle & 6 & 0.17\textbackslash{}\%\\
\hline
Liquor Law Violations & Unarmed & 3,336 & 94.61\textbackslash{}\%\\
\hline
Liquor Law Violations & Lethal Cutting Instrument & 23 & 0.65\textbackslash{}\%\\
\hline
Liquor Law Violations & Shotgun & 2 & 0.06\textbackslash{}\%\\
\hline
Liquor Law Violations & Firearm & 19 & 0.54\textbackslash{}\%\\
\hline
Liquor Law Violations & Handgun & 124 & 3.52\textbackslash{}\%\\
\hline
Liquor Law Violations & Blunt Object & 10 & 0.28\textbackslash{}\%\\
\hline
Liquor Law Violations & Total & 3,526 & 100\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Other Firearm & 79 & 0.15\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Blunt Object & 78 & 0.14\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Lethal Cutting Instrument & 656 & 1.22\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Rifle & 52 & 0.10\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Unarmed & 51,599 & 95.61\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Shotgun & 33 & 0.06\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Firearm & 282 & 0.52\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Handgun & 1,191 & 2.21\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Total & 53,970 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Rifle & 80 & 1.10\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Unarmed & 5,024 & 69.18\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Lethal Cutting Instrument & 430 & 5.92\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Shotgun & 43 & 0.59\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Firearm & 368 & 5.07\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Blunt Object & 36 & 0.50\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other Firearm & 36 & 0.50\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Handgun & 1,245 & 17.14\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 7,262 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & Unarmed & 850 & 89.19\textbackslash{}\%\\
\hline
Negligent Manslaughter & Handgun & 64 & 6.72\textbackslash{}\%\\
\hline
Negligent Manslaughter & Rifle & 4 & 0.42\textbackslash{}\%\\
\hline
Negligent Manslaughter & Blunt Object & 2 & 0.21\textbackslash{}\%\\
\hline
Negligent Manslaughter & Firearm & 19 & 1.99\textbackslash{}\%\\
\hline
Negligent Manslaughter & Lethal Cutting Instrument & 12 & 1.26\textbackslash{}\%\\
\hline
Negligent Manslaughter & Other Firearm & 1 & 0.10\textbackslash{}\%\\
\hline
Negligent Manslaughter & Shotgun & 1 & 0.10\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 953 & 100\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Unarmed & 5,719 & 99.31\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Firearm & 5 & 0.09\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Handgun & 21 & 0.36\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Lethal Cutting Instrument & 11 & 0.19\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Blunt Object & 1 & 0.02\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Other Firearm & 1 & 0.02\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Rifle & 1 & 0.02\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Total & 5,759 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Lethal Cutting Instrument & 5 & 0.27\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Other Firearm & 20 & 1.08\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Blunt Object & 2 & 0.11\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Firearm & 2 & 0.11\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Handgun & 16 & 0.87\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Unarmed & 1,802 & 97.56\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Total & 1,847 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Firearm & 97 & 1.33\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Unarmed & 7,127 & 97.95\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Other Firearm & 4 & 0.05\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Blunt Object & 3 & 0.04\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Handgun & 29 & 0.40\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Lethal Cutting Instrument & 15 & 0.21\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Rifle & 1 & 0.01\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Total & 7,276 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Firearm & 5 & 0.31\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Handgun & 16 & 1.00\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Unarmed & 1,578 & 98.56\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Blunt Object & 1 & 0.06\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Lethal Cutting Instrument & 1 & 0.06\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Total & 1,601 & 100\textbackslash{}\%\\
\hline
Robbery & Firearm & 973 & 2.23\textbackslash{}\%\\
\hline
Robbery & Blunt Object & 683 & 1.56\textbackslash{}\%\\
\hline
Robbery & Shotgun & 57 & 0.13\textbackslash{}\%\\
\hline
Robbery & Other Firearm & 567 & 1.30\textbackslash{}\%\\
\hline
Robbery & Unarmed & 34,050 & 77.92\textbackslash{}\%\\
\hline
Robbery & Handgun & 3,941 & 9.02\textbackslash{}\%\\
\hline
Robbery & Lethal Cutting Instrument & 3,314 & 7.58\textbackslash{}\%\\
\hline
Robbery & Rifle & 116 & 0.27\textbackslash{}\%\\
\hline
Robbery & Total & 43,701 & 100\textbackslash{}\%\\
\hline
Runaway & Unarmed & 38 & 100.00\textbackslash{}\%\\
\hline
Runaway & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Runaway & Total & 38 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Unarmed & 21 & 100.00\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Handgun & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Lethal Cutting Instrument & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Total & 21 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Lethal Cutting Instrument & 42 & 0.36\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Blunt Object & 4 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Shotgun & 4 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Handgun & 18 & 0.15\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Firearm & 14 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Other Firearm & 13 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Unarmed & 11,570 & 99.19\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Total & 11,665 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Unarmed & 215 & 97.29\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Blunt Object & 2 & 0.90\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Lethal Cutting Instrument & 2 & 0.90\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Handgun & 1 & 0.45\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Other Firearm & 1 & 0.45\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Shotgun & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Total & 221 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Lethal Cutting Instrument & 95 & 1.03\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Handgun & 80 & 0.87\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Unarmed & 8,953 & 97.43\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Rifle & 4 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other Firearm & 23 & 0.25\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Firearm & 22 & 0.24\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Shotgun & 2 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Blunt Object & 10 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 9,189 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Unarmed & 837 & 98.01\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Lethal Cutting Instrument & 6 & 0.70\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Handgun & 5 & 0.59\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Blunt Object & 4 & 0.47\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Firearm & 1 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Shotgun & 1 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 854 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Firearm & 7 & 0.30\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Blunt Object & 3 & 0.13\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Rifle & 3 & 0.13\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Unarmed & 2,275 & 98.23\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other Firearm & 2 & 0.09\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Shotgun & 2 & 0.09\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Lethal Cutting Instrument & 14 & 0.60\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Handgun & 10 & 0.43\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 2,316 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Handgun & 7 & 0.46\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Lethal Cutting Instrument & 5 & 0.33\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Unarmed & 1,518 & 99.15\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Shotgun & 1 & 0.07\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Blunt Object & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Other Firearm & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Rifle & 0 & 0\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Total & 1,531 & 100\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Shotgun & 82 & 0.14\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Lethal Cutting Instrument & 718 & 1.25\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Firearm & 646 & 1.12\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Unarmed & 50,817 & 88.30\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Handgun & 4,749 & 8.25\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Other Firearm & 261 & 0.45\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Rifle & 163 & 0.28\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Blunt Object & 114 & 0.20\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 57,550 & 100\textbackslash{}\%\\
\hline
Trespass of Real Property & Handgun & 89 & 0.78\textbackslash{}\%\\
\hline
Trespass of Real Property & Rifle & 5 & 0.04\textbackslash{}\%\\
\hline
Trespass of Real Property & Firearm & 32 & 0.28\textbackslash{}\%\\
\hline
Trespass of Real Property & Blunt Object & 23 & 0.20\textbackslash{}\%\\
\hline
Trespass of Real Property & Lethal Cutting Instrument & 220 & 1.92\textbackslash{}\%\\
\hline
Trespass of Real Property & Other Firearm & 19 & 0.17\textbackslash{}\%\\
\hline
Trespass of Real Property & Unarmed & 11,075 & 96.61\textbackslash{}\%\\
\hline
Trespass of Real Property & Shotgun & 1 & 0.01\textbackslash{}\%\\
\hline
Trespass of Real Property & Total & 11,464 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Unarmed & 1 & 100.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Blunt Object & 0 & 0\textbackslash{}\%\\
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
Weapon Law Violations - Weapon Law Violations & Lethal Cutting Instrument & 9,950 & 7.67\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Firearm & 8,734 & 6.73\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Handgun & 53,736 & 41.43\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Unarmed & 49,346 & 38.05\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Blunt Object & 2,873 & 2.22\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Rifle & 2,102 & 1.62\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Other Firearm & 1,775 & 1.37\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Shotgun & 1,188 & 0.92\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Total & 129,704 & 100\textbackslash{}\%\\
\hline
\end{longtable}



## Automatic weapons

This variable tells you if the weapon the arrestee was carrying was a gun whether that gun was fully automatic. To be clear, this means that when you pull the trigger once the gun will fire multiple bullets. Semi-automatic firearms are not automatic firearms. The Offense Segment also has a variable indicating if the offender used an automatic weapon but there they did not necessarily recover the gun so it is much less reliable than in this segment where the police have the gun and are able to test it.^[It is not clear whether they actually test it or simply go by the design of the gun, such as if the model allows for fully automatic firing.] The percent of guns that are fully automatic are fairly similar between the weapons seized at arrest, as shown in Figure \@ref(fig:arresteeAutomaticWeapon) and those used in the offense as shown in Figure \@ref(fig:offenseAutomaticWeapon) in Chapter \@ref(offenseSegment). Figure \@ref(fig:arresteeAutomaticWeapon) shows that about 5.6% of rifles seized by police during an arrest were fully automatic. About 4.9% of handguns are automatic while "firearm (type not stated) are automatic in 4.3% of cases. Shotguns and  "other firearm" category are the least likely to be automatic at about 2.5% and 1.1% of weapons, respectively. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/arresteeAutomaticWeapon-1} 

}

\caption{The percent of firearms the arrestee was carrying that were fully automatic, for the first weapon reported, 1991-2023.}(\#fig:arresteeAutomaticWeapon)
\end{figure}

## Type of arrest

While arrests are sometimes talked about as if they are a homogeneous group (likely in big part because UCR data does not differentiate types of arrests), NIBRS data breaks them down into three different types of arrests. Figure \@ref(fig:arresteeTypeOfArrest) shows the distribution in the type of arrest for all arrestees in the 2022 NIBRS data. The most common type is "On-View" which means that the person is arrested at the scene by an officer. For example, if police respond to a bank robbery and nab the robbers as they run out of the bank, this is an on-view arrest. On-view arrests make up the majority - 50.9% - of arrests.

The next type of arrest is a "warrant/previous incident report" and this makes up 26.8% of arrests. In these cases the police had an arrest warrant and found the person and arrested them based on that warrant. This also includes when a person is arrested and found to have been involved in previous incidents. Then these previous incidents would be considered cleared from this single arrest. In these cases NIBRS has an indicator variable, called the "multiple arrestee indicator" to tell us that this individual is responsible for multiple incidents cleared so we avoid counting them twice (as their demographics will be the same each time). In this variable it says "count arrestee" if this is their only arrest or if this is the first arrest that is counted in cases where multiple incidents are cleared by the arrest, and "multiple" otherwise. 

Finally, people can get a "summoned/cited" arrest which is not really an arrest at all. This is when they are given a subpoena that says that must go to court to be tried for a crime, but they are not formally arrested and taken into police custody (i.e. they are never handcuffed, taken to a police precinct or to jail). About 22.2% of arrests are this form of arrest.



\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:arresteeoffenseArrestType)The number and percent of arrestees by offense and type of arrest, 2023.}\\
\hline
Offense & Type of Arrest & \textbackslash{}\# of arrestees & \textbackslash{}\% of arrestees\\
\hline
\endfirsthead
\caption[]{(\#tab:arresteeoffenseArrestType)The number and percent of arrestees by offense and type of arrest, 2023. \textit{(continued)}}\\
\hline
Offense & Type of Arrest & \textbackslash{}\# of arrestees & \textbackslash{}\% of arrestees\\
\hline
\endhead
All Other Offenses & On-View Arrest & 39,585 & 51.10\textbackslash{}\%\\
\hline
All Other Offenses & Taken Into Custody & 28,109 & 36.29\textbackslash{}\%\\
\hline
All Other Offenses & Summoned/Cited & 9,766 & 12.61\textbackslash{}\%\\
\hline
All Other Offenses & Total & 77,460 & 100\textbackslash{}\%\\
\hline
Animal Cruelty & Summoned/Cited & 1,928 & 47.69\textbackslash{}\%\\
\hline
Animal Cruelty & Taken Into Custody & 1,069 & 26.44\textbackslash{}\%\\
\hline
Animal Cruelty & On-View Arrest & 1,046 & 25.87\textbackslash{}\%\\
\hline
Animal Cruelty & Total & 4,043 & 100\textbackslash{}\%\\
\hline
Arson & On-View Arrest & 3,626 & 54.36\textbackslash{}\%\\
\hline
Arson & Taken Into Custody & 2,260 & 33.88\textbackslash{}\%\\
\hline
Arson & Summoned/Cited & 784 & 11.75\textbackslash{}\%\\
\hline
Arson & Total & 6,670 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & On-View Arrest & 140,381 & 55.29\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Taken Into Custody & 100,162 & 39.45\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Summoned/Cited & 13,344 & 5.26\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 253,887 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & On-View Arrest & 46,866 & 44.54\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Taken Into Custody & 44,594 & 42.38\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Summoned/Cited & 13,765 & 13.08\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Total & 105,225 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & On-View Arrest & 373,264 & 54.07\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Taken Into Custody & 218,588 & 31.67\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Summoned/Cited & 98,437 & 14.26\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 690,289 & 100\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Taken Into Custody & 38 & 61.29\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & On-View Arrest & 21 & 33.87\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Summoned/Cited & 3 & 4.84\textbackslash{}\%\\
\hline
Bond Default - Failure To Appear & Total & 62 & 100\textbackslash{}\%\\
\hline
Bribery & On-View Arrest & 150 & 57.92\textbackslash{}\%\\
\hline
Bribery & Taken Into Custody & 88 & 33.98\textbackslash{}\%\\
\hline
Bribery & Summoned/Cited & 21 & 8.11\textbackslash{}\%\\
\hline
Bribery & Total & 259 & 100\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & On-View Arrest & 41,521 & 51.59\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Taken Into Custody & 33,161 & 41.20\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Summoned/Cited & 5,797 & 7.20\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & Total & 80,479 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Taken Into Custody & 21 & 95.45\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Summoned/Cited & 1 & 4.55\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Total & 22 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Summoned/Cited & 1 & 100.00\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Total & 1 & 100\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Taken Into Custody & 13,232 & 49.85\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & On-View Arrest & 9,711 & 36.59\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Summoned/Cited & 3,600 & 13.56\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Total & 26,543 & 100\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & On-View Arrest & 704 & 58.67\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Summoned/Cited & 366 & 30.50\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Taken Into Custody & 130 & 10.83\textbackslash{}\%\\
\hline
Curfew/Loitering/Vagrancy Violations & Total & 1,200 & 100\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & On-View Arrest & 52,107 & 41.52\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Taken Into Custody & 43,341 & 34.54\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Summoned/Cited & 30,037 & 23.94\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & Total & 125,485 & 100\textbackslash{}\%\\
\hline
Disorderly Conduct & On-View Arrest & 6,696 & 50.40\textbackslash{}\%\\
\hline
Disorderly Conduct & Summoned/Cited & 3,747 & 28.20\textbackslash{}\%\\
\hline
Disorderly Conduct & Taken Into Custody & 2,842 & 21.39\textbackslash{}\%\\
\hline
Disorderly Conduct & Total & 13,285 & 100\textbackslash{}\%\\
\hline
Driving Under The Influence & On-View Arrest & 12,171 & 72.79\textbackslash{}\%\\
\hline
Driving Under The Influence & Taken Into Custody & 2,863 & 17.12\textbackslash{}\%\\
\hline
Driving Under The Influence & Summoned/Cited & 1,687 & 10.09\textbackslash{}\%\\
\hline
Driving Under The Influence & Total & 16,721 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & On-View Arrest & 65,747 & 45.06\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Summoned/Cited & 56,655 & 38.83\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Taken Into Custody & 23,494 & 16.10\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Total & 145,896 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & On-View Arrest & 363,310 & 57.36\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Taken Into Custody & 144,704 & 22.85\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Summoned/Cited & 125,372 & 19.79\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Total & 633,386 & 100\textbackslash{}\%\\
\hline
Embezzlement & Taken Into Custody & 2,513 & 36.99\textbackslash{}\%\\
\hline
Embezzlement & On-View Arrest & 2,477 & 36.46\textbackslash{}\%\\
\hline
Embezzlement & Summoned/Cited & 1,803 & 26.54\textbackslash{}\%\\
\hline
Embezzlement & Total & 6,793 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & Taken Into Custody & 254 & 58.66\textbackslash{}\%\\
\hline
Extortion/Blackmail & On-View Arrest & 125 & 28.87\textbackslash{}\%\\
\hline
Extortion/Blackmail & Summoned/Cited & 54 & 12.47\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 433 & 100\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Taken Into Custody & 1,576 & 39.17\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & On-View Arrest & 1,550 & 38.52\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Summoned/Cited & 898 & 22.32\textbackslash{}\%\\
\hline
Family Offenses, Nonviolent & Total & 4,024 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Taken Into Custody & 3,183 & 44.95\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & On-View Arrest & 2,424 & 34.23\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Summoned/Cited & 1,474 & 20.82\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & Total & 7,081 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & On-View Arrest & 11,857 & 36.85\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Summoned/Cited & 10,391 & 32.29\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Taken Into Custody & 9,932 & 30.86\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & Total & 32,180 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Taken Into Custody & 72 & 44.72\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & On-View Arrest & 54 & 33.54\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Summoned/Cited & 35 & 21.74\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & Total & 161 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & On-View Arrest & 3,985 & 56.29\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Taken Into Custody & 2,287 & 32.31\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Summoned/Cited & 807 & 11.40\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & Total & 7,079 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & On-View Arrest & 6,542 & 59.35\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Taken Into Custody & 3,074 & 27.89\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Summoned/Cited & 1,406 & 12.76\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & Total & 11,022 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Taken Into Custody & 54 & 45.38\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Summoned/Cited & 39 & 32.77\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & On-View Arrest & 26 & 21.85\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & Total & 119 & 100\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Taken Into Custody & 168 & 48.70\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & On-View Arrest & 103 & 29.86\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Summoned/Cited & 74 & 21.45\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & Total & 345 & 100\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Taken Into Custody & 46 & 90.20\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Summoned/Cited & 4 & 7.84\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & On-View Arrest & 1 & 1.96\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & Total & 51 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Summoned/Cited & 124 & 40.92\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Taken Into Custody & 107 & 35.31\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & On-View Arrest & 72 & 23.76\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & Total & 303 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Taken Into Custody & 156 & 76.85\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Summoned/Cited & 26 & 12.81\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & On-View Arrest & 21 & 10.34\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Total & 203 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Taken Into Custody & 252 & 52.17\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & On-View Arrest & 132 & 27.33\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Summoned/Cited & 99 & 20.50\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & Total & 483 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & On-View Arrest & 219 & 51.65\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Taken Into Custody & 187 & 44.10\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Summoned/Cited & 18 & 4.25\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 424 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & On-View Arrest & 34 & 55.74\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Taken Into Custody & 24 & 39.34\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Summoned/Cited & 3 & 4.92\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 61 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & On-View Arrest & 7,688 & 54.38\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Taken Into Custody & 5,754 & 40.70\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Summoned/Cited & 695 & 4.92\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 14,137 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & On-View Arrest & 46,041 & 35.34\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Taken Into Custody & 45,941 & 35.26\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Summoned/Cited & 38,293 & 29.39\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & Total & 130,275 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Taken Into Custody & 1,623 & 38.09\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Summoned/Cited & 1,500 & 35.20\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & On-View Arrest & 1,138 & 26.71\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & Total & 4,261 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Taken Into Custody & 546 & 43.82\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & On-View Arrest & 458 & 36.76\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Summoned/Cited & 242 & 19.42\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & Total & 1,246 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Summoned/Cited & 121,007 & 38.84\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & On-View Arrest & 109,556 & 35.16\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Taken Into Custody & 81,021 & 26.00\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & Total & 311,584 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Taken Into Custody & 7,361 & 37.87\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & On-View Arrest & 6,045 & 31.10\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Summoned/Cited & 6,034 & 31.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & Total & 19,440 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Taken Into Custody & 321 & 53.95\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & On-View Arrest & 177 & 29.75\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Summoned/Cited & 97 & 16.30\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & Total & 595 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & On-View Arrest & 10,745 & 49.86\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Taken Into Custody & 8,169 & 37.91\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Summoned/Cited & 2,635 & 12.23\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & Total & 21,549 & 100\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Taken Into Custody & 1,402 & 40.76\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & On-View Arrest & 1,393 & 40.49\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Summoned/Cited & 645 & 18.75\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Total & 3,440 & 100\textbackslash{}\%\\
\hline
Liquor Law Violations & Summoned/Cited & 1,888 & 52.89\textbackslash{}\%\\
\hline
Liquor Law Violations & On-View Arrest & 1,241 & 34.76\textbackslash{}\%\\
\hline
Liquor Law Violations & Taken Into Custody & 441 & 12.35\textbackslash{}\%\\
\hline
Liquor Law Violations & Total & 3,570 & 100\textbackslash{}\%\\
\hline
Motor Vehicle Theft & On-View Arrest & 30,058 & 55.46\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Taken Into Custody & 19,856 & 36.64\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Summoned/Cited & 4,280 & 7.90\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Total & 54,194 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Taken Into Custody & 4,057 & 56.16\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & On-View Arrest & 3,002 & 41.56\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Summoned/Cited & 165 & 2.28\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 7,224 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & Taken Into Custody & 495 & 52.00\textbackslash{}\%\\
\hline
Negligent Manslaughter & On-View Arrest & 382 & 40.13\textbackslash{}\%\\
\hline
Negligent Manslaughter & Summoned/Cited & 75 & 7.88\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 952 & 100\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Taken Into Custody & 2,477 & 42.85\textbackslash{}\%\\
\hline
Pornography/Obscene Material & On-View Arrest & 2,068 & 35.77\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Summoned/Cited & 1,236 & 21.38\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Total & 5,781 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & On-View Arrest & 890 & 47.77\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Taken Into Custody & 672 & 36.07\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Summoned/Cited & 301 & 16.16\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & Total & 1,863 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & On-View Arrest & 4,077 & 55.56\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Taken Into Custody & 2,023 & 27.57\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Summoned/Cited & 1,238 & 16.87\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & Total & 7,338 & 100\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & On-View Arrest & 850 & 52.73\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Summoned/Cited & 528 & 32.75\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Taken Into Custody & 234 & 14.52\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & Total & 1,612 & 100\textbackslash{}\%\\
\hline
Robbery & Taken Into Custody & 21,742 & 50.41\textbackslash{}\%\\
\hline
Robbery & On-View Arrest & 19,732 & 45.75\textbackslash{}\%\\
\hline
Robbery & Summoned/Cited & 1,656 & 3.84\textbackslash{}\%\\
\hline
Robbery & Total & 43,130 & 100\textbackslash{}\%\\
\hline
Runaway & Summoned/Cited & 21 & 55.26\textbackslash{}\%\\
\hline
Runaway & On-View Arrest & 13 & 34.21\textbackslash{}\%\\
\hline
Runaway & Taken Into Custody & 4 & 10.53\textbackslash{}\%\\
\hline
Runaway & Total & 38 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Summoned/Cited & 10 & 47.62\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Taken Into Custody & 8 & 38.10\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & On-View Arrest & 3 & 14.29\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & Total & 21 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Taken Into Custody & 5,634 & 48.25\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & On-View Arrest & 4,083 & 34.97\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Summoned/Cited & 1,959 & 16.78\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Total & 11,676 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Taken Into Custody & 112 & 50.22\textbackslash{}\%\\
\hline
Sex Offenses - Incest & On-View Arrest & 74 & 33.18\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Summoned/Cited & 37 & 16.59\textbackslash{}\%\\
\hline
Sex Offenses - Incest & Total & 223 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Taken Into Custody & 4,737 & 51.46\textbackslash{}\%\\
\hline
Sex Offenses - Rape & On-View Arrest & 3,535 & 38.40\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Summoned/Cited & 933 & 10.14\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 9,205 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Taken Into Custody & 433 & 50.64\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & On-View Arrest & 340 & 39.77\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Summoned/Cited & 82 & 9.59\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 855 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Taken Into Custody & 1,299 & 55.99\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & On-View Arrest & 763 & 32.89\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Summoned/Cited & 258 & 11.12\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 2,320 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Taken Into Custody & 723 & 47.13\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & On-View Arrest & 571 & 37.22\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Summoned/Cited & 240 & 15.65\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & Total & 1,534 & 100\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & On-View Arrest & 34,906 & 60.51\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Taken Into Custody & 17,127 & 29.69\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Summoned/Cited & 5,650 & 9.79\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 57,683 & 100\textbackslash{}\%\\
\hline
Trespass of Real Property & On-View Arrest & 5,968 & 51.60\textbackslash{}\%\\
\hline
Trespass of Real Property & Summoned/Cited & 2,944 & 25.45\textbackslash{}\%\\
\hline
Trespass of Real Property & Taken Into Custody & 2,655 & 22.95\textbackslash{}\%\\
\hline
Trespass of Real Property & Total & 11,567 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Taken Into Custody & 1 & 100.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Total & 1 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & On-View Arrest & 78,141 & 60.65\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Taken Into Custody & 36,091 & 28.01\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Summoned/Cited & 14,612 & 11.34\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Total & 128,844 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & On-View Arrest & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & On-View Arrest & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & On-View Arrest & 0 & 0\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Summoned/Cited & 0 & 0\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & Taken Into Custody & 0 & 0\textbackslash{}\%\\
\hline
\end{longtable}



## Disposition for juvenile arrestees

For juvenile arrestees - those under age 18 *at the time of the arrest* (and, by definition they would also be under age 18 during the incident) - there is some information about the outcome of the arrest.^[There are a few people older than 18 with this variable but it is so rare that I think that they are just incorrectly inputted ages.] There are two possible outcomes (which NIBRS calls "dispositions"): being referred to other (that is, other than the arresting agency) authorities or handled within the arresting agency. Figure \@ref(fig:arresteeJuvenileDisposition) shows this breakdown and being referred to other authorities is the most common outcome at 72.6% of juvenile arrests. This is a very broad category and the "other authorities" can range from juvenile or adult court (so the police recommend that they be prosecuted) to welfare agencies and being sent to other police agencies (such as if they committed a crime elsewhere and are being extradited). The other category, being handled within the department, means that the police release the juvenile without any formal action taken (but they may give the juvenile a warning). In these cases the juvenile is released to an adult (including but not limited to family members or guardians) and the case is essentially dropped. In about 0.001% of juvenile arrests the disposition is unknown.^[A juvenile can potentially get multiple dispositions, such as if they are initially released but later the police recommend them for prosecution. It is not clear which outcome is recorded in these cases. In UCR data, however, only the initial disposition is recorded so that is likely how it also is in NIBRS.] 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/arresteeJuvenileDisposition-1} 

}

\caption{For juvenile arrestees (under age 18), the distribution of case outcomes, 1991-2023.}(\#fig:arresteeJuvenileDisposition)
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

\caption{Annual resident status (i.e. if they live in the arresting jurisdiction) of arrestees, 1991-2023.}(\#fig:nibrsArresteeResidentStatus)
\end{figure}

### Age

This variable is the age at the arrest, which may be different than age during the crime. As in the Offender Segment we are given the exact age (in years) but agencies can input a range of possible ages with the FBI giving us the average of this range (rounding down, not to the nearest integer) in the data. In Figure \@ref(fig:offenderAge) in the Offense Segment, this can be seen in the sudden spikes in the percent of offenders of a certain age and that some of the most common ages are divisible by five (e.g. 20, 25, 30). There are also far fewer unknown ages in this data with only 0.1% of arrestees having a missing age. This is reasonable as a person arrested is present for the police to learn their age from something like a driver's license or past criminal records, or estimate the age by looking at the arrestee. Like in the Offender Segment, age as a specific year is cutoff at 98 with all older ages grouped simply as "over 98 years old".

Figure \@ref(fig:arresteeAge) shows the percent of arrestees at every age available. Relative to Figure \@ref(fig:offenderAge), this graph is far smoother, indicating that there was less estimating ages and more knowing the actual age. While the trend is the same for both of these graphs, the arrestee data does not have any odd spikes with certain ages. Age we see that the percent of people arrested increases as they age, peaking in the early twenties before declining and then peaking age even higher in the late 20s. After this, there is a long steady decline as the arrestee ages.     


```
#> [1] 33.68461
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

\caption{The mean and median age of arrestees, 1991-2023.}(\#fig:nibrsArresteeAge)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeAgeMissing-1} 

}

\caption{The percent of arrestee's age that is unknown, 1991-2023.}(\#fig:nibrsArresteeAgeMissing)
\end{figure}


### Sex

We also know the sex of the arrestee. The only options for this variable are male and female and there is never missing data so the police always choose one of these two choices. There is no option for transgender or any other identity. Figure \@ref(fig:arresteeSex) shows the distribution of arrestees by sex. The vast majority, 70.5% of arrestees are male and the remaining 29.5% are female. This is a higher rate of female arrestees than you might expect - past research has found that crime is largely a male-phenomenon, even greater than found here (though "crime" in most criminology research is only murder or violent index crimes) - and that is because there are differences in sex involvement by type of crime. For rape, as an example, 97.8% of arrestees in 2022 were male. Shoplifting was an even 50% split between female and male arrestees.



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeSex-1} 

}

\caption{The share of arrestees by sex, 1991-2023.}(\#fig:nibrsArresteeSex)
\end{figure}

### Race

For each arrestee we know their race, with possible races being White, Black, American Indian/Alaskan Native, Asian, and Native Hawaiian/Pacific Islander. Unlike sex, the police can say that the race is unknown.^[I have been told that measuring race at all is itself racist so should never been done, even in research. This from a group of people who also said they have no need to actually evaluate police racial bias properly (i.e. using a regression with control variables) since they already knew the answer. Luckily I am no longer a postdoc.] As each arrestee is visible to the police, and can self-report race or provide official records (e.g. criminal history or jail admission data) which may say their race, there is far less uncertainty for arrestee race than offender race where 38.5% of the data is missing. As with any measure of race there is still some degree of uncertainty since people's race are not always obvious and may not fit tidily into each of the mutually exclusive groups available in NIBRS data (e.g. there is no option for mixed race). 

Figure \@ref(fig:arresteeRace) shows the breakdown for the races of each arrestee. White arrestees are most common at 64.2% of arrestees, following by Black arrestees at 29.8%. Only 3.1% of arrestees have an unknown race. The remaining small share of arrestees is made up of American Indian/Alaskan Native at 1.6%, Asian at 1%, and Native Hawaiian/Pacific Islander at 0.3% of arrestees.



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeRace-1} 

}

\caption{The share of arrestees by race, 1991-2023.}(\#fig:nibrsArresteeRace)
\end{figure}

### Ethnicity

Finally, there is data on the race of the arrestee so we know if they are Hispanic or not. Ethnicity is so poorly used in the UCR data (e.g. UCR stopped collecting it for arrests for most years available and most agencies still do not report it) that I recommended in the [UCR book](https://ucrbook.com/) against ever using it. For NIBRS, there is far less data missing so it is not as much of a problem to use ethnicity as it is with UCR data. The issue remains as to what agencies are actually reporting this data or in which scenarios this variable is reported or not even in agencies that generally do report it. 

Ethnicity is an optional variable so agencies are never required to report it. This means that there is a greater chance that it'll be used only in non-random situations (which would make the data biased in some unknown way). There's also the question of reliability of the ethnicity data. Someone being Hispanic or not is likely just what the arrestees calls themselves or what the arresting officer perceives them to be. Both are important ways of measuring ethnicity but get at different things. Perception is more important for studies of bias, self-identification for differences among groups of people such as arrest rates by ethnicity. And the subjectivity of who is classified as Hispanic means that this measurement may differ by agency and by officer, making it imprecise.

Figure \@ref(fig:arresteeEthnicity) shows the breakdown in arrests by arrestee ethnicity. Most arrestees - 72.5% - are not Hispanic. Only 10% are reported to be Hispanic but an even higher percent of arrestees - 16.8% - have an unknown ethnicity so the true percent or Hispanic or non-Hispanic arrestee may be different than shown here. 



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{16_nibrs_arrestee_files/figure-latex/nibrsArresteeEthnicity-1} 

}

\caption{The share of arrestees by ethnicity, 1991-2023.}(\#fig:nibrsArresteeEthnicity)
\end{figure}
