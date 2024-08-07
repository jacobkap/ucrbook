# Offender Segment





As might be expected, the Offender Segment provides information about who the offender (or offenders) is (are) for each incident, though this is limited to only demographic variables. So we know the age, sex, and race of each offender but nothing else. This means that important variables such as criminal history, ethnicity, socioeconomic status, and motive are missing. In the Victim Segment we learn about the relationship between the victim and offender, and in the Offense Segment we learn which weapon (if any) the offender used. So there is some other data on the offender in other segments but it's quite limited. This data has one row per offender so incidents with multiple offenders have multiple rows. In cases where there is no information about the offender there will be a single row where all of the offender variables will be "unknown." In these cases having a single row for the offender is merely a placeholder and doesn't necessarily mean that there was only one offender for that incident. However, there's no indicator for when this is a placeholder and when there was actually one offender but whose demographic info is unknown.

## Important variables

The Offender Segment is the sparsest of the available segments, and provides only three new variables that are about the offender's demographics. It also includes the standard set of variables: the agency ORI, the incident number, the state the agency is in, and the incident date (though we'd need to check the Administrative Segment to see if this is actually the incident date or the report date).

### Demographics

There are three demographics variables included in this data: the offenders' age, sex, and race. Please note that what we have here are not unique offenders as someone may be involved in multiple crimes. There's no offender ID variable that is consistent across incidents so we can't tell when an offender is involved with different incidents (except in cases where they are arrested, see Chapter \@ref(arrestee) for more).So be cautious when trying to compare this with some base rate such as percent of people of each age/sex/race in a population.  

#### Age 

The age variable is the suspected age of the offender. This is presented to us as whole years though agencies can input an age range if they don't know the exact age (e.g. age 20-29) and the FBI will convert that to an exact number by averaging it for us. So if the police say the offender is aged 20-29 (since they don't know for sure), we only see that the offender is 24 years old since the FBI (for some reason) rounds down. This value is top-coded to 99 years old with everyone 99 years or older being set as "over 98 years old." Figure \@ref(fig:offenderAge) shows the distribution of offender ages for all known offenders in the 2019 NIBRS data. About 14% of offenders have an unknown age and are excluded from the figure. 

This figure shows the percent of offenders at each age that make up known offenders in the data (known here meaning that we have info on their age, not that their identity is known). If you're familiar with research on the age-crime curve, which says that crimes peak in the late teens and then rapidly decrease, this essentially replicates those findings. There are some differences between this figure and past age-crime research as crime peaks later here, in the mid-20s (the most common age is 25), but the general trend of crime being largely a "young person" phenomenon holds consistent. This also depends on exactly which crime occurs as different crimes have different age-crime trends, so you'll need to merge this segment with the Offense Segment to be able to subset by crime committed. 

<div class="figure" style="text-align: center">
<img src="14_nibrs_offender_files/figure-html/offenderAge-1.png" alt="The age of all offenders reported in the 2022 NIBRS data. Approximately 44 percent of offenders have an unknown age are not shown in the figure." width="90%" />
<p class="caption">(\#fig:offenderAge)The age of all offenders reported in the 2022 NIBRS data. Approximately 44 percent of offenders have an unknown age are not shown in the figure.</p>
</div>

The spike you see at the very end of the data is due to the data maxing out possible individual ages at 98, so anyone older is grouped together. There's also a spike at age 1 - and other offenders at very young ages - which is the youngest possible age. Surely very young children aren't going around attacking people, so is this a data error? Yes. But it could actually be partially real as there are very rare cases where children harm or kill someone while playing with a gun and are included in the data. These aren't crimes as we conventionally think of them - and the "offenders" won't be criminally charged - but are still included in the data. However, the bulk of this, especially for age 1, is likely just a data error or the police entering age 1 instead of saying that the age is unknown (which they have the option of doing).    

Another indicator of guesses about age is that three of the five most common ages are 25, 30, and 20 years old. People tend to like multiples of five when making estimates, so these indicate that someone (the victim or the officer) probably didn't know the exact age and so guessed the age. 

#### Sex

The second offender demographic variable available is the offender's sex with male and female being the only available sexes. There is no option for transgender or any other identify. Other than arrestees, where police could (though we don't know if they do) use their identification (e.g. driver's license) to determine their sex, this is the perceived sex of the offender. Figure \@ref(fig:offenderSex) shows the distribution of offenders by sex. The most common sex is male, which is consistent with the literature on who commits crime. About 45% of all offenders were male. Female  offenders make up nearly 19% of offenders. Over a third - 35.9% - of offenders have an unknown sex. Considering that when nothing is known about offenders (including even how many offenders there are) this data includes a single row with "unknown" for all demographic variables, this is actually an undercount of offenders who have unknown sex. 

<div class="figure" style="text-align: center">
<img src="14_nibrs_offender_files/figure-html/offenderSex-1.png" alt="The sex of all offenders reported in the 2022 NIBRS data." width="90%" />
<p class="caption">(\#fig:offenderSex)The sex of all offenders reported in the 2022 NIBRS data.</p>
</div>

#### Race

The final variable available is the race of the offender. The only possible races are White, Black, American Indian/Alaskan Native, Asian, and Native Hawaiian/Other Pacific Islander. These categories are mutually exclusive so people cannot be labeled as mixed race, they must be put into one of the categories. Other than offenders who were arrested, and thus police can clearly see them and potentially ask them what race they are, this variable is likely a rough estimate of a person's race.     

Figure \@ref(fig:offenderRace) shows the breakdown in offender races for every offender in the 2019 data. The most common offender race is Unknown, with about 38.5% of offenders not having a known race. This 38.5% of actually an undercount as in cases where the agency doesn't know anything about the offenders they'll put down a single offender with "unknown" for every demographics variable. So there could potentially be multiple offenders represented when there is a row with an unknown offender race. This is also dependent on the type of crimes committed and when they are committed. For example, a daytime robbery would likely have a known offender race as the victim can clearly see (complexities about identifying people's race aside) the race of the robber. A daytime burglary where no one is home would likely have an unknown offender race and there'd be no witnesses.^[When NIBRS 2020 data comes out it'll be interesting to see how people staying at home due to covid affects the amount of unknown offender info.] Likewise, a robbery at night could have an unknown offender race because the darkness makes it harder to identify people.

The next most common offender race is White at 38.7% followed by Black at 22.1%. The remaining races make up only a little over 1.5% of offenders, with American Indian/Alaskan Native at 0.77%, Asian at 0.63%, and Native Hawaiian/Other Pacific Islander at 0.24%.

<div class="figure" style="text-align: center">
<img src="14_nibrs_offender_files/figure-html/offenderRace-1.png" alt="The race of all offenders reported in the 2022 NIBRS data." width="90%" />
<p class="caption">(\#fig:offenderRace)The race of all offenders reported in the 2022 NIBRS data.</p>
</div>

