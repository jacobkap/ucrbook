--- 
title: "Uniform Crime Reporting (UCR) Program Data: An Opinionated Guide to FBI Data"
author: "Jacob Kaplan, Ph.D."
date: "2024-09-12"
bibliography: [book.bib]
biblio-style: apalike
link-citations: yes
colorlinks: yes
description: "This is a comprehensive guide to using the FBI's Uniform Crime Reporting Program Data, including the Summary Reporting System (SRS) files and the National Incident-Based Reporting System (NIBRS) files."
url: "https://ucrbook.com"
github-repo: "jacobkap/ucrbook"
site: bookdown::bookdown_site
documentclass: krantz
monofont: "Source Code Pro"
monofontoptions: "Scale=0.7"
graphics: yes
---








\pagenumbering{roman}
\mainmatter
# (PART) Welcome {-}

# Preface 

If you've read an article about crime or arrests in the United States in the last half century, in most cases it was referring to the FBI's Uniform Crime Reporting Program Data, otherwise known as UCR data. UCR data is, with the exception of the more detailed data that only covers murders, a *monthly number of crimes or arrests reported to a single police agency* which is then gathered by the FBI into one file that includes all reporting agencies. It is actually a collection of different datasets, all of which have information about crimes and arrests that occur in a particular jurisdiction. Think of your home town. This data will tell you how many crimes were reported for a small number of crime categories or how many people (broken down by age, sex, and race) were arrested for a (larger) set of crime categories in that city (if the city has multiple police agencies then each agency will report crimes/arrests under their jurisdiction though the largest agency - usually the local police department - will cover the vast majority of crimes/arrests in that city) in a given month. 

This is a very broad measure of crime, and its uses in research - or uses for understanding crime at all - is fairly limited. Yet is has become over much of the last century - and will likely remain among researchers for at least the next decade - the most important crime data in the United States.

UCR data is important for three reasons: 

1. The definitions are standard, and all agencies (tend to) follow them so you can compare across agencies and over time.^[We'll see many examples of when agencies do not follow the definitions, which really limits this data.]
2. The data is available since 1960 (for most of the datasets) so there is a long period of available data.^[While the original UCR data first reported in 1929, there is only machine-readable data since 1960.]
3. The data is available for most of the 18,000 police agencies in the United States so you can compare across agencies. 

More than many other datasets, there will be times when using UCR data that you'll think "that's weird". This book will cover this weirdness and when we think the weirdness is just an odd - but acceptable - quirk of the data, and when it is a sign of a big problem in the data or in that particular variable and that we should avoid using it. For most of this book we'll be discussing the caveats of the above reasons - or, more directly, why these assumptions are wrong - but these are the reasons why the data is so influential. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/nibrsAnnualPercentPopulationIndex-1.png" alt="The annual percent of the United States population that is covered by an agency reporting data to NIBRS." width="90%" />
<p class="caption">(\#fig:nibrsAnnualPercentPopulationIndex)The annual percent of the United States population that is covered by an agency reporting data to NIBRS.</p>
</div>


<div class="figure" style="text-align: center">
<img src="index_files/figure-html/nibrsStateParticipation2020Index-1.png" alt="The percent of each state's population that is covered by police agencies reporting at least one month of data to NIBRS, 2022." width="90%" />
<p class="caption">(\#fig:nibrsStateParticipation2020Index)The percent of each state's population that is covered by police agencies reporting at least one month of data to NIBRS, 2022.</p>
</div>

## Goal of the book

By the end of each chapter you should have a firm grasp on the dataset that is covered and how to use it properly. However, this book can't possibly cover every potential use case for the data so make sure to carefully examine the data yourself for your own particular use. 

I get a lot of emails from people asking questions about this data so my own goal is to create a single place that answers as many questions as I can about the data. Again, this is among the most commonly used crime datasets and there are still many current papers published with incorrect information about the data (including such simple aspects like what geographic unit data is in and what time unit it is in). So hopefully this book will decrease the number of misconceptions about this data, increasing overall research quality.

## Structure of the book

This book will be divided into ten chapters: this chapter, an intro chapter briefly summarizing each dataset and going over overall issues with UCR data, and seven chapters each covering one of the seven UCR datasets. The final chapter will cover county-level UCR data, a commonly used but highly flawed aggregation of UCR data that I recommend against using. Each chapter will follow the same format: we'll start with a brief summary of the data such as when it first because available and how it can be used. Next we'll look at how many agencies report their data to this dataset, often looking at how to measure this reporting rate a couple of different ways. Finally, we'll cover the important variables included in the data and how to use them properly (including not using them at all) - this will be the bulk of each chapter. 

## Citing this book

If this data was useful in your research, please cite it. To cite this book, please use the below citation: 

Kaplan J (2024). *Uniform Crime Reporting (UCR) Program Data: An Opinionated Guide to FBI Data*. https://ucrbook.com/. 

BibTeX format:

```bibtex
@Manual{ucrbook,
  title = {Uniform Crime Reporting (UCR) Program Data: An Opinionated Guide to FBI Data},
  author = {{Jacob Kaplan}},
  year = {2024},
  url = {https://ucrbook.com/},
}
```

## Sources of UCR data

### My own collection

#### openICPSR

#### [Crimedatatool.com][https://crimedatatool.com/]

### NACJD

### FBI (raw data)

### Raw data

### Crime Data Explorer

### Crimes in the United States report



### FBI (Crime Data Explorer)

### FBI (Crimes in the United States Report)

There are a few different sources of UCR data available today. First, and probably most commonly used, is the data put together by the [National Archive of Criminal Justice Data (NACJD)](https://www.icpsr.umich.edu/web/pages/NACJD/index.html)). This a team out of the University of Michigan who manages a huge number of criminal justice datasets and makes them available to the public. If you have any questions about crime data - UCR or other crime data - I highly recommend you reach out to them for answers. They have a collection of data and excellent documentation available for UCR data available on their site [here](https://www.icpsr.umich.edu/web/NACJD/series/57). One limitation to their data, however, is that each year of data is available as an individual file meaning that you'll need to concatenate each year together into a single file. Some years also have different column names (generally minor changes like spelling robbery "rob" one year and "robb" the next) which requires more work to standardize before you could concatenate. They also only have data through 2016 which means that the most recent years (UCR data is available through 2019) of data are (as of this writing) unavailable. 

Next, and most usable for the general public - but limited for researchers - is the FBI's official website [Crime Data Explorer](https://crime-data-explorer.fr.cloud.gov/). On this site you can chose an agency and see annual crime data (remember, UCR data is monthly so this isn't as detailed as it can be) for certain crimes (and not even all the crimes actually available in the data). This is okay for the general public but only provides a fraction of the data available in the actual data so is really not good for researchers. 

It's worth mentioning a final source of UCR information. This is the annual Crimes in the United States report released by the FBI each year around the start of October. As an example, here is the [website for the 2019 report](https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019). In this report is summarized data which in most cases estimates missing data and provides information about national and subnational (though rarely city-level) crime data. As with the FBI's site, it is only a fraction of the true data available so is not a very useful source of crime data for quality research. Still, this is a very common source of information used by researchers.


## Recommended reading

While this book is designed to help researchers use this data, the FBI has an excellent manual on this data designed to help police agencies submit their data. That manual, called the "Summary Reporting System (SRS) User Manual" provides excellent definitions and examples of many variables included in the data. In this book when I quote the FBI, such as defining a crime, I quote from this manual. The manual is available to download as a PDF on the FBI's site and I've also posted it on my GitHub page [here](https://github.com/jacobkap/ucrbook/blob/main/FBI%20Uniform%20Crime%20Reporting%20(UCR)%20Program%20User%20Manual.pdf) for convenience. I highly recommend that you read this manual before using the data. That manual, alongside this book which tries to explain when and how the agencies don't follow the manual, will provide a solid foundation for your understanding of UCR data.

## How to contribute to this book

If you have any questions, suggestions (such as a topic to cover), or find any issues, please make a post on the [Issues page](https://github.com/jacobkap/ucrbook/issues) for this book on GitHub. On this page you can create a new issue (which is basically just a post on this forum) with a title and a longer description of your issue. You'll need a GitHub account to make a post. Posting here lets me track issues and respond to your message or alert you when the issue is closed (i.e. I've finished or denied the request). Issues are also public so you can see if someone has already posted something similar. 

For more minor issues like typos or grammar mistakes, you can edit the book directly through its GitHub page. That'll make an update for me to accept, which will change the book to include your edit. To do that, click the edit button at the top of the site - the button is highlighted in the below figure. You will need to make a GitHub account to make edits. When you click on that button you'll be taken to a page that looks like a Word Doc where you can make edits. Make any edits you want and then scroll to the bottom of the page. There you can write a short (please, no more than a sentence or two) description of what you've done and then submit the changes for me to review.

<div class="figure" style="text-align: center">
<img src="images/edit_button.PNG" alt="The edit button for how to make edits of this book." width="90%" />
<p class="caption">(\#fig:unnamed-chunk-3)The edit button for how to make edits of this book.</p>
</div>

Please only use the above two methods to contribute or make suggestions about the book. While it's a bit more work for you to do it this way, since you'll need to make a GitHub account if you don't already have one, it helps me organize all the questions in one place and update the book if I decide to add answers to certain questions. 

## How to identify a particular agency (ORI codes) {#ori}

In NIBRS and other FBI data sets, agencies are identified using **OR**iginating Agency **I**dentifiers or an ORI. An ORI is a unique ID code used to identify an agency.^[This is referred to as an "ORI", "ORI code", and "ORI number", all of which mean the same thing.] If we used the agency's name we'd end up with some duplicates since there can be multiple agencies in the country (and in a state, those this is very rare) with the same name. For example, if you looked for the Philadelphia Police Department using the agency name, you'd find both the "Philadelphia Police Department" in Pennsylvania and the one in Mississippi. Each ORI is a 9-digit value starting with the state abbreviation^[The abbreviation for Nebraska is "NB" rather than the more commonly used "NE."] followed by 7 numbers. In the UCR data (another FBI data set) the ORI uses only a 7-digit code - with only the 5 numbers following the state abbreviation instead of 7. So the NIBRS ORI codes are sometimes called ORI9. For nearly all agencies, the only difference between the UCR ORI and the NIBRS ORI is that the NIBRS ORI has "00" at the end so it is technically 9 characters long but isn't any more specific than the 7-character UCR ORI code. 

When dealing with specific agencies, make sure to use the ORI rather than the agency name to avoid any mistakes. For an easy way to find the ORI number of an agency, use [this page](https://crimedatatool.com/crosswalk.html) on my site. Type an agency name or an ORI code into the search section and it will return everything that is a match.


## The data as you get it from the FBI

We'll finish this overview of the SRS data by briefly talking about format of the data that is released by the FBI, before the processing done by myself or [NACJD](https://www.icpsr.umich.edu/web/pages/NACJD/index.html) that converts the data to a type that software like R or Stata or Excel can understand. The FBI releases their data as fixed-width ASCII files which are basically just an Excel file but with all of the columns squished together. As an example, Figure \@ref(fig:SRSascii) shows what the data looks like as you receive it from the FBI for the Offenses Known and Clearances by Arrest dataset for 1960, the first year with data available. In the figure, it seems like there are multiple rows but that's just because the software that I opened the file in isn't wide enough - in reality what is shown is a single row that is extremely wide because there are over 1,500 columns in this data. If you scroll down enough you'll see the next row, but that isn't shown in the current image. What is shown is a single row with a ton of columns all pushed up next to each other. Since all of the columns are squished together (the gaps are just blank spaces because the value there is a space, but that doesn't mean there is a in the data. Spaces are possible values in the data and are meaningful), you need some way to figure out which parts of the data belong in which column. 

<div class="figure" style="text-align: center">
<img src="images/offenses_known_raw_ascii_1960.PNG" alt="Fixed-width ASCII file for the 1960 Offenses Known and Clearances by Arrest dataset." width="90%" />
<p class="caption">(\#fig:SRSascii)Fixed-width ASCII file for the 1960 Offenses Known and Clearances by Arrest dataset.</p>
</div>

<div class="figure" style="text-align: center">
<img src="images/nibrs_ascii.PNG" alt="Fixed-width ASCII file for the 1991 National Incident-Based Reporting System (NIBRS) dataset." width="90%" />
<p class="caption">(\#fig:ascii)Fixed-width ASCII file for the 1991 National Incident-Based Reporting System (NIBRS) dataset.</p>
</div>

The "fixed-width" part of the file type is how this works (the ASCII part basically means it's a text file). Each row is the same width - literally the same number of characters, including blank spaces. So you must tell the software you are using to process this file - by literally writing code in something called a "setup file" but is basically just instructions for whatever software you use (R, SPSS, Stata, SAS can all do this) - which characters are certain columns. For example, in this data the first character says which type of SRS data it is (1 means the Offenses Known and Clearances by Arrest data) and the next two characters (in the setup file written as 2-3 since it is characters 2 through 3 [inclusive]) are the state number (01 is the state code for Alabama). So we can read this row as the first column indicating it is an Offenses Known data, the second column indicating that it is for the state of Alabama, and so on for each of the remaining columns. To read in this data you'll need a setup file that covers every column in the data (some software, like R, can handle just reading in the specific columns you want and don't need to include every column in the setup file). 

The second important thing to know about reading in a fixed-width ASCII file is something called a "value label."^[For most fixed-width ASCII files there are also missing values where it'll have placeholder value such as -8 and the setup file will instruct the software to convert that to NA. SRS data, however, does not have this and does not indicate when values are missing in this manner.] For example, in the above image we saw the characters 2-3 is the state and in the row we have the value "01" which means that the state is "Alabama." Since this type of data is trying to be as small as efficient as possible, it often replaces longer values with shorter one and provides a translation for the software to use to convert it to the proper value when reading it. "Alabama" is more characters than "01" so it saves space to say "01" and just replace that with "Alabama" later on. So "01" would be the "value" and "Alabama" would be the "label" that it changes to once read. 

Fixed-width ASCII files may seem awful to you reading it today, and it is awful to use. But it appears to be an efficient way to store data back many decades ago when data releases began but now is extremely inefficient - in terms of speed, file size, ease of use - compared to modern software so I'm not sure why they *still* release data in this format. But they do, and even the more *modern* (if starting in 1991, before I was born, is modern!) NIBRS data comes in this format. For you, however, the important part to understand is not how exactly to read this type of data, but to understand that people who made this data publicly available (such as myself and the team at NACJD) must make this conversion process.^[For those interested in reading in this type of data, please see my R package asciiSetupReader.] **This conversion process, from fixed-width ASCII to a useful format is the most dangerous step taken in using this data - and one that is nearly entirely unseen by researchers.** 

Every line of code you write (or, for SPSS users, click you make) invites the possibility of making a mistake.^[Even highly experienced programmers who are doing something like can make mistakes. For example, if you type out "2+2" 100 times - something extremely simple that anyone can do - how often will you mistype a character and get a wrong result? I'd guess that at least once you'd make a mistake.] The FBI does not provide a setup file with the fixed-width ASCII data so to read in this data you need to make it yourself. Since some SRS data are massive, this involves assigning the column width for thousands of columns and the value labels for hundreds of different value labels.^[With the exception of the arrest data and some value label changes in hate crimes and homicide data, the setup files remain consistent so a single file will work for all years for a given dataset. You do not need to make a setup file for each year.] A typo anywhere could have potentially far-reaching consequences, so this is a crucial weak point in the data cleaning process - and one in which I have not seen anything written about before. While I have been diligent in checking the setup files and my code to seek out any issues - and I know that NACJD has a robust checking process for their own work - that doesn't mean our work is perfect.^[For evidence of this, please see any of the openICPSR pages for my detail as they detail changes I've made in the data such as decisions on what level to aggregate to and mistakes that I made and later found and fixed.] Even with perfection in processing the raw data to useful files, decisions we make (e.g. what level to aggregate to, what is an outlier) can affect both what type of questions you can ask when using this data, and how well you can answer them.    




## Common issues

In this section we'll discuss issues common to most or all of the SRS datasets. For some of these, we'll come back to the issues in more detail in the chapter for the datasets most affected by the problem. 

### Population

Each of the SRS datasets include a population variable that has the estimated population under the jurisdiction of that agency.^[Jurisdiction here refers to the boundaries of the local government, not any legal authority for where the officer can make arrests. For example, the Los Angeles Police Department's jurisdiction in this case refers to crimes that happen inside the city or are otherwise investigated by the LAPD - and are not primarily investigated by another agency.] This variable is often used to create crime rates that control for population. In cases where jurisdiction overlaps, such as when a city has university police agencies or county sheriffs in counties where the cities in that county have their own police, SRS data assigns the population covered to the most local agency and zero population to the overlapping agency. So an agency's population is the number of people in that jurisdiction that isn't already covered by a different agency. 

For example, the city of Los Angeles in California has nearly four million residents according to the US Census. There are multiple police agencies in the city, including the Los Angeles Police Department, the Los Angeles County Sheriff's Office, the California Highway Patrol that operates in the area, airport and port police, and university police departments. If each agency reported the number of people in their jurisdiction - which all overlap with each other - we would end up with a population far higher than LA's four million people. To prevent double-counting population when agency's jurisdictions overlap, the non-primary agency will report a population of 0, even though they still report crime data like normal. As an example, in 2018 the police department for California State University - Los Angeles reported 92 thefts and a population of 0. Those 92 thefts are not counted in the Los Angeles Police Department data, even though the department counts the population. To get complete crime counts in Los Angeles, you'd need to add up all police agencies within in the city; since the population value is 0 for non-LAPD agencies, both the population and the crime sum will be correct. 

The SRS uses this method even when only parts of a jurisdiction overlaps. Los Angeles County Sheriff has a population of about one million people, far less than the actual county population (the number of residents, according to the Census) of about 10 million people. This is because the other nine million people are accounted for by other agencies, mainly the local police agencies in the cities that make up Los Angeles County. 

The population value is the population who reside in that jurisdiction and does not count people who are in the area but don't live there, such as tourists or people who commute there for work. This means that using the population value to determine a rate can be misleading as some places have much higher numbers of non-residents in the area (e.g. Las Vegas, Washington D.C.) than others. 

### Voluntary reporting {#voluntary}

When an agency reports their data to the FBI, they do so voluntarily - there is no national requirement to report.^[Some states do mandate that their agencies report, but this is not always followed.] This means that there is inconsistency in which agencies report, how many months of the year they report for, and which variables they include in their data submissions. 

In general, more agencies report their data every year and once an agency begins reporting data they tend to keep reporting. The SRS datasets are a collection of separate, though related, datasets and an agency can report to as many of these datasets as they want - an agency that reports to one dataset does not mean that they report to other datasets. Figure \@ref(fig:SRSagenciesReporting) shows the number of agencies that submitted at least one month of data to the Offenses Known and Clearances by Arrest data in the given year. For the first decade of available data under 8,000 agencies reported data and this grew to over 13,500 by the late 1970s before plateauing for about a decade. The number of agencies that reported their data actually declined in the 1990s, driven primarily by many Florida agencies temporarily dropping out, before growing steadily to nearly 17,000 agencies in 2010; from here it kept increasing but slower than before. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/SRSagenciesReporting-1.png" alt="The annual number of agencies reporting to the Offenses Known and Clearances by Arrest dataset. Reporting is based on the agency reporting at least one month of data in that year." width="90%" />
<p class="caption">(\#fig:SRSagenciesReporting)The annual number of agencies reporting to the Offenses Known and Clearances by Arrest dataset. Reporting is based on the agency reporting at least one month of data in that year.</p>
</div>

There are approximately 18,000 police agencies in the United States so recent data has reports from nearly all agencies, while older data has far fewer agencies reporting. When trying to estimate to larger geographies, such as state or national-level, later years will be more accurate as you're missing less data. For earlier data, however, you're dealing with a smaller share of agencies meaning that you have a large amount of missing data and a less representative sample. 

Figure \@ref(fig:bigAgenciesReporting) repeats the above figure but now including only agencies with 100,000 people or more in their jurisdiction. While these agencies have a far more linear trend than all agencies, the basic lesson is the same: recent data has most agencies reporting; old data excludes many agencies. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/bigAgenciesReporting-1.png" alt="The annual number of agencies with a population of 100,000 or higher reporting to the Offenses Known and Clearances by Arrest dataset. Reporting is based on the agency reporting at least one month of data in that year." width="90%" />
<p class="caption">(\#fig:bigAgenciesReporting)The annual number of agencies with a population of 100,000 or higher reporting to the Offenses Known and Clearances by Arrest dataset. Reporting is based on the agency reporting at least one month of data in that year.</p>
</div>

This voluntariness extends beyond whether they report or not, but into which variables they report. While in practice most agencies report every crime when they report any, they do have the choice to report only a subset of offenses. This is especially true for subsets of larger categories - such as gun assaults, a subset of aggravated assaults, or marijuana possession arrests which is a subset of drug possession arrests. As an example, Figure \@ref(fig:nycGunAssaults) shows the annual number of aggravated assaults with a gun in New York City. In 2003 the New York Police Department stopped reporting this category of offense, resuming only in 2013. They continued to report the broader aggravated assault category, but not any of the subsections of aggravated assaults which say which weapon was used during the assault.

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/nycGunAssaults-1.png" alt="Monthly reports of gun assaults in New York City, 1960-2022." width="90%" />
<p class="caption">(\#fig:nycGunAssaults)Monthly reports of gun assaults in New York City, 1960-2022.</p>
</div>

Given that agencies can join or drop out of the SRS program at will, and report only partial data, it is highly important to carefully examine your data to make sure that there are no issues caused by this. 

Even when an agency reports SRS data, and even when they report every crime category, they can report fewer than 12 months of data. In some cases they simply report all of their data in December, or report quarterly or semi-annually so some months have zero crimes reported while others count multiple months in that month's data. One example of this is New York City, shown in Figure \@ref(fig:nycMurderMonthly), in the early-2000s to the mid-2010s where they began reporting data quarterly instead of monthly. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/nycMurderMonthly-1.png" alt="Monthly murders in New York City, 1990-2022. During the 2000s, the police department began reporting quarterly instead of monthly and then resumed monthly reporting." width="90%" />
<p class="caption">(\#fig:nycMurderMonthly)Monthly murders in New York City, 1990-2022. During the 2000s, the police department began reporting quarterly instead of monthly and then resumed monthly reporting.</p>
</div>

When you sum up each month into an annual count, as shown in Figure \@ref(fig:nycMurderYearly), the problem disappears since the zero months are accounted for in the months that have the quarterly data. If you're using monthly data and only examine the data at the annual level, you'll fall into the trap of having incorrect data that is hidden due to the level of aggregation examined. While cases like NYC are obvious when viewed monthly, for people that are including thousands of agencies in their data, it is unfeasible to look at each agency for each crime included. This can introduce errors as the best way to examine the data is manually viewing graphs and the automated method, looking for outliers through some kind of comparison to expected values, can be incorrect.   

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/nycMurderYearly-1.png" alt="Annual murders in New York City, 1990-2022." width="90%" />
<p class="caption">(\#fig:nycMurderYearly)Annual murders in New York City, 1990-2022.</p>
</div>

In other cases when agencies report fewer than 12 months of the year, they simply report partial data and as a result undercount crimes. Figure \@ref(fig:miamiDadeMurderAnnual) shows annual murders in Miami-Dade, Florida and has three years of this issue occurring. The first two years with this issue are the two where zero murders are reported - this is because the agency didn't report any months of data. The final year is in 2018, the last year of data in this graph, where it looks like murder suddenly dropped significantly. That's just because Miami-Dade only reported through June, so they're missing half of 2018. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/miamiDadeMurderAnnual-1.png" alt="Annual murders in Miami-Dade, Florida, 1960-2022." width="90%" />
<p class="caption">(\#fig:miamiDadeMurderAnnual)Annual murders in Miami-Dade, Florida, 1960-2022.</p>
</div>

### Zero crimes vs no reports

When an agency does not report, we see it in the data as reporting zero crimes, not reporting NA or any indicator that they did not report. In cases where the agency says they didn't report that month we can be fairly sure (not entirely since that variable isn't always accurate) that the zero crimes reported are simply that the agency didn't report. In cases where the agency says they report that month but report zero crimes, we can't be sure if that's a true no crimes reported to the agency or the agency not reporting to the SRS. As agencies can report some crimes but not others in a given month and still be considered reporting that month, just saying they reported doesn't mean that the zero is a true zero.

In some cases it is easy to see when a zero crimes reported is actually the agency not reporting. As Figure \@ref(fig:nycGunAssaults) shows with New York City gun assaults, there is a massive and sustained drop-off to zero crimes and then a sudden return years later. Obviously, going from hundreds of crimes to zero crimes is not a matter of crimes not occurring anymore, it is a matter of the agency not reporting - and New York City did report other crimes these years so in the data it says that they reported every month. So in agencies which tend to report many crimes - and many here can be a few as 10 a year since going from 10 to 0 is a big drop - a sudden report of zero crimes is probably just non-reporting. 

Differentiating zero crimes and no reports becomes tricky in agencies that tend to report few crimes, which most small towns do. As an example, Figure \@ref(fig:danvilleRape) shows the annual reports of rape in Danville, California, a city of approximately 45,000 people. The city reports on average 2.8 rapes per year and in five years reported zero rapes. In cases like this it's not clear whether we should consider those zero years as true zeros (that no one was raped or reported their rape to the police) or whether the agency simply didn't report rape data that year.  


<div class="figure" style="text-align: center">
<img src="index_files/figure-html/danvilleRape-1.png" alt="Annual rapes reported in Danville, CA, 1960-2022." width="90%" />
<p class="caption">(\#fig:danvilleRape)Annual rapes reported in Danville, CA, 1960-2022.</p>
</div>

### Agency data covered by another agency

<!--chapter:end:index.Rmd-->

# About the Author {-}


**Dr. Jacob Kaplan** is a Professional Specialist at the School of Public and International Affairs at Princeton University. He holds a Ph.D. in Criminology from the University of Pennsylvania. He is a former member of the FBI’s Criminal Justice Information Services (CJIS) Advisory Policy Board (APB) Uniform Crime Reporting (UCR) Subcommittee.

He is the author of several R packages that make it easier to work with data, including  [fastDummies](https://jacobkap.github.io/fastDummies/), [asciiSetupReader](https://jacobkap.github.io/asciiSetupReader/), [predictrace](https://jacobkap.github.io/predictrace/), and [caesar](https://jacobkap.github.io/caesar/). 

For a list of papers he has written, please see [here](https://jacobdkaplan.weebly.com/research.html).

For a list of data he has cleaned and published (including data discussed in this book), please see [here](https://jacobdkaplan.weebly.com/data.html).

<!--chapter:end:01_author.Rmd-->

# Hate Crime Data {#hate_crimes}





This dataset covers crimes that are reported to the police and judged by the police to be motivated by hate. More specifically, they are (1) crimes which were (2) motivated - at least in part - by bias towards a certain person or group of people because of characteristics about them such as race, sexual orientation, or religion. The first part is key, they must be crimes - and really must be the selection of crimes that the FBI collects for this dataset. Biased actions that don't meet the standard of a crime, or are of a crime category not included in this data, are not considered hate crimes. For example, if someone yells at a Black person and uses racial slurs against them, it is clearly a racist action. For it to be included in this data, however, it would have to extend to a threat since "intimidation" is a crime included in this data and a racial slur without any accompanying crime is not illegal. For the second part, the bias motivation, it must be against a group that the FBI includes in this data. For example, when this data collection began in 1991, there was no way to collect information about hate crimes against transgender people specifically. Instead it would be counted in the "Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT) bias motivation. So if a transgender person was assaulted or killed because they were transgender, there wouldn't be a way to count that until 2013 when anti-transgender was first recorded in this data. 

In the previous example the offender shouted a racial slur, clear that the actions were motivated by bias. What about a hate crime where there is no explicit evidence of hate? Say, a White man robs a Black man and targets him because he is Black. The offender doesn't wear any insignia suggesting bias and never says a word to the victim. If the offender is never caught this robbery would not be considered a hate crime as there is no evidence that it is motivated by hate. Even if the offender is caught this would only be considered a hate crime if the police uncover evidence of bias, such as a confession or text messages between the offender and another person explaining why the victim was targeted. I think many - perhaps even most - hate crimes fall into this category. Where it was in fact a hate crime but there isn't sufficient evidence - both in terms of evidence the police can gather and even the victim's own perception - that it was a hate crime. 

So this data is really a narrower measure of hate crimes than it might seem. In practice it is (some) crimes motivated by (some) kinds of hate that are reported to the police and where the police have evidence of bias. It is also the dataset with the fewest agencies reporting, with most agencies not reporting any hate crimes to the FBI in a given year. This may be true for most agencies as hate crimes are rare and many agencies are small with relatively few crimes of any type reported. However, there is evidence that some agencies that likely have hate crimes still do not report. This leads to gaps in the data with some states having few agencies that report hate crimes, agencies reporting some bias motivations but not others, and agencies reporting some years but not others. While these problems exist for all of the SRS datasets, it is more severe in this data. This problem is exacerbated by hate crimes being rare even in agencies that report them - with such rare events, even minor changes in which agencies report or whether victims report the crime to the police can drastically change the number of hate crimes in this data. For these reasons I strongly advise caution to anyone using these data. 

## Agencies reporting

We'll start by looking at how many agencies report hate crime each year. This is a bit tricky since there can be multiple ways to examine how agencies report, and since agencies can truly have no hate crimes in a year it's hard to differentiate the true zeroes from the non-reporters. 

Figure \@ref(fig:hateAgencies) shows the number of agencies that report at least one hate crime incident in that year. During the first year of data in 1991 there were about 750 agencies reporting and that grew steadily to about 2,000 agencies in year 2000. From there it increased a bit over the next decade before declining to below 1,750 in the early 2010s and rising again to around 3,000 agencies at the end of our data.

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/hateAgencies-1.png" alt="The annual number of police agencies that report at least one hate crime incident in that year." width="90%" />
<p class="caption">(\#fig:hateAgencies)The annual number of police agencies that report at least one hate crime incident in that year.</p>
</div>

The 3,000 or so agencies that report each year are not the same every year. Figure \@ref(fig:hateCrimesEver) shows the cumulative number of agencies that have reported at least one hate crime between 1991 and 2022. There is a steady growth in the cumulative number of agencies, with about 350 new agencies each year. In each year some new agencies report hate crimes for the first time while some agencies that reported a hate crime in previous years don't report any hate crimes in the current year.

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/hateCrimesEver-1.png" alt="The cumulative number of agencies that have reported one or more hate crimes between 1991 and 2022" width="90%" />
<p class="caption">(\#fig:hateCrimesEver)The cumulative number of agencies that have reported one or more hate crimes between 1991 and 2022</p>
</div>

Figure \@ref(fig:hateCrimesPreviousYear) puts this into hard numbers by showing the percent of agencies who reported a hate crime in a certain year who *also* reported a hate crime in the previous year. For most years between 50% and 60% of agencies which reported a hate crime in the year shown on the x-axis also reported a hate crime in the previous year, indicating somewhat high consistency in which agencies have hate crimes. 

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/hateCrimesPreviousYear-1.png" alt="The percent of agencies that report a hate crime in a given year that also reported a hate crime in the previous year, 1992-2022" width="90%" />
<p class="caption">(\#fig:hateCrimesPreviousYear)The percent of agencies that report a hate crime in a given year that also reported a hate crime in the previous year, 1992-2022</p>
</div>

Another way to understand reporting is to look at the number of reported hate crimes by state and see which states report and which don't. Figure \@ref(fig:hateCrimesMap) does this for 2022 data by showing the number of reported hate crime incidents by state. Unfortunately what we've done here is basically create a population map, though with California as a clear outlier. Counting up and graphing or mapping the number of crimes is a common first response to getting new data but isn't actually that helpful. Here we see that the states with the biggest populations - California, New York, Texas,  - have the most hate crimes. To be more useful let's look at state-level reporting after adjusting to the number of agencies in the state and to the civilian population.

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/hateCrimesMap-1.png" alt="Total reported hate crimes by state, 2022" width="90%" />
<p class="caption">(\#fig:hateCrimesMap)Total reported hate crimes by state, 2022</p>
</div>


We'll start with the rate of agencies reporting though this incorrectly assumes that each agency in the state is comparable. For example, say a state has 10 agencies; one that has jurisdiction over 91% of the state's population, and nine that have jurisdiction over 1% of the population each. If the one big agency reports and none of the nine do then we'll say that only 10% of agencies report data. But this one covers 91% of the state so this is actually great coverage. Conversely, having that one agency not report means that even with the other nine agencies reporting we actually cover less than one-tenth of the state's population. Still, this is a useful starting point for understanding this data's reporting and usually answering these kinds of questions requires multiple answers that are all wrong in their own way.

Figure \@ref(fig:statePercentReporting) shows the percent of agencies for each state that reported at least one hate crime in 2022. In New Jersey, the state with the highest percent of agencies reporting, 39% of agencies reported at least one hate crime. It's neighboring states of Pennsylvania, Delaware, and New York have a much lower rate of reporting at 4% (the lowest of any state), 11%, and 14%, respectively. This difference is likely due to a 2019 request by the New Jersey Attorney General to police officers that they [https://www.washingtonpost.com/national-security/2022/01/29/hate-crimes-nj-fbi-asian/]("more thoroughly report on bias incidents.") To me this suggests that decisions at the state level can lead to drastic changes in reporting rates by agencies, and is a possible solution to low reporting rates. 

In 15 states, fewer than 10% of agencies reported a hate crime, and in one state (Pennsylvania) fewer than 5% of agencies did so. One interesting finding from this map is the more liberal states - New Jersey, Washington, California, Connecticut, etc. - have the highest share of agencies reporting a hate crime, indicating that the culture of the state may influence either the propensity of hate crimes, whether victims report, whether agencies report hate crimes, or simply that more hate crimes happen in these areas.   

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/statePercentReporting-1.png" alt="The percent of agencies in each state that reported at least one hate crime in 2022, excluding agencies covered by another agency." width="90%" />
<p class="caption">(\#fig:statePercentReporting)The percent of agencies in each state that reported at least one hate crime in 2022, excluding agencies covered by another agency.</p>
</div>

To examine how population affects our results, Figure \@ref(fig:statePercentReportingPop) shows the percent of each state's population that is covered by an agency that reported at least one hate crime. Results are similar to Figure \@ref(fig:statePercentReporting) but now show that there is more reporting than it appeared in that figure. That is because while not all agencies report a hate crime, the ones that do report are generally larger (in terms of population) than the ones that don't. And that's to be expected since smaller agencies will have fewer crimes than larger ones meaning that it's less likely that have a hate crime.

So measuring by population we see that about half of the people in the country lives in the jurisdiction of an agency which reported at least one hate crime. The average state also covers about half of the population in a hate-crime-reporting agency. The state with the lowest population covered is Mississippi with 17% of its residents in a jurisdiction with an agency reporting data; the state with the highest share is Hawaii at 86%.

Is this good? We don't necessarily want 100% of agencies to report a hate crime since not all agencies will experience a hate crime in their jurisdiction. The ideal dataset would have all hate crimes reported but without knowing how many hates crimes there actually are we can't tell how well this data captures hate crimes.

This is also a fairly poor measure of reporting as it just measures agencies reporting at least one hate crime. If an agency had many hate crimes but only reported very few - and here let's think about that as both agencies not knowing a crime was a hate crime and also knowing but not reporting a hate crime - that's also quite bad for our understanding of hate crimes. However, it is far more likely that a hate crime isn't reported than a non-hate crime being reported as a hate crime. Since we know the likely direction of any errors we can think about this entire dataset as being the lower-bound of hate crime data.

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/statePercentReportingPop-1.png" alt="The percent of population in each state in agencies that reported at least one hate crime in 2022, excluding agencies that are covered by another agency." width="90%" />
<p class="caption">(\#fig:statePercentReportingPop)The percent of population in each state in agencies that reported at least one hate crime in 2022, excluding agencies that are covered by another agency.</p>
</div>

## Tree of Life synagogue shooting {#treeOfLife}

One way I like to check the quality of data is to see how it reports something that I know occurred. Here we'll look at how the anti-Semitic attack on a synagogue in Pittsburgh was reported. In October of 2018 the deadliest attack on Jewish people in US history occurred at the Tree of Life synagogue in Pittsburgh, PA. There, 11 congregants were murdered, and several other people, including police officers, were injured by the shooter. According to this data, however, those murders never occurred. Not in Pittsburgh at least. No murders with an anti-Jewish bias were reported in Pittsburgh in 2018. Instead, the shooting was reported by the FBI's Pittsburgh field office, which, like many federal agencies that have offices across the country, is included in the data as its own agency.

This is good and bad. Of course it is good that when a crime happens it is reported in the data. The bad part is that it is counted as hate crimes that occurred in the FBI's Pittsburgh agency, and not the Pittsburgh Police Department. Most research occurs at the local level - usually studying an agency or county. So if a study is examining agency-level characteristics that are related to hate crimes it'd almost certainly exclude these murders as they are reported by a federal agency and not the local Pittsburgh agency. 

This also gets complicated as FBI rules say that a crime should be reported by the most local jurisdiction. This is true even when there is overlapping jurisdiction. 11 people were murdered in Pittsburgh, and several Pittsburgh Police officers were injured. That should mean that the crime is reported by Pittsburgh Police, not by the FBI. Pittsburgh does report these murders in their Offenses Known data, making it even more odd that they're Pittsburgh crimes in one dataset and not another.^[The murders of nine Black parishioners in the Emanuel African Methodist Episcopal Church in Charleston, South Carolina, in 2015 was reported by the Charleston Police Department, making it even more inconsistent for when the FBI reports hate crime murders.] 

## Important variables

This data has the standard set of variables describing the agency that is reporting. This includes the agency ORI - which is the unique ID for that agency - the agency name, their state, and the population under their jurisdiction. It then has more detailed information about each crime such as what crime happened, what type of bias it involved, where it occurred, and some demographics of the offender.

### Date and time

This data says the exact date that the hate crime occurred on - though not the date it was reported on. Figure \@ref(fig:hateCrimesByDay) shows the percent of hates crimes between 1991 and 2022 that occurred on each day of the week. Interestingly, the most common days for a hate crime to occur is on Friday, which is also when non-hate crimes most frequently occur. This suggests that hate crimes do follow the same trends - at least partially - as other crimes.

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/hateCrimesByDay-1.png" alt="The day of the week that hate crimes occurred on, 1991-2022" width="90%" />
<p class="caption">(\#fig:hateCrimesByDay)The day of the week that hate crimes occurred on, 1991-2022</p>
</div>

We can also look at which day of the month is most common, as shown in Figure \@ref(fig:hateCrimesByMonthDay). There's no pattern that I can see other than the the 1st of the most has the most hate crimes and the end of the month has the fewest. Not all months have more than 28 days so it makes sense that the 29th, 30th, and 31st are the least common days. Is the 1st of the month really the most dangerous? I think this is likely just a quirk of the data, and is something we also see in NIBRS data. When an agency doesn't report an actual date they may use the 1st of the month as a placeholder which then looks to us like the 1st is an especially prolific day for hate crimes. 

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/hateCrimesByMonthDay-1.png" alt="The day of the month that hate crimes occurred on, 1991-2022" width="90%" />
<p class="caption">(\#fig:hateCrimesByMonthDay)The day of the month that hate crimes occurred on, 1991-2022</p>
</div>

### The bias motivation (who the hate is against)

The most important variable in this data is the "bias motivation" which is the FBI's term for the cause of the hate. A hate crime targeted against Black people would be an "anti-Black" bias motivation. For the police to classify an incident as a hate crime, and to assign a particular bias motivation, the police must have *some* evidence that the crime was motivated by hate. The victim saying that the crime is a hate crime alone is not sufficient - though if large portions of the victim's community believe that the crime is a hate crime, this can be a factor in the police's assessment. 

The evidence required is not major. It includes evidence as explicit as slurs said during an incident and less obvious factors like the crime occurring on an important holiday for that community (e.g. Martin Luther King Day, religious holidays). The FBI also encourages police to consider the totality of the evidence even if none alone strongly suggests that the crime was a hate crime in making their determination about whether the incident was a hate crime or not. This also means that many (perhaps most) hate crimes will not be recorded as hate crimes since there is no evidence that the crime is motivated by hate. 

Consider, for example, a person who is biased against Asian people and decides to rob them because they are Asian. This is clearly a hate crime. And say this persons robs 10 Asian people in 10 different incidents, causing 10 hate crimes. All of the victims report it to the police but only two of them tell the police that they think it was a hate crime; the other eight do not think it is a hate crime. Without additional information the police would likely not report any of these robberies as hate crimes. And if all ten of the victims happened to be surveyed about crime victimization, such as through the Bureau of Justice Statistics' National Crime Victimization Survey, only two of the 10 victims would report being the victim of a hate crime. Using FBI data the anti-Asian hate crimes would be zero; using victimization surveys would undercount anti-Asian hate crimes enormously. This is the main problem with using hate crime data, even with perfect reporting or surveys of everyone possibly victimized we may still be getting data that is completely incorrect.

In the FBI data bias motivation is based on the offender's perceptions of the victim so even if they are incorrect in who their victim is, if they intended to target someone for their perceived group membership, that is still a hate crime. For example, if a person assaults a man because they think he is gay, that is a hate crime because the assault was motivated by hate towards gay people. Whether the victim is actually gay or not is not relevant - the offender perceived him to be gay so it is an anti-gay hate crime. To make this even more complicated, the offender must have committed the crime because they are motivated, at least to some degree, by their bias against the victim. Being biased against the victim but targeting them for some other reason means that the crime is not a hate crime. 

The biases that the FBI includes in this data have grown over time, with new bias motivations being added in 1997, 2012, 2013, and 2015. Table \@ref(tab:hateBiasMotivation) shows each bias motivation in this data, the year it was first reported, how many hate crimes there were for this bias motivation from 1991-2022 and what percent of hate crimes that bias motivation makes up. 

For ease of seeing the most common biases, the table is sorted by frequency of incidents. The year is the first year with that bias motivation - as hate crimes for certain groups are very rare, the bias motivation could have technically been available in previous years. The last column in this table shows the percent of hate crime incidents from 1991-2022. 

This sorting makes it easy to see the most common bias motivations, but that's not actually that useful to most people since we usually care more about a rate than a count. For example, according to this table there were almost three times as many anti-Black hate crimes than anti-Jewish hate crimes, showing that anti-Black hate crimes are more of a problem in this country. But this isn't right. We can't just count of the number of offenses or we risk accidentally just measuring the population of these groups. Black people, for example, make up about 14% of the United States population while Jewish people make up about 2%.^[For simplicity I am treating these groups as independent though of course some Black people can be Jewish.] If we adjust the numbers to equalize population then we see that there is a much higher anti-Jewish hate crime rate than anti-Black rate. 

And even this isn't that useful since you really need a much deeper dive into the data before pulling out these seemingly simple statistics. For example, maybe areas with more Jewish people have better reporting than areas with more Black people. Or that Jewish victims would report to the police at higher rates than Black victims. Maybe these are both true at certain times between 1992 and 2022 but have changed over the years. It's not hard to think of possible explanations for differences between groups so without running down each of these explanations I recommend caution before putting out even something as seemingly simple at the number of crimes by bias group. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:hateBiasMotivation)The bias motivation for hate crime incidents. In incidents with multiple bias motivation, this shows only the first bias motivation recorded.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Bias Motivation </th>
   <th style="text-align:right;"> First Year Reported </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:left;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 240,108 </td>
   <td style="text-align:left;"> 100\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Black </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 81,208 </td>
   <td style="text-align:left;"> 33.82\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Jewish </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 29,967 </td>
   <td style="text-align:left;"> 12.48\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-White </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 27,360 </td>
   <td style="text-align:left;"> 11.39\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Male Homosexual (Gay) </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 23,862 </td>
   <td style="text-align:left;"> 9.94\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Hispanic </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 15,397 </td>
   <td style="text-align:left;"> 6.41\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Ethnicity Other Than Hispanic </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 11,498 </td>
   <td style="text-align:left;"> 4.79\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT) </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 7,815 </td>
   <td style="text-align:left;"> 3.25\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Asian </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 7,671 </td>
   <td style="text-align:left;"> 3.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Multi-Racial Group </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 5,652 </td>
   <td style="text-align:left;"> 2.35\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Female Homosexual (Lesbian) </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 4,876 </td>
   <td style="text-align:left;"> 2.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Muslim </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 4,206 </td>
   <td style="text-align:left;"> 1.75\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Other Religion </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 3,621 </td>
   <td style="text-align:left;"> 1.51\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-American Indian Or Native Alaskan </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 2,781 </td>
   <td style="text-align:left;"> 1.16\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Catholic </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,819 </td>
   <td style="text-align:left;"> 0.76\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Arab </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,510 </td>
   <td style="text-align:left;"> 0.63\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Transgender </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1,500 </td>
   <td style="text-align:left;"> 0.62\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Protestant </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,361 </td>
   <td style="text-align:left;"> 0.57\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Mental Disability </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:right;"> 1,333 </td>
   <td style="text-align:left;"> 0.56\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Multi-Religious Group </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,314 </td>
   <td style="text-align:left;"> 0.55\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Physical Disability </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:right;"> 752 </td>
   <td style="text-align:left;"> 0.31\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Sikh </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 673 </td>
   <td style="text-align:left;"> 0.28\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Bisexual </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 652 </td>
   <td style="text-align:left;"> 0.27\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Heterosexual </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 615 </td>
   <td style="text-align:left;"> 0.26\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Gender Non-Conforming </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:left;"> 0.21\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Female </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:right;"> 443 </td>
   <td style="text-align:left;"> 0.18\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Other Christian </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 403 </td>
   <td style="text-align:left;"> 0.17\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Eastern Orthodox (Greek, Russian, Etc.) </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 388 </td>
   <td style="text-align:left;"> 0.16\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Atheism/Agnosticism </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 201 </td>
   <td style="text-align:left;"> 0.08\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Native Hawaiian Or Other Pacific Islander </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 184 </td>
   <td style="text-align:left;"> 0.08\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Male </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 171 </td>
   <td style="text-align:left;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Mormon </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 106 </td>
   <td style="text-align:left;"> 0.04\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Hindu </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 103 </td>
   <td style="text-align:left;"> 0.04\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Buddhist </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:left;"> 0.04\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anti-Jehovahs Witness </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> 0.02\% </td>
  </tr>
</tbody>
</table>



2015 is the year with the most bias additions, as of data through 2022. This year added a number of religions such as Anti-Buddhist, Anti-Sikh, and Anti-Jehovah's Witness. In 2013, anti-Transgender was added and this is the most common of the bias motivations added since data began in 1991 with 1500 hate crimes between 2013-2022 - 0.62% of all hate crime incidents from 1991-2022. That year also added anti-male and Anti-Native Hawaiian or Other Pacific Islander, which is the most recent racial group added. In 2012, anti-gender non-conforming and anti-female were included, while in 1997 both anti-mental and anti-physical disability were added. In part due to having fewer years of data available, these newer bias motivations make up a small percent of total hate crimes. 

The original hate crimes - that is, those in the data in 1991 when this dataset was released - are far more common. The most common bias motivation is anti-Black at 34% of hate crimes, anti-Jewish at 12%, anti-White at 11%, anti-male homosexual (gay) at 10%, anti-Hispanic at 6%, and anti-ethnicity other than Hispanic (this group means a crime against an ethnic group that isn't Hispanic, though it is occasionally reported as anti-non-Hispanic which is incorrect.) at 5%. All other bias motivations are less than 5% of hate crimes and consist of a variety of ethnic, racial, religious, or sexual orientation. Some hate crimes can potentially fall in multiple categories. For example, there is a bias motivation of "anti-male homosexual (gay)" and of "anti-lesbian, gay, bisexual, or transgender, mixed group (LGBT)" so there is some overlap between them. When an incident involves multiple bias motivations we can track that in the data as police can report up to 10 bias motivations per incident. In practice, however, most incidents involve only a single bias motivation.

### The crime that occurred

The "crime" part of hate crimes is which criminal offense occurred during the incident. A hateful act where the action is not one of the crimes that the FBI records would not be considered a hate crime. This is likely most common when considering something like a person calling someone by a hateful slur (e.g. "You're a [slur]," "go back to your own country", etc.) but where the action is not technically a crime. Another layer of difficulty in using this data is that not all crimes that the FBI includes were initially included when data become available in 1991. Every several years the FBI adds new crimes to be included in this data. Table \@ref(tab:hateOffense) shows each crime in the data, the first year that this crime was reported, the total number of these crimes reported between 1991 and 2022, and the percent of all incidents this crime makes up.^[This tables uses only the first offense in an incident so counts are slightly lower than if all crimes in every incident is used.] 

Each hate crime incident can cover up to 10 different crimes occurring - for example, a person who burglarizes a synagogue and spray paints a swastika on the wall would have both burglary and vandalism reported in this data. With each crime, this data has the bias motivation for that crime, the location of the crime (in broad categories, not the actual location in the city like a street address would have), and the number of victims for that offense. In practice, in most hate crimes with multiple offenses recorded, the bias motivation, location, and victim count is the same for each offense.

Figure \@ref(fig:crimesPerHateCrime) shows the number of crimes per incident for each hate crime reported between 1991 and 2022. In 96.6% of cases, there is only one offense in that incident.^[In 0.0004% of hate crimes there is no recorded offense. This is not shown in the graph.] This drops sharply to 3.2% of incidents having two offenses, 0.21% having three offenses, 0.019% having four offenses, and 0.002% having five offenses. Even though this data does allow up to 10 offenses per hate crime incident, there has never been a recorded case with more than five offenses. Results are nearly identical when examining the number of bias motivations and locations reported in an incident. 

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/crimesPerHateCrime-1.png" alt="The number of offenses per hate crime incident." width="90%" />
<p class="caption">(\#fig:crimesPerHateCrime)The number of offenses per hate crime incident.</p>
</div>

Nearly all hate crimes are vandalism/destruction of property (30%), intimidation (30%), and simple assault (20%) or aggravated assault (11%) with no remaining crime making up more than 2% of total hate crimes. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:hateOffense)The offense type for hate crime incidents. In incidents with multiple offense types, this shows only the first offense type recorded.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Offense </th>
   <th style="text-align:right;"> First Year Reported </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:left;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 240,108 </td>
   <td style="text-align:left;"> 100\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Destruction of Property/Vandalism </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 72,489 </td>
   <td style="text-align:left;"> 30.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Intimidation </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 71,583 </td>
   <td style="text-align:left;"> 29.81\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Simple Assault </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 47,917 </td>
   <td style="text-align:left;"> 19.96\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Aggravated Assault </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 26,879 </td>
   <td style="text-align:left;"> 11.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Robbery </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 4,339 </td>
   <td style="text-align:left;"> 1.81\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burglary/Breaking And Entering </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 3,890 </td>
   <td style="text-align:left;"> 1.62\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> All Other Larceny </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 2,584 </td>
   <td style="text-align:left;"> 1.08\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Arson </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,456 </td>
   <td style="text-align:left;"> 0.61\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Drug/Narcotic Violations </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1,380 </td>
   <td style="text-align:left;"> 0.57\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Theft-Other </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 917 </td>
   <td style="text-align:left;"> 0.38\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Theft From Motor Vehicle </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 884 </td>
   <td style="text-align:left;"> 0.37\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shoplifting </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 771 </td>
   <td style="text-align:left;"> 0.32\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Theft From Building </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 617 </td>
   <td style="text-align:left;"> 0.26\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Motor Vehicle Theft </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 577 </td>
   <td style="text-align:left;"> 0.24\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Weapon Law Violations </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 469 </td>
   <td style="text-align:left;"> 0.20\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Drug Equipment Violations </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 391 </td>
   <td style="text-align:left;"> 0.16\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> False Pretenses/Swindle/Confidence Game </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:right;"> 353 </td>
   <td style="text-align:left;"> 0.15\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Murder/Non-Negligent Manslaughter </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 330 </td>
   <td style="text-align:left;"> 0.14\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Forcible Rape </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 314 </td>
   <td style="text-align:left;"> 0.13\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Theft of Motor Vehicle Parts/Accessories </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 249 </td>
   <td style="text-align:left;"> 0.10\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Counterfeiting/Forgery </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 245 </td>
   <td style="text-align:left;"> 0.10\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Forcible Fondling - Indecent Liberties/Child Molest </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 225 </td>
   <td style="text-align:left;"> 0.09\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Credit Card/Atm Fraud </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 182 </td>
   <td style="text-align:left;"> 0.08\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Impersonation </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 152 </td>
   <td style="text-align:left;"> 0.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kidnapping/Abduction </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 152 </td>
   <td style="text-align:left;"> 0.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stolen Property Offenses - Receiving, Selling, Etc. </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 140 </td>
   <td style="text-align:left;"> 0.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fraud-Other </td>
   <td style="text-align:right;"> 2016 </td>
   <td style="text-align:right;"> 103 </td>
   <td style="text-align:left;"> 0.04\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Forcible Sodomy </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 82 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pornography/Obscene Material </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Embezzlement </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Extortion/Blackmail </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sexual Assault With An Object </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:left;"> 0.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Purse-Snatching </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 29 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pocket-Picking </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wire Fraud </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Statutory Rape </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Theft From Coin-Operated Machine Or Device </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Unknown </td>
   <td style="text-align:right;"> 2018 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Prostitution </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Welfare Fraud </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Incest </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Assisting Or Promoting Prostitution </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Human Trafficking - Commercial Sex Acts </td>
   <td style="text-align:right;"> 2017 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bribery </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Purchasing Prostitution </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Human Trafficking - Involuntary Servitude </td>
   <td style="text-align:right;"> 2021 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
</tbody>
</table>



Agencies that report to the FBI's National Incident-Based Reporting System (NIBRS) can also report bias motivations for their crimes, and these reports are included in this dataset. One tricky thing is that the crimes included are different depending on if the agency reported through NIBRS or to the dataset directly, and are not NIBRS reporting agencies. NIBRS agencies report all of the crimes as the agencies directly submitting SRS data, but have a wider variety of crimes they can report. In practice, however, both NIBRS and SRS reporting agencies can report the most common offenses so there is relatively little difference.

### The location of the crime

This data is interesting because it includes the location - in categories for types of places, not actual addresses - of the incident. This is important since the type of location can be a factor in whether the incident is classified as a hate crime. For example, spray paint on a synagogue or a mosque is much more likely to be a hate crime than spray paint on a wall of an abandoned building. Table \@ref(tab:hateLocations) shows the locations of hate crimes, including the first year that location was reported. Each hate crime incident can have multiple locations (up to ten) since each offense can have its own incident, but in most cases (96.6%) a hate crime only has a single location. 

As with the crime and the bias motivation, the available locations have increased as time went on, though these newer locations are relatively uncommon. One important change in location is that starting in 2010 the location of "school/college" was split to have one location be for elementary and high schools and another location be for colleges and universities. The majority of hate crimes occur in the victim's home (30%), on a road or alley (19%), in an other or unknown location (13%), and in a parking lot or parking garage (6%). All other locations occur in fewer than 5% of hate crimes. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:hateLocations)The location of hate crime incidents. In incidents with multiple locations, this shows only the first location recorded.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Location </th>
   <th style="text-align:right;"> First Year Reported </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:left;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 239,665 </td>
   <td style="text-align:left;"> 100\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Residence/Home </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 70,736 </td>
   <td style="text-align:left;"> 29.51\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Highway/Road/Alley </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 45,004 </td>
   <td style="text-align:left;"> 18.78\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other/Unknown </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 31,218 </td>
   <td style="text-align:left;"> 13.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> School/College </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 17,550 </td>
   <td style="text-align:left;"> 7.32\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Parking Lot/Garage </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 13,786 </td>
   <td style="text-align:left;"> 5.75\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Church/Synagogue/Temple </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 8,926 </td>
   <td style="text-align:left;"> 3.72\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Commercial/Office Building </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 5,403 </td>
   <td style="text-align:left;"> 2.25\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Restaurant </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 5,099 </td>
   <td style="text-align:left;"> 2.13\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bar/Nightclub </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 4,088 </td>
   <td style="text-align:left;"> 1.71\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> School - Elementary/Secondary </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 3,919 </td>
   <td style="text-align:left;"> 1.64\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Government/Public Building </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 3,545 </td>
   <td style="text-align:left;"> 1.48\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Convenience Store </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 3,357 </td>
   <td style="text-align:left;"> 1.40\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Specialty Store - Tv, Fur, Etc. </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 2,795 </td>
   <td style="text-align:left;"> 1.17\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Air/Bus/Train Terminal </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 2,531 </td>
   <td style="text-align:left;"> 1.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Service/Gas Station </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 2,287 </td>
   <td style="text-align:left;"> 0.95\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Grocery/Supermarket </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 2,178 </td>
   <td style="text-align:left;"> 0.91\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Field/Woods </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 2,169 </td>
   <td style="text-align:left;"> 0.91\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> School - College/University </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 2,068 </td>
   <td style="text-align:left;"> 0.86\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Department/Discount Store </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 2,024 </td>
   <td style="text-align:left;"> 0.84\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Drug Store/Doctors Office/Hospital </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,967 </td>
   <td style="text-align:left;"> 0.82\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Park/Playground </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1,883 </td>
   <td style="text-align:left;"> 0.79\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Jail/Prison </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,726 </td>
   <td style="text-align:left;"> 0.72\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hotel/Motel </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1,618 </td>
   <td style="text-align:left;"> 0.68\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Construction Site </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 643 </td>
   <td style="text-align:left;"> 0.27\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bank/Savings And Loan </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 556 </td>
   <td style="text-align:left;"> 0.23\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Liquor Store </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 459 </td>
   <td style="text-align:left;"> 0.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lake/Waterway </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:left;"> 0.17\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shopping Mall </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 268 </td>
   <td style="text-align:left;"> 0.11\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rental Storage Facility </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 257 </td>
   <td style="text-align:left;"> 0.11\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Community Center </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:left;"> 0.09\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shelter - Mission/Homeless </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 169 </td>
   <td style="text-align:left;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Industrial Site </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 135 </td>
   <td style="text-align:left;"> 0.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Arena/Stadium/Fairgrounds/Coliseum </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 88 </td>
   <td style="text-align:left;"> 0.04\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Auto Dealership New/Used </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 82 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Camp/Campground </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Abandoned/Condemned Structure </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gambling Facility/Casino/Race Track </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rest Area </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dock/Wharf/Freight/Modal Terminal </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> 0.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Daycare Facility </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> 0.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Amusement Park </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:left;"> 0.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Farm Facility </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tribal Lands </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Atm Separate From Bank </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:left;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Military Installation </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
</tbody>
</table>



### Number and race of offenders

There are two variables that have information about the people who commit the hate crime: the number of offenders and the race of the offenders. The offender race is recorded as a single value with the race of the group if all are of the same race or it will say a "multi-racial" group. Unfortunately, important information like the age of the offenders, their criminal history, their relationship to the victim, their gender, or whether they are arrested are completely unavailable in this dataset. These variables, however, are available in NIBRS data. 

As shown in Figure \@ref(fig:hateCrimeOffenderNumber), the most common racial group is "unknown" since the police do not know the race of the offenders. Next are White offenders at nearly 40% of hate crimes followed by Black offenders at nearly 13% of hate crimes. The remaining racial groups are rare with about 2% of hate crimes being committed by a multi-racial group of offenders and 0.8 % of hate crimes committed by Asian or Pacific Islander offenders and 0.6 % committed by American Indian or Native Alaskan offenders. Only 0.05% of offenders are Native Hawaiian or Other Pacific Islander.

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/hateCrimeOffenderRace-1.png" alt="The race of offenders, as a group, for hate crime incidents, 1991-2022." width="90%" />
<p class="caption">(\#fig:hateCrimeOffenderRace)The race of offenders, as a group, for hate crime incidents, 1991-2022.</p>
</div>

When the police do not have any information about the number of offenders (which is common in cases of property crimes such as vandalism but rare in violent crimes), this data considers that to have zero offenders. The zero is just a placeholder that means that the police don't know how many offenders there are, not that they think there were actually no offenders. Figure \@ref(fig:hateCrimeOffenderNumber) shows the percent of hate crimes from 1991-2022 that have each number of offenders recorded. In the actual data it says the actual number of offenders, with the largest group in the current data going to 99 offenders - in this graph I group 10 or more offenders together for simplicity. I also relabel zero offenders as "Unknown" offenders since that's more accurate. The most common number of offenders per hate crime is one offender, at about 49% of hate crimes from 1991-2022 having only one offender. This drops sharply to 9% of hate crimes having two offenders and continues to drop as the number of offenders increase. However, about a third (36%) of hate crimes have an unknown number of offenders. 

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/hateCrimeOffenderNumber-1.png" alt="The race of offenders, as a group, for hate crime incidents, 1991-2022." width="90%" />
<p class="caption">(\#fig:hateCrimeOffenderNumber)The race of offenders, as a group, for hate crime incidents, 1991-2022.</p>
</div>

### Number of victims 

When considering the data itself, hate crime data is very similar to most other datasets. It's just the number of crimes that were reported to the police, though with the additional step of having evidence of bias. But the difference in use is that while in other crimes the victim is usually, well, the victim, in hate crimes the victim may be a much wider group. Let's say a person's home is burglarized. The resident is clearly the victim as it was their house targeted. Their neighbors may also feel some effect if they are now concerned about their own home. And the victim's family will likely be concern. But the victim group is very limited and is directly related to the crime.

Hate crimes tend to affect everyone in the targeted group, or at least a much wider span of people than something like burglary. If a swastika, for example, is spray painted on the front door of a synagogue, who is the victim? Directly it'd be whomever owns the synagogue building. But it also affects all members of that congregation. And what about members of other synagogues in the city? What about Jewish people in the city who don't go to synagogue? Even though only a single crime occurred - a vandalism - it is very difficult to count how many victims there were. Is a swastika on a synagogue worse if the synagogue has a small congregation versus a large one? What if it is in a city with only one synagogue compared to a city with many? Is it worse to have a large swastika than a small one? 

If we're trying to use this data to measure hate against a particular group these are questions we need to answer, but are of course impossible to answer with this data. Remember, all of the FBI data is essentially just abstract contextless numbers in a spreadsheet. This is true for all UCR data but especially so for hate crimes where no two hate crimes are equal. One burglary in City A is about equivalent to one burglary in City B. For hate crimes a single incident may affect far more people in City A than in City B. 

In fact, I'd argue that this issue is bad enough that we should be extraordinarily cautious when using this data. Just aggregating up the number of incidents is insufficient to measuring either hate or fear. Sure, you can measure the number of hate crimes reported to the police and where the police found adequate evidence to label the crime as bias motivated. But is that really what you want be measuring when using hate crime data? 

Nonetheless, this is a book about the data. So let's look at one final variable in this data, the number of victims for each incident. This is not going to be true number of people affected by the crime. It's more the number of direct victims for the incident. Whether that is actually better than just counting incidents is dependent on the context of your question and the hate crimes in question. In Figure \@ref(fig:jewishIncidentVictim) I show the annual number of anti-Jewish hate crimes reported by all agencies in the country. As may be expected, there are always more victims than incidents though the trends are extremely similar over the entire period of data. This trend is also present for other bias motivations, such as anti-Black hate crimes shown in Figure \@ref(fig:blackIncidentVictim). 

While this variable is available in the data, I actually think it's best not to use it. I think there is always a danger in being overly precise and, therefore, overly confident about what the data shows. When you use the number of incidents you implicitly allow for each incident to affect multiple people^[One of the points of hate crimes is to cause fear in more than just the direct victim of the crime.] and readers understand that. But if you use this variable and say that "this is the number of victims of this crime" you are implicitly closing that door and therefore being too confident about how many victims of a crime there is. This is especially true for readers who aren't paying close attention - such as academics reviewing papers or New York Times reporters - since they may think you are measuring the number of victims in a better way than you actually are. 

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/jewishIncidentVictim-1.png" alt="The annual number of anti-Jewish hate crime incidents and victims in the United States, 1991-2022." width="90%" />
<p class="caption">(\#fig:jewishIncidentVictim)The annual number of anti-Jewish hate crime incidents and victims in the United States, 1991-2022.</p>
</div>

<div class="figure" style="text-align: center">
<img src="09_hate_crime_files/figure-html/blackIncidentVictim-1.png" alt="The annual number of anti-Black hate crime incidents and victims in the United States, 1991-2022." width="90%" />
<p class="caption">(\#fig:blackIncidentVictim)The annual number of anti-Black hate crime incidents and victims in the United States, 1991-2022.</p>
</div>


<!--chapter:end:09_hate_crime.Rmd-->

