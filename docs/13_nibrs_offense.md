# Offense Segment {#offenseSegment}





This dataset provides information about the offense that occurred, with each incident potentially having multiple offenses. Each row is an incident-offense so incidents with multiple offenses would have multiple rows. For a subset of offenses it also provides a more detailed subcategory of offense, allowing a deeper dive into what exactly happened. For example, for animal abuse there are four subcategories of offenses: simple/gross neglect of an animal, intentional abuse or torture, animal sexual abuse (bestiality), and organized fighting of animals such as dog or cock fights. 

There is also information for what date the crime occurred on, where the crime occurred - in categories such as residence or sidewalk rather than an address - whether the offender is suspected of using drugs, alcohol, or "computer equipment" (which includes cell phones) during the crime, and which weapon was involved. In cases where the weapon was a firearm it says whether that weapon was fully automatic or not. It also provides information on if the crime was a hate crime by including a variable on the bias motivation (if any) of the offender. This is based on evidence that the crime was motivated, at least in part, by the victim's group (e.g. race, sexuality, religion, etc.). There are 34 possible bias motivations and while hate crimes could potentially be motivated by bias against multiple groups, this data only allows for a single bias motivation.

As you look through this data yourself you may be surprised that some common crimes, such as DUIs and disorderly conduct, are missing. That is because some crimes, which the FBI calls "Group B" crimes, are reported only when an arrest is made and only as part of the "Group B Arrest Report" segment. Therefore, none of these offenses will be reported in the Offense Segment. We'll discuss these Group B offenses when we discuss arrestees in Chapter \@ref(arrestee). 

## Crime category

The most important variable in the Offense Segment is figuring out exactly what offense was committed. This tells you what crimes occurred in the incident. There can be multiple crimes in a single incident so this provides information about each offense that happened. To figure out which offenses belong together, just look at the incident number, year, and the ORI. Within ORI and year, each incident number is a unique identifier for an incident. Be careful that you're using all three of these variables as the incident number may be the same in different agencies, or in the same agency in different years, but these refer to different incidents.

Each crime is mutually exclusive and crimes which are elements of another crime are not double-counted. For example, robberies are basically theft plus assault/intimidation - it is the use of force (assault) or the threat of force (intimidation) to take property (theft). A case of robbery in this data would only count as robbery, not as robbery and theft and assault/intimidation. If there are these crimes together in an incident that is because that crime *also* occurred separately. For example, if someone is robbed and after the robbery is over (i.e. they hand over their belongings) they are then punched repeatedly, that could potentially be classified as a robbery and an assault. 

Table \@ref(tab:offenseCrimeCategories) shows each possible crime in the data and how common it was in 2022. It is sorted by frequency instead of alphabetically so it is easier to see which crimes are most common. There were about 13 million crimes reported to NIBRS in 2022. The most common crime is simple assault - which is an assault that did not use a weapon and did not result in serious injury - at 14% of crimes, or about 1.7 million crimes. If you think this is odd because property crimes are more common than violent crimes, you would be right. NIBRS data is pretty specific in its crime categories so it splits up certain crimes into a number of different categories. Theft is the most common crime committed in the United States. In NIBRS it is broken into several different types of theft so you need to combine them together to actually measure theft in its entirety. Of the top 6 most common crimes, theft crimes make up ranks 3, 5, and 6 (all other larceny, theft from motor vehicle, and shoplifting), and there are other theft offenses that are less common such as "theft from building" and "theft of motor vehicle parts/accessories." 

This table also shows the first year that offense is included in the data. Most offenses have been included since NIBRS started in 1991, but these have been new offenses added, with these additions becoming more common recently. For example, the crime "Failure to register as a sex offender" was added in 2021 as was "Illegal entry into the United States." There are even offenses that were not reported at all in 2022, such as "treason," which is an offense that only federal and tribal agencies are allowed to report. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseCrimeCategories)The number and percent of crimes reported from all agencies in 2022, by crime category.}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseCrimeCategories)The number and percent of crimes reported from all agencies in 2022, by crime category. \textit{(continued)}}\\
\hline
Crime Category & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Assault Offenses - Simple Assault & 1991 & 1,935,317 & 13.83\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 1991 & 1,655,619 & 11.83\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 1991 & 1,421,624 & 10.16\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & 1991 & 1,059,452 & 7.57\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 1991 & 966,955 & 6.91\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1991 & 892,984 & 6.38\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 1991 & 858,529 & 6.13\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 683,034 & 4.88\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 1991 & 623,972 & 4.46\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 1991 & 605,159 & 4.32\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & 1991 & 486,578 & 3.48\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1991 & 368,675 & 2.63\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & 1991 & 355,241 & 2.54\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 1991 & 309,847 & 2.21\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 1991 & 265,516 & 1.90\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & 2015 & 206,577 & 1.48\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 1991 & 192,734 & 1.38\textbackslash{}\%\\
\hline
Robbery & 1991 & 179,206 & 1.28\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 1991 & 154,026 & 1.10\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 1991 & 136,314 & 0.97\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & 1991 & 86,034 & 0.61\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 1991 & 85,093 & 0.61\textbackslash{}\%\\
\hline
Sex Offenses - Rape & 1991 & 78,612 & 0.56\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1991 & 45,412 & 0.32\textbackslash{}\%\\
\hline
Kidnapping/Abduction & 1991 & 44,695 & 0.32\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & 1991 & 43,899 & 0.31\textbackslash{}\%\\
\hline
Embezzlement & 1991 & 35,162 & 0.25\textbackslash{}\%\\
\hline
Arson & 1991 & 32,325 & 0.23\textbackslash{}\%\\
\hline
Extortion/Blackmail & 1991 & 27,034 & 0.19\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 1991 & 26,529 & 0.19\textbackslash{}\%\\
\hline
Animal Cruelty & 2015 & 22,418 & 0.16\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & 1991 & 20,410 & 0.15\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & 1991 & 14,861 & 0.11\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 1991 & 12,570 & 0.09\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & 1991 & 9,184 & 0.07\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & 2015 & 9,148 & 0.07\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & 1991 & 7,984 & 0.06\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & 1991 & 7,918 & 0.06\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & 1991 & 6,116 & 0.04\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & 1991 & 4,993 & 0.04\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 1991 & 3,419 & 0.02\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & 2013 & 3,076 & 0.02\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 2013 & 2,089 & 0.01\textbackslash{}\%\\
\hline
Negligent Manslaughter & 1991 & 1,802 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Incest & 1991 & 1,147 & 0.01\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & 1991 & 1,141 & 0.01\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & 1991 & 922 & 0.01\textbackslash{}\%\\
\hline
Bribery & 1991 & 807 & 0.01\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & 1991 & 735 & 0.01\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & 1991 & 671 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 2014 & 495 & 0.00\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & 2020 & 110 & 0.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & 2021 & 109 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & 2019 & 42 & 0.00\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & 1994 & 7 & 0.00\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & 2020 & 3 & 0.00\textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & 2023 & 2 & 0.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
Commerce Violations - Federal Tobacco Offenses & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
Fraud Offenses - Money Laundering & 2022 & 1 & 0.00\textbackslash{}\%\\
\hline
Total & - & 13,994,336 & 100\textbackslash{}\%\\
\hline
\end{longtable}



Though each agency is supposed to report the same crimes - using the exact same definition of the crimes so the data is consistent - that is not always true in practice. For example, animal cruelty was first reported in 2015 (before that it was not an option so agencies could not report it) and likely most agencies in the US have had at least one animal abuse crime since then. In 2015, however, reporting was concentrated in a small number of states, meaning that not all agencies reported that offense. The concentration in certain states suggests that this low reporting is due to agencies in certain states deciding (or not being able to, such as if having older reporting systems which do not have animal cruelty as an option) not to report that offense at all. Reporting has increased as time has gone on, suggesting that over time more agencies begin reporting crimes as they are added. Therefore, I strongly suggest examining your data over time and across geographic areas to see if there are any biases before using it. 

## Offense subtype

In addition to the broader crime committed, NIBRS does allow for a "subtype" of crime variable which gives us a bit more information about what crime occurred (the variable is technically called the "type of criminal activity"). This is especially useful for certain crimes where it is not clear exactly what they are referring to from the crime category alone. For example, for drug crimes we generally differentiate possession from sale or manufacturing. NIBRS combines everything into "drug/narcotic violations (crimes for drug materials such as syringes are classified as "drug equipment violations"). So we need to use the subtype variable to figure out what type of drug crime it is. Looking at the subtype we can see if the arrest is for "distributing/selling" "operating/promoting/assisting." "possessing/concealing," "transporting/transmitting/importing," or "using/consuming." There can be up to three subtypes per offense, so an arrest for a drug crime may be related to both possessing and selling drugs. 

There are also some unexpected subtypes related to certain offenses. For example, there are a few dozen drug offenses that also have the subtype of "exploiting children." This subtype is generally for cases where a child is abused, but happens here for drug offenses that do not have any associated child abuse (or for some of them, does not have any other crime at all) offense. The reason, I believe, for this category is that these offenses occurred in public so could have been viewed by children, and were labeled as exploiting children for that reason. Or, it may simply be a data entry error. If you are studying crimes against children, pulling from this variable would likely overcount crimes so - as always - you should make sure that the data you carefully check your data for odd things like this.^[Whether children viewing a crime, even a drug crime, would count as a crime against children would, of course, depend on your definition.]

This data is only available for the below subset of crimes, and is not always present even for these crimes. In Table \@ref(tab:offenseCrimeSubcategories) we show the breakdown of subtypes for each of these offenses, based on the first subtype reported. 

* Animal Cruelty
* Assault Offenses - Aggravated Assault
* Assault Offenses - Intimidation
* Assault Offenses - Simple Assault
* Commerce Violations - Federal Liquor Offenses
* Counterfeiting/Forgery
* Drug/Narcotic Offenses - Drug Equipment Violations
* Drug/Narcotic Offenses - Drug/Narcotic Violations
* Fugitive Offenses - Harboring Escapee/Concealing From Arrest
* Gambling Offenses - Gambling Equipment Violations
* Kidnapping/Abduction
* Murder/Nonnegligent Manslaughter
* Negligent Manslaughter
* Pornography/Obscene Material
* Robbery
* Sex Offenses - Fondling (Incident Liberties/Child Molest)
* Sex Offenses - Rape
* Sex Offenses - Sexual Assault With An Object
* Sex Offenses - Sodomy
* Stolen Property Offenses (Receiving, Selling, Etc.)
* Weapon Law Violations - Explosives
* Weapon Law Violations - Violation of National Firearm Act of 1934
* Weapon Law Violations - Weapon Law Violations


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseCrimeSubcategories)The number and percent of crime subtypes by offense, 2023. This breakdown is only available for a subset of offenses. There can be up to three subtypes per offense; in this table we only use the first subtype.}\\
\hline
Crime & Crime Subcategory & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseCrimeSubcategories)The number and percent of crime subtypes by offense, 2023. This breakdown is only available for a subset of offenses. There can be up to three subtypes per offense; in this table we only use the first subtype. \textit{(continued)}}\\
\hline
Crime & Crime Subcategory & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Animal Cruelty & Simple/Gross Neglect (Unintentionally, Intentionally, Or Knowingly Failing To Provide Food, Water, Shelter, Veterinary Care, Hoarding, Etc.) & 14,316 & 63.86\textbackslash{}\%\\
\hline
Animal Cruelty & Intentional Abuse And Torture (Tormenting, Mutilating, Poisoning, Or Abandonment) & 7,470 & 33.32\textbackslash{}\%\\
\hline
Animal Cruelty & Animal Sexual Abuse (Bestiality) & 368 & 1.64\textbackslash{}\%\\
\hline
Animal Cruelty & Organized Abuse (Dog Fighting And Cock Fighting) & 264 & 1.18\textbackslash{}\%\\
\hline
Animal Cruelty & Total & 22,418 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & None/Unknown Gang Involvement (Mutually Exclusive) & 335,384 & 55.42\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & None & 264,605 & 43.72\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other Gang & 3,843 & 0.64\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Juvenile Gang Involvement & 1,327 & 0.22\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 605,159 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & None/Unknown Gang Involvement (Mutually Exclusive) & 397,389 & 63.69\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & None & 223,830 & 35.87\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Other Gang & 2,002 & 0.32\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Juvenile Gang Involvement & 751 & 0.12\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Total & 623,972 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & None/Unknown Gang Involvement (Mutually Exclusive) & 1,076,203 & 55.61\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & None & 853,121 & 44.08\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Other Gang & 3,950 & 0.20\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Juvenile Gang Involvement & 2,043 & 0.11\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 1,935,317 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Using/Consuming & 97 & 88.18\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Possessing/Concealing & 11 & 10.00\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Distributing/Selling & 2 & 1.82\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Total & 110 & 100\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Possessing/Concealing & 57,858 & 37.56\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Using/Consuming & 31,008 & 20.13\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Cultivating/Manufacturing/Publishing (I.e., Production of Any Type) & 27,638 & 17.94\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Buying/Receiving & 24,471 & 15.89\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Distributing/Selling & 6,914 & 4.49\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Operating/Promoting/Assisting & 3,860 & 2.51\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Transporting/Transmitting/Importing & 2,212 & 1.44\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Exploiting Children & 65 & 0.04\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Total & 154,026 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Possessing/Concealing & 429,627 & 88.30\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Using/Consuming & 40,911 & 8.41\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Distributing/Selling & 7,951 & 1.63\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Buying/Receiving & 4,616 & 0.95\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Transporting/Transmitting/Importing & 1,356 & 0.28\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Operating/Promoting/Assisting & 1,111 & 0.23\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Cultivating/Manufacturing/Publishing (I.e., Production of Any Type) & 983 & 0.20\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Exploiting Children & 23 & 0.00\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Total & 486,578 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Possessing/Concealing & 838,769 & 79.17\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Distributing/Selling & 96,581 & 9.12\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Using/Consuming & 90,430 & 8.54\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Buying/Receiving & 19,444 & 1.84\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Transporting/Transmitting/Importing & 6,409 & 0.60\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Cultivating/Manufacturing/Publishing (I.e., Production of Any Type) & 5,260 & 0.50\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Operating/Promoting/Assisting & 2,449 & 0.23\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Exploiting Children & 110 & 0.01\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Total & 1,059,452 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Operating/Promoting/Assisting & 425 & 46.10\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Possessing/Concealing & 419 & 45.44\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Using/Consuming & 32 & 3.47\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Buying/Receiving & 28 & 3.04\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Distributing/Selling & 9 & 0.98\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Cultivating/Manufacturing/Publishing (I.e., Production of Any Type) & 8 & 0.87\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Transporting/Transmitting/Importing & 1 & 0.11\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Total & 922 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & None/Unknown Gang Involvement (Mutually Exclusive) & 24,074 & 53.86\textbackslash{}\%\\
\hline
Kidnapping/Abduction & None & 20,397 & 45.64\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other Gang & 187 & 0.42\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Juvenile Gang Involvement & 37 & 0.08\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 44,695 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & None/Unknown Gang Involvement (Mutually Exclusive) & 8,129 & 54.70\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & None & 6,420 & 43.20\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other Gang & 246 & 1.66\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Juvenile Gang Involvement & 66 & 0.44\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 14,861 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & None/Unknown Gang Involvement (Mutually Exclusive) & 967 & 53.66\textbackslash{}\%\\
\hline
Negligent Manslaughter & None & 827 & 45.89\textbackslash{}\%\\
\hline
Negligent Manslaughter & Other Gang & 6 & 0.33\textbackslash{}\%\\
\hline
Negligent Manslaughter & Juvenile Gang Involvement & 2 & 0.11\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 1,802 & 100\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Exploiting Children & 14,059 & 30.96\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Possessing/Concealing & 12,448 & 27.41\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Distributing/Selling & 10,479 & 23.08\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Cultivating/Manufacturing/Publishing (I.e., Production of Any Type) & 3,564 & 7.85\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Transporting/Transmitting/Importing & 1,864 & 4.10\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Operating/Promoting/Assisting & 1,145 & 2.52\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Buying/Receiving & 1,029 & 2.27\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Using/Consuming & 824 & 1.81\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Total & 45,412 & 100\textbackslash{}\%\\
\hline
Robbery & None/Unknown Gang Involvement (Mutually Exclusive) & 109,362 & 61.03\textbackslash{}\%\\
\hline
Robbery & None & 68,107 & 38.00\textbackslash{}\%\\
\hline
Robbery & Other Gang & 1,093 & 0.61\textbackslash{}\%\\
\hline
Robbery & Juvenile Gang Involvement & 644 & 0.36\textbackslash{}\%\\
\hline
Robbery & Total & 179,206 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & None/Unknown Gang Involvement (Mutually Exclusive) & 44,827 & 52.10\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & None & 41,010 & 47.67\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Other Gang & 102 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Juvenile Gang Involvement & 95 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Total & 86,034 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & None/Unknown Gang Involvement (Mutually Exclusive) & 41,327 & 52.57\textbackslash{}\%\\
\hline
Sex Offenses - Rape & None & 37,050 & 47.13\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other Gang & 176 & 0.22\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Juvenile Gang Involvement & 59 & 0.08\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 78,612 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & None & 4,261 & 53.37\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & None/Unknown Gang Involvement (Mutually Exclusive) & 3,708 & 46.44\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Juvenile Gang Involvement & 9 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other Gang & 6 & 0.08\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 7,984 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & None/Unknown Gang Involvement (Mutually Exclusive) & 11,074 & 54.26\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & None & 9,285 & 45.49\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other Gang & 30 & 0.15\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Juvenile Gang Involvement & 21 & 0.10\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 20,410 & 100\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Possessing/Concealing & 107,218 & 78.66\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Buying/Receiving & 14,483 & 10.62\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Operating/Promoting/Assisting & 5,759 & 4.22\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Using/Consuming & 4,478 & 3.29\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Transporting/Transmitting/Importing & 2,313 & 1.70\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Distributing/Selling & 1,930 & 1.42\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Cultivating/Manufacturing/Publishing (I.e., Production of Any Type) & 124 & 0.09\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Exploiting Children & 9 & 0.01\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 136,314 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Possessing/Concealing & 1 & 100.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Total & 1 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Possessing/Concealing & 291,967 & 82.19\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Using/Consuming & 40,616 & 11.43\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Operating/Promoting/Assisting & 11,727 & 3.30\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Buying/Receiving & 4,204 & 1.18\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Distributing/Selling & 3,092 & 0.87\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Transporting/Transmitting/Importing & 2,672 & 0.75\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Cultivating/Manufacturing/Publishing (I.e., Production of Any Type) & 893 & 0.25\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Exploiting Children & 70 & 0.02\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Total & 355,241 & 100\textbackslash{}\%\\
\hline
\end{longtable}



## Offense completed

For each offense, this segment also tells you if the offense was completed or only attempted. Nearly all offenses reported in NIBRS are completed offenses. This is likely in part due to completed crimes being easier to detect than attempted crimes. For example, if someone breaks into your house you will likely discover that and alert the police. If someone tries to break in but fails (even something such as trying your front door to see if it is locked and then leaving because it could be considered attempted burglary) there is much less evidence so it probably does not come to the police's attention as much.

Some offenses, such as simple and aggravated assault or homicide, are only labeled as completed. This is because an attempted murder, for example, would be classified as aggravated assault. Since crimes in NIBRS are mutually exclusive, there cannot be both attempted murder and aggravated assault, so only aggravated assault is included. This does limit the data as it is important to know when an aggravated assault is done with the intent to kill the victim and when it is just to seriously harm the victim (though measuring this would likely be extremely imprecise since it requires knowing the motives of the offender).

Table \@ref(tab:offensesCompleted) shows the percent of each crime category in 2022 NIBRS data that was completed or was only attempted.


\begin{longtable}[t]{l|l|r}
\caption{(\#tab:offensesCompleted)The percent of crimes completed or attempted, by crime category.}\\
\hline
Crime Category & \textbackslash{}\% Completed & \% Attempted\\
\hline
\endfirsthead
\caption[]{(\#tab:offensesCompleted)The percent of crimes completed or attempted, by crime category. \textit{(continued)}}\\
\hline
Crime Category & \textbackslash{}\% Completed & \% Attempted\\
\hline
\endhead
Drug/Narcotic Offenses - Drug Equipment Violations & 99.81 \textbackslash{}\% & 0.19 \textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & 99.62 \textbackslash{}\% & 0.38 \textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 99.37 \textbackslash{}\% & 0.63 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 99.31 \textbackslash{}\% & 0.69 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 98.94 \textbackslash{}\% & 1.06 \textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & 98.93 \textbackslash{}\% & 1.07 \textbackslash{}\%\\
\hline
Embezzlement & 98.77 \textbackslash{}\% & 1.23 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 98.77 \textbackslash{}\% & 1.23 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 98.77 \textbackslash{}\% & 1.23 \textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 98.69 \textbackslash{}\% & 1.31 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 98.14 \textbackslash{}\% & 1.86 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 97.82 \textbackslash{}\% & 2.18 \textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & 97.63 \textbackslash{}\% & 2.37 \textbackslash{}\%\\
\hline
Animal Cruelty & 97.4 \textbackslash{}\% & 2.6 \textbackslash{}\%\\
\hline
Pornography/Obscene Material & 97.32 \textbackslash{}\% & 2.68 \textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & 97.23 \textbackslash{}\% & 2.77 \textbackslash{}\%\\
\hline
Sex Offenses - Incest & 97.04 \textbackslash{}\% & 2.96 \textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & 96.98 \textbackslash{}\% & 3.02 \textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & 96.56 \textbackslash{}\% & 3.44 \textbackslash{}\%\\
\hline
Sex Offenses - Rape & 96.48 \textbackslash{}\% & 3.52 \textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 95.76 \textbackslash{}\% & 4.24 \textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 95.73 \textbackslash{}\% & 4.27 \textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & 95.25 \textbackslash{}\% & 4.75 \textbackslash{}\%\\
\hline
Kidnapping/Abduction & 95.01 \textbackslash{}\% & 4.99 \textbackslash{}\%\\
\hline
Arson & 94.85 \textbackslash{}\% & 5.15 \textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & 94.29 \textbackslash{}\% & 5.71 \textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 93.64 \textbackslash{}\% & 6.36 \textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 93.39 \textbackslash{}\% & 6.61 \textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & 93.38 \textbackslash{}\% & 6.62 \textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 92.33 \textbackslash{}\% & 7.67 \textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & 92.26 \textbackslash{}\% & 7.74 \textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 92.04 \textbackslash{}\% & 7.96 \textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & 91.63 \textbackslash{}\% & 8.37 \textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 91.52 \textbackslash{}\% & 8.48 \textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 91.38 \textbackslash{}\% & 8.62 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 91.27 \textbackslash{}\% & 8.73 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & 91.15 \textbackslash{}\% & 8.85 \textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & 90.6 \textbackslash{}\% & 9.4 \textbackslash{}\%\\
\hline
Robbery & 90.2 \textbackslash{}\% & 9.8 \textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & 89.43 \textbackslash{}\% & 10.57 \textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & 88.17 \textbackslash{}\% & 11.83 \textbackslash{}\%\\
\hline
Motor Vehicle Theft & 88.07 \textbackslash{}\% & 11.93 \textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & 86.67 \textbackslash{}\% & 13.33 \textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & 86.36 \textbackslash{}\% & 13.64 \textbackslash{}\%\\
\hline
Bribery & 80.67 \textbackslash{}\% & 19.33 \textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & 71.56 \textbackslash{}\% & 28.44 \textbackslash{}\%\\
\hline
Extortion/Blackmail & 61.84 \textbackslash{}\% & 38.16 \textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & 57.14 \textbackslash{}\% & 42.86 \textbackslash{}\%\\
\hline
Commerce Violations - Wildlife Trafficking & 50 \textbackslash{}\% & 50 \textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Commerce Violations - Federal Tobacco Offenses & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Negligent Manslaughter & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
\end{longtable}



In Figure \@ref(fig:nibrsOffenseCompleted) we see the share of all offenses per year that are reported as completed. In every year we have data nearly all offenses were reported as being completed. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/nibrsOffenseCompleted-1} 

}

\caption{The annual percent of offenses reported as completed, 1991-2023.}(\#fig:nibrsOffenseCompleted)
\end{figure}

## Drug, alcohol, or computer use

Intoxication, mainly by alcohol, is known to be a major correlate (and cause) of crime. Drunk people commit a lot of crime (even though most drunk people never commit crime). Drunk people are also better targets for crime so are chosen by certain offenders who want an easy victim. NIBRS tries to capture this by telling us if the offender is *suspected of using* drugs (just "drugs" as we do not know which drug was involved, though we could look in the Property Segment to see what drug [if any] was seized by the police), alcohol, or "computer equipment" which also includes cell phones. Computer equipment is more relevant for certain crimes such as fraud or pornography/obscene materials. 

For each offense there are three variables about usage of any of these so potentially the offender could have used all three. The data does not get any more specific than if the offender is *suspected of using* these items. So we do not know how intoxicated they are or what they used the computer equipment for. Just that they are suspected of using it. And suspected is key. We do not know for sure if they used it. If, for example, a victim says that their mugger was drunk, NIBRS will say they are suspected of using alcohol, even though there is no definitive proof such as a blood test or breathalyzer. Unlike some past variables like offense subtype where it applies to only a subset of crimes, this variable is available for every crime. 

Figure \@ref(fig:offenseDrugAlcoholComputer) shows the distribution is suspected usage for all offenses in 2019 NIBRS. This is just from the first suspected use variable for simplicity of the graph. The most common outcome is "Not Applicable" at 89% of offenses. Not Applicable actually just means that the offender was not suspected of using drugs, alcohol, or computer equipment. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/offenseDrugAlcoholComputer-1} 

}

\caption{The distribution of drug, alcohol, or computer use for all offenses in 2022}(\#fig:offenseDrugAlcoholComputer)
\end{figure}

Figure \@ref(fig:offenseDrugAlcoholComputerAny) shows the distribution of suspected use when excluding "Not Applicable." Drug usage is the most common thing offenders are suspected of using. In about 61% of offenses where the offender is suspected of using something (of the drugs, alcohol, or "computer equipment" choices), that something is drugs. Again, we do not know what type of drug was used, only that it was not alcohol. Alcohol follows at 30% while computer equipment is only 6%. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/offenseDrugAlcoholComputerAny-1} 

}

\caption{The distribution of drug, alcohol, or computer use for offenses where there was usage of one of these items. For easier viewing of how this variable is distributed, this figure excludes all offenses where there was no drug, alcohol, or computer use or the variable was NA.}(\#fig:offenseDrugAlcoholComputerAny)
\end{figure}

## Crime location

This dataset tells us where each crime happened, giving more of a type of location rather than the precise location (e.g. coordinates) where it happened. Table \@ref(tab:offenseLocation) shows the different location types where each offense could occur, sorted by most common to least common location, and includes the first year that location was reported. Most locations were part of the data since 1991 but there have been some changes, such as adding "Cyberspace" in 2009, and splitting "school/college" to "school - college/university" and "school - elementary/secondary" in 2009. 

The most common place for a crime to occur is in someone's own home, at 38% of offenses. This makes a bit of sense as people spend a lot of time at home and certain crimes, such as burglary and domestic violence, commonly occur in the victim's home. Crimes happening on a road or alley make up the second most common location at 17% and parking lot or garage follows at 10%. The remaining locations only make up 5% or fewer of offense locations. A careful reader may realize a mistake in this table. 

Incidents can involve multiple offenses but would likely - though not always - occur in the same location. So if certain locations are more likely to have multiple offenses in that incident then we could be counting those locations more often. That may be okay, if what you're really interested in is data at the offense-level rather than the more commonly used incident-level. But it is important to be careful in making sure you are measuring the data right and presenting results clearly. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseLocation)The location of crimes for all offenses reported in 2022.}\\
\hline
Crime Location & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseLocation)The location of crimes for all offenses reported in 2022. \textit{(continued)}}\\
\hline
Crime Location & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Residence/Home & 1991 & 5,183,989 & 37.04\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & 1991 & 2,485,451 & 17.76\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & 1991 & 1,278,600 & 9.14\textbackslash{}\%\\
\hline
Other/Unknown & 1991 & 699,834 & 5.00\textbackslash{}\%\\
\hline
Department/Discount Store & 1991 & 591,328 & 4.23\textbackslash{}\%\\
\hline
Grocery/Supermarket & 1991 & 322,997 & 2.31\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & 1991 & 320,153 & 2.29\textbackslash{}\%\\
\hline
Convenience Store & 1991 & 305,186 & 2.18\textbackslash{}\%\\
\hline
Commercial/Office Building & 1991 & 297,968 & 2.13\textbackslash{}\%\\
\hline
School - Elementary/Secondary & 2009 & 255,924 & 1.83\textbackslash{}\%\\
\hline
Restaurant & 1991 & 223,297 & 1.60\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & 1991 & 218,343 & 1.56\textbackslash{}\%\\
\hline
Service/Gas Station & 1991 & 191,290 & 1.37\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & 1991 & 172,748 & 1.23\textbackslash{}\%\\
\hline
Cyberspace & 2015 & 151,576 & 1.08\textbackslash{}\%\\
\hline
Bank/Savings And Loan & 1991 & 128,019 & 0.91\textbackslash{}\%\\
\hline
Park/Playground & 2010 & 126,604 & 0.90\textbackslash{}\%\\
\hline
Government/Public Building & 1991 & 95,696 & 0.68\textbackslash{}\%\\
\hline
Bar/Nightclub & 1991 & 93,809 & 0.67\textbackslash{}\%\\
\hline
Rental Storage Facility & 1991 & 82,604 & 0.59\textbackslash{}\%\\
\hline
Shopping Mall & 2009 & 82,576 & 0.59\textbackslash{}\%\\
\hline
School - College/University & 2009 & 76,897 & 0.55\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & 1991 & 73,706 & 0.53\textbackslash{}\%\\
\hline
Construction Site & 1991 & 70,901 & 0.51\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & 1991 & 70,663 & 0.50\textbackslash{}\%\\
\hline
Field/Woods & 1991 & 55,871 & 0.40\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & 1991 & 41,987 & 0.30\textbackslash{}\%\\
\hline
Auto Dealership New/Used & 2009 & 40,016 & 0.29\textbackslash{}\%\\
\hline
Liquor Store & 1991 & 36,738 & 0.26\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & 2009 & 32,447 & 0.23\textbackslash{}\%\\
\hline
School/College & 1991 & 28,906 & 0.21\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & 2010 & 23,112 & 0.17\textbackslash{}\%\\
\hline
Industrial Site & 2009 & 22,293 & 0.16\textbackslash{}\%\\
\hline
Community Center & 2012 & 16,542 & 0.12\textbackslash{}\%\\
\hline
Camp/Campground & 2009 & 12,038 & 0.09\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & 2009 & 10,773 & 0.08\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & 1991 & 10,345 & 0.07\textbackslash{}\%\\
\hline
Atm Separate From Bank & 2009 & 10,337 & 0.07\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & 2010 & 10,048 & 0.07\textbackslash{}\%\\
\hline
Farm Facility & 2009 & 9,731 & 0.07\textbackslash{}\%\\
\hline
Amusement Park & 2010 & 8,171 & 0.06\textbackslash{}\%\\
\hline
Daycare Facility & 2009 & 7,806 & 0.06\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & 2009 & 7,189 & 0.05\textbackslash{}\%\\
\hline
Tribal Lands & 2011 & 5,193 & 0.04\textbackslash{}\%\\
\hline
Rest Area & 2009 & 3,773 & 0.03\textbackslash{}\%\\
\hline
Military Installation & 2010 & 861 & 0.01\textbackslash{}\%\\
\hline
Total & - & 13,994,336 & 100\textbackslash{}\%\\
\hline
\end{longtable}



Keep in mind that some locations may be an overly specific location that fits well into a broader category that you are interested in. For example, if you care about crimes that happen in stores you would look at "Bank/Savings and Loan", "Restaurant", "Bar/Nightclub," among other locations, which combined have a lot more offenses than any one individually. This is a recurring theme of NIBRS data - you have a lot of data and some of it is so specific that you need to do extra work to aggregate data into units you want.


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseLocation)The most common offenses for each crime location, 2023.}\\
\hline
Crime Location & Offense & \textbackslash{}\# of Offenses & \textbackslash{}\# of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseLocation)The most common offenses for each crime location, 2023. \textit{(continued)}}\\
\hline
Crime Location & Offense & \textbackslash{}\# of Offenses & \textbackslash{}\# of Offenses\\
\hline
\endhead
Abandoned/Condemned Structure & Destruction/Damage/Vandalism of Property & 2,515 & 25.03\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Burglary/Breaking And Entering & 2,088 & 20.78\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Drug/Narcotic Offenses - Drug/Narcotic Violations & 888 & 8.84\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Larceny/Theft Offenses - All Other Larceny & 775 & 7.71\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Drug/Narcotic Offenses - Drug Equipment Violations & 673 & 6.70\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & All Other & 3,109 & 30.97\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Total & 10,048 & 100\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Larceny/Theft Offenses - All Other Larceny & 13,978 & 19.78\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Assault Offenses - Simple Assault & 10,822 & 15.31\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Drug/Narcotic Offenses - Drug/Narcotic Violations & 7,294 & 10.32\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Destruction/Damage/Vandalism of Property & 6,794 & 9.61\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Weapon Law Violations - Weapon Law Violations & 5,343 & 7.56\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & All Other & 26,432 & 37.39\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Total & 70,663 & 100\textbackslash{}\%\\
\hline
Amusement Park & Larceny/Theft Offenses - All Other Larceny & 1,717 & 21.01\textbackslash{}\%\\
\hline
Amusement Park & Assault Offenses - Simple Assault & 1,596 & 19.53\textbackslash{}\%\\
\hline
Amusement Park & Destruction/Damage/Vandalism of Property & 644 & 7.88\textbackslash{}\%\\
\hline
Amusement Park & Larceny/Theft Offenses - Theft From Building & 535 & 6.55\textbackslash{}\%\\
\hline
Amusement Park & Drug/Narcotic Offenses - Drug/Narcotic Violations & 518 & 6.34\textbackslash{}\%\\
\hline
Amusement Park & All Other & 3,161 & 38.7\textbackslash{}\%\\
\hline
Amusement Park & Total & 8,171 & 100\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Assault Offenses - Simple Assault & 2,780 & 25.81\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Larceny/Theft Offenses - All Other Larceny & 1,964 & 18.23\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Destruction/Damage/Vandalism of Property & 1,049 & 9.74\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Larceny/Theft Offenses - Theft From Building & 624 & 5.79\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Larceny/Theft Offenses - Theft From Motor Vehicle & 539 & 5.00\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & All Other & 3,817 & 35.42\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Total & 10,773 & 100\textbackslash{}\%\\
\hline
Atm Separate From Bank & Fraud Offenses - Credit Card/Atm Fraud & 3,239 & 31.33\textbackslash{}\%\\
\hline
Atm Separate From Bank & Larceny/Theft Offenses - All Other Larceny & 1,717 & 16.61\textbackslash{}\%\\
\hline
Atm Separate From Bank & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1,452 & 14.05\textbackslash{}\%\\
\hline
Atm Separate From Bank & Destruction/Damage/Vandalism of Property & 707 & 6.84\textbackslash{}\%\\
\hline
Atm Separate From Bank & Fraud Offenses - Identity Theft & 653 & 6.32\textbackslash{}\%\\
\hline
Atm Separate From Bank & All Other & 2,569 & 24.88\textbackslash{}\%\\
\hline
Atm Separate From Bank & Total & 10,337 & 100\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Motor Vehicle Theft & 11,146 & 27.85\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Destruction/Damage/Vandalism of Property & 4,947 & 12.36\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 3,745 & 9.36\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 3,474 & 8.68\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Larceny/Theft Offenses - All Other Larceny & 3,323 & 8.30\textbackslash{}\%\\
\hline
Auto Dealership New/Used & All Other & 13,381 & 33.36\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Total & 40,016 & 100\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Counterfeiting/Forgery & 32,504 & 25.39\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 26,367 & 20.60\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Larceny/Theft Offenses - All Other Larceny & 16,303 & 12.74\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Fraud Offenses - Identity Theft & 14,902 & 11.64\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Fraud Offenses - Credit Card/Atm Fraud & 10,228 & 7.99\textbackslash{}\%\\
\hline
Bank/Savings And Loan & All Other & 27,713 & 21.63\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Total & 128,017 & 100\textbackslash{}\%\\
\hline
Bar/Nightclub & Assault Offenses - Simple Assault & 29,599 & 31.55\textbackslash{}\%\\
\hline
Bar/Nightclub & Larceny/Theft Offenses - All Other Larceny & 11,411 & 12.16\textbackslash{}\%\\
\hline
Bar/Nightclub & Assault Offenses - Aggravated Assault & 8,895 & 9.48\textbackslash{}\%\\
\hline
Bar/Nightclub & Destruction/Damage/Vandalism of Property & 8,116 & 8.65\textbackslash{}\%\\
\hline
Bar/Nightclub & Larceny/Theft Offenses - Theft From Building & 4,592 & 4.90\textbackslash{}\%\\
\hline
Bar/Nightclub & All Other & 31,194 & 33.24\textbackslash{}\%\\
\hline
Bar/Nightclub & Total & 93,807 & 100\textbackslash{}\%\\
\hline
Camp/Campground & Larceny/Theft Offenses - All Other Larceny & 2,354 & 19.55\textbackslash{}\%\\
\hline
Camp/Campground & Assault Offenses - Simple Assault & 2,183 & 18.13\textbackslash{}\%\\
\hline
Camp/Campground & Destruction/Damage/Vandalism of Property & 1,633 & 13.57\textbackslash{}\%\\
\hline
Camp/Campground & Assault Offenses - Aggravated Assault & 823 & 6.84\textbackslash{}\%\\
\hline
Camp/Campground & Larceny/Theft Offenses - Theft From Motor Vehicle & 733 & 6.09\textbackslash{}\%\\
\hline
Camp/Campground & All Other & 4,312 & 35.84\textbackslash{}\%\\
\hline
Camp/Campground & Total & 12,038 & 100\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Destruction/Damage/Vandalism of Property & 12,249 & 29.17\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Burglary/Breaking And Entering & 6,579 & 15.67\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Larceny/Theft Offenses - All Other Larceny & 5,513 & 13.13\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Assault Offenses - Simple Assault & 2,692 & 6.41\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Larceny/Theft Offenses - Theft From Motor Vehicle & 2,220 & 5.29\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & All Other & 12,732 & 30.27\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Total & 41,985 & 100\textbackslash{}\%\\
\hline
Commercial/Office Building & Destruction/Damage/Vandalism of Property & 52,381 & 17.58\textbackslash{}\%\\
\hline
Commercial/Office Building & Larceny/Theft Offenses - All Other Larceny & 47,767 & 16.03\textbackslash{}\%\\
\hline
Commercial/Office Building & Burglary/Breaking And Entering & 42,551 & 14.28\textbackslash{}\%\\
\hline
Commercial/Office Building & Motor Vehicle Theft & 16,307 & 5.47\textbackslash{}\%\\
\hline
Commercial/Office Building & Larceny/Theft Offenses - Shoplifting & 16,277 & 5.46\textbackslash{}\%\\
\hline
Commercial/Office Building & All Other & 122,678 & 41.17\textbackslash{}\%\\
\hline
Commercial/Office Building & Total & 297,961 & 100\textbackslash{}\%\\
\hline
Community Center & Larceny/Theft Offenses - All Other Larceny & 3,245 & 19.62\textbackslash{}\%\\
\hline
Community Center & Destruction/Damage/Vandalism of Property & 2,882 & 17.42\textbackslash{}\%\\
\hline
Community Center & Assault Offenses - Simple Assault & 2,468 & 14.92\textbackslash{}\%\\
\hline
Community Center & Larceny/Theft Offenses - Theft From Building & 1,855 & 11.21\textbackslash{}\%\\
\hline
Community Center & Burglary/Breaking And Entering & 1,135 & 6.86\textbackslash{}\%\\
\hline
Community Center & All Other & 4,957 & 29.97\textbackslash{}\%\\
\hline
Community Center & Total & 16,542 & 100\textbackslash{}\%\\
\hline
Construction Site & Larceny/Theft Offenses - All Other Larceny & 29,510 & 41.62\textbackslash{}\%\\
\hline
Construction Site & Burglary/Breaking And Entering & 12,990 & 18.32\textbackslash{}\%\\
\hline
Construction Site & Destruction/Damage/Vandalism of Property & 10,942 & 15.43\textbackslash{}\%\\
\hline
Construction Site & Larceny/Theft Offenses - Theft From Building & 3,756 & 5.30\textbackslash{}\%\\
\hline
Construction Site & Motor Vehicle Theft & 2,606 & 3.68\textbackslash{}\%\\
\hline
Construction Site & All Other & 11,097 & 15.65\textbackslash{}\%\\
\hline
Construction Site & Total & 70,901 & 100\textbackslash{}\%\\
\hline
Convenience Store & Larceny/Theft Offenses - Shoplifting & 104,229 & 34.15\textbackslash{}\%\\
\hline
Convenience Store & Larceny/Theft Offenses - All Other Larceny & 35,883 & 11.76\textbackslash{}\%\\
\hline
Convenience Store & Assault Offenses - Simple Assault & 20,831 & 6.83\textbackslash{}\%\\
\hline
Convenience Store & Drug/Narcotic Offenses - Drug/Narcotic Violations & 17,963 & 5.89\textbackslash{}\%\\
\hline
Convenience Store & Destruction/Damage/Vandalism of Property & 16,685 & 5.47\textbackslash{}\%\\
\hline
Convenience Store & All Other & 109,593 & 35.89\textbackslash{}\%\\
\hline
Convenience Store & Total & 305,184 & 100\textbackslash{}\%\\
\hline
Cyberspace & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 36,262 & 23.92\textbackslash{}\%\\
\hline
Cyberspace & Fraud Offenses - Identity Theft & 31,022 & 20.47\textbackslash{}\%\\
\hline
Cyberspace & Assault Offenses - Intimidation & 20,660 & 13.63\textbackslash{}\%\\
\hline
Cyberspace & Fraud Offenses - Credit Card/Atm Fraud & 16,030 & 10.58\textbackslash{}\%\\
\hline
Cyberspace & Fraud Offenses - Wire Fraud & 14,962 & 9.87\textbackslash{}\%\\
\hline
Cyberspace & All Other & 32,640 & 21.56\textbackslash{}\%\\
\hline
Cyberspace & Total & 151,576 & 100\textbackslash{}\%\\
\hline
Daycare Facility & Assault Offenses - Simple Assault & 2,274 & 29.13\textbackslash{}\%\\
\hline
Daycare Facility & Destruction/Damage/Vandalism of Property & 1,036 & 13.27\textbackslash{}\%\\
\hline
Daycare Facility & Larceny/Theft Offenses - Theft From Motor Vehicle & 643 & 8.24\textbackslash{}\%\\
\hline
Daycare Facility & Larceny/Theft Offenses - All Other Larceny & 639 & 8.19\textbackslash{}\%\\
\hline
Daycare Facility & Burglary/Breaking And Entering & 625 & 8.01\textbackslash{}\%\\
\hline
Daycare Facility & All Other & 2,589 & 33.16\textbackslash{}\%\\
\hline
Daycare Facility & Total & 7,806 & 100\textbackslash{}\%\\
\hline
Department/Discount Store & Larceny/Theft Offenses - Shoplifting & 363,609 & 61.49\textbackslash{}\%\\
\hline
Department/Discount Store & Larceny/Theft Offenses - All Other Larceny & 57,555 & 9.73\textbackslash{}\%\\
\hline
Department/Discount Store & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 20,310 & 3.43\textbackslash{}\%\\
\hline
Department/Discount Store & Fraud Offenses - Credit Card/Atm Fraud & 17,512 & 2.96\textbackslash{}\%\\
\hline
Department/Discount Store & Larceny/Theft Offenses - Theft From Building & 14,336 & 2.42\textbackslash{}\%\\
\hline
Department/Discount Store & All Other & 118,006 & 19.93\textbackslash{}\%\\
\hline
Department/Discount Store & Total & 591,328 & 100\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Larceny/Theft Offenses - All Other Larceny & 1,733 & 24.11\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Drug/Narcotic Offenses - Drug/Narcotic Violations & 1,436 & 19.97\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Destruction/Damage/Vandalism of Property & 688 & 9.57\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Assault Offenses - Simple Assault & 682 & 9.49\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Burglary/Breaking And Entering & 407 & 5.66\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & All Other & 2,243 & 31.2\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Total & 7,189 & 100\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Larceny/Theft Offenses - Shoplifting & 41,385 & 23.96\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Assault Offenses - Simple Assault & 38,541 & 22.31\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Larceny/Theft Offenses - All Other Larceny & 14,910 & 8.63\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Destruction/Damage/Vandalism of Property & 11,582 & 6.70\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Assault Offenses - Intimidation & 9,249 & 5.35\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & All Other & 57,079 & 33.04\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Total & 172,746 & 100\textbackslash{}\%\\
\hline
Farm Facility & Larceny/Theft Offenses - All Other Larceny & 2,695 & 27.69\textbackslash{}\%\\
\hline
Farm Facility & Burglary/Breaking And Entering & 1,749 & 17.97\textbackslash{}\%\\
\hline
Farm Facility & Destruction/Damage/Vandalism of Property & 1,645 & 16.90\textbackslash{}\%\\
\hline
Farm Facility & Motor Vehicle Theft & 983 & 10.10\textbackslash{}\%\\
\hline
Farm Facility & Larceny/Theft Offenses - Theft From Building & 466 & 4.79\textbackslash{}\%\\
\hline
Farm Facility & All Other & 2,193 & 22.52\textbackslash{}\%\\
\hline
Farm Facility & Total & 9,731 & 100\textbackslash{}\%\\
\hline
Field/Woods & Larceny/Theft Offenses - All Other Larceny & 12,087 & 21.63\textbackslash{}\%\\
\hline
Field/Woods & Destruction/Damage/Vandalism of Property & 9,031 & 16.16\textbackslash{}\%\\
\hline
Field/Woods & Drug/Narcotic Offenses - Drug/Narcotic Violations & 5,293 & 9.47\textbackslash{}\%\\
\hline
Field/Woods & Assault Offenses - Simple Assault & 5,032 & 9.01\textbackslash{}\%\\
\hline
Field/Woods & Motor Vehicle Theft & 3,257 & 5.83\textbackslash{}\%\\
\hline
Field/Woods & All Other & 21,170 & 37.91\textbackslash{}\%\\
\hline
Field/Woods & Total & 55,870 & 100\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Larceny/Theft Offenses - All Other Larceny & 6,001 & 18.49\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Drug/Narcotic Offenses - Drug/Narcotic Violations & 4,170 & 12.85\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Assault Offenses - Simple Assault & 3,713 & 11.44\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Larceny/Theft Offenses - Theft From Building & 2,858 & 8.81\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Counterfeiting/Forgery & 1,961 & 6.04\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & All Other & 13,744 & 42.36\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Total & 32,447 & 100\textbackslash{}\%\\
\hline
Government/Public Building & Destruction/Damage/Vandalism of Property & 14,995 & 15.67\textbackslash{}\%\\
\hline
Government/Public Building & Larceny/Theft Offenses - All Other Larceny & 12,550 & 13.11\textbackslash{}\%\\
\hline
Government/Public Building & Assault Offenses - Simple Assault & 11,560 & 12.08\textbackslash{}\%\\
\hline
Government/Public Building & Drug/Narcotic Offenses - Drug/Narcotic Violations & 9,040 & 9.45\textbackslash{}\%\\
\hline
Government/Public Building & Assault Offenses - Intimidation & 7,485 & 7.82\textbackslash{}\%\\
\hline
Government/Public Building & All Other & 40,064 & 41.86\textbackslash{}\%\\
\hline
Government/Public Building & Total & 95,694 & 100\textbackslash{}\%\\
\hline
Grocery/Supermarket & Larceny/Theft Offenses - Shoplifting & 168,193 & 52.07\textbackslash{}\%\\
\hline
Grocery/Supermarket & Larceny/Theft Offenses - All Other Larceny & 42,608 & 13.19\textbackslash{}\%\\
\hline
Grocery/Supermarket & Assault Offenses - Simple Assault & 12,831 & 3.97\textbackslash{}\%\\
\hline
Grocery/Supermarket & Fraud Offenses - Credit Card/Atm Fraud & 10,724 & 3.32\textbackslash{}\%\\
\hline
Grocery/Supermarket & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 9,126 & 2.83\textbackslash{}\%\\
\hline
Grocery/Supermarket & All Other & 79,509 & 24.62\textbackslash{}\%\\
\hline
Grocery/Supermarket & Total & 322,991 & 100\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Drug/Narcotic Offenses - Drug/Narcotic Violations & 562,590 & 22.64\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Destruction/Damage/Vandalism of Property & 283,207 & 11.39\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Drug/Narcotic Offenses - Drug Equipment Violations & 264,734 & 10.65\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Motor Vehicle Theft & 255,631 & 10.29\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Assault Offenses - Simple Assault & 206,086 & 8.29\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & All Other & 913,163 & 36.78\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Total & 2,485,411 & 100\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Assault Offenses - Simple Assault & 38,480 & 17.62\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Larceny/Theft Offenses - All Other Larceny & 22,401 & 10.26\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Destruction/Damage/Vandalism of Property & 21,998 & 10.08\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Drug/Narcotic Offenses - Drug/Narcotic Violations & 20,281 & 9.29\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Larceny/Theft Offenses - Theft From Motor Vehicle & 19,255 & 8.82\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & All Other & 95,927 & 43.97\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Total & 218,342 & 100\textbackslash{}\%\\
\hline
Industrial Site & Larceny/Theft Offenses - All Other Larceny & 5,921 & 26.56\textbackslash{}\%\\
\hline
Industrial Site & Destruction/Damage/Vandalism of Property & 3,870 & 17.36\textbackslash{}\%\\
\hline
Industrial Site & Burglary/Breaking And Entering & 3,173 & 14.23\textbackslash{}\%\\
\hline
Industrial Site & Assault Offenses - Simple Assault & 1,399 & 6.28\textbackslash{}\%\\
\hline
Industrial Site & Motor Vehicle Theft & 1,277 & 5.73\textbackslash{}\%\\
\hline
Industrial Site & All Other & 6,652 & 29.79\textbackslash{}\%\\
\hline
Industrial Site & Total & 22,292 & 100\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Simple Assault & 29,336 & 39.80\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Drug/Narcotic Offenses - Drug/Narcotic Violations & 18,588 & 25.22\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Aggravated Assault & 6,797 & 9.22\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Destruction/Damage/Vandalism of Property & 6,036 & 8.19\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Intimidation & 2,886 & 3.92\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & All Other & 10,063 & 13.68\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Total & 73,706 & 100\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Larceny/Theft Offenses - All Other Larceny & 2,870 & 27.74\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Assault Offenses - Simple Assault & 1,335 & 12.90\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Destruction/Damage/Vandalism of Property & 1,235 & 11.94\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Drug/Narcotic Offenses - Drug/Narcotic Violations & 956 & 9.24\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Larceny/Theft Offenses - Theft From Motor Vehicle & 699 & 6.76\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & All Other & 3,250 & 31.39\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Total & 10,345 & 100\textbackslash{}\%\\
\hline
Liquor Store & Larceny/Theft Offenses - Shoplifting & 19,689 & 53.60\textbackslash{}\%\\
\hline
Liquor Store & Burglary/Breaking And Entering & 2,453 & 6.68\textbackslash{}\%\\
\hline
Liquor Store & Larceny/Theft Offenses - All Other Larceny & 2,420 & 6.59\textbackslash{}\%\\
\hline
Liquor Store & Destruction/Damage/Vandalism of Property & 2,221 & 6.05\textbackslash{}\%\\
\hline
Liquor Store & Assault Offenses - Simple Assault & 1,554 & 4.23\textbackslash{}\%\\
\hline
Liquor Store & All Other & 8,399 & 22.82\textbackslash{}\%\\
\hline
Liquor Store & Total & 36,736 & 100\textbackslash{}\%\\
\hline
Military Installation & Larceny/Theft Offenses - All Other Larceny & 186 & 21.60\textbackslash{}\%\\
\hline
Military Installation & Destruction/Damage/Vandalism of Property & 95 & 11.03\textbackslash{}\%\\
\hline
Military Installation & Assault Offenses - Simple Assault & 80 & 9.29\textbackslash{}\%\\
\hline
Military Installation & Assault Offenses - Intimidation & 76 & 8.83\textbackslash{}\%\\
\hline
Military Installation & Burglary/Breaking And Entering & 45 & 5.23\textbackslash{}\%\\
\hline
Military Installation & All Other & 379 & 44.04\textbackslash{}\%\\
\hline
Military Installation & Total & 861 & 100\textbackslash{}\%\\
\hline
Other/Unknown & Larceny/Theft Offenses - All Other Larceny & 115,019 & 16.44\textbackslash{}\%\\
\hline
Other/Unknown & Destruction/Damage/Vandalism of Property & 73,195 & 10.46\textbackslash{}\%\\
\hline
Other/Unknown & Assault Offenses - Simple Assault & 56,187 & 8.03\textbackslash{}\%\\
\hline
Other/Unknown & Larceny/Theft Offenses - Shoplifting & 45,609 & 6.52\textbackslash{}\%\\
\hline
Other/Unknown & Assault Offenses - Intimidation & 36,283 & 5.18\textbackslash{}\%\\
\hline
Other/Unknown & All Other & 373,527 & 53.37\textbackslash{}\%\\
\hline
Other/Unknown & Total & 699,820 & 100\textbackslash{}\%\\
\hline
Park/Playground & Destruction/Damage/Vandalism of Property & 27,650 & 21.84\textbackslash{}\%\\
\hline
Park/Playground & Assault Offenses - Simple Assault & 19,055 & 15.05\textbackslash{}\%\\
\hline
Park/Playground & Larceny/Theft Offenses - All Other Larceny & 13,991 & 11.05\textbackslash{}\%\\
\hline
Park/Playground & Drug/Narcotic Offenses - Drug/Narcotic Violations & 13,094 & 10.34\textbackslash{}\%\\
\hline
Park/Playground & Larceny/Theft Offenses - Theft From Motor Vehicle & 10,678 & 8.43\textbackslash{}\%\\
\hline
Park/Playground & All Other & 42,136 & 33.28\textbackslash{}\%\\
\hline
Park/Playground & Total & 126,604 & 100\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Larceny/Theft Offenses - Theft From Motor Vehicle & 273,500 & 21.39\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Destruction/Damage/Vandalism of Property & 247,701 & 19.37\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Motor Vehicle Theft & 213,331 & 16.69\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Drug/Narcotic Offenses - Drug/Narcotic Violations & 86,283 & 6.75\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Larceny/Theft Offenses - All Other Larceny & 83,482 & 6.53\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & All Other & 374,266 & 29.23\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Total & 1,278,563 & 100\textbackslash{}\%\\
\hline
Rental Storage Facility & Burglary/Breaking And Entering & 38,005 & 46.01\textbackslash{}\%\\
\hline
Rental Storage Facility & Destruction/Damage/Vandalism of Property & 11,438 & 13.85\textbackslash{}\%\\
\hline
Rental Storage Facility & Larceny/Theft Offenses - All Other Larceny & 9,848 & 11.92\textbackslash{}\%\\
\hline
Rental Storage Facility & Motor Vehicle Theft & 4,787 & 5.80\textbackslash{}\%\\
\hline
Rental Storage Facility & Larceny/Theft Offenses - Theft From Building & 4,275 & 5.18\textbackslash{}\%\\
\hline
Rental Storage Facility & All Other & 14,250 & 17.26\textbackslash{}\%\\
\hline
Rental Storage Facility & Total & 82,603 & 100\textbackslash{}\%\\
\hline
Residence/Home & Assault Offenses - Simple Assault & 1,149,864 & 22.18\textbackslash{}\%\\
\hline
Residence/Home & Destruction/Damage/Vandalism of Property & 680,051 & 13.12\textbackslash{}\%\\
\hline
Residence/Home & Larceny/Theft Offenses - All Other Larceny & 579,384 & 11.18\textbackslash{}\%\\
\hline
Residence/Home & Burglary/Breaking And Entering & 383,775 & 7.40\textbackslash{}\%\\
\hline
Residence/Home & Assault Offenses - Intimidation & 346,951 & 6.69\textbackslash{}\%\\
\hline
Residence/Home & All Other & 2,043,859 & 39.43\textbackslash{}\%\\
\hline
Residence/Home & Total & 5,183,884 & 100\textbackslash{}\%\\
\hline
Rest Area & Destruction/Damage/Vandalism of Property & 643 & 17.04\textbackslash{}\%\\
\hline
Rest Area & Larceny/Theft Offenses - All Other Larceny & 541 & 14.34\textbackslash{}\%\\
\hline
Rest Area & Assault Offenses - Simple Assault & 530 & 14.05\textbackslash{}\%\\
\hline
Rest Area & Drug/Narcotic Offenses - Drug/Narcotic Violations & 357 & 9.46\textbackslash{}\%\\
\hline
Rest Area & Larceny/Theft Offenses - Theft From Motor Vehicle & 277 & 7.34\textbackslash{}\%\\
\hline
Rest Area & All Other & 1,425 & 37.78\textbackslash{}\%\\
\hline
Rest Area & Total & 3,773 & 100\textbackslash{}\%\\
\hline
Restaurant & Larceny/Theft Offenses - All Other Larceny & 33,432 & 14.97\textbackslash{}\%\\
\hline
Restaurant & Assault Offenses - Simple Assault & 31,827 & 14.25\textbackslash{}\%\\
\hline
Restaurant & Destruction/Damage/Vandalism of Property & 27,812 & 12.46\textbackslash{}\%\\
\hline
Restaurant & Burglary/Breaking And Entering & 23,384 & 10.47\textbackslash{}\%\\
\hline
Restaurant & Larceny/Theft Offenses - Theft From Building & 13,008 & 5.83\textbackslash{}\%\\
\hline
Restaurant & All Other & 93,831 & 42.01\textbackslash{}\%\\
\hline
Restaurant & Total & 223,294 & 100\textbackslash{}\%\\
\hline
School - College/University & Larceny/Theft Offenses - All Other Larceny & 16,802 & 21.85\textbackslash{}\%\\
\hline
School - College/University & Destruction/Damage/Vandalism of Property & 13,211 & 17.18\textbackslash{}\%\\
\hline
School - College/University & Assault Offenses - Simple Assault & 8,648 & 11.25\textbackslash{}\%\\
\hline
School - College/University & Larceny/Theft Offenses - Theft From Building & 6,806 & 8.85\textbackslash{}\%\\
\hline
School - College/University & Drug/Narcotic Offenses - Drug/Narcotic Violations & 5,410 & 7.04\textbackslash{}\%\\
\hline
School - College/University & All Other & 26,020 & 33.8\textbackslash{}\%\\
\hline
School - College/University & Total & 76,897 & 100\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Assault Offenses - Simple Assault & 84,826 & 33.15\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Drug/Narcotic Offenses - Drug/Narcotic Violations & 44,891 & 17.54\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Assault Offenses - Intimidation & 28,122 & 10.99\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Destruction/Damage/Vandalism of Property & 18,045 & 7.05\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Larceny/Theft Offenses - All Other Larceny & 16,527 & 6.46\textbackslash{}\%\\
\hline
School - Elementary/Secondary & All Other & 63,509 & 24.83\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Total & 255,920 & 100\textbackslash{}\%\\
\hline
School/College & Assault Offenses - Simple Assault & 7,881 & 27.26\textbackslash{}\%\\
\hline
School/College & Drug/Narcotic Offenses - Drug/Narcotic Violations & 4,103 & 14.19\textbackslash{}\%\\
\hline
School/College & Larceny/Theft Offenses - All Other Larceny & 3,256 & 11.26\textbackslash{}\%\\
\hline
School/College & Destruction/Damage/Vandalism of Property & 2,799 & 9.68\textbackslash{}\%\\
\hline
School/College & Assault Offenses - Intimidation & 2,689 & 9.30\textbackslash{}\%\\
\hline
School/College & All Other & 8,178 & 28.27\textbackslash{}\%\\
\hline
School/College & Total & 28,906 & 100\textbackslash{}\%\\
\hline
Service/Gas Station & Larceny/Theft Offenses - Shoplifting & 31,892 & 16.67\textbackslash{}\%\\
\hline
Service/Gas Station & Larceny/Theft Offenses - All Other Larceny & 27,148 & 14.19\textbackslash{}\%\\
\hline
Service/Gas Station & Drug/Narcotic Offenses - Drug/Narcotic Violations & 15,847 & 8.28\textbackslash{}\%\\
\hline
Service/Gas Station & Assault Offenses - Simple Assault & 15,585 & 8.15\textbackslash{}\%\\
\hline
Service/Gas Station & Destruction/Damage/Vandalism of Property & 13,950 & 7.29\textbackslash{}\%\\
\hline
Service/Gas Station & All Other & 86,861 & 45.38\textbackslash{}\%\\
\hline
Service/Gas Station & Total & 191,283 & 100\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Simple Assault & 6,861 & 29.69\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Intimidation & 3,874 & 16.76\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Larceny/Theft Offenses - All Other Larceny & 2,884 & 12.48\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Aggravated Assault & 1,865 & 8.07\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Larceny/Theft Offenses - Theft From Building & 1,707 & 7.39\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & All Other & 5,921 & 25.61\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Total & 23,112 & 100\textbackslash{}\%\\
\hline
Shopping Mall & Larceny/Theft Offenses - Shoplifting & 34,875 & 42.24\textbackslash{}\%\\
\hline
Shopping Mall & Larceny/Theft Offenses - All Other Larceny & 9,019 & 10.92\textbackslash{}\%\\
\hline
Shopping Mall & Assault Offenses - Simple Assault & 4,750 & 5.75\textbackslash{}\%\\
\hline
Shopping Mall & Destruction/Damage/Vandalism of Property & 4,523 & 5.48\textbackslash{}\%\\
\hline
Shopping Mall & Assault Offenses - Intimidation & 2,964 & 3.59\textbackslash{}\%\\
\hline
Shopping Mall & All Other & 26,442 & 32.03\textbackslash{}\%\\
\hline
Shopping Mall & Total & 82,573 & 100\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Larceny/Theft Offenses - Shoplifting & 122,489 & 38.26\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Larceny/Theft Offenses - All Other Larceny & 35,389 & 11.05\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Destruction/Damage/Vandalism of Property & 24,886 & 7.77\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Burglary/Breaking And Entering & 24,731 & 7.72\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 16,482 & 5.15\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & All Other & 96,174 & 30.03\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Total & 320,151 & 100\textbackslash{}\%\\
\hline
Tribal Lands & Drug/Narcotic Offenses - Drug/Narcotic Violations & 658 & 12.67\textbackslash{}\%\\
\hline
Tribal Lands & Assault Offenses - Simple Assault & 604 & 11.63\textbackslash{}\%\\
\hline
Tribal Lands & Destruction/Damage/Vandalism of Property & 589 & 11.34\textbackslash{}\%\\
\hline
Tribal Lands & Motor Vehicle Theft & 509 & 9.80\textbackslash{}\%\\
\hline
Tribal Lands & Assault Offenses - Aggravated Assault & 390 & 7.51\textbackslash{}\%\\
\hline
Tribal Lands & All Other & 2,443 & 47.04\textbackslash{}\%\\
\hline
Tribal Lands & Total & 5,193 & 100\textbackslash{}\%\\
\hline
\end{longtable}




## Weapons {#offenseWeapons}

Using a weapon during a crime can greatly increase the severity of the offense, as evidenced by increased sanctions for using a weapon (and particularly a gun) and the enormous amount of attention - by the media, the public, and researchers - on gun crimes. Luckily, this data tells us the weapon used in certain offenses. There can be up to three different weapon types included in an offense. This data does not provide a weapon used for all offenses, just for the ones that they deem to be violent crimes, and thus could involve a weapon. Please note that this is the weapons used in some capacity during the crime, not necessarily to harm the victim.^[The Victim Segment does have data on victim injuries though it does not say which weapon caused the injuries] For example, if a gun is involved in a crime, that gun may have been fired and missed the victim, fired and hit the victim, used to beat the victim, or merely brandished. From this data alone we do not know how it was used. 

The list of offenses where there is data on weapon usage is below:

* Assault Offenses - Aggravated Assault
* Assault Offenses - Simple Assault
* Extortion/Blackmail
* Human Trafficking - Commercial Sex Acts
* Human Trafficking - Involuntary Servitude
* Justifiable Homicide - Not A Crime
* Kidnapping/Abduction
* Murder/Nonnegligent Manslaughter
* Negligent Manslaughter
* Robbery
* Sex Offenses - Fondling (Incident Liberties/Child Molest)
* Sex Offenses - Rape
* Sex Offenses - Sexual Assault With An Object
* Sex Offenses - Sodomy
* Weapon Law Violations - Explosives
* Weapon Law Violations - Violation of National Firearm Act of 1934
* Weapon Law Violations - Weapon Law Violations

Table \@ref(tab:offenseWeapon) shows the breakdown in the weapons used in 2022 data, by the offense type. This table aggregates data at the offense-level, meaning that an incident with two offenses that both involved a weapon would count that weapon twice. Depending on your use case you may want to aggregate data to the incident-level, such as by top-coding to the most serious weapon per incident. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseWeapon)The weapon used by an offender, by offense, 2023. The use means that it was part of the crime though may not have been physically discharged. For example, pointing a gun at someone even without firing the gun is still using it.}\\
\hline
Crime & Weapon & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseWeapon)The weapon used by an offender, by offense, 2023. The use means that it was part of the crime though may not have been physically discharged. For example, pointing a gun at someone even without firing the gun is still using it. \textit{(continued)}}\\
\hline
Crime & Weapon & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Assault Offenses - Simple Assault & Personal Weapons (Hands, Feet, Teeth, Etc.) & 1,517,722 & 78.42\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & None & 220,695 & 11.40\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Other & 145,694 & 7.53\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Unknown & 51,206 & 2.65\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 1,935,317 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Personal Weapons (Hands, Feet, Teeth, Etc.) & 124,452 & 20.57\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Handgun & 107,390 & 17.75\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 104,074 & 17.20\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 61,632 & 10.18\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Firearm (Type Not Stated) & 60,172 & 9.94\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other & 59,352 & 9.81\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Motor Vehicle/Vessel & 28,034 & 4.63\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & None & 17,828 & 2.95\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 13,348 & 2.21\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Unknown & 12,175 & 2.01\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Rifle & 5,933 & 0.98\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other Firearm & 4,794 & 0.79\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Shotgun & 3,082 & 0.51\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Fire/Incendiary Device & 1,004 & 0.17\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Drugs/Narcotics/Sleeping Pills & 1,002 & 0.17\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Poison (Include Gas) & 635 & 0.10\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Explosives & 252 & 0.04\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 605,159 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Handgun & 183,188 & 51.57\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Firearm (Type Not Stated) & 69,353 & 19.52\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 34,725 & 9.78\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Other & 17,587 & 4.95\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & None & 13,074 & 3.68\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Rifle & 9,476 & 2.67\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 7,426 & 2.09\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Unknown & 5,582 & 1.57\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Other Firearm & 5,578 & 1.57\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Shotgun & 4,940 & 1.39\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Explosives & 1,858 & 0.52\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Personal Weapons (Hands, Feet, Teeth, Etc.) & 1,352 & 0.38\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Fire/Incendiary Device & 409 & 0.12\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Motor Vehicle/Vessel & 374 & 0.11\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Drugs/Narcotics/Sleeping Pills & 220 & 0.06\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Poison (Include Gas) & 75 & 0.02\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 24 & 0.01\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Total & 355,241 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Personal Weapons (Hands, Feet, Teeth, Etc.) & 4,813 & 60.28\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & None & 1,658 & 20.77\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Unknown & 600 & 7.52\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other & 559 & 7.00\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 167 & 2.09\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 80 & 1.00\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Drugs/Narcotics/Sleeping Pills & 45 & 0.56\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Handgun & 30 & 0.38\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Firearm (Type Not Stated) & 14 & 0.18\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 11 & 0.14\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other Firearm & 2 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Poison (Include Gas) & 2 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Motor Vehicle/Vessel & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Explosives & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Shotgun & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 7,984 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Personal Weapons (Hands, Feet, Teeth, Etc.) & 41,014 & 52.17\textbackslash{}\%\\
\hline
Sex Offenses - Rape & None & 23,802 & 30.28\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Unknown & 7,928 & 10.08\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other & 2,638 & 3.36\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Handgun & 887 & 1.13\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 796 & 1.01\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Drugs/Narcotics/Sleeping Pills & 684 & 0.87\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Firearm (Type Not Stated) & 392 & 0.50\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 191 & 0.24\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 175 & 0.22\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Poison (Include Gas) & 29 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other Firearm & 28 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Rifle & 18 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Motor Vehicle/Vessel & 13 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Fire/Incendiary Device & 9 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Shotgun & 8 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 78,612 & 100\textbackslash{}\%\\
\hline
Robbery & Personal Weapons (Hands, Feet, Teeth, Etc.) & 55,139 & 30.77\textbackslash{}\%\\
\hline
Robbery & Handgun & 47,636 & 26.58\textbackslash{}\%\\
\hline
Robbery & None & 23,733 & 13.24\textbackslash{}\%\\
\hline
Robbery & Firearm (Type Not Stated) & 15,231 & 8.50\textbackslash{}\%\\
\hline
Robbery & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 14,983 & 8.36\textbackslash{}\%\\
\hline
Robbery & Other & 9,081 & 5.07\textbackslash{}\%\\
\hline
Robbery & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 4,780 & 2.67\textbackslash{}\%\\
\hline
Robbery & Unknown & 4,563 & 2.55\textbackslash{}\%\\
\hline
Robbery & Other Firearm & 1,296 & 0.72\textbackslash{}\%\\
\hline
Robbery & Rifle & 1,251 & 0.70\textbackslash{}\%\\
\hline
Robbery & Motor Vehicle/Vessel & 801 & 0.45\textbackslash{}\%\\
\hline
Robbery & Shotgun & 363 & 0.20\textbackslash{}\%\\
\hline
Robbery & Poison (Include Gas) & 107 & 0.06\textbackslash{}\%\\
\hline
Robbery & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 101 & 0.06\textbackslash{}\%\\
\hline
Robbery & Explosives & 57 & 0.03\textbackslash{}\%\\
\hline
Robbery & Fire/Incendiary Device & 42 & 0.02\textbackslash{}\%\\
\hline
Robbery & Drugs/Narcotics/Sleeping Pills & 42 & 0.02\textbackslash{}\%\\
\hline
Robbery & Total & 179,206 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Personal Weapons (Hands, Feet, Teeth, Etc.) & 10,233 & 50.14\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & None & 7,151 & 35.04\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Unknown & 1,415 & 6.93\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other & 780 & 3.82\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Handgun & 242 & 1.19\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 207 & 1.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Drugs/Narcotics/Sleeping Pills & 140 & 0.69\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Firearm (Type Not Stated) & 94 & 0.46\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 94 & 0.46\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 30 & 0.15\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other Firearm & 8 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Motor Vehicle/Vessel & 6 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Shotgun & 5 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Rifle & 3 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Poison (Include Gas) & 2 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 20,410 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Handgun & 5,808 & 39.08\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Firearm (Type Not Stated) & 4,624 & 31.11\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 1,306 & 8.79\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Unknown & 607 & 4.08\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Personal Weapons (Hands, Feet, Teeth, Etc.) & 575 & 3.87\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Rifle & 370 & 2.49\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other Firearm & 367 & 2.47\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other & 264 & 1.78\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 245 & 1.65\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Drugs/Narcotics/Sleeping Pills & 201 & 1.35\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Motor Vehicle/Vessel & 199 & 1.34\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Shotgun & 146 & 0.98\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 82 & 0.55\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Fire/Incendiary Device & 51 & 0.34\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Poison (Include Gas) & 16 & 0.11\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 14,861 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Personal Weapons (Hands, Feet, Teeth, Etc.) & 21,314 & 47.69\textbackslash{}\%\\
\hline
Kidnapping/Abduction & None & 12,283 & 27.48\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Handgun & 2,825 & 6.32\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 1,984 & 4.44\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other & 1,850 & 4.14\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Unknown & 1,767 & 3.95\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Firearm (Type Not Stated) & 1,081 & 2.42\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Motor Vehicle/Vessel & 527 & 1.18\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 476 & 1.06\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 215 & 0.48\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Rifle & 157 & 0.35\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Shotgun & 77 & 0.17\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other Firearm & 77 & 0.17\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Drugs/Narcotics/Sleeping Pills & 40 & 0.09\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Fire/Incendiary Device & 15 & 0.03\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Poison (Include Gas) & 5 & 0.01\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Explosives & 2 & 0.00\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 44,695 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Personal Weapons (Hands, Feet, Teeth, Etc.) & 46,721 & 54.31\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & None & 31,270 & 36.35\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Unknown & 5,636 & 6.55\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Other & 1,871 & 2.17\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 144 & 0.17\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Handgun & 103 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Drugs/Narcotics/Sleeping Pills & 75 & 0.09\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Firearm (Type Not Stated) & 73 & 0.08\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 62 & 0.07\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 27 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Motor Vehicle/Vessel & 17 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Other Firearm & 16 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Poison (Include Gas) & 8 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Rifle & 7 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Fire/Incendiary Device & 2 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Explosives & 1 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Shotgun & 1 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Indecent Liberties/Child Molest) & Total & 86,034 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & None & 1,149 & 55.00\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Personal Weapons (Hands, Feet, Teeth, Etc.) & 400 & 19.15\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Unknown & 315 & 15.08\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Other & 138 & 6.61\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Handgun & 34 & 1.63\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Firearm (Type Not Stated) & 16 & 0.77\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Drugs/Narcotics/Sleeping Pills & 15 & 0.72\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 8 & 0.38\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Motor Vehicle/Vessel & 7 & 0.34\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 4 & 0.19\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 2 & 0.10\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Poison (Include Gas) & 1 & 0.05\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 2,089 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & Motor Vehicle/Vessel & 933 & 51.78\textbackslash{}\%\\
\hline
Negligent Manslaughter & Other & 235 & 13.04\textbackslash{}\%\\
\hline
Negligent Manslaughter & Handgun & 174 & 9.66\textbackslash{}\%\\
\hline
Negligent Manslaughter & Drugs/Narcotics/Sleeping Pills & 162 & 8.99\textbackslash{}\%\\
\hline
Negligent Manslaughter & Unknown & 81 & 4.50\textbackslash{}\%\\
\hline
Negligent Manslaughter & Personal Weapons (Hands, Feet, Teeth, Etc.) & 77 & 4.27\textbackslash{}\%\\
\hline
Negligent Manslaughter & Firearm (Type Not Stated) & 55 & 3.05\textbackslash{}\%\\
\hline
Negligent Manslaughter & Rifle & 18 & 1.00\textbackslash{}\%\\
\hline
Negligent Manslaughter & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 17 & 0.94\textbackslash{}\%\\
\hline
Negligent Manslaughter & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 16 & 0.89\textbackslash{}\%\\
\hline
Negligent Manslaughter & Fire/Incendiary Device & 10 & 0.55\textbackslash{}\%\\
\hline
Negligent Manslaughter & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 8 & 0.44\textbackslash{}\%\\
\hline
Negligent Manslaughter & Other Firearm & 6 & 0.33\textbackslash{}\%\\
\hline
Negligent Manslaughter & Shotgun & 6 & 0.33\textbackslash{}\%\\
\hline
Negligent Manslaughter & Poison (Include Gas) & 4 & 0.22\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 1,802 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & None & 21,675 & 80.18\textbackslash{}\%\\
\hline
Extortion/Blackmail & Other & 2,298 & 8.50\textbackslash{}\%\\
\hline
Extortion/Blackmail & Personal Weapons (Hands, Feet, Teeth, Etc.) & 1,384 & 5.12\textbackslash{}\%\\
\hline
Extortion/Blackmail & Unknown & 1,343 & 4.97\textbackslash{}\%\\
\hline
Extortion/Blackmail & Firearm (Type Not Stated) & 122 & 0.45\textbackslash{}\%\\
\hline
Extortion/Blackmail & Handgun & 91 & 0.34\textbackslash{}\%\\
\hline
Extortion/Blackmail & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 38 & 0.14\textbackslash{}\%\\
\hline
Extortion/Blackmail & Rifle & 32 & 0.12\textbackslash{}\%\\
\hline
Extortion/Blackmail & Explosives & 16 & 0.06\textbackslash{}\%\\
\hline
Extortion/Blackmail & Other Firearm & 16 & 0.06\textbackslash{}\%\\
\hline
Extortion/Blackmail & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 9 & 0.03\textbackslash{}\%\\
\hline
Extortion/Blackmail & Drugs/Narcotics/Sleeping Pills & 4 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Fire/Incendiary Device & 2 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Motor Vehicle/Vessel & 2 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 1 & 0.00\textbackslash{}\%\\
\hline
Extortion/Blackmail & Poison (Include Gas) & 1 & 0.00\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 27,034 & 100\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Handgun & 410 & 61.10\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Firearm (Type Not Stated) & 167 & 24.89\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Rifle & 38 & 5.66\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 27 & 4.02\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Personal Weapons (Hands, Feet, Teeth, Etc.) & 8 & 1.19\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Other Firearm & 6 & 0.89\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Shotgun & 5 & 0.75\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Unknown & 4 & 0.60\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Motor Vehicle/Vessel & 2 & 0.30\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 2 & 0.30\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 1 & 0.15\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Other & 1 & 0.15\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Total & 671 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & None & 242 & 48.89\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Personal Weapons (Hands, Feet, Teeth, Etc.) & 100 & 20.20\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Unknown & 82 & 16.57\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Other & 34 & 6.87\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Handgun & 12 & 2.42\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Firearm (Type Not Stated) & 7 & 1.41\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Drugs/Narcotics/Sleeping Pills & 5 & 1.01\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 5 & 1.01\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Other Firearm & 2 & 0.40\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Poison (Include Gas) & 2 & 0.40\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Motor Vehicle/Vessel & 2 & 0.40\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 1 & 0.20\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 1 & 0.20\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 495 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Explosives & 1 & 100.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Total & 1 & 100\textbackslash{}\%\\
\hline
\end{longtable}



We can use this dataset to look at, for example, trends in the type of weapon used in murders and nonnegligent manslaughters over time, as seen in Figure \@ref(nibrsMurdersWeapon). We can see that guns are the most common weapon are over 60% of murders in most years. Most of these guns are handguns, with about 35% of all murders using a handgun. Other weapons are far less common making up fewer than 20% of offenses most years. There are different agencies reporting each year so differents in trends may simply be due to different agencies in the data. For your own analysis you will need to be far more careful than the figure shown here.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/nibrsMurdersWeapon-1} 

}

\caption{The annual percent of murders and nonnegligent homicides, by offender weapon, 1991-2023.}(\#fig:nibrsMurdersWeapon)
\end{figure}

### Automatic weapons

When the weapon involved was a firearm there is a variable which indicates that the firearm was fully automatic. To be clear, this means that when you pull the trigger once the gun will fire multiple bullets. Semi-automatic firearms are **not** automatic firearms. Of course, saying a gun is fully automatic requires either the policing seizing the gun or the gun being fired (and for witnesses to accurately determine that it is fully automatic). Since many crimes are never solved (and even those that lead to an arrest may not lead to the gun being seized^[Though some guns are seized even without an arrest, such as if the gun is left at the crime scene], this variable is likely imprecise. Still, Figure \@ref(fig:offenseAutomaticWeapon) shows the percent of firearms used in offenses in 2022 that are reported to be fully automatic. Even though there can be up to three weapons used in an offense, this figure only looks at the first weapon. The most common guns to be automatic are rifles and handguns, both with about 5% of all uses being of an automatic weapon. The remaining categories are all under 3% of uses. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/offenseAutomaticWeapon-1} 

}

\caption{The percent of firearms used that were fully automatic, for all offenses, 1991-2023.}(\#fig:offenseAutomaticWeapon)
\end{figure}

## Burglary info

For burglary offenses there are two variables that provide a little more information on the offense. The first variable is the number of "premises" that the burglar entered. This is only available when the location for the offense is either hotel/motel or a rental storage facility. So the "premise" can really be thought of as a room in the building, not that they break into multiple hotels. Figure \@ref(fig:offensePremisesEntered) shows the breakdown in the number of premises entered during a burglary incident. The graph is capped at ten or more for simplicity but in the data itself the number can go higher. The vast majority of hotel/motel and storage facility burglaries only have one room entered, with 87% of these burglaries only being on a single room. This declines enormously to 5% burglarizing two rooms and then more than halves to 2% burglarizing three rooms. This trend continues as the number of rooms increase. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/offensePremisesEntered-1} 

}

\caption{The distribution in the number of premises entered during burglaries, 2023. This information is only available for burglaries in a hotel/motel or rental storage facilities.}(\#fig:offensePremisesEntered)
\end{figure}

The second variable, and one where there is data from every burglary reported regardless of location, says whether the burglar entered the building forcibly or not. A burglary without force is one when the burglary *only* enters through unlocked doors or windows. The *only* means that if they entered through an unlocked door or window and then forced open another door or window, the entire burglary is classified as forcible entry. Forcible entry is any when the burglar has to access a locked door or window *through any means of entering*. This is very broad and includes actions ranging from breaking the window - which people generally think of when it comes to forcible entry - to less obvious uses of force like picking the lock or even using a passcard (e.g. a hotel room card) to unlock the door. The FBI also includes when a burglar enters a building legally and then stays past their allowed time such as walking into a store and hiding somewhere until past closing time. 

Figure \@ref(fig:nibrsBurglaryForce) shows the annual trend in the share of burglaries with or without force. Nearly all burglaries at the start of our data used force and has steadily declined until fewer than 60% of burglaries have force in 2022. However, this data is likely affected by differences in reporting by whether force was used. For example, consider two cases of burglary in which the victim does not notice any property stolen. If you come home and find your front door kicked in you'll almost certainly call the police, regardless of if you find any property taken. But if you come home and the door is just unlocked, and do not notice anything stolen, then you may just chalk it up to forgetting to lock the door and never alert the police. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/nibrsBurglaryForce-1} 

}

\caption{The annual percent of burglaries, by whether entry used force, 1991-2023.}(\#fig:nibrsBurglaryForce)
\end{figure}

## Hate crime indicator (bias motivation)

For each offense, NIBRS indicates whether it had a bias motivation, which is NIBRS way of saying if it was a hate crime or not. Offenses are considered hate crimes when the police has some evidence that the offense was motivated - at least in part - against the victim. Since not all hate crimes have evidence of bias (e.g. a person targeted due to bias but without the offender providing evidence that it is a hate crime) many hate crimes will likely not be reported as such. The process for what the FBI classifies as a hate crime is the same in NIBRS as in the Hate Crime dataset discussed in detail in Chapter \@ref(hate_crimes). For more information on how hate crimes are defined and important caveats with these data, please read that chapter. 

Table \@ref(tab:offenseBiasMotivation) shows the percent of all offenses in 2022 that were classified with or without a bias motivation. Nearly all offenses - 99.9% - are without a bias motivation or with an unknown bias motivation meaning that they are not considered hate crimes. 


\begin{longtable}[t]{l|l|r}
\caption{(\#tab:offenseBiasMotivation)The number and percent of incidents that had a known bias motivation for all incidents reported in 2022.}\\
\hline
Bias Motivation & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseBiasMotivation)The number and percent of incidents that had a known bias motivation for all incidents reported in 2022. \textit{(continued)}}\\
\hline
Bias Motivation & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
No Bias Motivation & 12,278,184 & 99.41\textbackslash{}\%\\
\hline
Bias Motivation & 73,366 & 0.59\textbackslash{}\%\\
\hline
Total & 12,351,550 & 100\textbackslash{}\%\\
\hline
\end{longtable}



In Table \@ref(tab:offenseBiasMotivationBiases) we can see the breakdown in the bias motivation of hate crimes, for all incidents where the crime is considered a hate crime. The most common bias motivation is anti-Black, which accounts for 31% of all hate crimes in the data. This is followed by anti-White at 10% and "anti-male homosexual (gay)" at almost 9% of crimes. The only other biases that make up more than 5% of hate crimes are anti-Jewish, anti-Hispanic, and "anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group)."^[Looking at the raw percents is a rather naive measure as it assumes that all groups have equal risk of hate crimes. Certain groups, such as Jews and transgender people, make up a relatively small share of the percent of hate crimes but when considering their percent of the overall population (itself only a slightly better measure as even total population does not account for true opportunity to be victimized) are victimized at much higher rates than many other groups.]

Some of these groups are also subsets of larger groups. For example, anti-Muslim, anti-Arab, and anti-Sikh (while Sikhs are not Muslim or Arabic, some Sikhs have been targeted by people who incorrectly believe that they are) are probably all the same bias motivation. Likewise, attacks on LGBT people are in multiple categories, which allows for a more detailed understanding of these hate crimes but requires aggregation to look at them as a group. While this aggregation is easy enough to do, accidentally missing any of the subcategories could vastly undercount offenses against the larger category.  


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:offenseBiasMotivationBiases)The bias motivation (i.e. if it was a hate crime and what type of hate crime) for all incidents reported in 2022 that were classified as hate crimes.}\\
\hline
Bias Motivation & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseBiasMotivationBiases)The bias motivation (i.e. if it was a hate crime and what type of hate crime) for all incidents reported in 2022 that were classified as hate crimes. \textit{(continued)}}\\
\hline
Bias Motivation & First Year & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Unknown (Offenders Motivation Not Known) & 1992 & 63,648 & 86.75\textbackslash{}\%\\
\hline
Anti-Black Or African American & - & 2,522 & 3.44\textbackslash{}\%\\
\hline
Anti-Jewish & 1992 & 1,415 & 1.93\textbackslash{}\%\\
\hline
Anti-Gay (Male) & 1992 & 866 & 1.18\textbackslash{}\%\\
\hline
Anti-White & 1992 & 776 & 1.06\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 1992 & 740 & 1.01\textbackslash{}\%\\
\hline
Anti-Hispanic Or Latino & 1992 & 680 & 0.93\textbackslash{}\%\\
\hline
Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 1993 & 361 & 0.49\textbackslash{}\%\\
\hline
Anti-Asian & 1992 & 319 & 0.43\textbackslash{}\%\\
\hline
Anti-Transgender & 2013 & 307 & 0.42\textbackslash{}\%\\
\hline
Anti-Islamic (Muslim) & 1994 & 199 & 0.27\textbackslash{}\%\\
\hline
Anti-Multiple Races, Group & 1993 & 186 & 0.25\textbackslash{}\%\\
\hline
Anti-Sikh & 2015 & 137 & 0.19\textbackslash{}\%\\
\hline
Anti-Lesbian (Female) & 1993 & 136 & 0.19\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & 2013 & 126 & 0.17\textbackslash{}\%\\
\hline
Anti-Arab & 1993 & 122 & 0.17\textbackslash{}\%\\
\hline
Anti-American Indian Or Alaskan Native & 1993 & 102 & 0.14\textbackslash{}\%\\
\hline
Anti-Other Religion & 1992 & 98 & 0.13\textbackslash{}\%\\
\hline
Anti-Mental Disability & 1998 & 94 & 0.13\textbackslash{}\%\\
\hline
Anti-Physical Disability & 1997 & 75 & 0.10\textbackslash{}\%\\
\hline
Anti-Catholic & 1993 & 66 & 0.09\textbackslash{}\%\\
\hline
Anti-Other Christian & 2015 & 63 & 0.09\textbackslash{}\%\\
\hline
Anti-Female & 2012 & 59 & 0.08\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Other) & 2015 & 44 & 0.06\textbackslash{}\%\\
\hline
Anti-Multiple Religions, Group & 1993 & 38 & 0.05\textbackslash{}\%\\
\hline
Anti-Bisexual & 1994 & 29 & 0.04\textbackslash{}\%\\
\hline
Anti-Protestant & 1993 & 25 & 0.03\textbackslash{}\%\\
\hline
Anti-Male & 2012 & 22 & 0.03\textbackslash{}\%\\
\hline
Anti-Hindu & 2015 & 21 & 0.03\textbackslash{}\%\\
\hline
Anti-Buddhist & 2016 & 20 & 0.03\textbackslash{}\%\\
\hline
Anti-Church of Jesus Christ (Mormon) & 2015 & 16 & 0.02\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & 1993 & 16 & 0.02\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & 2013 & 15 & 0.02\textbackslash{}\%\\
\hline
Anti-Heterosexual & 1993 & 12 & 0.02\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & 2016 & 11 & 0.01\textbackslash{}\%\\
\hline
Total & - & 73,366 & 100\textbackslash{}\%\\
\hline
\end{longtable}



Even as the number of agencies reporting to NIBRS increased over time, the share of offenses that are considered hate crimes has remained fairly steady, as shown in Figure \@ref(fig:nibrsOffenseBias) with no year having more than 0.1% of offenses considered hate crimes. 


\begin{longtable}[t]{l|l|l|r|r}
\caption{(\#tab:offenseBiasOffense)The number and percent of offenses by bias motivation, 2023. }\\
\hline
  & bias & Offense & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseBiasOffense)The number and percent of offenses by bias motivation, 2023.  \textit{(continued)}}\\
\hline
  & bias & Offense & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
...1 & Anti-American Indian Or Alaskan Native & Assault Offenses - Simple Assault & 24 & 21.82\textbackslash{}\%\\
\hline
...2 & Anti-American Indian Or Alaskan Native & Assault Offenses - Aggravated Assault & 15 & 13.64\textbackslash{}\%\\
\hline
...3 & Anti-American Indian Or Alaskan Native & Larceny/Theft Offenses - All Other Larceny & 10 & 9.09\textbackslash{}\%\\
\hline
...4 & Anti-American Indian Or Alaskan Native & Destruction/Damage/Vandalism of Property & 10 & 9.09\textbackslash{}\%\\
\hline
...5 & Anti-American Indian Or Alaskan Native & Larceny/Theft Offenses - Shoplifting & 8 & 7.27\textbackslash{}\%\\
\hline
...6 & Anti-American Indian Or Alaskan Native & All Other & 43 & 39.11\textbackslash{}\%\\
\hline
...7 & Anti-American Indian Or Alaskan Native & Total & 110 & 100\textbackslash{}\%\\
\hline
...8 & Anti-Arab & Assault Offenses - Intimidation & 51 & 38.35\textbackslash{}\%\\
\hline
...9 & Anti-Arab & Assault Offenses - Simple Assault & 36 & 27.07\textbackslash{}\%\\
\hline
...10 & Anti-Arab & Destruction/Damage/Vandalism of Property & 23 & 17.29\textbackslash{}\%\\
\hline
...11 & Anti-Arab & Assault Offenses - Aggravated Assault & 15 & 11.28\textbackslash{}\%\\
\hline
...12 & Anti-Arab & Fraud Offenses - Identity Theft & 2 & 1.50\textbackslash{}\%\\
\hline
...13 & Anti-Arab & All Other & 6 & 4.5\textbackslash{}\%\\
\hline
...14 & Anti-Arab & Total & 133 & 100\textbackslash{}\%\\
\hline
...15 & Anti-Asian & Assault Offenses - Simple Assault & 103 & 29.86\textbackslash{}\%\\
\hline
...16 & Anti-Asian & Assault Offenses - Intimidation & 99 & 28.70\textbackslash{}\%\\
\hline
...17 & Anti-Asian & Destruction/Damage/Vandalism of Property & 69 & 20.00\textbackslash{}\%\\
\hline
...18 & Anti-Asian & Assault Offenses - Aggravated Assault & 34 & 9.86\textbackslash{}\%\\
\hline
...19 & Anti-Asian & Robbery & 11 & 3.19\textbackslash{}\%\\
\hline
...20 & Anti-Asian & All Other & 29 & 8.41\textbackslash{}\%\\
\hline
...21 & Anti-Asian & Total & 345 & 100\textbackslash{}\%\\
\hline
...22 & Anti-Atheism/Agnosticism & Assault Offenses - Intimidation & 5 & 31.25\textbackslash{}\%\\
\hline
...23 & Anti-Atheism/Agnosticism & Assault Offenses - Simple Assault & 4 & 25.00\textbackslash{}\%\\
\hline
...24 & Anti-Atheism/Agnosticism & Destruction/Damage/Vandalism of Property & 2 & 12.50\textbackslash{}\%\\
\hline
...25 & Anti-Atheism/Agnosticism & Assault Offenses - Aggravated Assault & 2 & 12.50\textbackslash{}\%\\
\hline
...26 & Anti-Atheism/Agnosticism & Larceny/Theft Offenses - All Other Larceny & 1 & 6.25\textbackslash{}\%\\
\hline
...27 & Anti-Atheism/Agnosticism & All Other & 2 & 12.5\textbackslash{}\%\\
\hline
...28 & Anti-Atheism/Agnosticism & Total & 16 & 100\textbackslash{}\%\\
\hline
...29 & Anti-Bisexual & Assault Offenses - Intimidation & 8 & 23.53\textbackslash{}\%\\
\hline
...30 & Anti-Bisexual & Assault Offenses - Simple Assault & 7 & 20.59\textbackslash{}\%\\
\hline
...31 & Anti-Bisexual & Destruction/Damage/Vandalism of Property & 6 & 17.65\textbackslash{}\%\\
\hline
...32 & Anti-Bisexual & Assault Offenses - Aggravated Assault & 3 & 8.82\textbackslash{}\%\\
\hline
...33 & Anti-Bisexual & Extortion/Blackmail & 3 & 8.82\textbackslash{}\%\\
\hline
...34 & Anti-Bisexual & All Other & 7 & 20.58\textbackslash{}\%\\
\hline
...35 & Anti-Bisexual & Total & 34 & 100\textbackslash{}\%\\
\hline
...36 & Anti-Black Or African American & Assault Offenses - Intimidation & 937 & 34.45\textbackslash{}\%\\
\hline
...37 & Anti-Black Or African American & Destruction/Damage/Vandalism of Property & 764 & 28.09\textbackslash{}\%\\
\hline
...38 & Anti-Black Or African American & Assault Offenses - Simple Assault & 576 & 21.18\textbackslash{}\%\\
\hline
...39 & Anti-Black Or African American & Assault Offenses - Aggravated Assault & 284 & 10.44\textbackslash{}\%\\
\hline
...40 & Anti-Black Or African American & Burglary/Breaking And Entering & 27 & 0.99\textbackslash{}\%\\
\hline
...41 & Anti-Black Or African American & All Other & 132 & 4.86\textbackslash{}\%\\
\hline
...42 & Anti-Black Or African American & Total & 2,720 & 100\textbackslash{}\%\\
\hline
...43 & Anti-Buddhist & Assault Offenses - Simple Assault & 4 & 19.05\textbackslash{}\%\\
\hline
...44 & Anti-Buddhist & Destruction/Damage/Vandalism of Property & 3 & 14.29\textbackslash{}\%\\
\hline
...45 & Anti-Buddhist & Larceny/Theft Offenses - All Other Larceny & 3 & 14.29\textbackslash{}\%\\
\hline
...46 & Anti-Buddhist & Assault Offenses - Intimidation & 1 & 4.76\textbackslash{}\%\\
\hline
...47 & Anti-Buddhist & Drug/Narcotic Offenses - Drug/Narcotic Violations & 1 & 4.76\textbackslash{}\%\\
\hline
...48 & Anti-Buddhist & All Other & 9 & 42.84\textbackslash{}\%\\
\hline
...49 & Anti-Buddhist & Total & 21 & 100\textbackslash{}\%\\
\hline
...50 & Anti-Catholic & Destruction/Damage/Vandalism of Property & 54 & 71.05\textbackslash{}\%\\
\hline
...51 & Anti-Catholic & Assault Offenses - Intimidation & 10 & 13.16\textbackslash{}\%\\
\hline
...52 & Anti-Catholic & Larceny/Theft Offenses - All Other Larceny & 4 & 5.26\textbackslash{}\%\\
\hline
...53 & Anti-Catholic & Burglary/Breaking And Entering & 3 & 3.95\textbackslash{}\%\\
\hline
...54 & Anti-Catholic & Arson & 2 & 2.63\textbackslash{}\%\\
\hline
...55 & Anti-Catholic & All Other & 3 & 3.96\textbackslash{}\%\\
\hline
...56 & Anti-Catholic & Total & 76 & 100\textbackslash{}\%\\
\hline
1 & Anti-Church of Jesus Christ (Mormon) & Destruction/Damage/Vandalism of Property & 9 & 56.25\textbackslash{}\%\\
\hline
2 & Anti-Church of Jesus Christ (Mormon) & Assault Offenses - Simple Assault & 3 & 18.75\textbackslash{}\%\\
\hline
3 & Anti-Church of Jesus Christ (Mormon) & Assault Offenses - Intimidation & 3 & 18.75\textbackslash{}\%\\
\hline
4 & Anti-Church of Jesus Christ (Mormon) & Arson & 1 & 6.25\textbackslash{}\%\\
\hline
NA & NA & NA & NA & NA\\
\hline
...62 & Anti-Church of Jesus Christ (Mormon) & All Other & NA & NA\textbackslash{}\%\\
\hline
...63 & Anti-Church of Jesus Christ (Mormon) & Total & 16 & 100\textbackslash{}\%\\
\hline
...64 & Anti-Eastern Orthodox (Greek, Russian, Other) & Destruction/Damage/Vandalism of Property & 11 & 18.97\textbackslash{}\%\\
\hline
...65 & Anti-Eastern Orthodox (Greek, Russian, Other) & Drug/Narcotic Offenses - Drug/Narcotic Violations & 6 & 10.34\textbackslash{}\%\\
\hline
...66 & Anti-Eastern Orthodox (Greek, Russian, Other) & Larceny/Theft Offenses - Shoplifting & 6 & 10.34\textbackslash{}\%\\
\hline
...67 & Anti-Eastern Orthodox (Greek, Russian, Other) & Assault Offenses - Aggravated Assault & 5 & 8.62\textbackslash{}\%\\
\hline
...68 & Anti-Eastern Orthodox (Greek, Russian, Other) & Assault Offenses - Simple Assault & 4 & 6.90\textbackslash{}\%\\
\hline
...69 & Anti-Eastern Orthodox (Greek, Russian, Other) & All Other & 26 & 44.83\textbackslash{}\%\\
\hline
...70 & Anti-Eastern Orthodox (Greek, Russian, Other) & Total & 58 & 100\textbackslash{}\%\\
\hline
...71 & Anti-Female & Assault Offenses - Intimidation & 17 & 25.00\textbackslash{}\%\\
\hline
...72 & Anti-Female & Assault Offenses - Simple Assault & 15 & 22.06\textbackslash{}\%\\
\hline
...73 & Anti-Female & Assault Offenses - Aggravated Assault & 8 & 11.76\textbackslash{}\%\\
\hline
...74 & Anti-Female & Destruction/Damage/Vandalism of Property & 5 & 7.35\textbackslash{}\%\\
\hline
...75 & Anti-Female & Sex Offenses - Fondling (Indecent Liberties/Child Molest) & 3 & 4.41\textbackslash{}\%\\
\hline
...76 & Anti-Female & All Other & 20 & 29.4\textbackslash{}\%\\
\hline
...77 & Anti-Female & Total & 68 & 100\textbackslash{}\%\\
\hline
...78 & Anti-Gay (Male) & Assault Offenses - Simple Assault & 276 & 29.84\textbackslash{}\%\\
\hline
...79 & Anti-Gay (Male) & Assault Offenses - Intimidation & 257 & 27.78\textbackslash{}\%\\
\hline
...80 & Anti-Gay (Male) & Destruction/Damage/Vandalism of Property & 151 & 16.32\textbackslash{}\%\\
\hline
...81 & Anti-Gay (Male) & Assault Offenses - Aggravated Assault & 129 & 13.95\textbackslash{}\%\\
\hline
...82 & Anti-Gay (Male) & Larceny/Theft Offenses - All Other Larceny & 36 & 3.89\textbackslash{}\%\\
\hline
...83 & Anti-Gay (Male) & All Other & 76 & 8.24\textbackslash{}\%\\
\hline
...84 & Anti-Gay (Male) & Total & 925 & 100\textbackslash{}\%\\
\hline
...85 & Anti-Gender Non-Conforming & Destruction/Damage/Vandalism of Property & 28 & 20.29\textbackslash{}\%\\
\hline
...86 & Anti-Gender Non-Conforming & Assault Offenses - Simple Assault & 25 & 18.12\textbackslash{}\%\\
\hline
...87 & Anti-Gender Non-Conforming & Larceny/Theft Offenses - All Other Larceny & 14 & 10.14\textbackslash{}\%\\
\hline
...88 & Anti-Gender Non-Conforming & Drug/Narcotic Offenses - Drug/Narcotic Violations & 13 & 9.42\textbackslash{}\%\\
\hline
...89 & Anti-Gender Non-Conforming & Assault Offenses - Intimidation & 13 & 9.42\textbackslash{}\%\\
\hline
...90 & Anti-Gender Non-Conforming & All Other & 45 & 32.57\textbackslash{}\%\\
\hline
...91 & Anti-Gender Non-Conforming & Total & 138 & 100\textbackslash{}\%\\
\hline
...92 & Anti-Heterosexual & Destruction/Damage/Vandalism of Property & 4 & 30.77\textbackslash{}\%\\
\hline
...93 & Anti-Heterosexual & Assault Offenses - Intimidation & 2 & 15.38\textbackslash{}\%\\
\hline
...94 & Anti-Heterosexual & Assault Offenses - Simple Assault & 2 & 15.38\textbackslash{}\%\\
\hline
...95 & Anti-Heterosexual & Larceny/Theft Offenses - All Other Larceny & 2 & 15.38\textbackslash{}\%\\
\hline
...96 & Anti-Heterosexual & Assault Offenses - Aggravated Assault & 1 & 7.69\textbackslash{}\%\\
\hline
...97 & Anti-Heterosexual & All Other & 2 & 15.38\textbackslash{}\%\\
\hline
...98 & Anti-Heterosexual & Total & 13 & 100\textbackslash{}\%\\
\hline
...99 & Anti-Hindu & Destruction/Damage/Vandalism of Property & 6 & 27.27\textbackslash{}\%\\
\hline
...100 & Anti-Hindu & Assault Offenses - Simple Assault & 5 & 22.73\textbackslash{}\%\\
\hline
...101 & Anti-Hindu & Assault Offenses - Intimidation & 5 & 22.73\textbackslash{}\%\\
\hline
...102 & Anti-Hindu & Motor Vehicle Theft & 1 & 4.55\textbackslash{}\%\\
\hline
...103 & Anti-Hindu & Assault Offenses - Aggravated Assault & 1 & 4.55\textbackslash{}\%\\
\hline
...104 & Anti-Hindu & All Other & 4 & 18.2\textbackslash{}\%\\
\hline
...105 & Anti-Hindu & Total & 22 & 100\textbackslash{}\%\\
\hline
...106 & Anti-Hispanic Or Latino & Assault Offenses - Intimidation & 242 & 33.02\textbackslash{}\%\\
\hline
...107 & Anti-Hispanic Or Latino & Assault Offenses - Simple Assault & 228 & 31.11\textbackslash{}\%\\
\hline
...108 & Anti-Hispanic Or Latino & Assault Offenses - Aggravated Assault & 129 & 17.60\textbackslash{}\%\\
\hline
...109 & Anti-Hispanic Or Latino & Destruction/Damage/Vandalism of Property & 75 & 10.23\textbackslash{}\%\\
\hline
...110 & Anti-Hispanic Or Latino & Robbery & 19 & 2.59\textbackslash{}\%\\
\hline
...111 & Anti-Hispanic Or Latino & All Other & 40 & 5.47\textbackslash{}\%\\
\hline
...112 & Anti-Hispanic Or Latino & Total & 733 & 100\textbackslash{}\%\\
\hline
...113 & Anti-Islamic (Muslim) & Assault Offenses - Intimidation & 99 & 46.05\textbackslash{}\%\\
\hline
...114 & Anti-Islamic (Muslim) & Destruction/Damage/Vandalism of Property & 45 & 20.93\textbackslash{}\%\\
\hline
...115 & Anti-Islamic (Muslim) & Assault Offenses - Simple Assault & 42 & 19.53\textbackslash{}\%\\
\hline
...116 & Anti-Islamic (Muslim) & Assault Offenses - Aggravated Assault & 13 & 6.05\textbackslash{}\%\\
\hline
...117 & Anti-Islamic (Muslim) & Larceny/Theft Offenses - All Other Larceny & 3 & 1.40\textbackslash{}\%\\
\hline
...118 & Anti-Islamic (Muslim) & All Other & 13 & 6.07\textbackslash{}\%\\
\hline
...119 & Anti-Islamic (Muslim) & Total & 215 & 100\textbackslash{}\%\\
\hline
...120 & Anti-Jehovahs Witness & Destruction/Damage/Vandalism of Property & 4 & 28.57\textbackslash{}\%\\
\hline
...121 & Anti-Jehovahs Witness & Assault Offenses - Intimidation & 1 & 7.14\textbackslash{}\%\\
\hline
...122 & Anti-Jehovahs Witness & Arson & 1 & 7.14\textbackslash{}\%\\
\hline
...123 & Anti-Jehovahs Witness & Pornography/Obscene Material & 1 & 7.14\textbackslash{}\%\\
\hline
...124 & Anti-Jehovahs Witness & Larceny/Theft Offenses - Theft From Motor Vehicle & 1 & 7.14\textbackslash{}\%\\
\hline
...125 & Anti-Jehovahs Witness & All Other & 6 & 42.84\textbackslash{}\%\\
\hline
...126 & Anti-Jehovahs Witness & Total & 14 & 100\textbackslash{}\%\\
\hline
...127 & Anti-Jewish & Destruction/Damage/Vandalism of Property & 784 & 52.34\textbackslash{}\%\\
\hline
...128 & Anti-Jewish & Assault Offenses - Intimidation & 492 & 32.84\textbackslash{}\%\\
\hline
...129 & Anti-Jewish & Assault Offenses - Simple Assault & 71 & 4.74\textbackslash{}\%\\
\hline
...130 & Anti-Jewish & Larceny/Theft Offenses - All Other Larceny & 63 & 4.21\textbackslash{}\%\\
\hline
...131 & Anti-Jewish & Assault Offenses - Aggravated Assault & 33 & 2.20\textbackslash{}\%\\
\hline
...132 & Anti-Jewish & All Other & 55 & 3.68\textbackslash{}\%\\
\hline
...133 & Anti-Jewish & Total & 1,498 & 100\textbackslash{}\%\\
\hline
...134 & Anti-Lesbian (Female) & Assault Offenses - Intimidation & 52 & 35.37\textbackslash{}\%\\
\hline
...135 & Anti-Lesbian (Female) & Assault Offenses - Simple Assault & 37 & 25.17\textbackslash{}\%\\
\hline
...136 & Anti-Lesbian (Female) & Destruction/Damage/Vandalism of Property & 23 & 15.65\textbackslash{}\%\\
\hline
...137 & Anti-Lesbian (Female) & Assault Offenses - Aggravated Assault & 18 & 12.24\textbackslash{}\%\\
\hline
...138 & Anti-Lesbian (Female) & Larceny/Theft Offenses - All Other Larceny & 9 & 6.12\textbackslash{}\%\\
\hline
...139 & Anti-Lesbian (Female) & All Other & 8 & 5.44\textbackslash{}\%\\
\hline
...140 & Anti-Lesbian (Female) & Total & 147 & 100\textbackslash{}\%\\
\hline
...141 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Destruction/Damage/Vandalism of Property & 277 & 33.58\textbackslash{}\%\\
\hline
...142 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Intimidation & 169 & 20.48\textbackslash{}\%\\
\hline
...143 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Larceny/Theft Offenses - All Other Larceny & 150 & 18.18\textbackslash{}\%\\
\hline
...144 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Simple Assault & 124 & 15.03\textbackslash{}\%\\
\hline
...145 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Aggravated Assault & 50 & 6.06\textbackslash{}\%\\
\hline
...146 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & All Other & 55 & 6.65\textbackslash{}\%\\
\hline
...147 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Total & 825 & 100\textbackslash{}\%\\
\hline
...148 & Anti-Male & Destruction/Damage/Vandalism of Property & 6 & 23.08\textbackslash{}\%\\
\hline
...149 & Anti-Male & Assault Offenses - Simple Assault & 6 & 23.08\textbackslash{}\%\\
\hline
...150 & Anti-Male & Assault Offenses - Intimidation & 4 & 15.38\textbackslash{}\%\\
\hline
...151 & Anti-Male & Drug/Narcotic Offenses - Drug/Narcotic Violations & 2 & 7.69\textbackslash{}\%\\
\hline
...152 & Anti-Male & Larceny/Theft Offenses - All Other Larceny & 1 & 3.85\textbackslash{}\%\\
\hline
...153 & Anti-Male & All Other & 7 & 26.95\textbackslash{}\%\\
\hline
...154 & Anti-Male & Total & 26 & 100\textbackslash{}\%\\
\hline
...155 & Anti-Mental Disability & Assault Offenses - Simple Assault & 30 & 27.78\textbackslash{}\%\\
\hline
...156 & Anti-Mental Disability & Assault Offenses - Aggravated Assault & 22 & 20.37\textbackslash{}\%\\
\hline
...157 & Anti-Mental Disability & Assault Offenses - Intimidation & 17 & 15.74\textbackslash{}\%\\
\hline
...158 & Anti-Mental Disability & Larceny/Theft Offenses - All Other Larceny & 9 & 8.33\textbackslash{}\%\\
\hline
...159 & Anti-Mental Disability & Destruction/Damage/Vandalism of Property & 8 & 7.41\textbackslash{}\%\\
\hline
...160 & Anti-Mental Disability & All Other & 22 & 20.41\textbackslash{}\%\\
\hline
...161 & Anti-Mental Disability & Total & 108 & 100\textbackslash{}\%\\
\hline
...162 & Anti-Multiple Races, Group & Destruction/Damage/Vandalism of Property & 97 & 49.24\textbackslash{}\%\\
\hline
...163 & Anti-Multiple Races, Group & Assault Offenses - Intimidation & 57 & 28.93\textbackslash{}\%\\
\hline
...164 & Anti-Multiple Races, Group & Assault Offenses - Simple Assault & 23 & 11.68\textbackslash{}\%\\
\hline
...165 & Anti-Multiple Races, Group & Assault Offenses - Aggravated Assault & 11 & 5.58\textbackslash{}\%\\
\hline
...166 & Anti-Multiple Races, Group & Weapon Law Violations - Weapon Law Violations & 2 & 1.02\textbackslash{}\%\\
\hline
...167 & Anti-Multiple Races, Group & All Other & 7 & 3.57\textbackslash{}\%\\
\hline
...168 & Anti-Multiple Races, Group & Total & 197 & 100\textbackslash{}\%\\
\hline
...169 & Anti-Multiple Religions, Group & Destruction/Damage/Vandalism of Property & 18 & 40.91\textbackslash{}\%\\
\hline
...170 & Anti-Multiple Religions, Group & Assault Offenses - Intimidation & 7 & 15.91\textbackslash{}\%\\
\hline
...171 & Anti-Multiple Religions, Group & Assault Offenses - Simple Assault & 7 & 15.91\textbackslash{}\%\\
\hline
...172 & Anti-Multiple Religions, Group & Larceny/Theft Offenses - All Other Larceny & 3 & 6.82\textbackslash{}\%\\
\hline
...173 & Anti-Multiple Religions, Group & Drug/Narcotic Offenses - Drug/Narcotic Violations & 2 & 4.55\textbackslash{}\%\\
\hline
...174 & Anti-Multiple Religions, Group & All Other & 7 & 15.9\textbackslash{}\%\\
\hline
...175 & Anti-Multiple Religions, Group & Total & 44 & 100\textbackslash{}\%\\
\hline
...176 & Anti-Native Hawaiian Or Other Pacific Islander & Assault Offenses - Simple Assault & 5 & 31.25\textbackslash{}\%\\
\hline
...177 & Anti-Native Hawaiian Or Other Pacific Islander & Assault Offenses - Intimidation & 4 & 25.00\textbackslash{}\%\\
\hline
...178 & Anti-Native Hawaiian Or Other Pacific Islander & Weapon Law Violations - Weapon Law Violations & 2 & 12.50\textbackslash{}\%\\
\hline
...179 & Anti-Native Hawaiian Or Other Pacific Islander & Larceny/Theft Offenses - All Other Larceny & 2 & 12.50\textbackslash{}\%\\
\hline
...180 & Anti-Native Hawaiian Or Other Pacific Islander & Kidnapping/Abduction & 1 & 6.25\textbackslash{}\%\\
\hline
...181 & Anti-Native Hawaiian Or Other Pacific Islander & All Other & 2 & 12.5\textbackslash{}\%\\
\hline
...182 & Anti-Native Hawaiian Or Other Pacific Islander & Total & 16 & 100\textbackslash{}\%\\
\hline
...183 & Anti-Other Christian & Destruction/Damage/Vandalism of Property & 34 & 47.89\textbackslash{}\%\\
\hline
...184 & Anti-Other Christian & Assault Offenses - Intimidation & 16 & 22.54\textbackslash{}\%\\
\hline
...185 & Anti-Other Christian & Burglary/Breaking And Entering & 4 & 5.63\textbackslash{}\%\\
\hline
...186 & Anti-Other Christian & Larceny/Theft Offenses - All Other Larceny & 4 & 5.63\textbackslash{}\%\\
\hline
...187 & Anti-Other Christian & Assault Offenses - Simple Assault & 4 & 5.63\textbackslash{}\%\\
\hline
...188 & Anti-Other Christian & All Other & 9 & 12.69\textbackslash{}\%\\
\hline
...189 & Anti-Other Christian & Total & 71 & 100\textbackslash{}\%\\
\hline
...190 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Destruction/Damage/Vandalism of Property & 112 & 29.55\textbackslash{}\%\\
\hline
...191 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Intimidation & 100 & 26.39\textbackslash{}\%\\
\hline
...192 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Simple Assault & 84 & 22.16\textbackslash{}\%\\
\hline
...193 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Aggravated Assault & 32 & 8.44\textbackslash{}\%\\
\hline
...194 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Larceny/Theft Offenses - All Other Larceny & 15 & 3.96\textbackslash{}\%\\
\hline
...195 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & All Other & 36 & 9.46\textbackslash{}\%\\
\hline
...196 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Total & 379 & 100\textbackslash{}\%\\
\hline
...197 & Anti-Other Religion & Destruction/Damage/Vandalism of Property & 52 & 49.06\textbackslash{}\%\\
\hline
...198 & Anti-Other Religion & Assault Offenses - Intimidation & 23 & 21.70\textbackslash{}\%\\
\hline
...199 & Anti-Other Religion & Assault Offenses - Simple Assault & 9 & 8.49\textbackslash{}\%\\
\hline
...200 & Anti-Other Religion & Assault Offenses - Aggravated Assault & 5 & 4.72\textbackslash{}\%\\
\hline
...201 & Anti-Other Religion & Burglary/Breaking And Entering & 4 & 3.77\textbackslash{}\%\\
\hline
...202 & Anti-Other Religion & All Other & 13 & 12.26\textbackslash{}\%\\
\hline
...203 & Anti-Other Religion & Total & 106 & 100\textbackslash{}\%\\
\hline
...204 & Anti-Physical Disability & Assault Offenses - Intimidation & 27 & 32.53\textbackslash{}\%\\
\hline
...205 & Anti-Physical Disability & Assault Offenses - Simple Assault & 24 & 28.92\textbackslash{}\%\\
\hline
...206 & Anti-Physical Disability & Destruction/Damage/Vandalism of Property & 9 & 10.84\textbackslash{}\%\\
\hline
...207 & Anti-Physical Disability & Assault Offenses - Aggravated Assault & 8 & 9.64\textbackslash{}\%\\
\hline
...208 & Anti-Physical Disability & Larceny/Theft Offenses - All Other Larceny & 4 & 4.82\textbackslash{}\%\\
\hline
...209 & Anti-Physical Disability & All Other & 11 & 13.22\textbackslash{}\%\\
\hline
...210 & Anti-Physical Disability & Total & 83 & 100\textbackslash{}\%\\
\hline
...211 & Anti-Protestant & Destruction/Damage/Vandalism of Property & 8 & 26.67\textbackslash{}\%\\
\hline
...212 & Anti-Protestant & Assault Offenses - Intimidation & 3 & 10.00\textbackslash{}\%\\
\hline
...213 & Anti-Protestant & Burglary/Breaking And Entering & 3 & 10.00\textbackslash{}\%\\
\hline
...214 & Anti-Protestant & Assault Offenses - Simple Assault & 3 & 10.00\textbackslash{}\%\\
\hline
...215 & Anti-Protestant & Assault Offenses - Aggravated Assault & 3 & 10.00\textbackslash{}\%\\
\hline
...216 & Anti-Protestant & All Other & 10 & 33.33\textbackslash{}\%\\
\hline
...217 & Anti-Protestant & Total & 30 & 100\textbackslash{}\%\\
\hline
...218 & Anti-Sikh & Destruction/Damage/Vandalism of Property & 27 & 17.42\textbackslash{}\%\\
\hline
...219 & Anti-Sikh & Larceny/Theft Offenses - All Other Larceny & 20 & 12.90\textbackslash{}\%\\
\hline
...220 & Anti-Sikh & Assault Offenses - Simple Assault & 17 & 10.97\textbackslash{}\%\\
\hline
...221 & Anti-Sikh & Drug/Narcotic Offenses - Drug/Narcotic Violations & 14 & 9.03\textbackslash{}\%\\
\hline
...222 & Anti-Sikh & Larceny/Theft Offenses - Theft From Motor Vehicle & 13 & 8.39\textbackslash{}\%\\
\hline
...223 & Anti-Sikh & All Other & 64 & 41.34\textbackslash{}\%\\
\hline
...224 & Anti-Sikh & Total & 155 & 100\textbackslash{}\%\\
\hline
...225 & Anti-Transgender & Assault Offenses - Intimidation & 112 & 34.67\textbackslash{}\%\\
\hline
...226 & Anti-Transgender & Assault Offenses - Simple Assault & 79 & 24.46\textbackslash{}\%\\
\hline
...227 & Anti-Transgender & Assault Offenses - Aggravated Assault & 41 & 12.69\textbackslash{}\%\\
\hline
...228 & Anti-Transgender & Destruction/Damage/Vandalism of Property & 38 & 11.76\textbackslash{}\%\\
\hline
...229 & Anti-Transgender & Larceny/Theft Offenses - All Other Larceny & 14 & 4.33\textbackslash{}\%\\
\hline
...230 & Anti-Transgender & All Other & 39 & 12.09\textbackslash{}\%\\
\hline
...231 & Anti-Transgender & Total & 323 & 100\textbackslash{}\%\\
\hline
...232 & Anti-White & Assault Offenses - Simple Assault & 230 & 27.68\textbackslash{}\%\\
\hline
...233 & Anti-White & Assault Offenses - Intimidation & 189 & 22.74\textbackslash{}\%\\
\hline
...234 & Anti-White & Assault Offenses - Aggravated Assault & 94 & 11.31\textbackslash{}\%\\
\hline
...235 & Anti-White & Destruction/Damage/Vandalism of Property & 90 & 10.83\textbackslash{}\%\\
\hline
...236 & Anti-White & Larceny/Theft Offenses - All Other Larceny & 49 & 5.90\textbackslash{}\%\\
\hline
...237 & Anti-White & All Other & 179 & 21.52\textbackslash{}\%\\
\hline
...238 & Anti-White & Total & 831 & 100\textbackslash{}\%\\
\hline
...239 & Unknown (Offenders Motivation Not Known) & Larceny/Theft Offenses - All Other Larceny & 9,603 & 13.32\textbackslash{}\%\\
\hline
...240 & Unknown (Offenders Motivation Not Known) & Assault Offenses - Simple Assault & 9,529 & 13.22\textbackslash{}\%\\
\hline
...241 & Unknown (Offenders Motivation Not Known) & Destruction/Damage/Vandalism of Property & 9,499 & 13.17\textbackslash{}\%\\
\hline
...242 & Unknown (Offenders Motivation Not Known) & Drug/Narcotic Offenses - Drug/Narcotic Violations & 5,418 & 7.51\textbackslash{}\%\\
\hline
...243 & Unknown (Offenders Motivation Not Known) & Burglary/Breaking And Entering & 4,916 & 6.82\textbackslash{}\%\\
\hline
...244 & Unknown (Offenders Motivation Not Known) & All Other & 33,139 & 45.97\textbackslash{}\%\\
\hline
...245 & Unknown (Offenders Motivation Not Known) & Total & 72,104 & 100\textbackslash{}\%\\
\hline
\end{longtable}




\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/nibrsOffenseBias-1} 

}

\caption{The annual percent of offenses reported as having a bias motivation (i.e. hate crime), 1993-2023.}(\#fig:nibrsOffenseBias)
\end{figure}
