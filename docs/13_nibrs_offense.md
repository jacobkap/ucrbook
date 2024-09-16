# Offense Segment {#offenseSegment}





This dataset provides information about the offense that occurred, with each incident potentially having multiple offenses. Each row is an incident-offense so incidents with multiple offenses would have multiple rows. For a subset of offenses it also provides a more detailed subcategory of offense, allowing a deeper dive into what exactly happened. For example, for animal abuse there are four subcategories of offenses: simple/gross neglect of an animal, intentional abuse or torture, animal sexual abuse (bestiality), and organized fighting of animals such as dog or cock fights. 

There is also information for what date the crime occurred on, where the crime occurred - in categories such as residence or sidewalk rather than an address - whether the offender is suspected of using drugs, alcohol, or "computer equipment" (which includes cell phones) during the crime, and which weapon was involved. In cases where the weapon was a firearm it says whether that weapon was fully automatic or not. It also provides information on if the crime was a hate crime by including a variable on the bias motivation (if any) of the offender. This is based on evidence that the crime was motivated, at least in part, by the victim's group (e.g. race, sexuality, religion, etc.). There are 34 possible bias motivations and while hate crimes could potentially be motivated by bias against multiple groups, this data only allows for a single bias motivation.

As you look through this data yourself you may be surprised that some common crimes, such as DUIs and disorderly conduct, are missing. That is because some crimes, which the FBI calls "Group B" crimes, are reported only when an arrest is made and only as part of the "Group B Arrest Report" segment. Therefore, none of these offenses will be reported in the Offense Segment. We'll discuss these Group B offenses when we discuss arrestees in Chapter \@ref(arrestee). 

## Crime category

The most important variable in the Offense Segment is figuring out exactly what offense was committed. This tells you what crimes occurred in the incident. There can be multiple crimes in a single incident so this provides info about each offense that happened. To figure out which offenses belong together, just look at the incident number, year, and the ORI. Within ORI and year, each incident number is a unique identifier for an incident. Be careful that you're using all three of these variables as the incident number may be the same in different agencies, or in the same agency in different years, but these refer to different incidents.

Each crime is mutually exclusive and crimes which are elements of another crime are not double-counted. For example, robberies are basically theft plus assault/intimidation - it is the use of force (assault) or the threat of force (intimidation) to take property (theft). A case of robbery in this data would only count as robbery, not as robbery and theft and assault/intimidation. If there are these crimes together in an incident that is because that crime *also* occurred separately. For example, if someone is robbed and after the robbery is over (i.e. they hand over their belongings) they are then punched repeatedly, that could potentially be classified as a robbery and an assault. 

Table \@ref(tab:offenseCrimeCategories) shows each possible crime in the data and how common it was in 2022. It is sorted by frequency instead of alphabetically so it is easier to see which crimes are most common. There were about 13 million crimes reported to NIBRS in 2022. The most common crime is simple assault - which is an assault that did not use a weapon and did not result in serious injury - at 14% of crimes, or about 1.7 million crimes. If you think this is odd because property crimes are more common than violent crimes, you would be right. NIBRS data is pretty specific in its crime categories so it splits up certain crimes into a number of different categories. Theft is the most common crime committed in the United States. In NIBRS it is broken into several different types of theft so you need to combine them together to actually measure theft in its entirety. Of the top 6 most common crimes, theft crimes make up ranks 3, 5, and 6 (all other larceny, theft from motor vehicle, and shoplifting), and there are other theft offenses that are less common such as "theft from building" and "theft of motor vehicle parts/accessories." 

This table also shows the first year that offense is included in the data. Most offenses have been included since NIBRS started in 1991, but these have been new offenses added, with these additions becoming more common recently. For example, the crime "Failure to register as a sex offender" was added in 2021 as was "Illegal entry into the United States." There are even offenses that were not reported at all in 2022, such as "treason," which is an offense that only federal and tribal agencies are allowed to report. 


\begin{longtable}[t]{l|r|r|l}
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
Assault Offenses - Simple Assault & 1991 & 1,725,221 & 13.57\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 1991 & 1,499,936 & 11.80\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 1991 & 1,341,444 & 10.55\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & 1991 & 993,308 & 7.81\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 1991 & 851,640 & 6.70\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 1991 & 733,952 & 5.77\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1991 & 721,788 & 5.68\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 673,144 & 5.30\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 1991 & 540,892 & 4.25\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 1991 & 474,517 & 3.73\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & 1991 & 467,075 & 3.67\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 1991 & 378,447 & 2.98\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1991 & 337,056 & 2.65\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & 1991 & 326,104 & 2.57\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 1991 & 279,349 & 2.20\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 1991 & 190,962 & 1.50\textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & 2015 & 186,144 & 1.46\textbackslash{}\%\\
\hline
Robbery & 1991 & 149,999 & 1.18\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 1991 & 147,991 & 1.16\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 1991 & 115,472 & 0.91\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & 1991 & 80,711 & 0.63\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 1991 & 79,049 & 0.62\textbackslash{}\%\\
\hline
Sex Offenses - Rape & 1991 & 76,495 & 0.60\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1991 & 39,885 & 0.31\textbackslash{}\%\\
\hline
Kidnapping/Abduction & 1991 & 39,148 & 0.31\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & 1991 & 38,373 & 0.30\textbackslash{}\%\\
\hline
Embezzlement & 1991 & 32,487 & 0.26\textbackslash{}\%\\
\hline
Arson & 1991 & 30,178 & 0.24\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 1991 & 21,078 & 0.17\textbackslash{}\%\\
\hline
Animal Cruelty & 2015 & 20,527 & 0.16\textbackslash{}\%\\
\hline
Extortion/Blackmail & 1991 & 20,305 & 0.16\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & 1991 & 18,353 & 0.14\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & 1991 & 14,994 & 0.12\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 1991 & 11,278 & 0.09\textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & 2015 & 8,151 & 0.06\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & 1991 & 7,871 & 0.06\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & 1991 & 7,752 & 0.06\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & 1991 & 7,670 & 0.06\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & 1991 & 5,500 & 0.04\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & 1991 & 4,580 & 0.04\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 1991 & 2,961 & 0.02\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & 2013 & 2,380 & 0.02\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 2013 & 1,818 & 0.01\textbackslash{}\%\\
\hline
Negligent Manslaughter & 1991 & 1,588 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Incest & 1991 & 1,175 & 0.01\textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & 1991 & 909 & 0.01\textbackslash{}\%\\
\hline
Bribery & 1991 & 652 & 0.01\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & 1991 & 649 & 0.01\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & 1991 & 617 & 0.00\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & 1991 & 560 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 2014 & 416 & 0.00\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & 2020 & 145 & 0.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & 2021 & 68 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Failure To Register As A Sex Offender & 2021 & 27 & 0.00\textbackslash{}\%\\
\hline
Fraud Offenses - Money Laundering & 2022 & 7 & 0.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & 2021 & 4 & 0.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & 2021 & 3 & 0.00\textbackslash{}\%\\
\hline
Immigration Violations - Illegal Entry Into The United States & 2020 & 3 & 0.00\textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & 1994 & 3 & 0.00\textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Deportation & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Violation of National Firearm Act of 1934 & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
Total & - & 12,712,813 & 100\textbackslash{}\%\\
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


\begin{longtable}[t]{l|r|r|l}
\caption{(\#tab:offenseCrimeSubcategories)The number and percent of crime subtypes by offense, 2022. This breakdown is only available for a subset of offenses. There can be up to three subtypes per offense; in this table we only use the first subtype.}\\
\hline
Crime & Crime Subcategory & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseCrimeSubcategories)The number and percent of crime subtypes by offense, 2022. This breakdown is only available for a subset of offenses. There can be up to three subtypes per offense; in this table we only use the first subtype. \textit{(continued)}}\\
\hline
Crime & Crime Subcategory & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Animal Cruelty & Simple/Gross Neglect (Unintentionally, Intentionally, Or Knowingly Failing To Provide Food, Water, Shelter, Veterinary Care, Hoarding, Etc.) & 13,144 & 64.03\textbackslash{}\%\\
\hline
Animal Cruelty & Intentional Abuse And Torture (Tormenting, Mutilating, Poisoning, Or Abandonment) & 6,835 & 33.30\textbackslash{}\%\\
\hline
Animal Cruelty & Animal Sexual Abuse (Bestiality) & 293 & 1.43\textbackslash{}\%\\
\hline
Animal Cruelty & Organized Abuse (Dog Fighting And Cock Fighting) & 255 & 1.24\textbackslash{}\%\\
\hline
Animal Cruelty & Total & 20,527 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & None/Unknown Gang Involvement (Mutually Exclusive) & 292,170 & 54.02\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & None & 243,941 & 45.10\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other Gang & 3,701 & 0.68\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Juvenile Gang Involvement & 1,080 & 0.20\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 540,892 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & None/Unknown Gang Involvement (Mutually Exclusive) & 265,718 & 56.00\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & None & 206,580 & 43.53\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Other Gang & 1,682 & 0.35\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Juvenile Gang Involvement & 537 & 0.11\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & Total & 474,517 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & None/Unknown Gang Involvement (Mutually Exclusive) & 939,861 & 54.48\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & None & 780,608 & 45.25\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Other Gang & 3,246 & 0.19\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Juvenile Gang Involvement & 1,506 & 0.09\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 1,725,221 & 100\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Using/Consuming & 104 & 71.72\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Possessing/Concealing & 37 & 25.52\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Distributing/Selling & 3 & 2.07\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Buying/Receiving & 1 & 0.69\textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & Total & 145 & 100\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Possessing/Concealing & 52,146 & 35.24\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Using/Consuming & 30,247 & 20.44\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Cultivating/Manufacturing/Publishing & 28,423 & 19.21\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Buying/Receiving & 24,592 & 16.62\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Distributing/Selling & 6,967 & 4.71\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Operating/Promoting/Assisting & 3,383 & 2.29\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Transporting/Transmitting/Importing & 2,165 & 1.46\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Exploiting Children & 68 & 0.05\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & Total & 147,991 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Possessing/Concealing & 415,267 & 88.91\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Using/Consuming & 36,401 & 7.79\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Distributing/Selling & 7,936 & 1.70\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Buying/Receiving & 4,500 & 0.96\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Transporting/Transmitting/Importing & 1,223 & 0.26\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Operating/Promoting/Assisting & 1,032 & 0.22\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Cultivating/Manufacturing/Publishing & 694 & 0.15\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Exploiting Children & 22 & 0.00\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & Total & 467,075 & 100\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Possessing/Concealing & 789,994 & 79.53\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Distributing/Selling & 90,927 & 9.15\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Using/Consuming & 81,161 & 8.17\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Buying/Receiving & 17,783 & 1.79\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Transporting/Transmitting/Importing & 6,117 & 0.62\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Cultivating/Manufacturing/Publishing & 5,247 & 0.53\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Operating/Promoting/Assisting & 1,978 & 0.20\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Exploiting Children & 101 & 0.01\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & Total & 993,308 & 100\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Possessing/Concealing & 2 & 66.67\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Operating/Promoting/Assisting & 1 & 33.33\textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & Total & 3 & 100\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Possessing/Concealing & 286 & 51.07\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Operating/Promoting/Assisting & 244 & 43.57\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Distributing/Selling & 9 & 1.61\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Using/Consuming & 8 & 1.43\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Cultivating/Manufacturing/Publishing & 7 & 1.25\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Buying/Receiving & 5 & 0.89\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Transporting/Transmitting/Importing & 1 & 0.18\textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & Total & 560 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & None/Unknown Gang Involvement (Mutually Exclusive) & 20,866 & 53.30\textbackslash{}\%\\
\hline
Kidnapping/Abduction & None & 18,080 & 46.18\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other Gang & 169 & 0.43\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Juvenile Gang Involvement & 33 & 0.08\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 39,148 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & None/Unknown Gang Involvement (Mutually Exclusive) & 8,247 & 55.00\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & None & 6,386 & 42.59\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other Gang & 320 & 2.13\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Juvenile Gang Involvement & 41 & 0.27\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 14,994 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & None/Unknown Gang Involvement (Mutually Exclusive) & 847 & 53.34\textbackslash{}\%\\
\hline
Negligent Manslaughter & None & 735 & 46.28\textbackslash{}\%\\
\hline
Negligent Manslaughter & Other Gang & 5 & 0.31\textbackslash{}\%\\
\hline
Negligent Manslaughter & Juvenile Gang Involvement & 1 & 0.06\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 1,588 & 100\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Exploiting Children & 12,595 & 31.58\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Possessing/Concealing & 10,677 & 26.77\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Distributing/Selling & 9,304 & 23.33\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Cultivating/Manufacturing/Publishing & 3,112 & 7.80\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Transporting/Transmitting/Importing & 1,651 & 4.14\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Operating/Promoting/Assisting & 978 & 2.45\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Buying/Receiving & 915 & 2.29\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Using/Consuming & 653 & 1.64\textbackslash{}\%\\
\hline
Pornography/Obscene Material & Total & 39,885 & 100\textbackslash{}\%\\
\hline
Robbery & None/Unknown Gang Involvement (Mutually Exclusive) & 86,453 & 57.64\textbackslash{}\%\\
\hline
Robbery & None & 62,001 & 41.33\textbackslash{}\%\\
\hline
Robbery & Other Gang & 1,086 & 0.72\textbackslash{}\%\\
\hline
Robbery & Juvenile Gang Involvement & 459 & 0.31\textbackslash{}\%\\
\hline
Robbery & Total & 149,999 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & None & 40,530 & 50.22\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & None/Unknown Gang Involvement (Mutually Exclusive) & 40,008 & 49.57\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Other Gang & 99 & 0.12\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Juvenile Gang Involvement & 74 & 0.09\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Total & 80,711 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & None/Unknown Gang Involvement (Mutually Exclusive) & 40,412 & 52.83\textbackslash{}\%\\
\hline
Sex Offenses - Rape & None & 35,875 & 46.90\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other Gang & 162 & 0.21\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Juvenile Gang Involvement & 46 & 0.06\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 76,495 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & None & 4,340 & 55.14\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & None/Unknown Gang Involvement (Mutually Exclusive) & 3,513 & 44.63\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other Gang & 14 & 0.18\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Juvenile Gang Involvement & 4 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 7,871 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & None/Unknown Gang Involvement (Mutually Exclusive) & 9,465 & 51.57\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & None & 8,847 & 48.20\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other Gang & 32 & 0.17\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Juvenile Gang Involvement & 9 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 18,353 & 100\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Possessing/Concealing & 88,549 & 76.68\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Buying/Receiving & 14,777 & 12.80\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Operating/Promoting/Assisting & 4,790 & 4.15\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Using/Consuming & 3,401 & 2.95\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Transporting/Transmitting/Importing & 1,914 & 1.66\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Distributing/Selling & 1,910 & 1.65\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Cultivating/Manufacturing/Publishing & 128 & 0.11\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Exploiting Children & 3 & 0.00\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 115,472 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Operating/Promoting/Assisting & 2 & 50.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Using/Consuming & 1 & 25.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Transporting/Transmitting/Importing & 1 & 25.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Total & 4 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Violation of National Firearm Act of 1934 & Possessing/Concealing & 1 & 100.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Violation of National Firearm Act of 1934 & Total & 1 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Possessing/Concealing & 268,198 & 82.24\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Using/Consuming & 35,898 & 11.01\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Operating/Promoting/Assisting & 11,222 & 3.44\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Buying/Receiving & 4,102 & 1.26\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Distributing/Selling & 3,051 & 0.94\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Transporting/Transmitting/Importing & 2,744 & 0.84\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Cultivating/Manufacturing/Publishing & 817 & 0.25\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Exploiting Children & 72 & 0.02\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Total & 326,104 & 100\textbackslash{}\%\\
\hline
\end{longtable}



## Offense completed

For each offense, this segment also tells you if the offense was completed or only attempted. Nearly all offenses reported in NIBRS are completed offenses. This is likely in part due to completed crimes being easier to detect than attempted crimes. For example, if someone breaks into your house you will likely discover that and alert the police. If someone tries to break in but fails (even something such as trying your front door to see if it is locked and then leaving because it could be considered attempted burglary) there is much less evidence so it probably does not come to the police's attention as much.

Some offenses, such as simple and aggravated assault or homicide, are only labeled as completed. This is because an attempted murder, for example, would be classified as aggravated assault. Since crimes in NIBRS are mutually exclusive, there cannot be both attempted murder and aggravated assault, so only aggravated assault is included. This does limit the data as it is important to know when an aggravated assault is done with the intent to kill the victim and when it is just to seriously harm the victim (though measuring this would likely be extremely imprecise since it requires knowing the motives of the offender).

Table \@ref(tab:offensesCompleted) shows the percent of each crime category in 2022 NIBRS data that was completed or was only attempted.


\begin{longtable}[t]{l|r|r}
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
Drug/Narcotic Offenses - Drug/Narcotic Violations & 99.63 \textbackslash{}\% & 0.37 \textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 99.43 \textbackslash{}\% & 0.57 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 99.27 \textbackslash{}\% & 0.73 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 98.83 \textbackslash{}\% & 1.17 \textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & 98.81 \textbackslash{}\% & 1.19 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 98.8 \textbackslash{}\% & 1.2 \textbackslash{}\%\\
\hline
Embezzlement & 98.73 \textbackslash{}\% & 1.27 \textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 98.73 \textbackslash{}\% & 1.27 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 98.68 \textbackslash{}\% & 1.32 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 98.19 \textbackslash{}\% & 1.81 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 97.81 \textbackslash{}\% & 2.19 \textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & 97.33 \textbackslash{}\% & 2.67 \textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & 97.3 \textbackslash{}\% & 2.7 \textbackslash{}\%\\
\hline
Animal Cruelty & 97.25 \textbackslash{}\% & 2.75 \textbackslash{}\%\\
\hline
Pornography/Obscene Material & 97.17 \textbackslash{}\% & 2.83 \textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & 97.16 \textbackslash{}\% & 2.84 \textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & 97.12 \textbackslash{}\% & 2.88 \textbackslash{}\%\\
\hline
Sex Offenses - Rape & 96.7 \textbackslash{}\% & 3.3 \textbackslash{}\%\\
\hline
Sex Offenses - Incest & 96.43 \textbackslash{}\% & 3.57 \textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 95.72 \textbackslash{}\% & 4.28 \textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & 95.62 \textbackslash{}\% & 4.38 \textbackslash{}\%\\
\hline
Fraud Offenses - Identity Theft & 95.33 \textbackslash{}\% & 4.67 \textbackslash{}\%\\
\hline
Arson & 95.1 \textbackslash{}\% & 4.9 \textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 94.97 \textbackslash{}\% & 5.03 \textbackslash{}\%\\
\hline
Kidnapping/Abduction & 94.82 \textbackslash{}\% & 5.18 \textbackslash{}\%\\
\hline
Motor Vehicle Theft & 94.69 \textbackslash{}\% & 5.31 \textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 94.19 \textbackslash{}\% & 5.81 \textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 93.55 \textbackslash{}\% & 6.45 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 92.84 \textbackslash{}\% & 7.16 \textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 92.43 \textbackslash{}\% & 7.57 \textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 92.36 \textbackslash{}\% & 7.64 \textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & 92.04 \textbackslash{}\% & 7.96 \textbackslash{}\%\\
\hline
Gambling Offenses - Gambling Equipment Violations & 91.43 \textbackslash{}\% & 8.57 \textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 91.11 \textbackslash{}\% & 8.89 \textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 91.09 \textbackslash{}\% & 8.91 \textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & 90.29 \textbackslash{}\% & 9.71 \textbackslash{}\%\\
\hline
Robbery & 90.17 \textbackslash{}\% & 9.83 \textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & 90.15 \textbackslash{}\% & 9.85 \textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device & 89.76 \textbackslash{}\% & 10.24 \textbackslash{}\%\\
\hline
Fraud Offenses - Hacking/Computer Invasion & 89.18 \textbackslash{}\% & 10.82 \textbackslash{}\%\\
\hline
Fraud Offenses - Money Laundering & 85.71 \textbackslash{}\% & 14.29 \textbackslash{}\%\\
\hline
Gambling Offenses - Operating/Promoting/Assisting Gambling & 85.7 \textbackslash{}\% & 14.3 \textbackslash{}\%\\
\hline
Bribery & 83.9 \textbackslash{}\% & 16.1 \textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & 83.36 \textbackslash{}\% & 16.64 \textbackslash{}\%\\
\hline
Gambling Offenses - Sports Tampering & 66.67 \textbackslash{}\% & 33.33 \textbackslash{}\%\\
\hline
Commerce Violations - Federal Liquor Offenses & 64.83 \textbackslash{}\% & 35.17 \textbackslash{}\%\\
\hline
Extortion/Blackmail & 60.81 \textbackslash{}\% & 39.19 \textbackslash{}\%\\
\hline
Fugitive Offenses - Flight To Avoid Prosecution & 30.88 \textbackslash{}\% & 69.12 \textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
Fugitive Offenses - Harboring Escappee/Concealing From Arrest & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
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
Weapon Law Violations - Violation of National Firearm Act of 1934 & 100 \textbackslash{}\% & 0 \textbackslash{}\%\\
\hline
\end{longtable}



In Figure \@ref(fig:nibrsOffenseCompleted) we see the share of all offenses per year that are reported as completed. In every year we have data nearly all offenses were reported as being completed. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/nibrsOffenseCompleted-1} 

}

\caption{The annual percent of offenses reported as completed, 1991-2022.}(\#fig:nibrsOffenseCompleted)
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


\begin{longtable}[t]{l|r|r|l}
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
Residence/Home & 1991 & 4,782,593 & 37.62\textbackslash{}\%\\
\hline
Highway/Road/Alley & 1991 & 2,159,647 & 16.99\textbackslash{}\%\\
\hline
Parking Lot/Garage & 1991 & 1,245,424 & 9.80\textbackslash{}\%\\
\hline
Other/Unknown & 1991 & 614,236 & 4.83\textbackslash{}\%\\
\hline
Department/Discount Store & 1991 & 495,673 & 3.90\textbackslash{}\%\\
\hline
Commercial/Office Building & 1991 & 293,432 & 2.31\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & 1991 & 285,175 & 2.24\textbackslash{}\%\\
\hline
Convenience Store & 1991 & 282,025 & 2.22\textbackslash{}\%\\
\hline
Grocery/Supermarket & 1991 & 263,737 & 2.07\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & 1991 & 226,396 & 1.78\textbackslash{}\%\\
\hline
School - Elementary/Secondary & 2009 & 222,077 & 1.75\textbackslash{}\%\\
\hline
Restaurant & 1991 & 203,154 & 1.60\textbackslash{}\%\\
\hline
Service/Gas Station & 1991 & 190,517 & 1.50\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & 1991 & 138,569 & 1.09\textbackslash{}\%\\
\hline
Cyberspace & 2015 & 127,061 & 1.00\textbackslash{}\%\\
\hline
Bank/Savings And Loan & 1991 & 121,775 & 0.96\textbackslash{}\%\\
\hline
Park/Playground & 2010 & 112,826 & 0.89\textbackslash{}\%\\
\hline
Bar/Nightclub & 1991 & 87,592 & 0.69\textbackslash{}\%\\
\hline
Government/Public Building & 1991 & 87,227 & 0.69\textbackslash{}\%\\
\hline
Rental Storage Facility & 1991 & 82,479 & 0.65\textbackslash{}\%\\
\hline
Construction Site & 1991 & 72,579 & 0.57\textbackslash{}\%\\
\hline
School - College/University & 2009 & 65,940 & 0.52\textbackslash{}\%\\
\hline
Jail/Prison & 1991 & 65,250 & 0.51\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & 1991 & 58,884 & 0.46\textbackslash{}\%\\
\hline
Shopping Mall & 2009 & 57,199 & 0.45\textbackslash{}\%\\
\hline
Field/Woods & 1991 & 54,266 & 0.43\textbackslash{}\%\\
\hline
Church/Synagogue/Temple & 1991 & 42,293 & 0.33\textbackslash{}\%\\
\hline
Auto Dealership New/Used & 2009 & 42,120 & 0.33\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & 2009 & 32,557 & 0.26\textbackslash{}\%\\
\hline
School/College & 1991 & 30,474 & 0.24\textbackslash{}\%\\
\hline
Liquor Store & 1991 & 28,907 & 0.23\textbackslash{}\%\\
\hline
Industrial Site & 2009 & 22,938 & 0.18\textbackslash{}\%\\
\hline
Community Center & 2012 & 14,362 & 0.11\textbackslash{}\%\\
\hline
Camp/Campground & 2009 & 12,287 & 0.10\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & 2010 & 11,573 & 0.09\textbackslash{}\%\\
\hline
Lake/Waterway & 1991 & 11,237 & 0.09\textbackslash{}\%\\
\hline
Farm Facility & 2009 & 10,580 & 0.08\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & 2009 & 9,586 & 0.08\textbackslash{}\%\\
\hline
Atm Separate From Bank & 2009 & 9,214 & 0.07\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & 2010 & 8,757 & 0.07\textbackslash{}\%\\
\hline
Amusement Park & 2010 & 7,275 & 0.06\textbackslash{}\%\\
\hline
Daycare Facility & 2009 & 7,268 & 0.06\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Model Terminal & 2009 & 6,469 & 0.05\textbackslash{}\%\\
\hline
Tribal Lands & 2011 & 5,372 & 0.04\textbackslash{}\%\\
\hline
Rest Area & 2009 & 3,216 & 0.03\textbackslash{}\%\\
\hline
Military Installation & 2010 & 595 & 0.00\textbackslash{}\%\\
\hline
Total & - & 12,712,813 & 100\textbackslash{}\%\\
\hline
\end{longtable}



Keep in mind that some locations may be an overly specific location that fits well into a broader category that you are interested in. For example, if you care about crimes that happen in stores you would look at "Bank/Savings and Loan", "Restaurant", "Bar/Nightclub," among other locations, which combined have a lot more offenses than any one individually. This is a recurring theme of NIBRS data - you have a lot of data and some of it is so specific that you need to do extra work to aggregate data into units you want.

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


```
#>  [1] NA                                                                 
#>  [2] "none"                                                             
#>  [3] "personal weapons (hands, feet, teeth, etc.)"                      
#>  [4] "rifle"                                                            
#>  [5] "blunt object (club, hammer, etc.)"                                
#>  [6] "handgun"                                                          
#>  [7] "other"                                                            
#>  [8] "unknown"                                                          
#>  [9] "knife/cutting instrument (ice pick, screwdriver, ax, etc.)"       
#> [10] "motor vehicle"                                                    
#> [11] "shotgun"                                                          
#> [12] "asphyxiation (by drowning, strangulation, suffocation, gas, etc.)"
#> [13] "firearm (type not stated)"                                        
#> [14] "other firearm"                                                    
#> [15] "explosives"                                                       
#> [16] "fire/incendiary device"                                           
#> [17] "drugs/narcotics/sleeping pills"                                   
#> [18] "16"                                                               
#> [19] "poison (include gas)"                                             
#> [20] "17"
```


\begin{longtable}[t]{l|r|r|l}
\caption{(\#tab:offenseWeapon)The weapon used by an offender, by offense, 2022. The use means that it was part of the crime though may not have been physically discharged. For example, pointing a gun at someone even without firing the gun is still using it.}\\
\hline
Crime & Weapon & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseWeapon)The weapon used by an offender, by offense, 2022. The use means that it was part of the crime though may not have been physically discharged. For example, pointing a gun at someone even without firing the gun is still using it. \textit{(continued)}}\\
\hline
Crime & Weapon & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Assault Offenses - Simple Assault & Personal Weapons (Hands, Feet, Teeth, Etc.) & 1,339,468 & 77.64\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & None & 199,659 & 11.57\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Other & 137,600 & 7.98\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Unknown & 48,494 & 2.81\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & Total & 1,725,221 & 100\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Handgun & 107,104 & 19.80\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Personal Weapons (Hands, Feet, Teeth, Etc.) & 105,595 & 19.52\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 86,430 & 15.98\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Firearm (Type Not Stated) & 59,787 & 11.05\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Blunt Object (Club, Hammer, Etc.) & 51,416 & 9.51\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other & 47,939 & 8.86\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Motor Vehicle & 26,332 & 4.87\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & None & 16,091 & 2.97\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Unknown & 11,615 & 2.15\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 11,199 & 2.07\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Rifle & 6,284 & 1.16\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Other Firearm & 5,282 & 0.98\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Shotgun & 3,303 & 0.61\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Fire/Incendiary Device & 994 & 0.18\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Drugs/Narcotics/Sleeping Pills & 800 & 0.15\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Poison (Include Gas) & 506 & 0.09\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Explosives & 213 & 0.04\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Unknown & 2 & 0.00\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & Total & 540,892 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Handgun & 175,717 & 53.88\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Firearm (Type Not Stated) & 68,207 & 20.92\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 23,043 & 7.07\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & None & 13,726 & 4.21\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Other & 12,822 & 3.93\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Rifle & 9,070 & 2.78\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Other Firearm & 5,481 & 1.68\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Blunt Object (Club, Hammer, Etc.) & 5,227 & 1.60\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Shotgun & 4,912 & 1.51\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Unknown & 4,422 & 1.36\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Explosives & 1,545 & 0.47\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Personal Weapons (Hands, Feet, Teeth, Etc.) & 959 & 0.29\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Motor Vehicle & 362 & 0.11\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Fire/Incendiary Device & 353 & 0.11\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Drugs/Narcotics/Sleeping Pills & 188 & 0.06\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Poison (Include Gas) & 37 & 0.01\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 33 & 0.01\textbackslash{}\%\\
\hline
Weapon Law Violations - Weapon Law Violations & Total & 326,104 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Personal Weapons (Hands, Feet, Teeth, Etc.) & 4,752 & 60.37\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & None & 1,667 & 21.18\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Unknown & 587 & 7.46\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other & 521 & 6.62\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Blunt Object (Club, Hammer, Etc.) & 160 & 2.03\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 60 & 0.76\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Handgun & 45 & 0.57\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Drugs/Narcotics/Sleeping Pills & 40 & 0.51\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Firearm (Type Not Stated) & 18 & 0.23\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 9 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Poison (Include Gas) & 5 & 0.06\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Other Firearm & 3 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Rifle & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Explosives & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Shotgun & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Fire/Incendiary Device & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & Total & 7,871 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Personal Weapons (Hands, Feet, Teeth, Etc.) & 39,886 & 52.14\textbackslash{}\%\\
\hline
Sex Offenses - Rape & None & 23,420 & 30.62\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Unknown & 7,569 & 9.89\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other & 2,447 & 3.20\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Handgun & 855 & 1.12\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 769 & 1.01\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Drugs/Narcotics/Sleeping Pills & 726 & 0.95\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Firearm (Type Not Stated) & 374 & 0.49\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 182 & 0.24\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Blunt Object (Club, Hammer, Etc.) & 162 & 0.21\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Other Firearm & 38 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Motor Vehicle & 19 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Shotgun & 18 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Poison (Include Gas) & 17 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Rifle & 11 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Fire/Incendiary Device & 2 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Rape & Total & 76,495 & 100\textbackslash{}\%\\
\hline
Robbery & Handgun & 45,014 & 30.01\textbackslash{}\%\\
\hline
Robbery & Personal Weapons (Hands, Feet, Teeth, Etc.) & 41,101 & 27.40\textbackslash{}\%\\
\hline
Robbery & None & 19,123 & 12.75\textbackslash{}\%\\
\hline
Robbery & Firearm (Type Not Stated) & 13,738 & 9.16\textbackslash{}\%\\
\hline
Robbery & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 11,368 & 7.58\textbackslash{}\%\\
\hline
Robbery & Other & 7,701 & 5.13\textbackslash{}\%\\
\hline
Robbery & Unknown & 4,427 & 2.95\textbackslash{}\%\\
\hline
Robbery & Blunt Object (Club, Hammer, Etc.) & 3,950 & 2.63\textbackslash{}\%\\
\hline
Robbery & Rifle & 1,124 & 0.75\textbackslash{}\%\\
\hline
Robbery & Other Firearm & 918 & 0.61\textbackslash{}\%\\
\hline
Robbery & Motor Vehicle & 849 & 0.57\textbackslash{}\%\\
\hline
Robbery & Shotgun & 384 & 0.26\textbackslash{}\%\\
\hline
Robbery & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 99 & 0.07\textbackslash{}\%\\
\hline
Robbery & Poison (Include Gas) & 67 & 0.04\textbackslash{}\%\\
\hline
Robbery & Explosives & 59 & 0.04\textbackslash{}\%\\
\hline
Robbery & Fire/Incendiary Device & 39 & 0.03\textbackslash{}\%\\
\hline
Robbery & Drugs/Narcotics/Sleeping Pills & 38 & 0.03\textbackslash{}\%\\
\hline
Robbery & Total & 149,999 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Personal Weapons (Hands, Feet, Teeth, Etc.) & 9,530 & 51.93\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & None & 6,216 & 33.87\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Unknown & 1,298 & 7.07\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other & 598 & 3.26\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Handgun & 229 & 1.25\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 164 & 0.89\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Drugs/Narcotics/Sleeping Pills & 105 & 0.57\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Firearm (Type Not Stated) & 98 & 0.53\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Blunt Object (Club, Hammer, Etc.) & 66 & 0.36\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 26 & 0.14\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Other Firearm & 10 & 0.05\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Motor Vehicle & 5 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Shotgun & 2 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Poison (Include Gas) & 2 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Rifle & 2 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Explosives & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Fire/Incendiary Device & 1 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & Total & 18,353 & 100\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Handgun & 5,942 & 39.63\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Firearm (Type Not Stated) & 4,754 & 31.71\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 1,179 & 7.86\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Unknown & 618 & 4.12\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Personal Weapons (Hands, Feet, Teeth, Etc.) & 522 & 3.48\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Rifle & 397 & 2.65\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other Firearm & 379 & 2.53\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Blunt Object (Club, Hammer, Etc.) & 276 & 1.84\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Other & 249 & 1.66\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Motor Vehicle & 220 & 1.47\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Drugs/Narcotics/Sleeping Pills & 168 & 1.12\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Shotgun & 148 & 0.99\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 69 & 0.46\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Fire/Incendiary Device & 59 & 0.39\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Poison (Include Gas) & 13 & 0.09\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Explosives & 1 & 0.01\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & Total & 14,994 & 100\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Personal Weapons (Hands, Feet, Teeth, Etc.) & 18,134 & 46.32\textbackslash{}\%\\
\hline
Kidnapping/Abduction & None & 10,734 & 27.42\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Handgun & 2,882 & 7.36\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 1,693 & 4.32\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Unknown & 1,651 & 4.22\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other & 1,602 & 4.09\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Firearm (Type Not Stated) & 1,026 & 2.62\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Motor Vehicle & 500 & 1.28\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Blunt Object (Club, Hammer, Etc.) & 408 & 1.04\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 181 & 0.46\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Rifle & 133 & 0.34\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Other Firearm & 73 & 0.19\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Shotgun & 64 & 0.16\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Drugs/Narcotics/Sleeping Pills & 48 & 0.12\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Fire/Incendiary Device & 13 & 0.03\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Poison (Include Gas) & 4 & 0.01\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Explosives & 2 & 0.01\textbackslash{}\%\\
\hline
Kidnapping/Abduction & Total & 39,148 & 100\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Personal Weapons (Hands, Feet, Teeth, Etc.) & 45,113 & 55.89\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & None & 27,645 & 34.25\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Unknown & 5,609 & 6.95\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Other & 1,773 & 2.20\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 145 & 0.18\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Handgun & 124 & 0.15\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Firearm (Type Not Stated) & 83 & 0.10\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Drugs/Narcotics/Sleeping Pills & 77 & 0.10\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Blunt Object (Club, Hammer, Etc.) & 61 & 0.08\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 31 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Motor Vehicle & 14 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Other Firearm & 13 & 0.02\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Poison (Include Gas) & 9 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Rifle & 7 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Shotgun & 5 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Fire/Incendiary Device & 2 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Fondling (Incident Liberties/Child Molest) & Total & 80,711 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & None & 1,011 & 55.61\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Personal Weapons (Hands, Feet, Teeth, Etc.) & 330 & 18.15\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Unknown & 288 & 15.84\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Other & 108 & 5.94\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Handgun & 32 & 1.76\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Drugs/Narcotics/Sleeping Pills & 17 & 0.94\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Firearm (Type Not Stated) & 16 & 0.88\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 6 & 0.33\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Blunt Object (Club, Hammer, Etc.) & 4 & 0.22\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 2 & 0.11\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Other Firearm & 2 & 0.11\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Motor Vehicle & 2 & 0.11\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & Total & 1,818 & 100\textbackslash{}\%\\
\hline
Negligent Manslaughter & Motor Vehicle & 764 & 48.11\textbackslash{}\%\\
\hline
Negligent Manslaughter & Other & 227 & 14.29\textbackslash{}\%\\
\hline
Negligent Manslaughter & Handgun & 173 & 10.89\textbackslash{}\%\\
\hline
Negligent Manslaughter & Drugs/Narcotics/Sleeping Pills & 145 & 9.13\textbackslash{}\%\\
\hline
Negligent Manslaughter & Unknown & 80 & 5.04\textbackslash{}\%\\
\hline
Negligent Manslaughter & Firearm (Type Not Stated) & 65 & 4.09\textbackslash{}\%\\
\hline
Negligent Manslaughter & Personal Weapons (Hands, Feet, Teeth, Etc.) & 58 & 3.65\textbackslash{}\%\\
\hline
Negligent Manslaughter & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 19 & 1.20\textbackslash{}\%\\
\hline
Negligent Manslaughter & Shotgun & 13 & 0.82\textbackslash{}\%\\
\hline
Negligent Manslaughter & Blunt Object (Club, Hammer, Etc.) & 12 & 0.76\textbackslash{}\%\\
\hline
Negligent Manslaughter & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 11 & 0.69\textbackslash{}\%\\
\hline
Negligent Manslaughter & Rifle & 10 & 0.63\textbackslash{}\%\\
\hline
Negligent Manslaughter & Fire/Incendiary Device & 5 & 0.31\textbackslash{}\%\\
\hline
Negligent Manslaughter & Poison (Include Gas) & 4 & 0.25\textbackslash{}\%\\
\hline
Negligent Manslaughter & Other Firearm & 1 & 0.06\textbackslash{}\%\\
\hline
Negligent Manslaughter & Explosives & 1 & 0.06\textbackslash{}\%\\
\hline
Negligent Manslaughter & Total & 1,588 & 100\textbackslash{}\%\\
\hline
Extortion/Blackmail & None & 15,974 & 78.67\textbackslash{}\%\\
\hline
Extortion/Blackmail & Other & 1,778 & 8.76\textbackslash{}\%\\
\hline
Extortion/Blackmail & Unknown & 1,193 & 5.88\textbackslash{}\%\\
\hline
Extortion/Blackmail & Personal Weapons (Hands, Feet, Teeth, Etc.) & 1,123 & 5.53\textbackslash{}\%\\
\hline
Extortion/Blackmail & Handgun & 71 & 0.35\textbackslash{}\%\\
\hline
Extortion/Blackmail & Firearm (Type Not Stated) & 65 & 0.32\textbackslash{}\%\\
\hline
Extortion/Blackmail & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 33 & 0.16\textbackslash{}\%\\
\hline
Extortion/Blackmail & Blunt Object (Club, Hammer, Etc.) & 16 & 0.08\textbackslash{}\%\\
\hline
Extortion/Blackmail & Rifle & 14 & 0.07\textbackslash{}\%\\
\hline
Extortion/Blackmail & Other Firearm & 8 & 0.04\textbackslash{}\%\\
\hline
Extortion/Blackmail & Motor Vehicle & 8 & 0.04\textbackslash{}\%\\
\hline
Extortion/Blackmail & Fire/Incendiary Device & 7 & 0.03\textbackslash{}\%\\
\hline
Extortion/Blackmail & Explosives & 6 & 0.03\textbackslash{}\%\\
\hline
Extortion/Blackmail & Asphyxiation (By Drowning, Strangulation, Suffocation, Gas, Etc.) & 3 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Shotgun & 3 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Drugs/Narcotics/Sleeping Pills & 3 & 0.01\textbackslash{}\%\\
\hline
Extortion/Blackmail & Total & 20,305 & 100\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Handgun & 371 & 60.13\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Firearm (Type Not Stated) & 155 & 25.12\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Rifle & 40 & 6.48\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 23 & 3.73\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Personal Weapons (Hands, Feet, Teeth, Etc.) & 10 & 1.62\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Blunt Object (Club, Hammer, Etc.) & 5 & 0.81\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Other Firearm & 5 & 0.81\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Shotgun & 4 & 0.65\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Other & 3 & 0.49\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Unknown & 1 & 0.16\textbackslash{}\%\\
\hline
Justifiable Homicide - Not A Crime & Total & 617 & 100\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & None & 191 & 45.91\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Personal Weapons (Hands, Feet, Teeth, Etc.) & 94 & 22.60\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Unknown & 79 & 18.99\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Handgun & 18 & 4.33\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Other & 15 & 3.61\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Drugs/Narcotics/Sleeping Pills & 7 & 1.68\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Blunt Object (Club, Hammer, Etc.) & 4 & 0.96\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Knife/Cutting Instrument (Ice Pick, Screwdriver, Ax, Etc.) & 4 & 0.96\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Motor Vehicle & 3 & 0.72\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Firearm (Type Not Stated) & 1 & 0.24\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & Total & 416 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Explosives & 3 & 75.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Unknown & 1 & 25.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Explosives & Total & 4 & 100\textbackslash{}\%\\
\hline
Weapon Law Violations - Violation of National Firearm Act of 1934 & Firearm (Type Not Stated) & 1 & 100.00\textbackslash{}\%\\
\hline
Weapon Law Violations - Violation of National Firearm Act of 1934 & Total & 1 & 100\textbackslash{}\%\\
\hline
\end{longtable}



We can use this dataset to look at, for example, trends in the type of weapon used in murders and nonnegligent manslaughters over time, as seen in Figure \@ref(nibrsMurdersWeapon). We can see that guns are the most common weapon are over 60% of murders in most years. Most of these guns are handguns, with about 35% of all murders using a handgun. Other weapons are far less common making up fewer than 20% of offenses most years. There are different agencies reporting each year so differents in trends may simply be due to different agencies in the data. For your own analysis you will need to be far more careful than the figure shown here.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/nibrsMurdersWeapon-1} 

}

\caption{The annual percent of murders and nonnegligent homicides, by offender weapon, 1991-2022.}(\#fig:nibrsMurdersWeapon)
\end{figure}

## Automatic weapons

When the weapon involved was a firearm there is a variable which indicates that the firearm was fully automatic. To be clear, this means that when you pull the trigger once the gun will fire multiple bullets. Semi-automatic firearms are **not** automatic firearms. Of course, saying a gun is fully automatic requires either the policing seizing the gun or the gun being fired (and for witnesses to accurately determine that it is fully automatic). Since many crimes are never solved (and even those that lead to an arrest may not lead to the gun being seized^[Though some guns are seized even without an arrest, such as if the gun is left at the crime scene], this variable is likely imprecise. Still, Figure \@ref(fig:offenseAutomaticWeapon) shows the percent of firearms used in offenses in 2022 that are reported to be fully automatic. Even though there can be up to three weapons used in an offense, this figure only looks at the first weapon. The most common guns to be automatic are rifles and handguns, both with about 5% of all uses being of an automatic weapon. The remaining categories are all under 3% of uses. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/offenseAutomaticWeapon-1} 

}

\caption{The percent of firearms used that were fully automatic, for all offenses in 2022.}(\#fig:offenseAutomaticWeapon)
\end{figure}

## Burglary info

For burglary offenses there are two variables that provide a little more information on the offense. The first variable is the number of "premises" that the burglar entered. This is only available when the location for the offense is either hotel/motel or a rental storage facility. So the "premise" can really be thought of as a room in the building, not that they break into multiple hotels. Figure \@ref(fig:offensePremisesEntered) shows the breakdown in the number of premises entered during a burglary incident. The graph is capped at ten or more for simplicity but in the data itself the number can go higher. The vast majority of hotel/motel and storage facility burglaries only have one room entered, with 87% of these burglaries only being on a single room. This declines enormously to 5% burglarizing two rooms and then more than halves to 2% burglarizing three rooms. This trend continues as the number of rooms increase. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/offensePremisesEntered-1} 

}

\caption{The distribution in the number of premises entered during burglaries. This info is only available for burglaries in a hotel/motel or rental storage facilities.}(\#fig:offensePremisesEntered)
\end{figure}

The second variable, and one where there is data from every burglary reported regardless of location, says whether the burglar entered the building forcibly or not. A burglary without force is one when the burglary *only* enters through unlocked doors or windows. The *only* means that if they entered through an unlocked door or window and then forced open another door or window, the entire burglary is classified as forcible entry. Forcible entry is any when the burglar has to access a locked door or window *through any means of entering*. This is very broad and includes actions ranging from breaking the window - which people generally think of when it comes to forcible entry - to less obvious uses of force like picking the lock or even using a passcard (e.g. a hotel room card) to unlock the door. The FBI also includes when a burglar enters a building legally and then stays past their allowed time such as walking into a store and hiding somewhere until past closing time. 

Figure \@ref(fig:nibrsBurglaryForce) shows the annual trend in the share of burglaries with or without force. Nearly all burglaries at the start of our data used force and has steadily declined until fewer than 60% of burglaries have force in 2022. However, this data is likely affected by differences in reporting by whether force was used. For example, consider two cases of burglary in which the victim does not notice any property stolen. If you come home and find your front door kicked in you'll almost certainly call the police, regardless of if you find any property taken. But if you come home and the door is just unlocked, and do not notice anything stolen, then you may just chalk it up to forgetting to lock the door and never alert the police. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/nibrsBurglaryForce-1} 

}

\caption{The annual percent of burglaries, by whether entry used force, 1991-2022.}(\#fig:nibrsBurglaryForce)
\end{figure}

## Hate crime indicator (bias motivation)

For each offense, NIBRS indicates whether it had a bias motivation, which is NIBRS way of saying if it was a hate crime or not. Offenses are considered hate crimes when the police has some evidence that the offense was motivated - at least in part - against the victim. Since not all hate crimes have evidence of bias (e.g. a person targeted due to bias but without the offender providing evidence that it is a hate crime) many hate crimes will likely not be reported as such. The process for what the FBI classifies as a hate crime is the same in NIBRS as in the Hate Crime dataset discussed in detail in Chapter \@ref(hate_crimes). For more information on how hate crimes are defined and important caveats with these data, please read that chapter. 

Table \@ref(tab:offenseBiasMotivation) shows the percent of all offenses in 2022 that were classified with or without a bias motivation. Nearly all offenses - 99.9% - are without a bias motivation or with an unknown bias motivation meaning that they are not considered hate crimes. 


\begin{longtable}[t]{l|r|r}
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
No Bias Motivation & 11,199,356 & 99.93\textbackslash{}\%\\
\hline
Bias Motivation & 8,278 & 0.07\textbackslash{}\%\\
\hline
Total & 11,207,634 & 100\textbackslash{}\%\\
\hline
\end{longtable}



In Table \@ref(tab:offenseBiasMotivationBiases) we can see the breakdown in the bias motivation of hate crimes, for all incidents where the crime is considered a hate crime. The most common bias motivation is anti-Black, which accounts for 31% of all hate crimes in the data. This is followed by anti-White at 10% and "anti-male homosexual (gay)" at almost 9% of crimes. The only other biases that make up more than 5% of hate crimes are anti-Jewish, anti-Hispanic, and "anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group)."^[Looking at the raw percents is a rather naive measure as it assumes that all groups have equal risk of hate crimes. Certain groups, such as Jews and transgender people, make up a relatively small share of the percent of hate crimes but when considering their percent of the overall population (itself only a slightly better measure as even total population does not account for true opportunity to be victimized) are victimized at much higher rates than many other groups.]

Some of these groups are also subsets of larger groups. For example, anti-Muslim, anti-Arab, and anti-Sikh (while Sikhs are not Muslim or Arabic, some Sikhs have been targeted by people who incorrectly believe that they are) are probably all the same bias motivation. Likewise, attacks on LGBT people are in multiple categories, which allows for a more detailed understanding of these hate crimes but requires aggregation to look at them as a group. While this aggregation is easy enough to do, accidentally missing any of the subcategories could vastly undercount offenses against the larger category.  


\begin{longtable}[t]{l|r|r}
\caption{(\#tab:offenseBiasMotivationBiases)The bias motivation (i.e. if it was a hate crime and what type of hate crime) for all incidents reported in 2022 that were classified as hate crimes. For easier viewing of how hate crimes are broken down, this excludes all offenses where there was no bias motivation.}\\
\hline
Bias Motivation & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endfirsthead
\caption[]{(\#tab:offenseBiasMotivationBiases)The bias motivation (i.e. if it was a hate crime and what type of hate crime) for all incidents reported in 2022 that were classified as hate crimes. For easier viewing of how hate crimes are broken down, this excludes all offenses where there was no bias motivation. \textit{(continued)}}\\
\hline
Bias Motivation & \textbackslash{}\# of Offenses & \textbackslash{}\% of Offenses\\
\hline
\endhead
Anti-Black & 2,623 & 31.69\textbackslash{}\%\\
\hline
Anti-White & 837 & 10.11\textbackslash{}\%\\
\hline
Anti-Gay (Male) & 719 & 8.69\textbackslash{}\%\\
\hline
Anti-Jewish & 554 & 6.69\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 523 & 6.32\textbackslash{}\%\\
\hline
Anti-Hispanic & 506 & 6.11\textbackslash{}\%\\
\hline
Anti-Other Race/Ethnicity/National Origin & 287 & 3.47\textbackslash{}\%\\
\hline
Anti-Asian & 277 & 3.35\textbackslash{}\%\\
\hline
Anti-Transgender & 250 & 3.02\textbackslash{}\%\\
\hline
Anti-Multi-Racial Group & 202 & 2.44\textbackslash{}\%\\
\hline
Anti-American Indian Or Alaskan Native & 152 & 1.84\textbackslash{}\%\\
\hline
Anti-Sikh & 151 & 1.82\textbackslash{}\%\\
\hline
Anti-Lesbian (Female) & 143 & 1.73\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & 110 & 1.33\textbackslash{}\%\\
\hline
Anti-Islamic (Muslim) & 109 & 1.32\textbackslash{}\%\\
\hline
Anti-Mental Disability & 87 & 1.05\textbackslash{}\%\\
\hline
Anti-Other Christian & 82 & 0.99\textbackslash{}\%\\
\hline
Anti-Other Religion & 73 & 0.88\textbackslash{}\%\\
\hline
Anti-Physical Disability & 70 & 0.85\textbackslash{}\%\\
\hline
Anti-Arab & 70 & 0.85\textbackslash{}\%\\
\hline
Anti-Catholic & 68 & 0.82\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Etc.) & 65 & 0.79\textbackslash{}\%\\
\hline
Anti-Female & 64 & 0.77\textbackslash{}\%\\
\hline
Anti-Protestant & 48 & 0.58\textbackslash{}\%\\
\hline
Anti-Multi-Religious Group & 36 & 0.43\textbackslash{}\%\\
\hline
Anti-Bisexual & 32 & 0.39\textbackslash{}\%\\
\hline
Anti-Mormon & 26 & 0.31\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & 24 & 0.29\textbackslash{}\%\\
\hline
Anti-Heterosexual & 18 & 0.22\textbackslash{}\%\\
\hline
Anti-Hindu & 18 & 0.22\textbackslash{}\%\\
\hline
Anti-Buddhist & 17 & 0.21\textbackslash{}\%\\
\hline
Anti-Male & 15 & 0.18\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & 12 & 0.14\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & 10 & 0.12\textbackslash{}\%\\
\hline
Total & 8,278 & 100\textbackslash{}\%\\
\hline
\end{longtable}



Even as the number of agencies reporting to NIBRS increased over time, the share of offenses that are considered hate crimes has remained fairly steady, as shown in Figure \@ref(fig:nibrsOffenseBias) with no year having more than 0.1% of offenses considered hate crimes. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{13_nibrs_offense_files/figure-latex/nibrsOffenseBias-1} 

}

\caption{The annual percent of offenses reported as having a bias motivation (i.e. hate crime), 1993-2022.}(\#fig:nibrsOffenseBias)
\end{figure}
