--- 
title: "Uniform Crime Reporting (UCR) Program Data: An Opinionated Guide to FBI Data"
author: "Jacob Kaplan, Ph.D."
date: "2024-09-13"
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

If you have read an article about crime or arrests in the United States in the last half century, in most cases it was referring to the FBI's Uniform Crime Reporting Program Data, otherwise known as UCR data. UCR data is, with the exception of the more detailed data that only covers murders, a *monthly number of crimes or arrests reported to a single police agency* which is then gathered by the FBI into one file that includes all reporting agencies. It is actually a collection of different datasets, all of which have information about crimes and arrests that occur in a particular jurisdiction. Think of your home town. This data will tell you how many crimes were reported for a small number of crime categories or how many people (broken down by age, sex, and race) were arrested for a (larger) set of crime categories in that city (if the city has multiple police agencies then each agency will report crimes/arrests under their jurisdiction though the largest agency - usually the local police department - will cover the vast majority of crimes/arrests in that city) in a given month. 

This is a very broad measure of crime, and its uses in research - or uses for understanding crime at all - is fairly limited. Yet is has become over much of the last century - and will likely remain among researchers for at least the next decade - the most important crime data in the United States.

UCR data is important for three reasons: 

1. The definitions are standard, and all agencies (tend to) follow them so you can compare across agencies and over time.^[We will see many examples of when agencies do not follow the definitions, which really limits this data.]
2. The data is available since 1960 (for most of the datasets) so there is a long period of available data.^[While the original UCR data first reported in 1929, there is only machine-readable data since 1960.]
3. The data is available for most of the 18,000 police agencies in the United States so you can compare across agencies. 

More than many other datasets, there will be times when using UCR data that you will think "that is weird". This book will cover this weirdness and when we think the weirdness is just an odd - but acceptable - quirk of the data, and when it is a sign of a big problem in the data or in that particular variable and that we should avoid using it. For most of this book we will be discussing the caveats of the above reasons - or, more directly, why these assumptions are wrong - but these are the reasons why the data is so influential. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/nibrsAnnualPercentPopulationIndex-1.png" alt="The annual percent of the United States population that is covered by an agency reporting data to NIBRS." width="90%" />
<p class="caption">(\#fig:nibrsAnnualPercentPopulationIndex)The annual percent of the United States population that is covered by an agency reporting data to NIBRS.</p>
</div>


<div class="figure" style="text-align: center">
<img src="index_files/figure-html/nibrsStateParticipation2020Index-1.png" alt="The percent of each state's population that is covered by police agencies reporting at least one month of data to NIBRS, 2022." width="90%" />
<p class="caption">(\#fig:nibrsStateParticipation2020Index)The percent of each state's population that is covered by police agencies reporting at least one month of data to NIBRS, 2022.</p>
</div>

## Goal of the book

By the end of each chapter you should have a firm grasp on the dataset that is covered and how to use it properly. However, this book cannot possibly cover every potential use case for the data so make sure to carefully examine the data yourself for your own particular use. 

I get a lot of emails from people asking questions about this data so my own goal is to create a single place that answers as many questions as I can about the data. Again, this is among the most commonly used crime datasets and there are still many current papers published with incorrect information about the data (including such simple aspects like what geographic unit data is in and what time unit it is in). So hopefully this book will decrease the number of misconceptions about this data, increasing overall research quality.

## Structure of the book

This book will be divided into ten chapters: this chapter, an intro chapter briefly summarizing each dataset and going over overall issues with UCR data, and seven chapters each covering one of the seven UCR datasets. The final chapter will cover county-level UCR data, a commonly used but highly flawed aggregation of UCR data that I recommend against using. Each chapter will follow the same format: we will start with a brief summary of the data such as when it first because available and how it can be used. Next we will look at how many agencies report their data to this dataset, often looking at how to measure this reporting rate a couple of different ways. Finally, we will cover the important variables included in the data and how to use them properly (including not using them at all) - this will be the bulk of each chapter. 

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

There are a few different sources of UCR data available today. First, and probably most commonly used, is the data put together by the [National Archive of Criminal Justice Data (NACJD)](https://www.icpsr.umich.edu/web/pages/NACJD/index.html)). This a team out of the University of Michigan who manages a huge number of criminal justice datasets and makes them available to the public. If you have any questions about crime data - UCR or other crime data - I highly recommend you reach out to them for answers. They have a collection of data and excellent documentation available for UCR data available on their site [here](https://www.icpsr.umich.edu/web/NACJD/series/57). One limitation to their data, however, is that each year of data is available as an individual file meaning that you will need to concatenate each year together into a single file. Some years also have different column names (generally minor changes like spelling robbery "rob" one year and "robb" the next) which requires more work to standardize before you could concatenate. They also only have data through 2016 which means that the most recent years (UCR data is available through 2019) of data are (as of this writing) unavailable. 

Next, and most usable for the general public - but limited for researchers - is the FBI's official website [Crime Data Explorer](https://crime-data-explorer.fr.cloud.gov/). On this site you can chose an agency and see annual crime data (remember, UCR data is monthly so this is not as detailed as it can be) for certain crimes (and not even all the crimes actually available in the data). This is okay for the general public but only provides a fraction of the data available in the actual data so is really not good for researchers. 

It is worth mentioning a final source of UCR information. This is the annual Crimes in the United States report released by the FBI each year around the start of October. As an example, here is the [website for the 2019 report](https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019). In this report is summarized data which in most cases estimates missing data and provides information about national and subnational (though rarely city-level) crime data. As with the FBI's site, it is only a fraction of the true data available so is not a very useful source of crime data for quality research. Still, this is a very common source of information used by researchers.


## Recommended reading

While this book is designed to help researchers use this data, the FBI has an excellent manual on this data designed to help police agencies submit their data. That manual, called the "Summary Reporting System (SRS) User Manual" provides excellent definitions and examples of many variables included in the data. In this book when I quote the FBI, such as defining a crime, I quote from this manual. The manual is available to download as a PDF on the FBI's site and I have also posted it on my GitHub page [here](https://github.com/jacobkap/ucrbook/blob/main/FBI%20Uniform%20Crime%20Reporting%20(UCR)%20Program%20User%20Manual.pdf) for convenience. I highly recommend that you read this manual before using the data. That manual, alongside this book which tries to explain when and how the agencies do not follow the manual, will provide a solid foundation for your understanding of UCR data.

## How to contribute to this book

If you have any questions, suggestions (such as a topic to cover), or find any issues, please make a post on the [Issues page](https://github.com/jacobkap/ucrbook/issues) for this book on GitHub. On this page you can create a new issue (which is basically just a post on this forum) with a title and a longer description of your issue. You will need a GitHub account to make a post. Posting here lets me track issues and respond to your message or alert you when the issue is closed (i.e. I have finished or denied the request). Issues are also public so you can see if someone has already posted something similar. 

For more minor issues like typos or grammar mistakes, you can edit the book directly through its GitHub page. That will make an update for me to accept, which will change the book to include your edit. To do that, click the edit button at the top of the site - the button is highlighted in the below figure. You will need to make a GitHub account to make edits. When you click on that button you will be taken to a page that looks like a Word Doc where you can make edits. Make any edits you want and then scroll to the bottom of the page. There you can write a short (please, no more than a sentence or two) description of what you have done and then submit the changes for me to review.

<div class="figure" style="text-align: center">
<img src="images/edit_button.PNG" alt="The edit button for how to make edits of this book." width="90%" />
<p class="caption">(\#fig:unnamed-chunk-3)The edit button for how to make edits of this book.</p>
</div>

Please only use the above two methods to contribute or make suggestions about the book. While it is a bit more work for you to do it this way, since you will need to make a GitHub account if you do not already have one, it helps me organize all the questions in one place and update the book if I decide to add answers to certain questions. 

## How to identify a particular agency (ORI codes) {#ori}

In NIBRS and other FBI data sets, agencies are identified using **OR**iginating Agency **I**dentifiers or an ORI. An ORI is a unique ID code used to identify an agency.^[This is referred to as an "ORI", "ORI code", and "ORI number", all of which mean the same thing.] If we used the agency's name we would end up with some duplicates since there can be multiple agencies in the country (and in a state, those this is very rare) with the same name. For example, if you looked for the Philadelphia Police Department using the agency name, you would find both the "Philadelphia Police Department" in Pennsylvania and the one in Mississippi. Each ORI is a 9-digit value starting with the state abbreviation^[The abbreviation for Nebraska is "NB" rather than the more commonly used "NE."] followed by 7 numbers. In the UCR data (another FBI data set) the ORI uses only a 7-digit code - with only the 5 numbers following the state abbreviation instead of 7. So the NIBRS ORI codes are sometimes called ORI9. For nearly all agencies, the only difference between the UCR ORI and the NIBRS ORI is that the NIBRS ORI has "00" at the end so it is technically 9 characters long but is not any more specific than the 7-character UCR ORI code. 

When dealing with specific agencies, make sure to use the ORI rather than the agency name to avoid any mistakes. For an easy way to find the ORI number of an agency, use [this page](https://crimedatatool.com/crosswalk.html) on my site. Type an agency name or an ORI code into the search section and it will return everything that is a match.


## The data as you get it from the FBI

We will finish this overview of the SRS data by briefly talking about format of the data that is released by the FBI, before the processing done by myself or [NACJD](https://www.icpsr.umich.edu/web/pages/NACJD/index.html) that converts the data to a type that software like R or Stata or Excel can understand. The FBI releases their data as fixed-width ASCII files which are basically just an Excel file but with all of the columns squished together. As an example, Figure \@ref(fig:SRSascii) shows what the data looks like as you receive it from the FBI for the Offenses Known and Clearances by Arrest dataset for 1960, the first year with data available. In the figure, it seems like there are multiple rows but that is just because the software that I opened the file in is not wide enough - in reality what is shown is a single row that is extremely wide because there are over 1,500 columns in this data. If you scroll down enough you will see the next row, but that is not shown in the current image. What is shown is a single row with a ton of columns all pushed up next to each other. Since all of the columns are squished together (the gaps are just blank spaces because the value there is a space, but that does not mean there is a in the data. Spaces are possible values in the data and are meaningful), you need some way to figure out which parts of the data belong in which column. 

<div class="figure" style="text-align: center">
<img src="images/offenses_known_raw_ascii_1960.PNG" alt="Fixed-width ASCII file for the 1960 Offenses Known and Clearances by Arrest dataset." width="90%" />
<p class="caption">(\#fig:SRSascii)Fixed-width ASCII file for the 1960 Offenses Known and Clearances by Arrest dataset.</p>
</div>

<div class="figure" style="text-align: center">
<img src="images/nibrs_ascii.PNG" alt="Fixed-width ASCII file for the 1991 National Incident-Based Reporting System (NIBRS) dataset." width="90%" />
<p class="caption">(\#fig:ascii)Fixed-width ASCII file for the 1991 National Incident-Based Reporting System (NIBRS) dataset.</p>
</div>

The "fixed-width" part of the file type is how this works (the ASCII part basically means it is a text file). Each row is the same width - literally the same number of characters, including blank spaces. So you must tell the software you are using to process this file - by literally writing code in something called a "setup file" but is basically just instructions for whatever software you use (R, SPSS, Stata, SAS can all do this) - which characters are certain columns. For example, in this data the first character says which type of SRS data it is (1 means the Offenses Known and Clearances by Arrest data) and the next two characters (in the setup file written as 2-3 since it is characters 2 through 3 [inclusive]) are the state number (01 is the state code for Alabama). So we can read this row as the first column indicating it is an Offenses Known data, the second column indicating that it is for the state of Alabama, and so on for each of the remaining columns. To read in this data you will need a setup file that covers every column in the data (some software, like R, can handle just reading in the specific columns you want and do not need to include every column in the setup file). 

The second important thing to know about reading in a fixed-width ASCII file is something called a "value label."^[For most fixed-width ASCII files there are also missing values where it will have placeholder value such as -8 and the setup file will instruct the software to convert that to NA. SRS data, however, does not have this and does not indicate when values are missing in this manner.] For example, in the above image we saw the characters 2-3 is the state and in the row we have the value "01" which means that the state is "Alabama." Since this type of data is trying to be as small as efficient as possible, it often replaces longer values with shorter one and provides a translation for the software to use to convert it to the proper value when reading it. "Alabama" is more characters than "01" so it saves space to say "01" and just replace that with "Alabama" later on. So "01" would be the "value" and "Alabama" would be the "label" that it changes to once read. 

Fixed-width ASCII files may seem awful to you reading it today, and it is awful to use. But it appears to be an efficient way to store data back many decades ago when data releases began but now is extremely inefficient - in terms of speed, file size, ease of use - compared to modern software so I am not sure why they *still* release data in this format. But they do, and even the more *modern* NIBRS data comes in this format. For you, however, the important part to understand is not how exactly to read this type of data, but to understand that people who made this data publicly available (such as myself and the team at NACJD) must make this conversion process.^[For those interested in reading in this type of data, please see my R package asciiSetupReader.] **This conversion process, from fixed-width ASCII to a useful format is the most dangerous step taken in using this data - and one that is nearly entirely unseen by researchers.** 

Every line of code you write (or, for SPSS users, click you make) invites the possibility of making a mistake.^[Even highly experienced programmers who are doing something like can make mistakes. For example, if you type out "2+2" 100 times - something extremely simple that anyone can do - how often will you mistype a character and get a wrong result? I would guess that at least once you would make a mistake.] The FBI does not provide a setup file with the fixed-width ASCII data so to read in this data you need to make it yourself. Since some SRS data are massive, this involves assigning the column width for thousands of columns and the value labels for hundreds of different value labels.^[With the exception of the arrest data and some value label changes in hate crimes and homicide data, the setup files remain consistent so a single file will work for all years for a given dataset. You do not need to make a setup file for each year.] A typo anywhere could have potentially far-reaching consequences, so this is a crucial weak point in the data cleaning process - and one in which I have not seen anything written about before. While I have been diligent in checking the setup files and my code to seek out any issues - and I know that NACJD has a robust checking process for their own work - that does not mean our work is perfect.^[For evidence of this, please see any of the openICPSR pages for my detail as they detail changes I have made in the data such as decisions on what level to aggregate to and mistakes that I made and later found and fixed.] Even with perfection in processing the raw data to useful files, decisions we make (e.g. what level to aggregate to, what is an outlier) can affect both what type of questions you can ask when using this data, and how well you can answer them.    

## Common issues

In this section we will discuss issues common to most or all of the SRS datasets. For some of these, we will come back to the issues in more detail in the chapter for the datasets most affected by the problem. 

### Population

Each of the SRS datasets include a population variable that has the estimated population under the jurisdiction of that agency.^[Jurisdiction here refers to the boundaries of the local government, not any legal authority for where the officer can make arrests. For example, the Los Angeles Police Department's jurisdiction in this case refers to crimes that happen inside the city or are otherwise investigated by the LAPD - and are not primarily investigated by another agency.] This variable is often used to create crime rates that control for population. In cases where jurisdiction overlaps, such as when a city has university police agencies or county sheriffs in counties where the cities in that county have their own police, SRS data assigns the population covered to the most local agency and zero population to the overlapping agency. So an agency's population is the number of people in that jurisdiction that is not already covered by a different agency. 

For example, the city of Los Angeles in California has nearly four million residents according to the US Census. There are multiple police agencies in the city, including the Los Angeles Police Department, the Los Angeles County Sheriff's Office, the California Highway Patrol that operates in the area, airport and port police, and university police departments. If each agency reported the number of people in their jurisdiction - which all overlap with each other - we would end up with a population far higher than LA's four million people. To prevent double-counting population when agency's jurisdictions overlap, the non-primary agency will report a population of 0, even though they still report crime data like normal. As an example, in 2018 the police department for California State University - Los Angeles reported 92 thefts and a population of 0. Those 92 thefts are not counted in the Los Angeles Police Department data, even though the department counts the population. To get complete crime counts in Los Angeles, you would need to add up all police agencies within in the city; since the population value is 0 for non-LAPD agencies, both the population and the crime sum will be correct. 

The SRS uses this method even when only parts of a jurisdiction overlaps. Los Angeles County Sheriff has a population of about one million people, far less than the actual county population (the number of residents, according to the Census) of about 10 million people. This is because the other nine million people are accounted for by other agencies, mainly the local police agencies in the cities that make up Los Angeles County. 

The population value is the population who reside in that jurisdiction and does not count people who are in the area but do not live there, such as tourists or people who commute there for work. This means that using the population value to determine a rate can be misleading as some places have much higher numbers of non-residents in the area (e.g. Las Vegas, Washington D.C.) than others. 

### Voluntary reporting {#voluntary}

When an agency reports their data to the FBI, they do so voluntarily - there is no national requirement to report.^[Some states do mandate that their agencies report, but this is not always followed.] This means that there is inconsistency in which agencies report, how many months of the year they report for, and which variables they include in their data submissions. 

In general, more agencies report their data every year and once an agency begins reporting data they tend to keep reporting. The SRS datasets are a collection of separate, though related, datasets and an agency can report to as many of these datasets as they want - an agency that reports to one dataset does not mean that they report to other datasets. Figure \@ref(fig:SRSagenciesReporting) shows the number of agencies that submitted at least one month of data to the Offenses Known and Clearances by Arrest data in the given year. For the first decade of available data under 8,000 agencies reported data and this grew to over 13,500 by the late 1970s before plateauing for about a decade. The number of agencies that reported their data actually declined in the 1990s, driven primarily by many Florida agencies temporarily dropping out, before growing steadily to nearly 17,000 agencies in 2010; from here it kept increasing but slower than before. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/SRSagenciesReporting-1.png" alt="The annual number of agencies reporting to the Offenses Known and Clearances by Arrest dataset. Reporting is based on the agency reporting at least one month of data in that year." width="90%" />
<p class="caption">(\#fig:SRSagenciesReporting)The annual number of agencies reporting to the Offenses Known and Clearances by Arrest dataset. Reporting is based on the agency reporting at least one month of data in that year.</p>
</div>

There are approximately 18,000 police agencies in the United States so recent data has reports from nearly all agencies, while older data has far fewer agencies reporting. When trying to estimate to larger geographies, such as state or national-level, later years will be more accurate as you are missing less data. For earlier data, however, you are dealing with a smaller share of agencies meaning that you have a large amount of missing data and a less representative sample. 

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

When you sum up each month into an annual count, as shown in Figure \@ref(fig:nycMurderYearly), the problem disappears since the zero months are accounted for in the months that have the quarterly data. If you are using monthly data and only examine the data at the annual level, you will fall into the trap of having incorrect data that is hidden due to the level of aggregation examined. While cases like NYC are obvious when viewed monthly, for people that are including thousands of agencies in their data, it is unfeasible to look at each agency for each crime included. This can introduce errors as the best way to examine the data is manually viewing graphs and the automated method, looking for outliers through some kind of comparison to expected values, can be incorrect.   

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/nycMurderYearly-1.png" alt="Annual murders in New York City, 1990-2022." width="90%" />
<p class="caption">(\#fig:nycMurderYearly)Annual murders in New York City, 1990-2022.</p>
</div>

In other cases when agencies report fewer than 12 months of the year, they simply report partial data and as a result undercount crimes. Figure \@ref(fig:miamiDadeMurderAnnual) shows annual murders in Miami-Dade, Florida and has three years of this issue occurring. The first two years with this issue are the two where zero murders are reported - this is because the agency did not report any months of data. The final year is in 2018, the last year of data in this graph, where it looks like murder suddenly dropped significantly. That is just because Miami-Dade only reported through June, so they are missing half of 2018. 

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/miamiDadeMurderAnnual-1.png" alt="Annual murders in Miami-Dade, Florida, 1960-2022." width="90%" />
<p class="caption">(\#fig:miamiDadeMurderAnnual)Annual murders in Miami-Dade, Florida, 1960-2022.</p>
</div>

### Zero crimes vs no reports

When an agency does not report, we see it in the data as reporting zero crimes, not reporting NA or any indicator that they did not report. In cases where the agency says they did not report that month we can be fairly sure (not entirely since that variable is not always accurate) that the zero crimes reported are simply that the agency did not report. In cases where the agency says they report that month but report zero crimes, we cannot be sure if that is a true no crimes reported to the agency or the agency not reporting to the SRS. As agencies can report some crimes but not others in a given month and still be considered reporting that month, just saying they reported does not mean that the zero is a true zero.

In some cases it is easy to see when a zero crimes reported is actually the agency not reporting. As Figure \@ref(fig:nycGunAssaults) shows with New York City gun assaults, there is a massive and sustained drop-off to zero crimes and then a sudden return years later. Obviously, going from hundreds of crimes to zero crimes is not a matter of crimes not occurring anymore, it is a matter of the agency not reporting - and New York City did report other crimes these years so in the data it says that they reported every month. So in agencies which tend to report many crimes - and many here can be a few as 10 a year since going from 10 to 0 is a big drop - a sudden report of zero crimes is probably just non-reporting. 

Differentiating zero crimes and no reports becomes tricky in agencies that tend to report few crimes, which most small towns do. As an example, Figure \@ref(fig:danvilleRape) shows the annual reports of rape in Danville, California, a city of approximately 45,000 people. The city reports on average 2.8 rapes per year and in five years reported zero rapes. In cases like this it is not clear whether we should consider those zero years as true zeros (that no one was raped or reported their rape to the police) or whether the agency simply did not report rape data that year.  


<div class="figure" style="text-align: center">
<img src="index_files/figure-html/danvilleRape-1.png" alt="Annual rapes reported in Danville, CA, 1960-2022." width="90%" />
<p class="caption">(\#fig:danvilleRape)Annual rapes reported in Danville, CA, 1960-2022.</p>
</div>

### Agency data covered by another agency

<!--chapter:end:index.Rmd-->

# About the Author {-}

**Jacob Kaplan**

I am a Professional Specialist at the School of Public and International Affairs (SPIA) and a member of Criminal Justice @ SPIA at Princeton University. My research focuses on law enforcement, including its impact on violent crime, the influence of removing 'bad apple' officers on reducing complaints against officers, the extent to which police forces represent the civilian populations they serve, and the role of race and political affiliations in shaping officer behavior. In addition to this, I conduct methodological research focused on the quality and usability of crime data, with a special emphasis on the FBI's Uniform Crime Reporting (UCR) Program.

I am the author of *[A Criminologist's Guide to R: Crime by the Numbers (Chapman & Hall/CRC The R Series, 2022)](https://www.routledge.com/A-Criminologists-Guide-to-R-Crime-by-the-Numbers/Kaplan/p/book/9781032244075)*, an introductory textbook on the R programming language tailored for crime research, with a special focus on data cleaning and analysis. In addition, I have developed several R packages, including [fastDummies](https://jacobkap.github.io/fastDummies/), [asciiSetupReader](https://jacobkap.github.io/asciiSetupReader/), and [predictrace](https://jacobkap.github.io/predictrace/), to streamline the data analysis process for researchers. My website, [Crime Data Tool](https://crimedatatool.com/), offers users an interactive platform to explore crime data from thousands of agencies across hundreds of variables (e.g., arrests, offenses, demographics)—no data or programming skills required.

My research has been published in leading academic journals, such as the *Journal of Quantitative Criminology*, *Journal of Research in Crime and Delinquency*, *Journal of Interpersonal Violence*, and *American Political Science Review*. I hold a B.S. in Criminal Justice from California State University, Sacramento, and a M.S. and Ph.D. in Criminology from the University of Pennsylvania. I previously served on the FBI’s Criminal Justice Information Services (CJIS) Advisory Policy Board (APB) Uniform Crime Reporting (UCR) Subcommittee.

<!--chapter:end:01_author.Rmd-->

# Property Stolen and Recovered (Supplement to Return A) {#stolen_property}





The Property Stolen and Recovered data - sometimes called the Supplement to Return A (Return A being another name for the Offenses Known and Clearances by Arrest dataset, the "crime" dataset) - provides monthly information about property-related offenses (theft, motor vehicle theft, robbery, and burglary), including the location of the offense (in broad categories like "gas station" or "residence"), what was stolen (e.g. clothing, livestock, firearms), and how much the stolen items were worth.^[It also includes the value of items stolen during rapes and murders, if anything was stolen.] It also includes robberies so is really the "stuff taken during a crime" dataset than the dataset about property crimes. The "recovered" part of this dataset covers the type and value of property recovered so you can use this, along with the type and value of property stolen, to determine what percent and type of items the police managed to recover. 

Like most other SRS datasets this is at the agency-month level so you can, for example, learn how often burglaries occur at the victim's home during the day, and if that rate changes over the year or differs across agencies. The data, however, provides no information about the offender or the victim (other than if the victim was an individual or a commercial business ^[Based on the location of the incident - "bank", "gas station", etc.]). The value of the property stolen is primarily based on the victim's estimate of how much the item is worth (items that are decreased in value once used - such as cars - are supposed to be valued at the current market rate, but the data provides no indication of when it uses the current market rate or the victim's estimate) so it should be used as a very rough estimate of value.  

Before getting into the details of this data, let us look at one example of how this data can measure property crime in a few different ways. This data is highly useful to use as a rough measure of the cost of crime. This cost is limited to just the value of the property stolen - so excludes things like injuries, mental health effects of victimization, etc. - but is still better than nothing. Since this data includes, for some types of property stolen, both the number of offenses per month (broken down by type of theft and items stolen) and the value of the stolen property, we can also see if the average value of these thefts change over time. Though since we do not have the value of items stolen from each individual crime we do not know when outliers are skewing results.

We will look at home burglaries that occur during the day in Philadelphia. First, we can look at the number of these kinds of burglaries each month or year. Figure \@ref(fig:phillyHomeBurglaryCount) shows the annual number of daytime home burglaries and in recent years it has declined sharply into having the fewest on record in 2020 followed by a very low number of crimes in 2021 and 2022. So citywide, Philadelphia has never been safer (averaging across the last few years) when it comes to daytime home burglaries. As you should be aware by this point in the book, SRS data is optional and not all agencies report data every year. In this case 2019, 2020, and 2021 data are all partial, with only 9, 4, and 9 months, respectively, reported for each of these years. Every previous year other than 1974, 1975, 1988, and 1989^[1974 had11 months, 1975 had 9 months, 1988 had 10 months, and 1989 had 11 months of data.] had a full 12-months of data reported. So it makes sense the 2019-2021 had fewer crimes if they only submitted data for part of the year. This is something that is pretty obvious - you cannot compare 12 months of data with <12 months of data - but it is a common mistake so you should check how many months are reported every time you compare multiple years. 

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/phillyHomeBurglaryCount-1.png" alt="The annual number of daytime home burglaries reported in Philadelphia, PA, 1960-2022." width="90%" />
<p class="caption">(\#fig:phillyHomeBurglaryCount)The annual number of daytime home burglaries reported in Philadelphia, PA, 1960-2022.</p>
</div>
When considering the cost of crime, we also want to know the actually monetary cost of that incident. This encompasses a lot of different values including physical and emotional harm to the victim (including harm to structures such as broken doors and windows) and changes in people's behavior (e.g. quit job to avoid going to a certain part of town), and spending on additional precautions such as a home security system to prevent future crimes. With this data we only have the value of the physical items stolen, so while it is still a cost of crime it is a rather shallow one.  

Figure \@ref(fig:PhillyBurglaryCost) measures this cost of crime by showing the annual sum of the value of the property stolen for daytime home burglaries in Philadelphia. The years without 12 months of data are excluded from the figure. Like many variables in the SRS, there is no reported crime value until 1964 so the data shows a value of 0 from 1960-1963. The trend here is different than the previous graph which showed undulations in the number of burglaries but not major trend changes until the 2010s; here is a steady increase over the long term, though with varying speed of increase, until it peaked in the late 2000s/early 2010s before declining substantially in recent years. While the number of burglaries peaked in the early 1980s, the total value of burglaries did not peak until the early 2010s, so the cost of this crime (even this very narrow measure of cost) cannot be ascertained from knowing the number of burglaries alone. From this measure we can say that daytime home burglaries were worse in the early 2010s and are substantially better currently. At least this is true among burglaries reported to the police in Philly.  

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/PhillyBurglaryCost-1.png" alt="The total annual cost of daytime home burglaries in Philadelphia." width="90%" />
<p class="caption">(\#fig:PhillyBurglaryCost)The total annual cost of daytime home burglaries in Philadelphia.</p>
</div>

The final way we can measure daytime home burglaries is to put the previous variables together to look at the cost per burglary. This will give us the average amount of property stolen from each burglary victim. Figure \@ref(fig:phillyHomeCostPerBurglary) shows the cost average cost per burglary for each year of data available. Now we have a different story than the other graphs. Even though the number of daytime home burglaries declined substantially over the last decade and the total cost is around the level seen in the 1980s, the cost per burglary remains at record highs in recent years, though down from the peak in the mid-2010s. This suggests that while burglaries are down, the burden on each burglary victim has continued to grow.

A perhaps obvious issue here is that we had no way to determining how much outliers are affecting results. If one year has, for example, a home burglary where $10 million worth of jewelry is stolen then that year's total value of property stolen would be much higher just due to a single burglary. There is, unfortunately, no way to handle this in this dataset, though the NIBRS' version of the data does let you check for outliers.^[Having an outlier, as long as it is not just a data entry error, should not necessarily mean you remove it. If we removed rare events after all we would have to drop murders from our data as murders are very uncommon crimes.] 

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/phillyHomeCostPerBurglary-1.png" alt="The annual number of burglaries and cost per burglary for daytime home burglaries in Philadelphia, 1960-2022." width="90%" />
<p class="caption">(\#fig:phillyHomeCostPerBurglary)The annual number of burglaries and cost per burglary for daytime home burglaries in Philadelphia, 1960-2022.</p>
</div>

Part of this - and part of the long-term increase seen in Figure \@ref(fig:PhillyBurglaryCost) - is simply due to inflation. \$1 in 1964, the first year we have data on the value of burglaries, is worth \$9.84 in 2023, according to the Bureau of Labor Statistics.^[Based on June of both years] The values in this data are *not* adjusted for inflation so you need to do that adjustment yourself before any analyses, otherwise your results will be quite a bit off. When we adjust all values to 2023 dollars, as shown in Figure \@ref(fig:phillyHomeCostPerBurglaryInflation), the trend becomes changes a bit. There's still a steady increase in cost per burglary over time but it is far more gradual than in Figure \@ref(fig:phillyHomeCostPerBurglary). And now the difference from the cost in early years and late years are far smaller. 

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/phillyHomeCostPerBurglaryInflation-1.png" alt="The inflation-adjusted annual number of burglaries and cost per burglary for daytime home burglaries in Philadelphia (2023 dollars), 1960-2022." width="90%" />
<p class="caption">(\#fig:phillyHomeCostPerBurglaryInflation)The inflation-adjusted annual number of burglaries and cost per burglary for daytime home burglaries in Philadelphia (2023 dollars), 1960-2022.</p>
</div>

## Agencies reporting

We will start by looking at which agencies report. The data is available from 1960 through 2022 though the columns about the value of the property only begin in 1964. Figure \@ref(fig:propertyAgencies) show the number of agencies each year that reported at least one month during that year. In the first several years of data barely any agencies reported data and then it spiked around 1966 to over 6,000 agencies per year then grew quickly until over 12,000 agencies reported data in the late 1970s. From here it actually gradually declined until fewer than 12,000 agencies in the late 1990s before reversing course again and growing to about 15,000 agencies by 2019 - down several hundred agencies from the peak a few years earlier. We see the now-typical drop in 2021 as a result of the FBI's death of SRS and then the partial recovery in 2022 when SRS is reborn.

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/propertyAgencies-1.png" alt="The annual number of police agencies that report at least month of data and 12 months of data that year." width="90%" />
<p class="caption">(\#fig:propertyAgencies)The annual number of police agencies that report at least month of data and 12 months of data that year.</p>
</div>

Since this data is called the "Supplement to Return A" we would expect that the agencies that report here are the same as the ones that report to the Offenses Known and Clearances by Arrest data, which is also called the Return A dataset. Figure \@ref(fig:agenciesInBoth) shows the percent of agencies in this dataset that are report at least one month of Return A data. Except for the first several years of data in the 1960s, we can see that most years have nearly all agencies reporting to both, though this has declined in recent years. Since the late 1970s over 90% of agencies that report to the Offenses Known data also report to this dataset. 

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/agenciesInBoth-1.png" alt="The percent of agencies in the Supplement to Return A data that report at least one month of data and are also in the Offenses Known and Clearances by Arrest (Return A) data in that year, 1960-2022." width="90%" />
<p class="caption">(\#fig:agenciesInBoth)The percent of agencies in the Supplement to Return A data that report at least one month of data and are also in the Offenses Known and Clearances by Arrest (Return A) data in that year, 1960-2022.</p>
</div>

When filtering the data to agencies that report a full 12 months of both the Return A and the Supplement to Return A, shown in Figure \ref(fig:agenciesInBoth12Month), trends are quite similar to Figure \ref(fig:agenciesInBoth) though now the average percent is around 75% rather than 90%. This translates to around 11k agencies though it drops starting in 2018 until fewer than 8,500 agencies report full data to both datasets in 2022. 

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/agenciesInBoth12Month-1.png" alt="The percent of agencies that report 12 months of data to both the the Supplement to Return A data and the Offenses Known and Clearances by Arrest (Return A) data in that year, 1960-2022." width="90%" />
<p class="caption">(\#fig:agenciesInBoth12Month)The percent of agencies that report 12 months of data to both the the Supplement to Return A data and the Offenses Known and Clearances by Arrest (Return A) data in that year, 1960-2022.</p>
</div>

## Important variables

This data can really be broken into two parts: the monthly number of property (as well as robbery) crimes that occur that are more detailed than in the Offenses Known data, and the value of the property stolen (and recovered) from these crimes.^[I am really not sure why this data is not just merged with the Offenses Known data, especially the first part where it is just counts of crimes. You can merge it with the Offenses Known data by joining by the year-month and the ORI (unique agency identifier) columns.] For each category I present the complete breakdown of the available offenses/items stolen and describe some of the important issues to know about them. Like other SRS data, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. 

### A more detailed breakdown of property (and robbery) crimes {#propertycount}

The first part of this data is just a monthly (or yearly in the annual data that I have released^[The FBI, however, only releases data monthly so I just aggregated the months together] number of crimes of each type reported to the police (and that a police investigation discovered actually happened. For more on this process, please see Chapter \@ref(actual)). There are six crimes and their subsets included here: burglary, theft, robbery, and motor vehicle theft. The remaining two are rape and murder, but they do not break down these crimes into any subcategories and are only available starting in 1974.

Burglary is reported based on whether the building burgled was the victim's residence or not, and also the time of the burglary. Time is either during the day (6am-5:59pm) or night (6:pm-5:59am) or if the time is unknown. Data is available since 1960 for both the day and night burglaries, but only since 1964 for the unknown time burglaries. For robbery, the subcategories are based on where the robberies occurred such as if it happened in a bank, a gas station, or a street. 

Theft is divided into two groups. The first group is based on the value of items stolen: less than \$50, \$50-\$199, and \$200 and up. The second group of thefts is broken into the type of theft such as a shoplifting or stealing from someone's car. All theft variables begin in 1960 other than thefts from a coin machine and from a building which start in 1964 and the miscellaneous "All other thefts" variable that has data starting in 1961. Finally, motor vehicle theft is broken into where the stolen vehicle was stolen and found: stolen in the reporting agency's jurisdiction and found by the same agency, stolen in the reporting agency's jurisdiction and found by a different agency, and stolen in a different agency's jurisdiction and found by the reporting agency. 

The complete list of each subsection and a brief definition for the non-obvious ones are presented below. 

* Burglary
    + Home/residence during the day (6:00am - 5:59pm)
    + Home/residence during the night (6:00pm - 5:59am)
    + Home residence at unknown time
    + Non-residence (i.e. all buildings other than victim's home) during the day (6:00am - 5:59pm)
    + Non-residence (i.e. all buildings other than victim's home) during the night (6:00pm - 5:59am)
    + Non-residence (i.e. all buildings other than victim's home) at unknown time
* Theft/larceny (excluding of a motor vehicle)
    + <\$50
    + \$50-\$199
    + \$200 and up
    + Pick pocket
    + Purse snatching
    + Shoplifting
    + Stealing from a car (but not stealing the car itself)
    + Stealing parts of a car, such as the car battery or the tires
    + Stealing a bicycle
    + Stealing from a building where the offender is allowed to be in (and is not counted already as shoplifting)
    + Stealing from a "coin operated machine" which is mainly vending machines
    + All other thefts
* Robbery
    + Highway - This is an old term to say a place is outside and in generally accessible and visible areas. This includes robberies on public streets and alleys.
    + Commercial building - This is robberies in a business other than ones stated below. Includes restaurants, stores, hotels, bars. 
    + Gas station
    + Chain/convenience store - a neighborhood store that generally is open late and sells food
    + Home/residence
    + Bank
    + Miscellaneous/other - This is all other robberies not already covered.
* Motor vehicle theft
    + Stolen in current agency's jurisdiction and found by that agency
    + Stolen in current agency's jurisdiction and found by another agency
    + Stolen in another agency's jurisdiction and recovered by current agency
* Murder
* Rape

### The value of property stolen in property (and robbery) crimes

The next set of variables is the value of the property stolen in each crime, as well as the value of property stolen broken down by the type of property (e.g. clothing, electronics, etc.). To be clear, this is *only* the value of the property stolen during the crime. The cost of any injuries (mental or physical) or any lasting cost to the victim, their family, and society for these crimes are not included. This, of course, vastly underestimates the cost of these crimes so please understand that while this is a measure of the cost of crime, it is only a narrow slice of the true cost.

The cost is the cost for the victim to replace the stolen item. So the current market price for that item (though factoring in the current state the item is in, e.g. if it is already damaged) and, for businesses, the cost to buy that item and *not* the cost they sell it for. While the police can ask the victim how much the property was worth, they are not required to use the exact amount given as victims may exaggerate the value of items. This is not an exact science, so I recommend only interpreting these values as estimates - and potentially rough estimates. None of this data is adjusted for inflation so if you are comparing values over time you will need to do that adjustment yourself. 

Though this data starts in 1960, not all variables are available then. 1963 and 1964 saw many new variables added - the values in these variables are reported as 0 in previous years - and in 1974 and 1975 even more variables are added. In 1963 the value of burglaries where the time of the burglary was known, thefts broken down into categories based on the value of property taken, thefts of car parts, theft from cars, shoplifting, and "other" thefts was added to the data. In the following year this data began including the value of property stolen from burglaries where the time of the burglary was unknown was added as well as thefts of bicycles, from "coin operated machines" (i.e. vending machines), purse snatching, and pick pocketing. The value of property stolen during rapes and murders was first reported in 1974. Finally, 1975 was the last year with new variables, with this year including consumable goods, stolen guns, household goods, livestock, office equipment and electronics, and sound and picture equipment.  

The value of the property stolen is broken into two overlapping categories: by crime type, and by type of property that was stolen. These are the exact same categories as covered in Section \@ref(propertycount) but now is the dollar amount of the items stolen from those types of crimes. The second group is what type of items, based on several discrete categories, was stolen. Please note that multiple items can be stolen in each category - i.e. there is no Hierarchy Rule used here^[For more in the Hierarchy Rule that is used in other UCR data, please see Section \@ref(hierarchy)]. And it counts the property stolen for each crime type *as well as* for each item type. So if you sum up all of the crime variables and all of the item type variables together you will over-count the value of property stolen. Each of the categories and their definitions are detailed below. 

Some of these will overlap with the list in the previous section, though for completeness I will repeat them. 

Here are the subsets of crimes:

* Burglary
    + Home/residence during the day (6:00am - 5:59pm)
    + Home/residence during the night (6:00pm - 5:59am)
    + Home residence at unknown time
    + Non-residence (i.e. all buildings other than victim's home) during the day (6:00am - 5:59pm)
    + Non-residence (i.e. all buildings other than victim's home) during the night (6:00pm - 5:59am)
    + Non-residence (i.e. all buildings other than victim's home) at unknown time
* Theft/larceny (excluding of a motor vehicle)
    + <\$50
    + \$50-\$199
    + \$200 and up
    + Pick pocket
    + Purse snatching
    + Shoplifting
    + Stealing from a car (but not stealing the car itself)
    + Stealing parts of a car, such as the car battery or the tires
    + Stealing a bicycle
    + Stealing from a building where the offender is allowed to be in (and is not counted already as shoplifting)
    + Stealing from a "coin operated machine" which is mainly vending machines
    + All other thefts
* Robbery
    + Highway - This is an old term to say a place is outside and in generally accessible and visible areas. This includes robberies on public streets and alleys.
    + Commercial building - This is robberies in a business other than ones stated below. Includes restaurants, stores, hotels, bars. 
    + Gas station
    + Chain/convenience store - a neighborhood store that generally is open late and sells food
    + Home/residence
    + Bank
    + Miscellaneous/other - This is all other robberies not already covered.
* Motor vehicle theft
    + Stolen in current agency's jurisdiction and found by that agency
    + Stolen in current agency's jurisdiction and found by another agency
    + Stolen in another agency's jurisdiction and recovered by current agency
* Murder
* Rape

And here are the items stolen:

* Currency 
    + This includes all money and signed documents that can be exchanged for money (e.g. checks). Blank checks and credit and debit cards are not included (they are in the Miscellaneous/other  category)
* Jewelry and "precious metals"
    + Only metals that are considered high value are included here. Metals that are generally worth little are counted in the Miscellaneous/other category.
* Clothing and fur 
    + This also includes items that you take with you when leaving the house (except for your phone): wallet, shoes, purse, backpacks.
* Motor vehicle stolen in current agency's jurisdiction 
    + This includes only vehicles than can be driven on wheels so excludes trains and anything on water or that can fly.
* Office equipment and electronics 
    + This includes "typewriters" and "magnetic tapes" but is essentially any kind of equipment needed to run a business. So printers, computers, cash registers, computer equipment like a monitor or a mouse, and computer software. These items do not have to be stolen from a commercial building to be included in this category. 
* Sound and picture equipment 
    + This is a kind of odd category that is a product of its time. Anything that produces noise or pictures (including the fancy motion pictures) is included. This includes TVs, cameras, projectors, radios, MP3 players (but not phones that can play music) and (since again, this is a very old dataset) VHS cassettes. 
* Guns 
    + This includes all types of firearms other than toys or BB/pellet/paintball guns. 
* Home furniture 
    + This includes all of the "big things" in a house: begs, chairs, AC units, washer/dryer units, etc. However, items that are in the "Office equipment and electronics" category do not apply. 
* Consumable goods 
    + This is anything that can be consumed such as food, drinks, and drugs, or anything you use in the bathroom.
* Livestock 
    + This is all animals other than ones that you would consider a pet
* Miscellaneous/other 
    + Anything that is not part of the above categories would fall in here. Cell phones and credit cards are included. 
    
### Value of recovered property by type of item stolen

For the below subset of items stolen, this data includes the value of the items that were recovered. The only info we have for the value of recovered property is for the breakdown in the items themselves - not breakdowns of crimes such as robbery or burglary. So we can know the value of guns recovered, but not if those guns were taken from a burglary, a robbery, a theft, etc. 

While this dataset began in 1960, the recovered property variables begin later, and in different years. For clothing and fur, currency, jewels and precious metals, motor vehicles, miscellaneous/other, and the variable that sums up all of the recovered property variables, the first year with data was 1961. The remaining variables - consumable goods, guns, household goods/home furniture, livestock, office equipment and electronics, and sound and picture equipment - began in 1975.

Another issue is that it uses the value of the property as it is recovered, not as it is stolen. For example, if someone steals a laptop that is worth \$1,000 and then the police recover it damaged and it is now worth only \$200, we would see \$1,000 for the stolen column for "office equipment and electronics" and only \$200 for the recovered column for that category. So an agency that recovers 100% of the items that were stolen can appear to only recover a fraction of them since the value of recovered items could be substantially lower than the value of stolen items - and there is no way to know how many items are actually recovered, we must rely on the value of stolen and recovered.^[Even if we look at the Offenses Known and Clearances by Arrest data, that only says if there was an arrest or exceptional clearance in the case, not if the property stolen was recovered]

The full list of items recovered are below:

* Currency 
* Jewelry and "precious metals"
* Clothing and fur 
* Motor vehicle stolen in current agency's jurisdiction 
* Office equipment and electronics 
* Sound and picture equipment 
* Guns 
* Household goods/Home furniture 
* Consumable goods 
* Livestock 
* Miscellaneous/other 
    
## Data errors

This dataset comes with a considerable number of data errors - basically enormous valuations for stolen property.^[Since the minimum value is 0 there is less chance of data errors underestimating the value of an item, though some errors must certainly occur.] Some of the values are so big that it is clearly an error and not just something very expensive stolen. However, this gets tricky since there can in fact simply be very expensive items stolen and make it look like an error. Some of the stolen property include variables for both the number of items of that type stolen and the total value of the items. From this we can make an average value per item stolen which can help our understanding of what was stolen. However, some items only have the value of the property stolen and the value of property recovered so we actually do not know how many of those items were stolen. These cases make it even harder to believe that a large value is true and not just a data error since we do not know if the number of these thefts increased, causing the increase in the value reported. We will look at a couple examples of this and see how difficult it can be to trust this data.

First, we will look at the value of livestock thefts in New York City. Livestock is one of the variables where we know the value stolen and recovered but not how many times it happened. Being a major urban city, we might expect that there are not many livestock animals in the city so the values should be low. Figure \@ref(fig:nycLivestock) shows the annual value of livestock thefts in NYC. There are two major issues here. First, in all but two years they report $0 in livestock thefts. This is likely wrong since even New York City has some livestock (even just the police horses and the horse carriages tourists like) that probably got stolen. The second issue is the massive spike of reported livestock theft value in 1993 with over \$15 million stolen (the only other year with reported thefts is 1975 with \$87,651 stolen). Clearly NYC did not move from \$0 in thefts for decades to \$15 million in a year and then \$0 again so this is a blatant data error. 

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/nycLivestock-1.png" alt="The annual value of stolen livestock in New York City, 1960-2022." width="90%" />
<p class="caption">(\#fig:nycLivestock)The annual value of stolen livestock in New York City, 1960-2022.</p>
</div>

It gets harder to determine when a value is a mistake when it is simply a big spike - or drop - in reported value in a dataset that otherwise looks correct. Take, for example, the annual value of stolen clothing and fur in Philadelphia from 1960-2019, shown in Figure \@ref(fig:phillyFurValue). The annual value of these stolen items more than doubled in 1989 compared to the previous year and then declined rapidly in the following year. Is this real? Is it a data error? It is really hard to tell. Here we do not know how many clothing/fur thefts there were, only the value of the total thefts that month (which is aggregated annually here). It continues a multi-year trend of increasing value of thefts but it larger than previous increases in value. And while the spike is very large in percent terms, it is not so extraordinarily huge that we immediately think it is an error - though some outlier detection methods may think so if it is beyond the expected value for that year. 

Remember too that Philly had several years in this time period where only part of that year's data was reported. In fact both 1988 and 1989 had fewer than 12 months of data; as did 1974 and 1975. So the year with <12 months had an atypically high value of clothing and fur stolen. Normally we would expect less data to lead to smaller numbers. But that is not always true. Sometimes less data is a sign that there is something wrong with the data quality altogether and that we need to be cautious of any value in that year. And even though we know that some years are missing months of data just looking at this figure it is not clear which years those are. So while graphing data helps, it is only by looking at the data itself - and yes, this means you will likely need to pull out a programming language like R or python, or at the very least use Excel - and look at each data point before trusting this data. 

It is also important to have some understanding of what the data *should* look like when trying to figure out what data point may be incorrect. In this figure we see a huge spike in 1989. If we know, for example, that a ring of fur thieves were active this year, then that makes it far more likely that the data is real. This may be a rather odd example, but it is helpful to try to understand the context of the data to better understand when the "weird" data is an error and when it is just "weird but correct".

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/phillyFurValue-1.png" alt="The annual value of stolen clothing and fur in Philadelphia, PA, 1960-2019" width="90%" />
<p class="caption">(\#fig:phillyFurValue)The annual value of stolen clothing and fur in Philadelphia, PA, 1960-2019</p>
</div>

Finally, some errors are so extreme that it is shocking they were not captured during any of the review points from the police officer entering data in their agency's computer to the FBI releasing this data to the public. For example, Figure \@ref(fig:romeBicycles) shows Rome, New York, a city of about 32,000 people in central New York State. Here's what the reported value of bicycles stolen was for Rome in our data.^[For this example we would not worry about years where <12 months of data were reported.]

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/romeBicycles-1.png" alt="The annual value of stolen bicycles in Rome, New York, 1960-2022." width="90%" />
<p class="caption">(\#fig:romeBicycles)The annual value of stolen bicycles in Rome, New York, 1960-2022.</p>
</div>

2020 had a bit of a spike in their stolen bicycle value, from less than $10,000 is the previous few years to over \$5 billion. Yes, that is billion with a "b." 2021 followed by slightly under \$3 billion worth of bicycles stolen. In both years 19 bicycles were reported stolen. 

Bicycles were not the only thing stolen in Rome. Consumable goods such as food and toiletries were stolen to the tune of \$5 billion in 2020 and \$1 billion in 2022, with only $84,278 worth of goods stolen in 2021. To put this into perspective - not that it is really needed - the total amount of property stolen by theft in 2019, according to this data, was \$8 billion. Rome, NY, superseded that by far just through two groups of property stolen. 

Now, obviously this is not real. This is just an error with the police entering in the wrong price. But the issue is that through all the layers of checks that occurred - checks by the local police, by the state UCR system (though some agencies submit directly to the FBI) and the FBI themselves - failed to prevent this incorrect data from being published. This is an obvious, glaring error. If this slipped through the cracks, what less glaring issue did too? So you cannot just trust that this data is right. You need to check and recheck^[and check again.] everything before using it. This is the right approach for all data, and especially for this data. 

<div class="figure" style="text-align: center">
<img src="04_stolen_property_files/figure-html/romeConsumable-1.png" alt="The annual value of stolen consumable goods in Rome, New York, 1960-2022." width="90%" />
<p class="caption">(\#fig:romeConsumable)The annual value of stolen consumable goods in Rome, New York, 1960-2022.</p>
</div>

<!--chapter:end:04_stolen_property.Rmd-->

# Arrests by Age, Sex, and Race {#arrests}





The Arrests by Age, Sex, and Race dataset - often called ASR, or the "arrests data", or sometimes the "Arrests by Age, Sex, Race, and Ethnicity though this is really misleading since most years do not even report ethnicity data - includes the monthly number of arrests for a variety of crimes and, unlike the crime data, breaks down this data by age and gender. This data includes a broader number of crime categories than the crime dataset (the Offenses Known and Clearances by Arrest data) though is less detailed on violent crimes since it does not breakdown aggravated assault or robberies by weapon type as the Offenses Known data does.

For each crime it says the number of arrests for each gender-age group with younger ages (15-24) showing the arrestee's age to the year (e.g. age 16, age 17) and other ages grouping years together (e.g. age 25-29, 30-34, "under 10"). It also breaks down arrests by race-age by including the number of arrestees of each race (American Indian, Asian, Black, and White are the only included races) and if the arrestee is a juvenile (<18 years old) or an adult. The data does technically include a breakdown by ethnicity-age (e.g. juvenile-Hispanic, juvenile-non-Hispanic) but almost no agencies report this data (for most years zero agencies report ethnicity at all) so in practice the data does not include ethnicity. As the data includes counts of arrestees, people who are arrested multiple times are included in the data multiple times - it is not a measure of unique arrestees. 

## Agencies reporting

This data is available from 1974 through 2022 though after 2020 the measure for how many months of data an agency reported changed so post-2020 data is difficult to compare to 2020 and earlier.^[Post-2020 years do have considerably fewer agencies reporting than in previous years.] Figure \@ref(fig:arrestsAgenciesReporting) shows how many agencies reported at least one month of the year for 1974-2020. I am not sure why there is a dip in 1980. Since it immediately reverses itself in the next year I think it is just a data issue, not a real decrease in the number of agencies that report. The first year of data has about 9,000 agencies reporting and that increases strongly to a little over 13,000 in 1979. Following the odd blip in 1980, the number of agencies remain steady for nearly a decade before declining to a local low of about 11,000 in 1998 before again increasing steadily until the end of the 2010s where nearly 15,000 agencies report. This 15,000, however, still remains under the estimated 18,000 police agencies in the United States and below the reporting rates of UCR data such as the Offenses Known and Clearances by Arrest data. This data is also missing some important cities such as New York City which has not reported even a single month since 2002 and Chicago which tends to only report a single month if at all.   

<div class="figure" style="text-align: center">
<img src="05_arrests_files/figure-html/arrestsAgenciesReporting-1.png" alt="The annual number of agencies reporting at least one month of data and 12 months of data in that year." width="90%" />
<p class="caption">(\#fig:arrestsAgenciesReporting)The annual number of agencies reporting at least one month of data and 12 months of data in that year.</p>
</div>

Another issue is that agencies can report only some crimes. So, for example, they may report how many people were arrested for theft but not for murder, and it is unclear when that means that truly zero people were arrested for murder and when the agency just did not report. This is not in the original data but in my version of this data (available [here](https://www.openicpsr.org/openicpsr/project/102263/version/V15/view)), I added variables for the number of months reported (based on the agency reporting at least arrest for that crime in that year) for each crime category.^[As I noted before, post-2020 data changed the way they reported this variable so the number of months reported is always set to 0, even if they actually did report data.] Again, please note that when there are fewer than 12 months reported in that year for that variable, that could simply mean that there were no arrests for that crime that year (The FBI does tell agencies not to even submit a report in these cases) - but we do not know that for sure. 

## What is an arrest? (what unit is this data in?)

A key part of understanding this data is knowing what unit of analysis it is in. This data is the monthly number of *total arrests for a given crime, with only the most serious crime per incident included*. Consider for example, a person who robs a bank, shooting and killing a guard and pointing their gun at other people in the bank. They are arrested and then released from jail (just imagine that this is true) and are then arrested the next day for shoplifting. And let us further assume that both arrests were in the same month in the same agency. How many arrests are here? They committed multiple crimes in the first incident (murder, robbery, aggravated assault) but in this dataset they would only be classified as an arrest for the most serious crime, murder. And then separately they would also be an arrested for shoplifting. So assuming that no other arrests occurred in that police agency that month, there would be two arrests reported: one for murder and one for shoplifting. 

There's no way to tell how many unique people were arrested, or of those arrested multiple times which crimes they were arrested for. So if you have 100 arrests there may be 1 person arrested 100 times or 100 people arrested once - though, of course, the true number is likely somewhere in between. This means that studies that try to use this data as a measure of unique people or even the percent of arrestees by group (age, gender, or race) relative to some base rate of the population such as the number of people living in that city are going to be wrong - though how wrong is unclear.^[While all studies are going to be *estimates* of the real effect, that is no reason to be flippant in using data (FBI data or any other data). Without having a high level of confidence that your estimates are close to the actual value, you should not do that study.] 

Common uses of this data - more common in more news articles or advocacy group reports than in peer-reviewed research articles - compare the percent of arrestees of a certain group to the percent of a city's population of that group. Any differences between the arrestee percent and the resident percent is, according to these reports, evidence of a disparity (this is most common for looking at differences by race).^[Disparity, of course, does not even mean discrimination.] For example, say a city is equally split between Black and White residents (and no other races are present, for the simplicity of this example). If >50% of arrestees for a particular crime are Black, that is often cited as evidence of anti-Black discrimination. There are two assumptions built into this. First, that offending rates are identical between Black and White residents; second, that reoffending rates are identical. If, for example, Black people in this example commit that crime at higher rates than White people then all else being equal you would expect this group to have a higher share of arrests than their share of the resident population. Second, it assumes that people of each race are rearrested at similar rates. Put another way, it assumes that if 100 Black people are arrested and 100 White people are arrested, there are an equal number of unique people in each group. If these assumptions are violated - and they certainly are violated to some degree in every use of the data - the conclusions will be wrong. Whether this distinction between arrests and unique people arrested affects your interpretation of the data depends on the study you are doing, but it is important to consider in your research. One way to address this is to use other data on the rate of rearrest by group, though you would have to be very careful to not extrapolate the results of the other study too far beyond what they could tell you of the specific time and place they studied. 

Another solution would be to try to bound results, such as calculating how extreme your assumptions (e.g. assuming how different the true offense rates between races are) can be for your conclusions to still hold. Going back to the example of a city with 50% White and 50% Black people, say that there are 10 arrests with a split of 1 White and 9 Black arrestees. If offense rates are identical you would expect 5 White and 5 Black people arrested, not a disparity of 9 to 1. So you could say that this disparity is reasonable if the Black people commit this offense at a rate of nine times as often than White people.^[This is a simplification as there are other things that affect arrests such as witness cooperation,  details of the offense like time of day and location. and (especially in the case of rare events like only 10 arrests) random chance.] Is this bounding assumption reasonable? In this context-less example, I have no idea. There certainly may be cases where it is reasonable but that is context dependent. And - as I keep trying to argue in this book - you need to understand the context of what you are studying. Numbers are not enough. If based on your understanding of the context of what you are studying you believe that it is unreasonable that Black people commit that offense at a rate nine times that of White people, then you may conclude that the disparity is not explained by differences in offending rates. Your next step is to identify another explanation and try to rule that out too. 

### The Hierarchy Rule

In incidents where the arrestee commits multiple crimes, this data uses something called the Hierarchy Rule which says that only the most serious crime is counted as the crime that the person was arrested for. This is a limitation of this dataset that is solved in the FBI's NIBRS data which we will discuss in Chapter \@ref(#arrestee).

For a comprehensive overview of the Hierarchy Rule, please see Section \@ref(hierarchy). Basically, the FBI chose seven crimes in 1929 that they call Index Crimes - or sometimes called Part I crimes - and these were considered the most important crimes to be recorded.^[Partly based on the quality of the data available as they considered these crimes to be a good combination of well-reported and serious.] For more on Index Crimes, please see Section \@ref(indexCrimesOffensesKnown). If a person is arrested for multiple crimes and an Index Crime is one of those crimes, then the Index Crime at the top of the Hierarchy is the one recorded in this data. Section \@ref(arrestsCrimesIncluded) shows all crimes included and the crimes 1-7 as well as 9 (arson) are the Index Crimes. The top of the Hierarchy is the crime with the lowest number. So murder is always reported in incidents where there is a murder; rape is always reported when there is an incident with rape but no murder; etc. 

In incidents where the arrestee committed both an Index Crime and a Part II crime, then only the top Index Crime is recorded. This can lead to rather silly results since some Part II crimes are certainly more serious than some Index Crimes. Consider, for example, a person arrested for simple assault, carrying a firearm, pimping, and theft. The first three crimes are, in my opinion, clearly more serious than theft. But since theft is an Index Crime, this person would be considered to have been arrested for theft. 

The remaining crimes are called Part II crimes and are not arranged in any particular way. So a lower value numbered crime is not higher on the Hierarchy than a higher value number - Part II crimes do not follow the Hierarchy. If all of the crimes in an incident are Part II crimes then the agency must decide for themselves which crime is the most serious. This can lead to agencies deciding their own hierarchy differently than others which makes this data much less comparable across agencies than if there was a standard rule.^[This here is another example of where the "Uniform" part of Uniform Crime Reporting is more of a suggestion than a rule.]  

## Crimes included {#arrestsCrimesIncluded}

1. Homicide
  + Murder and non-negligent manslaughter
  + Manslaughter by negligence
2. Rape
3. Robbery
4. Aggravated assault
5. Burglary 
6. Theft (other than of a motor vehicle)
7. Motor vehicle theft
8. Simple assault
9. Arson
10. Forgery and counterfeiting
11. Fraud
12. Embezzlement
13. Stolen property - buying, receiving, and possessing
14. Vandalism
15. Weapons offenses - carrying, possessing, etc.
16. Prostitution and commercialized vice
17. Sex offenses - other than rape or prostitution
18. Drug abuse violations - total
  + Drug sale or manufacturing
    - Opium and cocaine, and their derivatives (including morphine and heroin)
    - Marijuana
    - Synthetic narcotics
    - Other dangerous non-narcotic drugs
  + Drug possession
    - Opium and cocaine, and their derivatives (including morphine and heroin)
    - Marijuana
    - Synthetic narcotics
    - Other dangerous non-narcotic drugs
19. Gambling - total
  + Bookmaking - horse and sports
  + Number and lottery
  + All other gambling
20. Offenses against family and children - nonviolent acts against family members. Includes neglect or abuse, nonpayment of child support or alimony.
21. Driving under the influence (DUI)
22. Liquor law violations - Includes illegal production, possession (e.g. underage) or sale of alcohol, open container, or public use laws. Does not include DUIs and drunkenness.
23. Drunkenness - i.e. public intoxication
24. Disorderly conduct
25. Vagrancy - includes begging, loitering (for adults only), homelessness, and being a "suspicious person."
26. All other offenses (other than traffic) - a catch-all category for any arrest that is not otherwise specified in this list. Does not include traffic offenses. Very wide variety of crimes are included - use caution when using!
27. Suspicion - "Arrested for no specific offense and released without formal charges being placed."
28. Curfew and loitering law violations - for minors only.
29. Runaways - for minors only.

## Important variables

This data has the standard set of variables describing the agency that is reporting. This includes the agency ORI - which is the unique ID for that agency - the agency name, their state, the population under their jurisdiction, and the month and year of the data.

For each crime this data provides the number of arrests in that month (or year for the annual data) broken down by age (within this, by sex), by race (within this, by if they are a juvenile or an adult), and by ethnicity though this is an enormously flawed variable. Finally, we also know the number of juvenile arrests that ended in a few possible outcomes (e.g. released without charges, referred to juvenile court), though we do not know the crime that led to these arrests. We will get into each of these variables below. 

### Age

For each crime the data provides the number of people of each sex by age, with several years in the peak offending age given as the specific age and younger and older ages broken into groups. Only female and male options are available, and there is no variable for "unknown" sex. There is also no option for transgender so whether the sex for that arrestee is their biological sex or their current gender is likely dependent on the policy of the arresting agency. So to get a total arrests for that crime for that age, just add the female and male variables together. Below are the ages or age categories included in the data, and these are the same for female and male arrestees.

* Female
    + Under 10
    + 10-12
    + 13-14
    + 15
    + 16
    + 17
    + 18
    + 19
    + 20
    + 21
    + 22
    + 23
    + 24
    + 25-29
    + 30-34
    + 35-39
    + 40-44
    + 45-49
    + 50-54
    + 55-59
    + 60-64
    + 65 and older
* Male
    + Under 10
    + 10-12
    + 13-14
    + 15
    + 16
    + 17
    + 18
    + 19
    + 20
    + 21
    + 22
    + 23
    + 24
    + 25-29
    + 30-34
    + 35-39
    + 40-44
    + 45-49
    + 50-54
    + 55-59
    + 60-64
    + 65 and older
    
One way to use this data is to look at the age-crime curve of offending. The age-crime curve is a criminological finding that crime trends to grow in the early teenage years to peaking around age 18 before declining sharply. So essentially people commit crime as teenagers and then tend to fizzle out as they get older. Figure \@ref(fig:phillyRapeAge) shows this trend for male arrestees of rape in Philadelphia from 1974-2022, which is every year of data we have available. A major problem with this figure is that some of the ages are for single years and some are for age categories. In the graph there were 793 arrests for rape for people aged 24. The next age is the category of aged 25-29 and there were 3,604 arrests for this age group. One way to address this is to assume that each age in the category has the same number of arrests, so dividing 3,604 by 5 gives us about 721 arrests per age. Assuming equal arrests by age, however, is not consistent with either the literature on the age-crime curve or the findings in this figure for previous ages, as the number of arrests by age is, overall, going down since age 18. So instead of assuming equality, would we assume that older ages have fewer arrests than younger ages (maybe taking the percent change from the previous years where we do have individual ages available)? This is a tricky question to answer and it makes these kinds of analyses really hard to do - and very imprecise since all of your assumptions will be wrong, though hopefully not *too* wrong. 

<div class="figure" style="text-align: center">
<img src="05_arrests_files/figure-html/phillyRapeAge-1.png" alt="The total number of rapes by male arrestees reported by arrestee age in Philadelphia, 1974-2022." width="90%" />
<p class="caption">(\#fig:phillyRapeAge)The total number of rapes by male arrestees reported by arrestee age in Philadelphia, 1974-2022.</p>
</div>

### Race

The data also breaks down the number of arrests for each crime by race, with the only included races being American Indian, Asian, Black, and White.^[There is no option for a person who is mixed-race. Only one race may be chosen.] This is further broken down into if the arrestee was an adult (18 years or older) or a juvenile (under 18). Whether the arrestee is Hispanic is in a separate (and nearly universally non-reported variable). Since the ethnicity variable is separate, and since the data is not at the arrestee-level unit, there is no way to interact the race and ethnicity variables. So, for example, there is no way to determine how many White-Hispanic or White-Non-Hispanic arrestees. Just total White arrestees and total Hispanic arrestees. 

As with race variables in other UCR datasets - and, really, any dataset - you should be cautious about using this variables since it is the officer's perception of the arrestee's race - though of course some arrests do have other data about the arrestee's race such as what they tell the officer. In cases where the arrestee is carrying identification such as a driver's license this variable is likely to be extremely well reported. However, we cannot tell from this data whether the race is based on something like a license or is merely the officer's perception.^[In my experience working directly with police data where I can identify a person arrested multiple times in about 5-10% of cases they have at least one arrest where their reported race is different than other arrests. Such as a person arrested five times and being reported as White four times and Black once. This is probably a mix of officers perceiving people differently (e.g. mixed race people) and having different officers report different race for the same person, and human error when entering data. But all of it suggests that there is at least some uncertainty in this variable.] 

Even though there is information about the specific age of arrestee (or the age range, depending on the arrestee's age) and their gender, there is no gender information combined with race and no age beyond the adult/juvenile binary. If you add up all arrests that are broken down by gender-age and compare it to the sum of all of the arrests broken down by adult/juvenile-race here, in some cases these numbers do not add up. That's because while most agencies do report the age variables, not all agencies report the race variables. So summing up the race variables will actually undercount the total number of arrests. 

* Adult
    + American Indian
    + Asian
    + Black
    + White
* Juvenile
    + American Indian
    + Asian
    + Black
    + White
    
Figure \@ref(fig:phillyMarijuanaRacePercent) shows one example of an analysis of this data by showing the percent of arrests of adults for marijuana possession by the arrestee's race in Philadelphia, PA for all years of data we have available, 1976-2022. At the bottom are American Indian and Asian arrestees who make up nearly none of the arrests for this crime. Black arrestees, shown in purple, make up the bulk of arrests with only a few years making up under 60% of arrests and growing to around 80% of arrests since the mid-2000s. As White arrestees, shown in black, are the only other race category included, they make up a near perfect mirror image of Black arrestees, composing of around 40% of arrests until decreasing starting in the 1990s to end up with about 20% of arrests in recent years. 

<div class="figure" style="text-align: center">
<img src="05_arrests_files/figure-html/phillyMarijuanaRacePercent-1.png" alt="The annual percent of adult marijuana possession arrests in Philadelphia by arrestee race, 1976-2022." width="90%" />
<p class="caption">(\#fig:phillyMarijuanaRacePercent)The annual percent of adult marijuana possession arrests in Philadelphia by arrestee race, 1976-2022.</p>
</div>

Interestingly, while the disparity between Black-White arrests has grown dramatically in recent decades, the total number of arrests have a very different trend as shown in Figure \@ref(fig:phillyMarijuanaRaceCount). Total marijuana possession arrests declined in the mid-1980s then increased in the mid-1990s from only a few hundred arrests in the early 1990s to nearly 6,000 arrests in the late-2000s before dropping precipitously to about 700 each year in the late-2010s. Yet throughout this latter period as a percent of arrests, Black people consistently grew for years before plateauing around 2007 with a small decline in the last few years including a drop to 35 in 2020 and then a rebound in following years. Philadelphia decriminalized marijuana possession in 2014 under Mayor Nutter which is right when the steepest decline in arrests happened, though in the last couple of years also saw a decline in arrests. This suggests that who is arrested, in terms of race, is relatively unrelated to the total number of arrests, at least for marijuana.
    
<div class="figure" style="text-align: center">
<img src="05_arrests_files/figure-html/phillyMarijuanaRaceCount-1.png" alt="The annual number of adult marijuana possession arrests in Philadelphia by arrestee race, 1976-2022." width="90%" />
<p class="caption">(\#fig:phillyMarijuanaRaceCount)The annual number of adult marijuana possession arrests in Philadelphia by arrestee race, 1976-2022.</p>
</div>
  
### Ethnicity

While technically included, the ethnicity variable is largely useless since for most years no agencies reported it and for the years where agencies do report ethnicity, not all agencies do so. The ethnicities included are Hispanic and non-Hispanic and are broken down by if the arrestee is an adult (18+ years old) or a juvenile (<18 years old).

* Adult
    + Hispanic
    + Non-Hispanic
* Juvenile
    + Hispanic
    + Non-Hispanic

Figure \@ref(fig:theftHispanic) shows the annual number of Hispanic arrestees for theft for all agencies that reported any data that year.^[Theft is used as it is one of the most common crimes.] For several years no agencies reported until the number of Hispanic arrestees start climbing in 1980 and peaks in 1986 at about 136,000 arrestees. Then there are zero Hispanic arrestees for a few years, four Hispanic arrestees in 1990, and then again zero Hispanic arrestees, this time for decades. Only in 2017 do the number of Hispanic theft arrestees begin to creep up. From 2017 to 2022 (the last year available at the time of this writing) there are Hispanic arrestees reported every year, though now only about 60,000 per year.
    
<div class="figure" style="text-align: center">
<img src="05_arrests_files/figure-html/theftHispanic-1.png" alt="The national annual number of Hispanic arrestees for theft. This includes all agencies that year that reporting any number of months. Hispanic arrestees include both juvenile and adult arrestees" width="90%" />
<p class="caption">(\#fig:theftHispanic)The national annual number of Hispanic arrestees for theft. This includes all agencies that year that reporting any number of months. Hispanic arrestees include both juvenile and adult arrestees</p>
</div>

Perhaps a better way to look at this data is to see what percent of agencies report ethnicity data. Figure \@ref(fig:theftHispanicPercentAgencies) show the percent of agencies each year that report at least one Hispanic or non-Hispanic (which are the only choices, but showing only Hispanic arrests would exclude agencies where no Hispanic people truly were arrested) arrest for theft, of all agencies that reported theft data. About 90-95% of agencies reported ethnicity data in the early 80s and then only a couple agencies report in 1990 and 1991. Other than those agencies, none report between 1987 and 2017. Starting in 2017, 36% of agencies report and this number has grown by about five percentage points a year to 56% in 2022 Since only a bit over half of agencies currently report, I strongly recommend against using these variables, even for the recent years of data. 

<div class="figure" style="text-align: center">
<img src="05_arrests_files/figure-html/theftHispanicPercentAgencies-1.png" alt="The annual percent of agencies that report theft arrests that reported at least one Hispanic person or one non-Hispanic person arrested for theft. Arrestees include both juvenile and adult arrestees." width="90%" />
<p class="caption">(\#fig:theftHispanicPercentAgencies)The annual percent of agencies that report theft arrests that reported at least one Hispanic person or one non-Hispanic person arrested for theft. Arrestees include both juvenile and adult arrestees.</p>
</div>

### Juvenile referrals

The final variable of interest are five mutually exclusive outcomes for juveniles who are arrested by the police for a crime that if they were adults would have been counted as a formal arrest. This variable is not available for data after 2020.

Unlike the rest of this dataset where juvenile is defined as being under the age of 18, these variables allow states to use their own definition of juvenile. So potentially the limit for who is a juvenile could be below the age of 18, and nothing in the data indicates when this is so - you would have to check each state to see their definition and if it changed over time. There is no breakdown by crime so this gives you the outcomes for juveniles arrested for all crimes in that agency. Please note that the number of juveniles in other variables and the number here do not always line up, which is a mix of underreporting of this variable, arrests for other jurisdictions are not counted as an arrest in the above variables, and different age definitions for who is a juvenile. A juvenile may potentially get multiple referrals, such as being released and then later referred to court. But in this data only the *initial* referral is included. It is also unclear - and likely determined by a particular agency's policy - what is reported when there are multiple initial referrals. Below are the five potential outcomes and definitions of each: 

* Handled within department and released
    + Juvenile is arrested but then released without any formal charges. Generally released to adult relatives with a warning but no formal charge.
* Referred to juvenile court or probation department
* Referred to welfare agency
* Referred to other police agency
    + This includes when the agency makes an arrest on behalf of a different agency, such as when the juvenile committed a crime in that different agency's jurisdiction. People arrested in this category are also not included in the other variables for juvenile arrests (e.g. arrests by age) as that only includes people who committed a crime in the agency's own jurisdiction. 
* Referred to criminal or adult court
    + These are juveniles who are referred to be tried in criminal court as adults. This is for states that allow juveniles to be tried as adults. This is the police's recommendation that they be tried as adults, regardless of the decision of the district attorney or court for whether that juvenile is ultimately tried as an adult. 

We can look at an example of this in Figure \@ref(fig:phillyJuvenileReferrals) which shows the annual number of referral types in the entire United States from 1974-2020 For all the first couple of years almost all of the referrals have either been that the agency handles the arrest internally and releases the juvenile without any formal charges, or that the juvenile is formally arrested and referred to juvenile court. This is a pretty consistent trend with those two categories being the predominant outcome for juveniles arrested in other agencies and over time. In most years handled internally is the most common outcome though juvenile court is occasionally more common, including in recent years.  

<div class="figure" style="text-align: center">
<img src="05_arrests_files/figure-html/phillyJuvenileReferrals-1.png" alt="The annual number of juvenile referrals in the United States by referral type, 1974-2020." width="90%" />
<p class="caption">(\#fig:phillyJuvenileReferrals)The annual number of juvenile referrals in the United States by referral type, 1974-2020.</p>
</div>

<!--chapter:end:05_arrests.Rmd-->

# Supplementary Homicide Reports (SHR) {#shr}



The Supplementary Homicide Reports dataset - often abbreviated to SHR - is the most detailed of the SRS datasets and provides information about the circumstances and participants (victim and offender demographics and relationship status) for homicides. For each homicide incident it tells you the age, gender, race, and ethnicity of each victim and offender as well as the relationship between the first victim and each of the offenders (but not the other victims in cases where there are multiple victims). It also tells you the weapon used by each offender and the circumstance of the killing, such as a "lovers triangle" or a gang-related murder. As with other SRS data, it also tells you the agency it occurred in and the month and year when the crime happened. 

One important point of clarification: this is not the number of murders, though it does track that. This data also includes the number of homicides that are manslaughter by negligence (e.g. children playing with a gun, hunting accident) and justifiable homicides (i.e. not criminal). So be carefully when speaking about this data. It is murders but not only murders so you want to speak precisely. 




## Agencies reporting

This data only has a report when the agency has a homicide that year and since homicides are relatively rare it is difficult to measure underreporting. One way we can look at reporting is to compare homicide in the SHR data with that of other datasets. We will look at two of them: the Offenses Known and Clearances by Arrest which is covered in detail in Chapter \@ref(offensesKnown), and the Center for Disease Control and Prevention (CDC) data on national deaths from homicide.^[CDC WONDER data is available here: https://wonder.cdc.gov/] Both this dataset and the Offenses Known and Clearances by Arrest data are SHR datasets so you may think that the numbers of homicides from each dataset should be the same. That is a perfectly reasonable assumption, but since this is SHR data we are talking about, you would be wrong. Police agencies are free to report to either, both, or neither dataset so while the number of homicides are close for each dataset, they are never equal. CDC WONDER data aggregates mortality data (among other data) from state death certificates which reduces the issue of voluntary reporting that we have in SHR data.

Figure \@ref(fig:shrVsOffenses) shows the annual number of homicide victims (including murders and manslaughters) from each of these datasets starting in 1976 for the SHR data and in 1999 for the CDC data.^[1975 is actually the first year that the Supplementary Homicide Reports data is available but that dataset only has info for a single victim and offender - all later years has info for up to 11 victims and offenders - so 1976 is often used as the first year of data] 

For the SHR data, in every year the numbers are fairly similar and the trends are the same over time, but the number of homicides is never equal. The numbers have actually gotten worse over time with the difference between the datasets increasing and the Offenses Known data having consistently more murders reported than the SHR data since the late 1990s. Compared to the CDC data, however, both SHR datasets - and in particular the SHR data - undercount the number of homicides. While trends are the same, SHR data reports thousands fewer murders per year than the CDC data, indicating how much of an issue underreporting is in this data.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVsOffenses-1.png" alt="The annual number of murders and nonngeligent manslaughters from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset, and homicides from the Center for Disease Control (CDC). Numbers differ because agencies voluntarily report and may not report to both datasets." width="90%" />
<p class="caption">(\#fig:shrVsOffenses)The annual number of murders and nonngeligent manslaughters from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset, and homicides from the Center for Disease Control (CDC). Numbers differ because agencies voluntarily report and may not report to both datasets.</p>
</div>

Let us look at Chicago for another example of the differences in reporting from the SHR and the Offenses Known data. Figure \@ref(fig:chicagoSHRvsOffensesKnown) shows the annual number of homicide victims from both datasets. In most years they are pretty similar, excluding a few really odd years in the 1980s and in 1990. But what is also strange is that most years have more SHR victims than Offenses Known victims. So nationally SHR has fewer homicides than Offenses Known but that pattern is reversed in Chicago? This is one of the many quirks of SHR data. And is a warning against treating national trends as local trends; what is true nationally is not always true in your community. So when you use this data, check everything closely. And once you have done that, check it again. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/chicagoSHRvsOffensesKnown-1.png" alt="The annual number of homicide victims in Chicago, SHR and Offeksnes Known, 1976-2022." width="90%" />
<p class="caption">(\#fig:chicagoSHRvsOffensesKnown)The annual number of homicide victims in Chicago, SHR and Offeksnes Known, 1976-2022.</p>
</div>

Another way to visualize reporting is to see the total number of agencies that report at least one homicide, as depicted in Figure \@ref(fig:shrAnnualAgencies). Here we can see that have about 3,000 agencies reporting. Given that most agencies are small and truly do have zero homicides in a year, that may be reasonable. Agencies that do not have homicides do not submit a report saying so, they just do not submit any data. So that makes it hard to tell when an agency not reporting data is doing so because they choose to not report, or because they have nothing to report. This is most common in small agencies where many years truly have no homicides. But let us look at our biggest agencies, and see how much of an impact it would make to have them not report data.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrAnnualAgencies-1.png" alt="The annual number of agencies that report at least one homicide." width="90%" />
<p class="caption">(\#fig:shrAnnualAgencies)The annual number of agencies that report at least one homicide.</p>
</div>

Figures \@ref(fig:shrTopAgenciesCount) and \@ref(fig:shrTopAgenciesCountPercent) attempt to get at this question by looking the number and percent of all incidents that the top 100, 50 and 10 agencies based on number of homicide incidents make up out of all homicide incidents in each year. These agencies are massively disproportionate in how many homicides they represent - though they are also generally the largest cities in the country so are a small number of agencies but a large share of this nation's population. On average, the 10 agencies with the most homicide incidents each year - which may change every year - have over 4,000 homicide incidents and make up about 1/4 of all homicide incidents reported nationally. The top 50 have about 7,500 incidents a year, accounting for 46% of incidents. The top 100 agencies have a bit under 10,000 incidents a year and make up over 55% of all homicide incidents in the United States. So excluding the largest agencies in the country would certainly undercount homicides.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrTopAgenciesCount-1.png" alt="The annual number of homicide incidents, showing all agencies, the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrTopAgenciesCount)The annual number of homicide incidents, showing all agencies, the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2022.</p>
</div>


<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrTopAgenciesCountPercent-1.png" alt="The annual percent of homicide incidents by the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrTopAgenciesCountPercent)The annual percent of homicide incidents by the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2022.</p>
</div>

## Important variables

The data has demographic information for up to 11 victims and 11 offenders, as well as the information on the weapon used by each offender, the relationship between the first victim and each offender, and the circumstance of the homicide. The data also has the traditional SHR set of variables about the agency: their ORI code, population, state, region and the month and year of this data. One key variable that is missing is the outcome of the homicide: there is no information on whether any of the offenders were arrested. 

While there is information on up to 11 victims and offenders, in most cases, there is only a single victim and a single offender in each incident. We can use the additional_victim_count and additional_offender_count columns to see how many additional victims/offenders there are. An additional victim/offender means in addition to the first one. Even though we have columns for up to 11 victims and offenders, in very rare instances the additional_[victim/offender]_count columns may say there are more than 11 victims/offenders.

To see how the breakdown for the number of victims in each incident looks, Figure \@ref(fig:numberSHRVictims) shows the percent of incidents with each possible number of victims.^[There are five incident where there are more than 11 victims. For simplicity of the graph, these incident are excluded.] In nearly all incidents - 96.0% - there was only a single victim. This drops to 3.3% of incidents for two victims, 0.5% for three victims, and only about 0.2% of incidents have four or more victims. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/numberSHRVictims-1.png" alt="The percent of incidents that have 1-11 victims." width="90%" />
<p class="caption">(\#fig:numberSHRVictims)The percent of incidents that have 1-11 victims.</p>
</div>

Figure \@ref(fig:numberSHROffenders) shows the breakdown of the number of offenders per homicide incident.^[There are seven incidents with more than 11 offenders. For simplicity of the graph, these incidents are excluded.] It is a little less concentrated than with victims but the vast majority of homicides are committed by one offender - or at least the police only report one offender. About 87.6% of homicides have only one offender, 8.4% have two, 2.5% have three, and 1.5% have four. Fewer than 0.5% of homicides have more than four offenders. However, this is all a bit misleading. In cases where there is no information about the offender, including how many offenders there is, the data simply says that there is a single offender. So the number of homicides with a single offender is an over-count while the number with more offenders is an undercount. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/numberSHROffenders-1.png" alt="The percent of incidents that have 1-11 offenders." width="90%" />
<p class="caption">(\#fig:numberSHROffenders)The percent of incidents that have 1-11 offenders.</p>
</div>

The variable "situation" says what type of victim-offender number combination the incident is - e.g. "multiple victims/single offender", "single victim/multiple offenders", etc. - and does indicate if the number of offenders is unknown (though curiously there are over 4,000 instances where the number of offenders is unknown but they still say there are two offenders) so you can use this variable to determine if the police do not know how many offenders there is. You're still limited, of course, in that the number of offenders is always what the police think there are, and they may be wrong. So use this variable - and anything that comes from it like the percent of offenders of a certain race - with caution. 

We will now look at a number of important variables individually. Since the data can potentially have 11 victims and 11 offenders - but in practice has only one each in the vast majority of cases - we will only look at the first victim/offender for each of these variables. Therefore, the results will not be entirely accurate, but will still give you a good overview of the data. The figures below will use data for all homicides from 1976 to 2022 so will cover all currently available years of data. Keep in mind that national trends are not the same as local trends so what is shown in these figures will probably not be the same as what is happening in your community. And that looking at all homicides means we are including murders, manslaughters, and justifiable homicides. 

### Demographics

There are two broad categories of variables that we will cover: demographics of the victim and offenders, and characteristics of the case. We start with demographics.

#### Age

This data includes the age (in years) for each victim and each offender. For those under one years old, it also breaks this down into those from birth to six days old "including abandoned infant" and those seven days old to 364 days old. So there is a bit more info on homicides of babies. It also maxes out the age at 99 so for victims or offenders older than that we do not get their exact age, just text that says "99 years or older" (which I turn to the number 99 in the figures below).  

Figure \@ref(fig:shrOffenderAge) shows the percent of homicides where the first offender in the case is of each age from 0-99. Offenders with unknown ages are excluded from this graph and make up about 27% of cases. The average (mean) age is 31.1 years old (shown in orange) which is due to a long right tail; the median age is 28 years old. If you look closely at the left side of the graph you can see that there are some very young offenders, with at least one offender for each year of age from 0 to 10 included in the data. It is not clear from this alone that these ages are a data entry error. While a two-year-old certainly could not kill someone, the data does include deaths caused by "children playing with gun" (homicide circumstances will be discussed in Section \@ref(circumstance)) so these ages could potentially be correct. 

If you are familiar with the age-crime curve in criminology - which basically says crime peaks in late teen years then falls dramatically - this shows that exact curve, though is older and does not decline as the offender ages as quickly as we see with less serious crimes. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrOffenderAge-1.png" alt="The age of homicide offenders, based on the first offender in any homicide incident. Offenders under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Offenders reported as '99 years or older' are considered 99 years old." width="90%" />
<p class="caption">(\#fig:shrOffenderAge)The age of homicide offenders, based on the first offender in any homicide incident. Offenders under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Offenders reported as '99 years or older' are considered 99 years old.</p>
</div>

Figure \@ref(fig:shrVictimAge) repeats Figure \@ref(fig:shrOffenderAge) but with victim age rather than offender age. The mean victim age (shown in orange) is 33 and the median age is 30. Though the average victim age is a bit younger than the average offender age, trends are relatively similar for teenagers and older where deaths spikes in the late teen years and then declines steadily. The major difference is the U-shape for younger victims - for victims under age 15, homicides peak at age 0 (i.e. younger than their first birthday) with ~1.4% of all homicides being this this age. They then decline until plateauing at around age 6 before increasing again in the early teen years. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVictimAge-1.png" alt="The age of homicide victims, based on the first victims in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old." width="90%" />
<p class="caption">(\#fig:shrVictimAge)The age of homicide victims, based on the first victims in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old.</p>
</div>

#### Sex 

We will next look at victim and offender sex, a simple variable since only male and female are included. About 62.2% of offenders, as seen in Figure \@ref(fig:shrOffenderSex), are male and about 8.2% are female, indicating a large disparity in the sex of homicide offenders. The remaining 29.6% of offenders do not have sex data available because the police do not know the sex of this individual. For offenders who are not arrested, this variable may be inaccurate since it is perceived sex of the offender.^[If we ignore unknown sex, essentially saying that the unknown people will have their sex distributed exactly as the known sex people, 88% are male and 12% are female. However, this assumption is probably wrong since the unknown people may be materially different than the known people, as evidence by them likely not being arrested and committing the crime in a way where even their sex cannot be identified. ] 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrOffenderSex-1.png" alt="The sex of offender \#1, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrOffenderSex)The sex of offender \#1, 1976-2022.</p>
</div>

There is far less uncertainty for victim sex, with under 0.17% of victims having an unknown sex. Here again there is a large disparity between male and female with about 78.2% of victims being male and 21.6% being female. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVictimSex-1.png" alt="The sex of victim \#1, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrVictimSex)The sex of victim \#1, 1976-2022.</p>
</div>

#### Race

This data also includes the race of the victims and offenders. This includes the following races: American Indian or Alaskan Native, Asian, Black, Native Hawaiian or Other Pacific Islander, and White. These are the only races included in the data; Hispanic is considered an ethnicity and is available as a separate, though flawed, variable. There is no category for bi- or multi-racial. As with other demographics info for offenders, in cases where no arrest is made (and we do not know in this data if one is made), there is no way to confirm the person's race so these results may not be entirely accurate. 

Figure \@ref(fig:shrOffenderRace) shows the percent of homicides in the data by the race of offender #1. Black and White offenders are included are similar percentages, at 34.3% and 33.6% of victims, respectively. The next most common group is Unknown at about 30.6% of offenders. Given that so many offenders have an unknown race, the reliability of race measures is limited. The remaining races are Asian at 0.9% of offenders, American Indian or Alaskan Native at 0.6%, and Native Hawaiian or Other Pacific Islander at 0.02%. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrOffenderRace-1.png" alt="The race of offender \#1, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrOffenderRace)The race of offender \#1, 1976-2022.</p>
</div>

For victim race, seen in Figure \@ref(fig:shrVictimRace), only about 1% of victim #1 races are unknown. This means we can be a lot more confident in the race of the victims than in the race of the offender. Similar to offenders, White and Black victims are the two most common races, with 48.4% and 48.1% of victims, respectively. There is a greater share of Asian victims than Asian offenders at 1.5% of victims. American Indian or Alaskan Natives make up 0.8% of victims while Native Hawaiian or Pacific Islanders make up 0.02% of victims.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVictimRace-1.png" alt="The race of victim \#1, 1976-2022" width="90%" />
<p class="caption">(\#fig:shrVictimRace)The race of victim \#1, 1976-2022</p>
</div>

#### Ethnicity

The final demographic variable is ethnicity which is whether the victim or offender is Hispanic or not Hispanic. The SHR data has a weird relationship with this variable (which is also in the Arrests by Age, Sex, and Race dataset, discussed in Chapter \@ref(arrests)) where ethnicity is technically a variable in the data but very rarely collected. As such, this is an unreliable variable that if you really want to use needs careful attention to make sure it is being reported consistently by the agencies that you are looking at. 

The vast majority - 69.7% - of offenders have an unknown ethnicity while 23.4% are not Hispanic and 7.1% are Hispanic. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrOffenderEthnicity-1.png" alt="The ethnicity of offender \#1, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrOffenderEthnicity)The ethnicity of offender \#1, 1976-2022.</p>
</div>

Unlike the other demographic variables, there is still a huge amount of underreporting when it comes to victim ethnicity, though still less than for offender ethnicity. 55.6% of victims have an unknown ethnicity. Approximately 33.2% of victim #1 are reported as not Hispanic while 11.1% are reported as Hispanic.

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrVictimEthnicity-1.png" alt="The ethnicity of victim \#1, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrVictimEthnicity)The ethnicity of victim \#1, 1976-2022.</p>
</div>

As an example of agencies under-reporting this variable, let us look at the number of offender #1s in Albuquerque, New Mexico, a city which the [US Census](https://www.census.gov/quickfacts/fact/table/albuquerquecitynewmexico,US/PST045222) says is about 50% Hispanic. Yet the Albuquerque police reported no ethnicity information for almost three decades of data. 

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/ABQ-1.png" alt="Annual number of offender \#1 who is Hispanic in Albuquerque, New Mexico, 1976-2022." width="90%" />
<p class="caption">(\#fig:ABQ)Annual number of offender \#1 who is Hispanic in Albuquerque, New Mexico, 1976-2022.</p>
</div>


### Case characteristics

Now we will move to facts about each case such as what weapon was used, how people involved knew each other, and what was the (rough) cause of the homicide.

#### Weapon used

The first variable we will look at is the weapon used by each offender. Table \@ref(tab:shrWeapon) shows the weapon used by the first offender in every incident from 1976 to 2022. Each offender can only be reported as having a single weapon, so this table essentially shows the number (and percent) of homicides caused by this weapon. This is not entirely true since in reality an offender could use multiple weapons and there can be multiple offenders. In these cases the police include what they believe is the "primary" weapon used by this offender.

The most commonly used weapon is a handgun, which is used in nearly half of homicides. This is followed by a knife or other sharp weapon used to cut at almost 15% of homicides, and then by "firearm, type not stated" which is just a firearm where we do not know the exact type (it can include handguns) at 8.9% of homicides The fourth most common weapon is "personal weapons" at nearly 6% of homicides. "Personal weapons" is a weird term to mean that there was no weapon - the "weapon" was the offender who beat the victim to death. Shotguns are involved in almost 5% of homicides and all other weapons are involved in fewer than 5% of cases. In total there are 19 different weapons included though most are very uncommon. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:shrWeapon)The weapon used in a homicide incident, 1976-2022. In cases where there are multiple offenders, shows only the primary weapon for the first offender.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Weapon </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:right;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Handgun </td>
   <td style="text-align:right;"> 388,178 </td>
   <td style="text-align:right;"> 49.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Knife Or Cutting Instrument </td>
   <td style="text-align:right;"> 115,540 </td>
   <td style="text-align:right;"> 14.60\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Firearm, Type Not Stated </td>
   <td style="text-align:right;"> 70,632 </td>
   <td style="text-align:right;"> 8.93\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Personal Weapons - Includes Beating </td>
   <td style="text-align:right;"> 45,473 </td>
   <td style="text-align:right;"> 5.75\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Or Unknown Weapon </td>
   <td style="text-align:right;"> 42,002 </td>
   <td style="text-align:right;"> 5.31\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shotgun </td>
   <td style="text-align:right;"> 36,827 </td>
   <td style="text-align:right;"> 4.65\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Blunt Object </td>
   <td style="text-align:right;"> 34,716 </td>
   <td style="text-align:right;"> 4.39\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rifle </td>
   <td style="text-align:right;"> 28,108 </td>
   <td style="text-align:right;"> 3.55\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Strangulation - Includes Hanging </td>
   <td style="text-align:right;"> 9,763 </td>
   <td style="text-align:right;"> 1.23\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fire </td>
   <td style="text-align:right;"> 5,380 </td>
   <td style="text-align:right;"> 0.68\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Asphyxiation - Includes Death By Gas </td>
   <td style="text-align:right;"> 4,804 </td>
   <td style="text-align:right;"> 0.61\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Gun </td>
   <td style="text-align:right;"> 3,473 </td>
   <td style="text-align:right;"> 0.44\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Narcotics/Drugs - Includes Sleeping Pills </td>
   <td style="text-align:right;"> 3,144 </td>
   <td style="text-align:right;"> 0.40\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Drowning </td>
   <td style="text-align:right;"> 1,387 </td>
   <td style="text-align:right;"> 0.18\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Or Type Unknown </td>
   <td style="text-align:right;"> 586 </td>
   <td style="text-align:right;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poison - Does Not Include Gas </td>
   <td style="text-align:right;"> 531 </td>
   <td style="text-align:right;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Explosives </td>
   <td style="text-align:right;"> 386 </td>
   <td style="text-align:right;"> 0.05\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pushed Or Thrown Out of Window </td>
   <td style="text-align:right;"> 257 </td>
   <td style="text-align:right;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Narcotics Or Drugs </td>
   <td style="text-align:right;"> 48 </td>
   <td style="text-align:right;"> 0.01\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 791,235 </td>
   <td style="text-align:right;"> 100\% </td>
  </tr>
</tbody>
</table>


You may have noticed from the table that AR-15 is not included. While AR-15 is the commonly discussed in the media and policy circles as a way to control gun violence, it is not in a category by itself. Instead it is combined with other rifles in the "rifle" weapon group, and makes up about 3.6% of the weapons used by offender #1 in the data. 

Let us check if AR-15s, through our rough proxy of the "rifle" weapon group, is getting more common over time. Figure \@ref(fig:shrRifle) shows the number of homicide incidents (including manslaughters, so not necessarily all murders) where offender #1 used a rifle. Figure \@ref(fig:shrRiflePercent) shows the percent of all homicide incidents where the the weapon was a rifle. Using both of these measures we can see the rifles are getting less common, declining substantially since 1980 though increasing again starting in the mid-2010s.  

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrRifle-1.png" alt="The annual number of homicide incidents where offender \#1's weapon was a rifle, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrRifle)The annual number of homicide incidents where offender \#1's weapon was a rifle, 1976-2022.</p>
</div>

<div class="figure" style="text-align: center">
<img src="06_shr_files/figure-html/shrRiflePercent-1.png" alt="The annual share of homicide incidents where offender \#1's weapon was a rifle, 1976-2022." width="90%" />
<p class="caption">(\#fig:shrRiflePercent)The annual share of homicide incidents where offender \#1's weapon was a rifle, 1976-2022.</p>
</div>

Now, maybe this weapon is more commonly used in some types of crimes such as school shootings. You could get at that question using this data by seeing if times when a rifle is used that victims or offenders are younger or if the circumstance is something that suggests a school shooting. Unfortunately there is no offense location variable here, though there is in NIBRS and we can largely recreate this data through NIBRS. And of course you cannot tell if the weapon is actually an AR-15, only if it is a rifle.

#### Relationship between first victim and offenders

An interesting and highly useful variable is the relationship between the first victim and each offender. To be clear, this is only for the first victim; we do not have the relationship between other victims and offenders. However, as seen earlier, this is not *too much* of an issue since nearly all incidents only have a single victim. There are 29 possible relationship types (including "unknown" relationship) which are broken into three categories: legal family members, people known to the victim but who are not family, and people not known to the victim. Table \@ref(tab:shrRelationship) shows these relationships and the number and percent of homicides with these relationships. 

The most common relationship, with about 28% of homicides, is that the police do not know the relationship. So there is a good deal of uncertainty in the relationship between victims and offenders. Next is that the victim is the offender's acquaintance at 19.7% or is a stranger at 15.3%. The next is "other - known to victim" which is similar to being an acquaintance at almost 5% of homicides. This is followed by the victim being the friend of the murderer at 3.6%. The 6th most common relationship, at 3.6% is that the victim is the wife of the offender, so she is murdered by her husband, and is the first familial relationship of this list. The remaining relationships all make up fewer than 3% of all homicides. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:shrRelationship)The relationship between the first victim and the first offender in a homicide incident, 1976-2022.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Relationship </th>
   <th style="text-align:right;"> Category </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:left;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Unknown </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 296,757 </td>
   <td style="text-align:left;"> 37.51\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Acquaintance </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 156,115 </td>
   <td style="text-align:left;"> 19.73\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stranger </td>
   <td style="text-align:right;"> Not known </td>
   <td style="text-align:right;"> 120,719 </td>
   <td style="text-align:left;"> 15.26\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other - Known To Victim </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 37,899 </td>
   <td style="text-align:left;"> 4.79\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Friend </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 28,411 </td>
   <td style="text-align:left;"> 3.59\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wife </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 27,977 </td>
   <td style="text-align:left;"> 3.54\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Girlfriend </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 21,447 </td>
   <td style="text-align:left;"> 2.71\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Husband </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 12,085 </td>
   <td style="text-align:left;"> 1.53\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Family </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 11,760 </td>
   <td style="text-align:left;"> 1.49\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Son </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 11,408 </td>
   <td style="text-align:left;"> 1.44\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Boyfriend </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 10,009 </td>
   <td style="text-align:left;"> 1.26\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Neighbor </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 8,081 </td>
   <td style="text-align:left;"> 1.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Daughter </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 8,056 </td>
   <td style="text-align:left;"> 1.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brother </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 6,961 </td>
   <td style="text-align:left;"> 0.88\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Father </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 5,667 </td>
   <td style="text-align:left;"> 0.72\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mother </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 5,274 </td>
   <td style="text-align:left;"> 0.67\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> In-Law </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 4,608 </td>
   <td style="text-align:left;"> 0.58\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Common-Law Wife </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 3,317 </td>
   <td style="text-align:left;"> 0.42\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Common-Law Husband </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 2,722 </td>
   <td style="text-align:left;"> 0.34\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ex-Wife </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 2,365 </td>
   <td style="text-align:left;"> 0.30\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stepfather </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 1,864 </td>
   <td style="text-align:left;"> 0.24\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Homosexual Relationship </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 1,704 </td>
   <td style="text-align:left;"> 0.22\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sister </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 1,536 </td>
   <td style="text-align:left;"> 0.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stepson </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 1,500 </td>
   <td style="text-align:left;"> 0.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ex-Husband </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 937 </td>
   <td style="text-align:left;"> 0.12\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stepdaughter </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 792 </td>
   <td style="text-align:left;"> 0.10\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Employer </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 564 </td>
   <td style="text-align:left;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Employee </td>
   <td style="text-align:right;"> Not family (but known) </td>
   <td style="text-align:right;"> 451 </td>
   <td style="text-align:left;"> 0.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stepmother </td>
   <td style="text-align:right;"> Family </td>
   <td style="text-align:right;"> 250 </td>
   <td style="text-align:left;"> 0.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 791,236 </td>
   <td style="text-align:left;"> 100\% </td>
  </tr>
</tbody>
</table>



#### Homicide circumstance {#circumstance}

We also have information on the type of the homicide, which this data calls the "circumstance." This comes as relatively broad categories that leave a lot to be desired in our understanding of what led to the homicide. Table \@ref(tab:shrCircumstance) shows the number and percent of each circumstance for the first victim of each homicide from 1976 to 2022. This data has 33 possible circumstances which it groups into four main categories: murders that coincide with committing another crime ("felony type" murders), murders that do not coincide with another crime ("non-felony type" murders), justifiable homicides, and negligent manslaughter. 

The felony type murders are simply ones where another crime occurred during the homicide. While this is called "felony type" it does include other crimes such as theft and gambling (which are not always a felony) so is a bit of a misnomer. The "non-felony type" are murders that happen without another crime. This includes gang killings (where, supposedly, only the murder occurred), children killed by babysitters, fights among intoxicated (both of alcohol and drugs) people, and "lover's triangle" killings.  Justifiable homicides are when a person (civilian or police officer) kill a person who is committing a crime. Negligent manslaughter includes accidental shootings such as when children find and shoot a gun, but excludes deaths from traffic accidents. 

The most common circumstances, accounting for 27.4%, 26.9%, and 12.5%, respectively, are "Unknown", "Other Arguments", and "Other Non-Felony Type - Not Specified." Since the data includes "Argument Over Money Or Property" as one category, the "Other Arguments" mean that it is an argument for a reason other than over money or property. The "Other Non-Felony Type" one does not mean that the murder did not occur alongside another crime, but also does not fall into the non-felony categories included. Robbery is the only remaining circumstance with more than 5% of murders, at 7.4%. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:shrCircumstance)The circumstance of the homicide for the first offender in a homicide incident.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Circumstance </th>
   <th style="text-align:right;"> Category </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:left;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Unknown </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 219,450 </td>
   <td style="text-align:left;"> 27.74\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Arguments </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 212,941 </td>
   <td style="text-align:left;"> 26.91\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Non-Felony Type - Not Specified </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 98,730 </td>
   <td style="text-align:left;"> 12.48\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Robbery </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 58,885 </td>
   <td style="text-align:left;"> 7.44\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Narcotic Drug Laws </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 28,360 </td>
   <td style="text-align:left;"> 3.58\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Juvenile Gang Killings </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 24,309 </td>
   <td style="text-align:left;"> 3.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Killed By Police </td>
   <td style="text-align:right;"> Justifiable Homicide </td>
   <td style="text-align:right;"> 17,553 </td>
   <td style="text-align:left;"> 2.22\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Felony Type - Not Specified </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 15,460 </td>
   <td style="text-align:left;"> 1.95\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brawl Due To Influence of Alcohol </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 15,227 </td>
   <td style="text-align:left;"> 1.92\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Argument Over Money Or Property </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 14,972 </td>
   <td style="text-align:left;"> 1.89\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Killed By Private Citizen </td>
   <td style="text-align:right;"> Justifiable Homicide </td>
   <td style="text-align:right;"> 13,928 </td>
   <td style="text-align:left;"> 1.76\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> All Suspected Felony Type </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 12,975 </td>
   <td style="text-align:left;"> 1.64\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> All Other Manslaughter By Negligence Except Traffic Deaths </td>
   <td style="text-align:right;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 8,536 </td>
   <td style="text-align:left;"> 1.08\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Domestic Violence (Historically Called Lovers Triangle/Quarrel) </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 6,431 </td>
   <td style="text-align:left;"> 0.81\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burglary </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 6,356 </td>
   <td style="text-align:left;"> 0.80\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gangland Killings </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 5,809 </td>
   <td style="text-align:left;"> 0.73\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brawl Due To Influence of Narcotics </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 4,750 </td>
   <td style="text-align:left;"> 0.60\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lovers Triangle </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 4,158 </td>
   <td style="text-align:left;"> 0.53\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rape </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 4,142 </td>
   <td style="text-align:left;"> 0.52\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Negligent Handling of Gun Which Resulted In Death of Another </td>
   <td style="text-align:right;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 3,877 </td>
   <td style="text-align:left;"> 0.49\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Arson </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 3,304 </td>
   <td style="text-align:left;"> 0.42\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Motor Vehicle Theft </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 1,468 </td>
   <td style="text-align:left;"> 0.19\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Children Playing With Gun </td>
   <td style="text-align:right;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 1,453 </td>
   <td style="text-align:left;"> 0.18\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other Sex Offenses </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 1,433 </td>
   <td style="text-align:left;"> 0.18\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Child Killed By Babysitter </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 1,342 </td>
   <td style="text-align:left;"> 0.17\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Institutional Killings </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 1,262 </td>
   <td style="text-align:left;"> 0.16\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gambling </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 1,040 </td>
   <td style="text-align:left;"> 0.13\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Larceny </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 916 </td>
   <td style="text-align:left;"> 0.12\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Prostitution And Commercialized Vice </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 626 </td>
   <td style="text-align:left;"> 0.08\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other - Not Specified </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 554 </td>
   <td style="text-align:left;"> 0.07\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sniper Attack </td>
   <td style="text-align:right;"> Non-Felony Type </td>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:left;"> 0.06\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Victim Shot In Hunting Accident </td>
   <td style="text-align:right;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 350 </td>
   <td style="text-align:left;"> 0.04\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gun Cleaning Death - Other Than Self-Inflicted </td>
   <td style="text-align:right;"> Negligent Manslaughter </td>
   <td style="text-align:right;"> 144 </td>
   <td style="text-align:left;"> 0.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Abortion </td>
   <td style="text-align:right;"> Felony Type </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Human Trafficking/Commercial Sex Acts </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 0.00\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 791,236 </td>
   <td style="text-align:left;"> 100\% </td>
  </tr>
</tbody>
</table>



#### Homicide subcircumstance

The "subcircumstance" just tells you more information about justifiable homicides. This includes the circumstance leading up to the "felon" - which is how the person killed is described, though technically they do not need to have committed a felony - was killed. It includes if this person attacked an officer (the one who killed them), a different officer, a civilian, or was committing or fleeing a crime. 

This dataset is one source of information on how many people police kill each year. But it is a large undercount compared to other sources such as the Washington Post collection, so is not a very useful source of information on this topic. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:shrSubCircumstance)The circumstance for the first offender in a homicide incident in cases where the offender is killed. This includes incidents where the only person who dies in the offender.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Subcircumstance </th>
   <th style="text-align:right;"> # of Incidents </th>
   <th style="text-align:right;"> % of Incidents </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Felon Killed In Commission of A Crime </td>
   <td style="text-align:right;"> 11,026 </td>
   <td style="text-align:right;"> 35.02\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Attacked Police Officer </td>
   <td style="text-align:right;"> 9,224 </td>
   <td style="text-align:right;"> 29.30\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Attacked A Civilian </td>
   <td style="text-align:right;"> 5,499 </td>
   <td style="text-align:right;"> 17.47\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Not Enough Information To Determine </td>
   <td style="text-align:right;"> 2,529 </td>
   <td style="text-align:right;"> 8.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Resisted Arrest </td>
   <td style="text-align:right;"> 1,268 </td>
   <td style="text-align:right;"> 4.03\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Attacked Fellow Police Officer </td>
   <td style="text-align:right;"> 1,096 </td>
   <td style="text-align:right;"> 3.48\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Felon Attempted Flight From A Crime </td>
   <td style="text-align:right;"> 840 </td>
   <td style="text-align:right;"> 2.67\% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 31,482 </td>
   <td style="text-align:right;"> 100\% </td>
  </tr>
</tbody>
</table>




<!--chapter:end:06_shr.Rmd-->

# Law Enforcement Officers Killed and Assaulted (LEOKA) {#leoka}





The Law Enforcement Officers Killed and Assaulted data (sometimes referred to as the "Police Employees" dataset), often called just by its acronym LEOKA ("LEE-OH-KUH"), has two main purposes. First, it provides counts of employees employed by each agency - broken down by if they are civilian employees or sworn officers, and also broken down by sex (male and female are the only options). And second, it measures how many officers were assaulted or killed (including officers who die accidentally such as in a car crash) in a given month. The assault data is also broken down into shift type (e.g. alone, with a partner, on foot, in a car, etc.), the offender's weapon, and type of call they are responding to (e.g. robbery, disturbance, traffic stop). The killed data simply says how many officers are killed feloniously (i.e. murdered) or died accidentally (e.g. car crash) in a given month. The employee information is at the year-level so you know, for example, how many male police officers were employed in a given year at an agency, but do not know any more than that such as if the number employed changed over the year. This dataset is commonly used as a measure of police employees and is a generally reliable measure of how many police are employed by a police agency. The second part of this data, measuring assaults and deaths, is more flawed with missing data issues and data error issues (e.g. more officers killed than employed in an agency).

## Agencies reporting

Figure \@ref(fig:leokaAgencies) shows the annual number of police agencies that reported at least one month that year. The first year of data available, 1960, has about 8,400 agencies reporting though this quickly drops to a trough of around 4,800 agencies that last for several years. After some undulations in the 1970s, reporting agencies steadily increases to nearly 14,000 agencies in the 1980s and remains steady until declining to around 12,000 by the late 1990s. Then reporting again steadily increases through 2020 to about 16,000 agencies by the end. 2021 has a massive drop in reporting to only about 5,000 agencies and then slightly increasing in 2022.^[This returns us to the low point of historical collection all the back in the 1960s.] 

The decline after 2020 is part of what I have referred to as the "death and rebirth" of the SRS. 2020 was the last year that the FBI accepted SRS data - though in 2022 they began accepting SRS submissions again. As noted in previous chapters, this death and rebirth led to changes in both which agencies reported and what data was reported. In 2021 when only NIBRS was collected, no SRS agencies could report, but even once they began to accept SRS data again the damage was done. Some agencies were transitioning from SRS to NIBRS so reported neither, while others likely made the decision to stick to NIBRS only - perhaps caused by their data vendor no longer supporting SRS data. 

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaAgencies-1.png" alt="The annual number of police agencies that report at least month of data that year, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaAgencies)The annual number of police agencies that report at least month of data that year, 1960-2022</p>
</div>

Part of the decline we see in Figure \@ref(fig:leokaAgencies) is because starting in 2018 - for reasons I am unsure of - many more agencies started reporting having zero employees. In Figure \@ref(fig:leokaAgenciesEmployees) we can see the annual number of agencies that report having at least one employee (civilian or sworn officer). Compared to Figure \@ref(fig:leokaAgencies) we see more agencies reporting since the 200s, and an earlier but less steep drop in reporting.

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaAgenciesEmployees-1.png" alt="The annual number of police agencies that report having at least one employee, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaAgenciesEmployees)The annual number of police agencies that report having at least one employee, 1960-2022</p>
</div>

I mentioned that LEOKA has two purposes: employee information and assaults on officers information. You should really think about this data as two separate datasets as agencies can report one, both, or neither part. In practice, more agencies report data on the number of employees they have than they do for assaults on officers. In Figure \@ref(fig:leokaAgenciesAssaults) we can see that in most years of data fewer than 6,000 (out of ~18k agencies in the country) report having at least one officer assaulted. The year with the most agencies reporting >1 assault was 2022 with 6,397 agencies. Most years average about 5,000 agencies reporting at least one assault on an officer. Though there is variation over time, the trend is much more settled than in the previous figures without any sharp decline in recent years. Assaults on officers is *relatively* rare, at least considering how many officer-civilian interactions occur. And many agencies are small with relatively little crime. So agencies that say they had zero assaults on officers may in fact truly have zero assaults. However, there are agencies that likely do have assaults on officers - such as large, high crime agencies which report assaults in other years - which report zero assaults in some months or years. So you will need to be careful when determining if a zero report is a true zero rather than an agency submitting incomplete data.

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaAgenciesAssaults-1.png" alt="The annual number of police agencies that report having at least one assault against a police officer, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaAgenciesAssaults)The annual number of police agencies that report having at least one assault against a police officer, 1960-2022</p>
</div>

## Important variables

The important variables can be divided into two sections: information on people employed by the department, and information about assaults against officers. The employee information is a snapshot in time during the year while the assault information tells you the number of assaults, broken down several different ways, for each month of the year. Like other UCR data, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. 

### Number of employees 

This data includes the number of people employed by the department with breakdowns by if they are civilian employees or sworn officers (i.e. carries a gun and badge and can make arrests) as well as by gender. The only genders available are female and male. This is the number of employees as of Halloween that year so it is a single point in time. Though this helps us as it is consistent every year, we do not know exactly when certain officer classes start, which we would likely see through a jump in employment that year, or if employment or hiring patterns change over the year. 
 
* Female employees
    + Officers
    + Civilians
* Male employees
    + Officers
    + Civilians

One of the claims made around the massive crime spike during Covid is that it was caused, at least in part, by an exodus of police officers. Fewer police officers led to more crime. Luckily, we can easily determine if there were fewer officers employed starting in 2020. In Figure \@ref(fig:leokaNationalEmployees) we have the total number of sworn officers and civilian employees in the country from 1960 through 2022. The number of both groups has fairly steadily increased since 1960 until plateuing around 2010 and then fairly sharply dropping in 2018 before rebounding a bit in 2022. So the number of employees dropped before 2020, actually increased a tiny bit in 20202 itself, and increased in 2022. Obviously all the claims about a declining number of officers was wrong. 

Well, not quite. This country's population has grown quite a bit since 1960 so we really want to do some kind of rate of officers per civilian population. And as we saw earlier not all agencies report data. So changes over time may really just be changes in which agencies report data. For a good comparison we need to look at only agencies that have reported data for every year we are interested in. And that is all assuming we actually care about national trends which we really should not. Crime is a local issue; what happens in your community - be it whether officers are leaving or crime is increasing - matters a whole lot more than what is happening across the country.^[Of course what happens nationally may be reflected locally, but there is no good reason to focus on national data in lieu of local data.]

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaNationalEmployees-1.png" alt="The number of civilian employees and sworn officers in the United States, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaNationalEmployees)The number of civilian employees and sworn officers in the United States, 1960-2022</p>
</div>

So now lets look at a local example: the Philadelphia Police Department as shown in Figure \@ref(fig:leokaCivilianOfficers). The number of civilian employees has remained at a little under 1,000 employees from about 1970 through the end of our data, though declining very slightly since the middle 2000s. This is curious since the city's population and crime trends have changed dramatically over this time and the ability of civilian employees to contribute has also changed, such as that they now have computers.^[The last time I heard, which was several years ago, patrol officers in Philadelphia still had to write up certain reports using typewriters. So tech apparently is still about 1960 level.] In contrast, the number of police has changed far more than civilians, growing rapidly in the 1960s and 1970s to peaking at a little over 8,000 officers in the mid-1970s before declining substantially to the 6,000s. in the late-1980s. As with some larger agencies nationwide, the number of officers increased in the 1990s and then has decreased steadily in ensuing years. By recent years there are about as many officers as in the late-1980s, even though the city's population has grown substantially since then. What stands out is that in 2020 there are zero sworn officers or civilians employees. By 2022 there are fewer sworn officers but more civilian employees than in 2020. 2021 is simply due to Philly reporting zero employees in that year, though obviously this is not actually a reflection of reality. When looking at only one city like we do here it is glaringly obvious that there is a data issue. The problem is that when looking at aggregate data, like we do in Figure \@ref(fig:leokaNationalEmployees) it is much harder, without additional data cleaning steps, to determine what is a data error and what is a true change.  
    
<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaCivilianOfficers-1.png" alt="The number of civilian employees and sworn officers in the Philadelphia Police Department, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaCivilianOfficers)The number of civilian employees and sworn officers in the Philadelphia Police Department, 1960-2022</p>
</div>

We can also look at the number of officers (or civilian employees) by gender. Figure \@ref(fig:leokaOfficersGender) shows the percent of Philadelphia police officers by gender while Figure \@ref(fig:leokaOfficersGenderCount) shows the number of officers. For the first decade of data all female officers (or civilians) were recorded as male, so that variable should be interpreted as "total officers" until 1971 when it is split into gender. Starting at basically 0% of officers in 1971, female officers grew until they made up about a quarter of officers in 2000 and then has declined slowly since then.^[Please note that since Philly did not report in 2021 the 2021 value is NA, and is shown in the figure as the 2020 data point drawing a straight line to the 2022 data point.] 

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaOfficersGender-1.png" alt="The percent of female and male sworn officers in Philadelphia, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaOfficersGender)The percent of female and male sworn officers in Philadelphia, 1960-2022</p>
</div>

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaOfficersGenderCount-1.png" alt="The number of female and male sworn officers in Philadelphia, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaOfficersGenderCount)The number of female and male sworn officers in Philadelphia, 1960-2022</p>
</div>


### Officers killed

There is almost no information about officers killed. The data only breaks this down into if they died "feloniously" which just means that someone killed them on purpose (e.g. shooting them, intentionally hitting them with a car) or if they died "accidentally" such as if they die during a car crash while on duty. The FBI actually collects more information on officer deaths than they release in this data. This includes the circumstances of each death such as the type of death (e.g. car crash, shooting, ambush, etc.), what weapon the offender had if feloniously killed, and even a detailed written summary of what occurred for each officer killed. They post this information in their annual LEOKA report which is part of their Crime in the United States report. The 2019 report, for example, can be found on their site [here](https://ucr.fbi.gov/leoka/2019/home).

We can look at what data is available through Figure \@ref(fig:leokaOfficersKilled) which shows the number of Los Angeles Police Department officers killed over time. There are no accidental killings until 1975 though this is misleading because that accidental killings variable is not reported until 1971, which is a year in which many other variables in this data began reporting. So we actually have no idea how many officers were killed accidentally from 1960-1970 since this variable is always reported as 0. In general it seems like there is about one officer killed per year in recent decades while the period from 1980 to 2000 was the time of highest danger with as many as five officers killed in a single year. We can also see some trend changes with felonious killings more common than accidental killings in the 1990s and then accidental killings becoming far more common starting in 2000.

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaOfficersKilled-1.png" alt="The number of officers killed by felony and killed accidentally in Los Angeles, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaOfficersKilled)The number of officers killed by felony and killed accidentally in Los Angeles, 1960-2022</p>
</div>

We can also look at the national number of officers killed as shown in Figure \@ref(fig:leokaOfficersKilledNational). Please note that this is simply summing up the number of officers killed by all agencies that report that year so changes over time are certainly partially due to different agencies reporting each year. Therefore, we will focus on interpreting the different between felony and accidental killings rather than counts over time - though even this may be off if agencies that reported more felony or more accidental killings differ in their reporting over time. Again we see that there are no officers killed accidentally, due to that variable not being reported, until 1971. The difference between officers killed by felony and killed accidentally is widest are the start of our data and narrows considerable until there are only several more felonious killings than accidental killings by the late 1990s. This trend reverses in the early 2010s with accidental killings decreasing and felonious killings increasing again. 

The last several years of data have extremely few officers killed accidentally, with fewer than 10 a year since 2018 and even zero officers killed in 2021. According to the website [Officer Down Memorial Page](https://www.odmp.org/search/year?year=2021), there were 719 officers who died in 2021, including some that should meet the killed accidentally criteria.^[The vast majority of officers who died in 2021 died from Covid.] For example, 23 officers were reported to have been killed by an automobile crash. So this data on officers killed is incorrect, is an undercount, and should be used only with a great deal of caution. 

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaOfficersKilledNational-1.png" alt="The national number of officers killed by felony and killed accidentally, 1960-2022" width="90%" />
<p class="caption">(\#fig:leokaOfficersKilledNational)The national number of officers killed by felony and killed accidentally, 1960-2022</p>
</div>

### Assaults by injury and weapon

This data breaks down the monthly number of assaults on officers in a few different ways. Here, we will look at the number of assaults where the officer is injured or not injured and within these categories by which weapon the offender had. This is the number of officers assaulted so if an incident has three officers assaulted, that will count as three different assaults. If the offender used multiple weapons then only the most serious weapon would be counted. For example, if an offender used a knife and a gun during the assault, the assault would be counted as a gun assault. Unfortunately we only know if an officer was injured or not and not the severity of the injury. So we cannot tell if the officer is merely bruised or was shot or stabbed. 

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
    
We can start by looking at the breakdown of assaults by injury and weapon type for officers in the Los Angeles Police Department. Figure \@ref(fig:leokaAssaultTypeInjury) shows the number of assaults from all years reported for these categories. Over the complete time period there were almost 43,000 officers assaulted with about three-quarters of these assaults - 33,000 assaults - leading to no injuries. This data shows the number of officers assaulted, not unique officers, so an officer can potentially be included in the data multiple times if they are assaulted multiple times over a year. A little under a quarter of assaults lead to officer injury with most of these from unarmed offenders. Interestingly, there are far more gun and knife assaults where the officer is not injured than where the officer is injured. There are likely cases when the offender threatens the officer with the weapon but does not shoot or stab the officer. 
    
<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaAssaultTypeInjury-1.png" alt="The total number of assaults on officers by injury sustained and offender weapon in Los Angeles, 1960-2022." width="90%" />
<p class="caption">(\#fig:leokaAssaultTypeInjury)The total number of assaults on officers by injury sustained and offender weapon in Los Angeles, 1960-2022.</p>
</div>

We can also look at assaults over time. Figure \@ref(fig:leokaAssaultsInjuryYear) shows the number of assaults, assaults with injury, and assault without injury for the Los Angeles Police Department from 1960 to 2018. We can immediately see some data issues are there are years with no assaults recorded. And in the late-2000s there is a sudden drop from about 250 assaults with injuries per year in the previous few decades to nearly zero officer injuries reported a year. This strongly suggests some change in reporting rather than a true decrease in assaults with injuries. For the decades where the data is less obviously wrong, there is a consistent trend of most assaults leading to no injuries, though the distance between the number of injury and non-injury assaults fluctuates over time. 

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaAssaultsInjuryYear-1.png" alt="The annual number of assaults on officers by injury sustained in Los Angeles, 1960-2022." width="90%" />
<p class="caption">(\#fig:leokaAssaultsInjuryYear)The annual number of assaults on officers by injury sustained in Los Angeles, 1960-2022.</p>
</div>


### Assaults by call type

The next group of ways that assaults are broken down is by the type of call the officer is assigned when they are assaulted. For example, if an officer is responding to a burglary report, any assault they experience on that call will be classified as "burglary" related. In addition, we know how many assaults were cleared by arrest or cleared through exceptional means (for more on this, please see Section \@ref(clearedCrimes)) though it does not differentiate between the two. Since assaults are based on the number of officers assaulted, not the number of incidents where officers are assaulted, arresting a single person can clear multiple assaults. The possible call types are below:

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

Figure \@ref(fig:leokaAssaultCallType) shows the number of assaults on Los Angeles Police Department officers by the type of call for 1960-2022. There were about 41,000 assaults against Los Angeles Police Department officers with a little over 33,500 of these assaults cleared. An important thing to note is that the number of assaults here is less than the nearly 43,000 assaults for the same agency over the same time period we saw in Figure \@ref(fig:leokaAssaultTypeInjury). This is because some variables are not reported for all years and agencies are free to report which variables they want to report in any given year. This makes it massively tricky to use this data since even simple statistics for the same agency for supposedly the same variable (here it is technically different variables but should still be the total number of officers assaulted) can be different.

The most common type of call where officers are assaulted are disturbance calls which include domestic violence and reports of dangerous individuals such as people carrying guns in public. The least common call type is ambush calls, though in these calls the police are called to a scene by the offender who intends to assault or kill the officers, so is likely far more dangerous than other call types, even though it is rare. 

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaAssaultCallType-1.png" alt="Assaults on Los Angeles Police Department officers by type of call where they were assaulted at, 1960-2022." width="90%" />
<p class="caption">(\#fig:leokaAssaultCallType)Assaults on Los Angeles Police Department officers by type of call where they were assaulted at, 1960-2022.</p>
</div>

Within these call types is also a breakdown by offender weapon use, with the same weapons as above, and the type of officer assignment which is essentially if they are alone or not and if they are on foot or not. Finally, it says how many assaults are cleared by arrest or cleared through exceptional means, though it does not differentiate between the two. The shift assignment is essentially how they go through their normal day, if this is in a vehicle, alone, as a detective, or under a different assignment (including being off-duty). For example, being in a vehicle with two officers  means that their normal assignment is driving in a vehicle, not that they were actually assaulted in said vehicle. This also does not necessarily mean that these are the only officers at the scene. It is simply the shift assignment of the officer who is assaulted. For example, if an officer who normally works alone in a vehicle shows up to a scene where other officers are present, and who are under different shift assignments, and gets assaulted - and no one else gets assaulted - that is an assault for officers "in a vehicle alone". 

* Offender weapons
    + Offender has firearm
    + Offender had knife
    + Offender had other weapon
    + Offender was unarmed
* Type of officer shift assignment
    + In a vehicle with two officers
    + In a vehicle alone
    + In a vehicle alone but assisted by other officers
    + Detective or special unit alone
    + Detective or special unit assisted by other officers
    + Other assignment alone
    + Other assignment assisted by other officers
* Number of assaults on police cleared

We will look specifically at disturbance calls since they are the most common call type, at least for the Los Angeles Police Department. Figure \@ref(fig:leokaDisturbanceWeapon) shows the total number of disturbance assaults by offender weapon in Los Angeles. Most assaults have an unarmed offender with a sharp decline to the number of offenders with a weapon other than a gun or knife. Assaults by a gun and by a knife are the least common. 

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaDisturbanceWeapon-1.png" alt="The number of assaults on Los Angeles Police Department officers in disturbance calls by the injury sustained by the officer, 1960-2022." width="90%" />
<p class="caption">(\#fig:leokaDisturbanceWeapon)The number of assaults on Los Angeles Police Department officers in disturbance calls by the injury sustained by the officer, 1960-2022.</p>
</div>

Again using disturbance calls for the Los Angeles Police Department, we can look at assaults by the officer assignment, as seen in Figure \@ref(fig:leokaShiftAssignment). In the vast majority of assaults it is of officers who are in a vehicle along with a partner. This drops very sharply to several hundred assaults on detectives who are assisting other officers and then increasingly declines to the other shift assignments to the least common assault being against detectives who are acting alone. So are officers in two-man vehicles are much higher risk of assaults than officers alone or of detectives? Almost certainly not. To determine the risk for officers we need to know how officers are generally deployed. If the vast majority of officers are in two-man cars then it makes sense that the vast majority of assaults are on these assignments. Like most FBI data - and most crime data in general - we have the numerator (in this case the number of assaults by shift assignment type) and do not have a proper denominator (such as the distribution of shift assignments for all LAPD officers) to determine a rate of risk. Without this we can present some descriptive statistics but cannot be more useful by determining, for example, if officers in certain shift assignments are at higher risks of being assaulted. 

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/leokaShiftAssignment-1.png" alt="The number of assaults on Los Angeles Police Department officers in disturbance calls by the injury sustained by the shift assignment of the officer, 1960-2022." width="90%" />
<p class="caption">(\#fig:leokaShiftAssignment)The number of assaults on Los Angeles Police Department officers in disturbance calls by the injury sustained by the shift assignment of the officer, 1960-2022.</p>
</div>

    
### Assaults by time

The final breakdown in assaults is by the time they occur, divided into 12 two-hour chunks starting at 12:01am. Like some other variables this data is only available starting in 1971. There is no more information than total assaults in this time so we do not know if the assaults led to injuries, the type of call or shift assignment the officer was on, or the offender's weapons. 

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

We will look at these time chunks in Figure \@ref(fig:phoenixAssaultTimes) which shows the total number of assaults by time of day from 1971 to 2018 in Phoenix, Arizona. The most common times for officers to be assaulted looks pretty similar to when crime is highest: late night and early morning. The 12:01am to 2am chunk is the most common time followed by 10pm to midnight, with assaults increasing at the day grows later and at its lowest point from 6-8am. This strongly suggests that officers are assaulted at crime scenes, such as responding to crimes or making arrests.^[In the chapters on NIBRS I will argue against placing too much trust about time which includes midnight, such as the 12:01am to 2am chunk here, because there is evidence that some agencies may use it as the default time when the true time is unknown. That probably happens here as well. While in nearly every officer assault the time should be known, there may still be instances where the reported time is unknown, such as an officer being assaulted at a certain time but forgetting to mark it when entering the report.] 

<div class="figure" style="text-align: center">
<img src="07_leoka_files/figure-html/phoenixAssaultTimes-1.png" alt="The number of assaults against Phoenix Police Department officers by hourly grouping for all years with data available, 1971-2018." width="90%" />
<p class="caption">(\#fig:phoenixAssaultTimes)The number of assaults against Phoenix Police Department officers by hourly grouping for all years with data available, 1971-2018.</p>
</div>


<!--chapter:end:07_leoka.Rmd-->

