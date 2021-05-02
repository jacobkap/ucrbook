# Law Enforcement Officers Killed and Assaulted (LEOKA) {#leoka}





The Law Enforcement Officers Killed and Assaulted data, often called just by its acronym LEOKA, has two main purposes.^[This data is also sometimes called the "Police Employees" dataset.] First, it provides counts of employees employed by each agency - broken down by if they are civilian employees or sworn officers, and also broken down by gender. And second, it measures how many officers were assaulted or killed (including officers who die accidentally such as in a car crash) in a given month. The assault data is also broken down into shift type and type (e.g. alone, with a partner, on foot, in a car, etc.), the offender's weapon, and type of call they are responding to (e.g. robbery, disturbance, traffic stop). The killed data simply says how many officers are killed feloniously (i.e. murdered) or died accidentally (e.g. car crash) in a given month. The employee information is at the year-level so you know, for example, how many male police officers were employed in a given year at an agency, but don't know any more than that such as how many officers were on patrol, were detectives, were in special units, etc. This dataset is commonly used as a measure of police employees and is a generally reliable - though imperfect as we'll see - measure of how many police are employed by a police agency.  The second part of this data, measuring assaults and deaths,  is more flawed with missing data issues and data error issues (e.g. more officers killed than employed in an agency). 

## Agencies reporting

<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaAgencies-1.png" alt="The annual number of police agencies that report at least month of data that year, 1960-2018" width="90%" />
<p class="caption">(\#fig:leokaAgencies)The annual number of police agencies that report at least month of data that year, 1960-2018</p>
</div>

<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaAgencies12Months-1.png" alt="The annual number of police agencies that report all 12 months of data that year, 1960-2018" width="90%" />
<p class="caption">(\#fig:leokaAgencies12Months)The annual number of police agencies that report all 12 months of data that year, 1960-2018</p>
</div>

## Important variables

### Number of employees 
 
* Female employees
    + Officers
    + Civilians
* Male employees
    + Officers
    + Civilians
    
<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaCivilianOfficers-1.png" alt="The number of civilian employees and sworn officers in Philadelphia, 1960-2018" width="90%" />
<p class="caption">(\#fig:leokaCivilianOfficers)The number of civilian employees and sworn officers in Philadelphia, 1960-2018</p>
</div>

<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaOfficersGender-1.png" alt="The number of female and male sworn officers in Philadelphia, 1960-2018" width="90%" />
<p class="caption">(\#fig:leokaOfficersGender)The number of female and male sworn officers in Philadelphia, 1960-2018</p>
</div>
    
### Patrol shifts

* One officer vehicle patrol
    + Day shift
    + Evening shift
    + Night shift
    + Other shift
    + Total shifts - sum of above
* Two officer vehicle patrol
    + Day shift
    + Evening shift
    + Night shift
    + Other shift
    + Total shifts - sum of above
* One officer foot patrol
    + Day shift
    + Evening shift
    + Night shift
    + Other shift
    + Total shifts - sum of above
* Two officer foot patrol
    + Day shift
    + Evening shift
    + Night shift
    + Other shift
    + Total shifts - sum of above
* Other patrols
    + Day shift
    + Evening shift
    + Night shift
    + Other shift
    + Total shifts - sum of above
* Total patrols
    + Day shift
    + Evening shift
    + Night shift
    + Other shift
    + Total shifts - sum of above


### Officers killed

There is almost no information about officers killed. The data only breaks this down into if they died "feloniously" which just means that someone killed them on purpose (e.g. shooting them, intentionally hitting them with a car) or if they died "accidentally" such as if they die during a car crash while on duty. The FBI actually collects more information on officer deaths than they release in this data. This includes the circumstances of each death such as the type of death (e.g. car crash, shooting, ambush, etc.), what weapon the offender had if feloniously killed, and even a detailed written summary of what occurred for each officer killed. They post this information in their annual LEOKA report which is part of their Crime in the United States report. The 2019 report, the latest year available, can be found on their site [here](https://ucr.fbi.gov/leoka/2019/home).

<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaOfficersKilled-1.png" alt="The number of officers killed by felony and killed accidentally in Los Angeles, 1960-2018" width="90%" />
<p class="caption">(\#fig:leokaOfficersKilled)The number of officers killed by felony and killed accidentally in Los Angeles, 1960-2018</p>
</div>

<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaOfficersKilledNational-1.png" alt="The national number of officers killed by felony and killed accidentally, 1960-2018" width="90%" />
<p class="caption">(\#fig:leokaOfficersKilledNational)The national number of officers killed by felony and killed accidentally, 1960-2018</p>
</div>




### Assaults by injury and weapon

* Assaults with injury
    + Offender has firearm
    + Offender had knife
    + Offender had other weapon
    + Offender was unarmed
* Assaults without injury
    + Offender has firearm
    + Offender had knife
    + Offender had other weapon
    + Offender was unarmed
    
    
<img src="leoka_files/figure-html/leokaAssaultTypeInjury, The total number of assaults on officers by injury sustained and offender weapon in Los Angeles, 1960-2018.-1.png" width="90%" style="display: block; margin: auto;" />


<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaAssaultsInjuryYear-1.png" alt="The annual number of assaults on officers by injury sustained in Los Angeles, 1960-2018." width="90%" />
<p class="caption">(\#fig:leokaAssaultsInjuryYear)The annual number of assaults on officers by injury sustained in Los Angeles, 1960-2018.</p>
</div>


### Assaults by call type

* Disturbance call (e.g. domestic violence, person carrying a gun in public)
* Burglary
* Robbery
* Officers arresting someone for another crime
* Civil disorder
* Officer has custody of prisoners
* Suspicious persons
* Officers are ambushed
* Mentally deranged person
* Traffic pursuit and traffic stops
* All other call types
* Total - sum of all call types

<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaAssaultCallType-1.png" alt="Assaults on Los Angeles Police Department officers by type of call where they were assaulted at, 1960-2018." width="90%" />
<p class="caption">(\#fig:leokaAssaultCallType)Assaults on Los Angeles Police Department officers by type of call where they were assaulted at, 1960-2018.</p>
</div>


* Offender weapons
    + Offender has firearm
    + Offender had knife
    + Offender had other weapon
    + Offender was unarmed
* Type of officer assignment
    + In a vehicle with two officers
    + In a vehicle alone
    + In a vehicle alone but assisted by other officers
    + Detective or special unit alone
    + Detective or special unit assisted by other officers
    + Other assignment alone
    + Other assignment assisted by other officers
* Number of assaults on police cleared

<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaDisturbanceWeapon-1.png" alt="The number of assaults on Los Angeles Police Department officers in distrubance calls by the injury sustained by the officer, 1960-2018." width="90%" />
<p class="caption">(\#fig:leokaDisturbanceWeapon)The number of assaults on Los Angeles Police Department officers in distrubance calls by the injury sustained by the officer, 1960-2018.</p>
</div>


<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/leokaShiftAssignment-1.png" alt="The number of assaults on Los Angeles Police Department officers in distrubance calls by the injury sustained by the shift assignment of the officer, 1960-2018." width="90%" />
<p class="caption">(\#fig:leokaShiftAssignment)The number of assaults on Los Angeles Police Department officers in distrubance calls by the injury sustained by the shift assignment of the officer, 1960-2018.</p>
</div>

    
### Assaults by time

* 12:01am - 2:00am
* 2:01am  - 4:00am
* 4:01am  - 6:00am
* 6:01am  - 8:00am
* 8:01am  - 10:00am
* 10:01am - 12:00pm
* 12:01pm - 2:00pm
* 2:01pm  - 4:00pm
* 4:01pm  - 6:00pm
* 6:01pm  - 8:00pm
* 8:01pm  - 10:00pm
* 10:01pm - 12:00am

<div class="figure" style="text-align: center">
<img src="leoka_files/figure-html/phoenixAssaultTimes-1.png" alt="The number of assaults against Phoenix Police Department officers by hourly grouping for all years with data available, 1971-2018." width="90%" />
<p class="caption">(\#fig:phoenixAssaultTimes)The number of assaults against Phoenix Police Department officers by hourly grouping for all years with data available, 1971-2018.</p>
</div>

