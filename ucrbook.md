--- 
title: "Uniform Crime Reporting (UCR) Program Data: An Opinionated Guide to FBI Data"
author: "Jacob Kaplan, Ph.D."
date: "2024-10-08"
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

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/nibrsAnnualPercentPopulationIndex-1} 

}

\caption{The annual percent of the United States population that is covered by an agency reporting data to NIBRS.}(\#fig:nibrsAnnualPercentPopulationIndex)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/nibrsStateParticipation2020Index-1} 

}

\caption{The percent of each state's population that is covered by police agencies reporting at least one month of data to NIBRS, 2023 (using 2022 ACS 5-year Census data).}(\#fig:nibrsStateParticipation2020Index)
\end{figure}

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

There are a few different sources of UCR data available today. First, and probably most commonly used, is the data put together by the [National Archive of Criminal Justice Data (NACJD)](https://www.icpsr.umich.edu/web/pages/NACJD/index.html)). This a team out of the University of Michigan who manages a huge number of criminal justice datasets and makes them available to the public. If you have any questions about crime data - UCR or other crime data - I highly recommend you reach out to them for answers. They have a collection of data and excellent documentation available for UCR data available on their site [here](https://www.icpsr.umich.edu/web/NACJD/series/57). One limitation to their data, however, is that each year of data is available as an individual file meaning that you will need to concatenate each year together into a single file. Some years also have different column names (generally minor changes like spelling robbery "rob" one year and "robb" the next) which requires more work to standardize before you could concatenate. They also only have data through 2016 which means that the most recent years (UCR data is available through 2019) of data are (as of this writing) unavailable. 

Next, and most usable for the general public - but limited for researchers - is the FBI's official website [Crime Data Explorer](https://crime-data-explorer.fr.cloud.gov/). On this site you can chose an agency and see annual crime data (remember, UCR data is monthly so this is not as detailed as it can be) for certain crimes (and not even all the crimes actually available in the data). This is okay for the general public but only provides a fraction of the data available in the actual data so is really not good for researchers. 

It is worth mentioning a final source of UCR information. This is the annual Crimes in the United States report released by the FBI each year around the start of October. As an example, here is the [website for the 2019 report](https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019). In this report is summarized data which in most cases estimates missing data and provides information about national and subnational (though rarely city-level) crime data. As with the FBI's site, it is only a fraction of the true data available so is not a very useful source of crime data for quality research. Still, this is a very common source of information used by researchers.


## Recommended reading

While this book is designed to help researchers use this data, the FBI has an excellent manual on this data designed to help police agencies submit their data. That manual, called the "Summary Reporting System (SRS) User Manual" provides excellent definitions and examples of many variables included in the data. In this book when I quote the FBI, such as defining a crime, I quote from this manual. The manual is available to download as a PDF on the FBI's site and I have also posted it on my GitHub page [here](https://github.com/jacobkap/ucrbook/blob/main/FBI%20Uniform%20Crime%20Reporting%20(UCR)%20Program%20User%20Manual.pdf) for convenience. I highly recommend that you read this manual before using the data. That manual, alongside this book which tries to explain when and how the agencies do not follow the manual, will provide a solid foundation for your understanding of UCR data.

## How to contribute to this book

If you have any questions, suggestions (such as a topic to cover), or find any issues, please make a post on the [Issues page](https://github.com/jacobkap/ucrbook/issues) for this book on GitHub. On this page you can create a new issue (which is basically just a post on this forum) with a title and a longer description of your issue. You will need a GitHub account to make a post. Posting here lets me track issues and respond to your message or alert you when the issue is closed (i.e. I have finished or denied the request). Issues are also public so you can see if someone has already posted something similar. 

For more minor issues like typos or grammar mistakes, you can edit the book directly through its GitHub page. That will make an update for me to accept, which will change the book to include your edit. To do that, click the edit button at the top of the site - the button is highlighted in the below figure. You will need to make a GitHub account to make edits. When you click on that button you will be taken to a page that looks like a Word Doc where you can make edits. Make any edits you want and then scroll to the bottom of the page. There you can write a short (please, no more than a sentence or two) description of what you have done and then submit the changes for me to review.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{images/edit_button} 

}

\caption{The edit button for how to make edits of this book.}(\#fig:unnamed-chunk-3)
\end{figure}

Please only use the above two methods to contribute or make suggestions about the book. While it is a bit more work for you to do it this way, since you will need to make a GitHub account if you do not already have one, it helps me organize all the questions in one place and update the book if I decide to add answers to certain questions. 

## How to identify a particular agency (ORI codes) {#ori}

In NIBRS and other FBI data sets, agencies are identified using **OR**iginating Agency **I**dentifiers or an ORI. An ORI is a unique ID code used to identify an agency.^[This is referred to as an "ORI", "ORI code", and "ORI number", all of which mean the same thing.] If we used the agency's name we would end up with some duplicates since there can be multiple agencies in the country (and in a state, those this is very rare) with the same name. For example, if you looked for the Philadelphia Police Department using the agency name, you would find both the "Philadelphia Police Department" in Pennsylvania and the one in Mississippi. Each ORI is a 9-digit value starting with the state abbreviation^[The abbreviation for Nebraska is "NB" rather than the more commonly used "NE."] followed by 7 numbers. In the UCR data (another FBI data set) the ORI uses only a 7-digit code - with only the 5 numbers following the state abbreviation instead of 7. So the NIBRS ORI codes are sometimes called ORI9. For nearly all agencies, the only difference between the UCR ORI and the NIBRS ORI is that the NIBRS ORI has "00" at the end so it is technically 9 characters long but is not any more specific than the 7-character UCR ORI code. 

When dealing with specific agencies, make sure to use the ORI rather than the agency name to avoid any mistakes. For an easy way to find the ORI number of an agency, use [this page](https://crimedatatool.com/crosswalk.html) on my site. Type an agency name or an ORI code into the search section and it will return everything that is a match.


## The data as you get it from the FBI

We will finish this overview of the SRS data by briefly talking about format of the data that is released by the FBI, before the processing done by myself or [NACJD](https://www.icpsr.umich.edu/web/pages/NACJD/index.html) that converts the data to a type that software like R or Stata or Excel can understand. The FBI releases their data as fixed-width ASCII files which are basically just an Excel file but with all of the columns squished together. As an example, Figure \@ref(fig:SRSascii) shows what the data looks like as you receive it from the FBI for the Offenses Known and Clearances by Arrest dataset for 1960, the first year with data available. In the figure, it seems like there are multiple rows but that is just because the software that I opened the file in is not wide enough - in reality what is shown is a single row that is extremely wide because there are over 1,500 columns in this data. If you scroll down enough you will see the next row, but that is not shown in the current image. What is shown is a single row with a ton of columns all pushed up next to each other. Since all of the columns are squished together (the gaps are just blank spaces because the value there is a space, but that does not mean there is a in the data. Spaces are possible values in the data and are meaningful), you need some way to figure out which parts of the data belong in which column. 


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{images/nibrs_ascii} 

}

\caption{Fixed-width ASCII file for the 1991 National Incident-Based Reporting System (NIBRS) dataset.}(\#fig:ascii)
\end{figure}

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

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/nibrsAnnualNumberAgenciesIndex-1} 

}

\caption{The annual number of police agencies that report data to NIBRS.}(\#fig:nibrsAnnualNumberAgenciesIndex)
\end{figure}

In general, more agencies report their data every year and once an agency begins reporting data they tend to keep reporting. The SRS datasets are a collection of separate, though related, datasets and an agency can report to as many of these datasets as they want - an agency that reports to one dataset does not mean that they report to other datasets. Figure \@ref(fig:SRSagenciesReporting) shows the number of agencies that submitted at least one month of data to the Offenses Known and Clearances by Arrest data in the given year. For the first decade of available data under 8,000 agencies reported data and this grew to over 13,500 by the late 1970s before plateauing for about a decade. The number of agencies that reported their data actually declined in the 1990s, driven primarily by many Florida agencies temporarily dropping out, before growing steadily to nearly 17,000 agencies in 2010; from here it kept increasing but slower than before. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/SRSagenciesReporting-1} 

}

\caption{The annual number of agencies reporting to the Offenses Known and Clearances by Arrest dataset. Reporting is based on the agency reporting at least one month of data in that year.}(\#fig:SRSagenciesReporting)
\end{figure}

There are approximately 18,000 police agencies in the United States so recent data has reports from nearly all agencies, while older data has far fewer agencies reporting. When trying to estimate to larger geographies, such as state or national-level, later years will be more accurate as you are missing less data. For earlier data, however, you are dealing with a smaller share of agencies meaning that you have a large amount of missing data and a less representative sample. 



This voluntariness extends beyond whether they report or not, but into which variables they report. While in practice most agencies report every crime when they report any, they do have the choice to report only a subset of offenses. This is especially true for subsets of larger categories - such as gun assaults, a subset of aggravated assaults, or marijuana possession arrests which is a subset of drug possession arrests. As an example, Figure \@ref(fig:nycGunAssaults) shows the annual number of aggravated assaults with a gun in New York City. In 2003 the New York Police Department stopped reporting this category of offense, resuming only in 2013. They continued to report the broader aggravated assault category, but not any of the subsections of aggravated assaults which say which weapon was used during the assault.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/nycGunAssaults-1} 

}

\caption{Monthly reports of gun assaults in New York City, 1960-2023.}(\#fig:nycGunAssaults)
\end{figure}

Given that agencies can join or drop out of the SRS program at will, and report only partial data, it is highly important to carefully examine your data to make sure that there are no issues caused by this. 

Even when an agency reports SRS data, and even when they report every crime category, they can report fewer than 12 months of data. In some cases they simply report all of their data in December, or report quarterly or semi-annually so some months have zero crimes reported while others count multiple months in that month's data. One example of this is New York City, shown in Figure \@ref(fig:nycMurderMonthly), in the early-2000s to the mid-2010s where they began reporting data quarterly instead of monthly. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/nycMurderMonthly-1} 

}

\caption{Monthly murders in New York City, 1990-2023. During the 2000s, the police department began reporting quarterly instead of monthly and then resumed monthly reporting.}(\#fig:nycMurderMonthly)
\end{figure}

When you sum up each month into an annual count, as shown in Figure \@ref(fig:nycMurderYearly), the problem disappears since the zero months are accounted for in the months that have the quarterly data. If you are using monthly data and only examine the data at the annual level, you will fall into the trap of having incorrect data that is hidden due to the level of aggregation examined. While cases like NYC are obvious when viewed monthly, for people that are including thousands of agencies in their data, it is unfeasible to look at each agency for each crime included. This can introduce errors as the best way to examine the data is manually viewing graphs and the automated method, looking for outliers through some kind of comparison to expected values, can be incorrect.   

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/nycMurderYearly-1} 

}

\caption{Annual murders in New York City, 1990-2023.}(\#fig:nycMurderYearly)
\end{figure}

In other cases when agencies report fewer than 12 months of the year, they simply report partial data and as a result undercount crimes. Figure \@ref(fig:miamiDadeMurderAnnual) shows annual murders in Miami-Dade, Florida and has three years of this issue occurring. The first two years with this issue are the two where zero murders are reported - this is because the agency did not report any months of data. The final year is in 2018, the last year of data in this graph, where it looks like murder suddenly dropped significantly. That is just because Miami-Dade only reported through June, so they are missing half of 2018. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/miamiDadeMurderAnnual-1} 

}

\caption{Annual murders in Miami-Dade, Florida, 1960-2023.}(\#fig:miamiDadeMurderAnnual)
\end{figure}

### Zero crimes vs no reports

When an agency does not report, we see it in the data as reporting zero crimes, not reporting NA or any indicator that they did not report. In cases where the agency says they did not report that month we can be fairly sure (not entirely since that variable is not always accurate) that the zero crimes reported are simply that the agency did not report. In cases where the agency says they report that month but report zero crimes, we cannot be sure if that is a true no crimes reported to the agency or the agency not reporting to the SRS. As agencies can report some crimes but not others in a given month and still be considered reporting that month, just saying they reported does not mean that the zero is a true zero.

In some cases it is easy to see when a zero crimes reported is actually the agency not reporting. As Figure \@ref(fig:nycGunAssaults) shows with New York City gun assaults, there is a massive and sustained drop-off to zero crimes and then a sudden return years later. Obviously, going from hundreds of crimes to zero crimes is not a matter of crimes not occurring anymore, it is a matter of the agency not reporting - and New York City did report other crimes these years so in the data it says that they reported every month. So in agencies which tend to report many crimes - and many here can be a few as 10 a year since going from 10 to 0 is a big drop - a sudden report of zero crimes is probably just non-reporting. 

Differentiating zero crimes and no reports becomes tricky in agencies that tend to report few crimes, which most small towns do. As an example, Figure \@ref(fig:danvilleRape) shows the annual reports of rape in Danville, California, a city of approximately 45,000 people. The city reports on average 2.8 rapes per year and in five years reported zero rapes. In cases like this it is not clear whether we should consider those zero years as true zeros (that no one was raped or reported their rape to the police) or whether the agency simply did not report rape data that year.  


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{index_files/figure-latex/danvilleRape-1} 

}

\caption{Annual rapes reported in Danville, CA, 1960-2023.}(\#fig:danvilleRape)
\end{figure}

### Agency data covered by another agency

<!--chapter:end:index.Rmd-->

# About the Author {-}

**Jacob Kaplan**

I am a Professional Specialist at the School of Public and International Affairs (SPIA) and a member of Criminal Justice @ SPIA at Princeton University. My research focuses on law enforcement, including its impact on violent crime, the influence of removing 'bad apple' officers on reducing complaints against officers, the extent to which police forces represent the civilian populations they serve, and the role of race and political affiliations in shaping officer behavior. In addition to this, I conduct methodological research focused on the quality and usability of crime data, with a special emphasis on the FBI's Uniform Crime Reporting (UCR) Program.

I am the author of *[A Criminologist's Guide to R: Crime by the Numbers (Chapman & Hall/CRC The R Series, 2023)](https://www.routledge.com/A-Criminologists-Guide-to-R-Crime-by-the-Numbers/Kaplan/p/book/9781032244075)*, an introductory textbook on the R programming language tailored for crime research, with a special focus on data cleaning and analysis. In addition, I have developed several R packages, including [fastDummies](https://jacobkap.github.io/fastDummies/), [asciiSetupReader](https://jacobkap.github.io/asciiSetupReader/), and [predictrace](https://jacobkap.github.io/predictrace/), to streamline the data analysis process for researchers. My website, [Crime Data Tool](https://crimedatatool.com/), offers users an interactive platform to explore crime data from thousands of agencies across hundreds of variables (e.g., arrests, offenses, demographics)—no data or programming skills required.

My research has been published in leading academic journals, such as the *Journal of Quantitative Criminology*, *Journal of Research in Crime and Delinquency*, *Journal of Interpersonal Violence*, and *American Political Science Review*. I hold a B.S. in Criminal Justice from California State University, Sacramento, and a M.S. and Ph.D. in Criminology from the University of Pennsylvania. I previously served on the FBI’s Criminal Justice Information Services (CJIS) Advisory Policy Board (APB) Uniform Crime Reporting (UCR) Subcommittee.

<!--chapter:end:01_author.Rmd-->

\mainmatter
# (PART) Summary Reporting System (SRS) {-}

# SRS Overview {#SRSGeneral}

One of the first, and most important, questions I think people have about crime is a simple one: is crime going up? Answering it seems simple - you just count up all the crimes that happen in an area and see if that number of bigger than it was in previous times. 

However, putting this into practice invites a number of questions, all of which affect how we measure crime. First, we need to define what a crime is. Not philosophically what actions are crimes - or what should be crimes - but literally which of the many thousands of different criminal acts (crimes as defined by state or federal law) should be considered in this measure. Should murder count? Most people would say yes. How about jaywalking or speeding? Many would say probably not. Should marital rape be considered a crime? Now, certainly most people (all, I would hope) would say yes. But in much of the United States it was not a crime until the 1970s [@bennice2003marital; @mcmahon2009criminalizing]. What about marijuana possession, an act that is illegal nationally and in some states, but legal elsewhere?

Next, we have to know what geographic and time unit to measure crimes at since these decisions determine how precise we can measure crime and when it changed. That is, if you are mugged on Jan 1st at exactly 12:15pm right outside your house, how do we record it? Should we be as precise as including the exact time and location (such as your home address)? Out of privacy concerns to the victim, should we only include a larger time unit (such as hour of the day or just the day without any time of day) or a larger geographic unit (such as a Census Tract or the city)? And what about when there are questions about geographic jurisdiction such as a local police and sheriff overlapping in their patrol area? Or when a crime happens over the course of several hours (e.g. a length burglary or kidnapping)? Should we count the start time, the end time, or somewhere in the middle?

The final question is that when a crime occurs, how do we know? That is, when we want to count how many crimes occurred do we ask people how often they've been victimized, do we ask people how often they commit a crime, do we look at crimes reported to police, crimes charged in a criminal court? Each of these measures will likely give different answers as to how many crimes occurred.\footnote{The Bureau of Justice Statistics does measure crime by asking a random sample of people whether they were the victim of a crime. For more on this, please see their National Crime Victimization Survey reports} And what about crimes where a victim reports it and the police investigate and decide that it did not occur (e.g. victim reports an act which was not actually illegal)? Or where the police say a crime occurred by the local District Attorney declines to prosecute? 

The FBI answered all of these questions in 1929 when they began the Uniform Crime Reporting (SRS) Program Data, or SRS data for short. **Crime consists of eight crime categories - murder, rape, robbery, aggravated assault, burglary, motor vehicle theft, theft, and simple assault - that are reported to the police and is collected each month from each agency in the country.** So essentially we know how many of a small number of crime categories happen each month in each city (though some cities have multiple police agencies so even this is more complicated than it seems). These decisions, born primarily out of the resource limitations of 1929 (i.e. no computers), have had a major impact on criminology research. The first seven crime categories - known as "Index Crimes" or "Part 1 crimes" (or "Part I" sometimes) - are the ones used to measure crime in many criminology papers, even when the researchers have access to data that covers a broader selection of crimes than these.^[Arson is also an index crime but was added after these initial seven were chosen and is not included in the crimes dataset (though is available separately) so is generally not included in studies that use index crimes.] These are also the crimes that the news uses each year to report on how crime in the United States compares to the previous year. The crime data actually also includes the final crime, simple assault, though it is not included as an index crime and is, therefore, generally ignored by researchers - a large flaw in most studies that we will discuss in more detail in Section \@ref(indexCrimes). In fact excluding simple assault is such a large issue that doing so has led us to exclude the most common violent crime from most government, news, and academic reports, leading to an undercount of violence in this country by approximately 50%.  

In this chapter we will provide a brief overview of the datasets that make up the FBI's Summary Reporting System (SRS) which you can think of as the "aggregate" data collection that is part of their Uniform Crime Reporting (UCR) Program Data. These datasets are primarily focused on aggregate data, mostly having monthly counts of crimes without many details about any particular crime. In comparison, the other half of the UCR collection, the National Incident-Based Reporting System (NIBRS) data is focused entirely on providing detail on every individual crime reported to the police. You can actually convert NIBRS data to SRS in most cases - and FBI does for agencies that report only NIBRS data - but there is no way to go from SRS to NIBRS. 

## Crimes included in the SRS datasets

SRS data covers only a subset - and for the crime data, a very small subset - of all crimes that can occur. It also only includes crimes reported to the police. So there are two levels of abstraction from a crime occurring to it being included in the data: a crime must occur that is one of the crimes included in one of the SRS datasets (we detail all of these crimes below) *and* the victim must report the incident to the police. While the crimes included are only a small selection of crimes - which were originally chosen since at the time the SRS was designed these were considered important offenses and among the best reported - this is an important first step to understanding the data.

SRS data should be understood as a loose collection of data that seeks to understand crimes and arrests in the United States. There are seven datasets in the SRS collection that each cover a different topic or a subset of a previously covered topic: crimes, arrests, property crimes specifically, homicides specifically, police officers killed or assaulted, arson specifically, and hate crimes.^[There is also a human trafficking dataset though this is a newer dataset and rarely used so I will not cover it in this book.] In this section we will go over the crimes included in the two main SRS datasets: Offenses Known and Clearances by Arrest and (which I like to call the "crime" dataset) and the Arrests by Age, Sex, and Race (the "arrests" dataset). These are the most commonly used SRS datasets and the stolen property and homicide datasets are simply more detailed subsets of these datasets. The hate crime dataset can cover a broader selection of offenses than in the crimes or arrests data, so we will discuss those in Chapter \@ref(hate_crimes). 

## A summary of each SRS dataset

The SRS collection of data can be roughly summarized into two groups: crime data and arrest data. While there are several datasets included in the SRS data collection, they are all extensions of one of the above groups. For arrest data, you have information about who (by race and by age-gender, but not by race-gender or race-age other than within race you know if the arrestee is an adult or a juvenile) was arrested for each crime. For crime data, you have monthly counts of a small number of crimes (many fewer than crimes covered in the arrest data) and then more specialized data on a subset of these crimes - information on homicides, hate crimes, assaults or killings of police officers, and stolen property. 

Each of these datasets will have its own chapter in this book where we discuss the data thoroughly. Here is a very brief summary of each dataset which will help you know which one to use for your research. I still recommend reading that data's chapter since it covers important caveats and uses (or misuses) of the data that would not be covered below. 

### Offenses Known and Clearances by Arrest (1960 - present)

The Offenses Known and Clearances by Arrest dataset - often called Return A, "Offenses Known" or, less commonly, OKCA - is the oldest and most commonly used dataset and measures crimes reported to the police. For this reason it is used as *the* main measure of crime in the United States, and I tend to call it the "crimes dataset." This data answers the most basic questions about crimes: how many occurred? If you see crime data referenced in a news or academic article it is usually this data. This data also includes the number of crimes solved (though with a weaker definition of "solved" than you may think) and the number of crimes in which the agency concluded did not actually occur which they call an "unfounded" crime. This data has the monthly number of crimes - for a select group of crimes types - that occurred in an agency, as well as how many the police investigated and decided did not occur, and the number "cleared" by an arrest.  The data uses something called a Hierarchy Rule which means that in incidents with multiple crimes, only the most serious is recorded - though in practice this affects only a small percent of cases, and primarily affects property crimes.

### Arrests by Age, Sex, and Race (1974 - present)

The Arrests by Age, Sex, and Race dataset - often called ASR, or the "arrests data", or sometimes the "Arrests by Age, Sex, Race, and Ethnicity though this is really misleading since most years do not even report ethnicity data - includes the monthly number of arrests for a variety of crimes and, unlike the crime data, breaks down this data by age and gender. This data includes a broader number of crime categories than the crime dataset (the Offenses Known and Clearances by Arrest data) though is less detailed on violent crimes since it does not breakdown aggravated assault or robberies by weapon type as the Offenses Known data does.

For each crime it says the number of arrests for each gender-age group with younger ages (15-24) showing the arrestee's age to the year (e.g. age 16, age 17) and other ages grouping years together (e.g. age 25-29, 30-34, "under 10"). It also breaks down arrests by race-age by including the number of arrestees of each race (American Indian, Asian, Black, and White are the only included races) and if the arrestee is a juvenile (<18 years old) or an adult. The data does technically include a breakdown by ethnicity-age (e.g. juvenile-Hispanic, juvenile-non-Hispanic) but almost no agencies report this data (for most years zero agencies report ethnicity at all) so in practice the data does not include ethnicity. As the data includes counts of arrestees, people who are arrested multiple times are included in the data multiple times - it is not a measure of unique arrestees. 

### Law Enforcement Officers Killed and Assaulted (LEOKA) (1960 - present)

The Law Enforcement Officers Killed and Assaulted data, often called just by its acronym LEOKA ("LEE-OH-KUH"), has two main purposes.^[This data is also sometimes called the "Police Employees" dataset.] First, it provides counts of employees employed by each agency - broken down by if they are civilian employees or sworn officers, and also broken down by sex (male and female are the only options). And second, it measures how many officers were assaulted or killed (including officers who die accidentally such as in a car crash) in a given month. The assault data is also broken down into shift type (e.g. alone, with a partner, on foot, in a car, etc.), the offender's weapon, and type of call they are responding to (e.g. robbery, disturbance, traffic stop). The killed data simply says how many officers are killed feloniously (i.e. murdered) or died accidentally (e.g. car crash) in a given month. The employee information is at the year-level so you know, for example, how many male police officers were employed in a given year at an agency, but do not know any more than that such as if the number employed changed over the year. This dataset is commonly used as a measure of police employees and is a generally reliable measure of how many police are employed by a police agency. The second part of this data, measuring assaults and deaths, is more flawed with missing data issues and data error issues (e.g. more officers killed than employed in an agency).

### Supplementary Homicide Reports (SHR)

The Supplementary Homicide Reports dataset - often abbreviated to SHR - is the most detailed of the SRS datasets and provides information about the circumstances and participants (victim and offender demographics and relationship status) for homicides. For each homicide incident it tells you the age, gender, race, and ethnicity of each victim and offender as well as the relationship between the first victim and each of the offenders (but not the other victims in cases where there are multiple victims). It also tells you the weapon used by each offender and the circumstance of the killing, such as a "lovers triangle" or a gang-related murder. As with other SRS data, it also tells you the agency it occurred in and the month and year when the crime happened. 

One important point of clarification: this is not the number of murders, though it does track that. This data also includes the number of homicides that are manslaughter by negligence (e.g. children playing with a gun, hunting accident) and justifiable homicides (i.e. not criminal). So be carefully when speaking about this data. It is murders but not only murders so you want to speak precisely. 

### Hate Crime Data (1991 - present)

This dataset covers crimes that are reported to the police and judged by the police to be motivated by hate. More specifically, they are (1) crimes which were (2) motivated - at least in part - by bias towards a certain person or group of people because of characteristics about them such as race, sexual orientation, or religion. The first part is key, they must be crimes - and really must be the selection of crimes that the FBI collects for this dataset. Biased actions that do not meet the standard of a crime, or are of a crime category not included in this data, are not considered hate crimes. For example, if someone yells at a Black person and uses racial slurs against them, it is clearly a racist action. For it to be included in this data, however, it would have to extend to a threat since "intimidation" is a crime included in this data but lesser actions such as simply insulting someone is not included. For the second part, the bias motivation, it must be against a group that the FBI includes in this data. For example, when this data collection began in 1991 crimes against transgender people were not counted so if a transgender person was assaulted or killed because they were transgender, this is not a hate crime recorded in the data (though it would have counted in the "Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT)" bias motivation which was always reported).


### Property Stolen and Recovered (Supplement to Return A) (1960 - present)

The Property Stolen and Recovered data - sometimes called the Supplement to Return A (Return A being another name for the Offenses Known and Clearances by Arrest dataset, the "crime" dataset) - provides monthly information about property-related offenses (theft, motor vehicle theft, robbery, and burglary), including the location of the offense (in broad categories like "gas station" or "residence"), what was stolen (e.g. clothing, livestock, firearms), and how much the stolen items were worth.^[It also includes the value of items stolen during rapes and murders, if anything was stolen.] It also includes robberies so is really the "stuff taken during a crime" dataset than the dataset about property crimes. The "recovered" part of this dataset covers the type and value of property recovered so you can use this, along with the type and value of property stolen, to determine what percent and type of items the police managed to recover. 

Like most other SRS datasets this is at the agency-month level so you can, for example, learn how often burglaries occur at the victim's home during the day, and if that rate changes over the year or differs across agencies. The data, however, provides no information about the offender or the victim (other than if the victim was an individual or a commercial business ^[based on the location of the incident - "bank", "gas station", etc.]). The value of the property stolen is primarily based on the victim's estimate of how much the item is worth (items that are decreased in value once used - such as cars - are supposed to be valued at the current market rate, but the data provides no indication of when it uses the current market rate or the victim's estimate) so it should be used as a very rough estimate of value.  

### Arson (1979 - present)

The arson dataset provides monthly counts at the police agency-level for arsons that occur, and includes a breakdown of arsons by the type of arson (e.g. arson of a person's home, arson of a vehicle, arson of a community/public building) and the estimated value of the damage caused by the arson. This data includes all arsons reported to the police or otherwise known to the police (e.g. discovered while on patrol) and also has a count of arsons that lead to an arrest (of at least one person who committed the arson) and reports that turned out to not be arsons (such as if an investigation found that the fire was started accidentally). This is essentially the Offenses Known and Clearances by Arrest data but only for arsons. The data even follows the same definitions for categories such as what counts as a cleared or unfounded crime. The primary additional variable is the estimated damage in dollars caused by the arson. 




<!--chapter:end:02_ucr_general.Rmd-->

---
output:
  pdf_document: default
  html_document: default
---
# Offenses Known and Clearances by Arrest {#offensesKnown}






The Offenses Known and Clearances by Arrest dataset - often called Return A, "Offenses Known" or, less commonly, OKCA - is the oldest and most commonly used dataset in the UCR and measures it crimes reported to the police. For this reason it is used as *the* main measure of crime in the United States, and I tend to call it the "crimes dataset." This data answers the most basic questions about crimes: how many occurred? If you see crime data referenced in a news or academic article it is usually this data. This data also includes the number of crimes solved (though with a weaker definition of "solved" than you may think) and the number of crimes in which the agency concluded did not actually occur which they call an "unfounded" crime. This data has the monthly number of crimes - for a select group of crimes types - that occurred in an agency, as well as how many the police investigated and decided did not occur, and the number "cleared" by an arrest. 

The Offenses Known data has been **the** crime data of record for nearly a century, and will likely still be for the next couple of decades at least. And that is due to its simplicity. This data is (with some exceptions we will get into) just the monthly number of crimes reported or otherwise known (e.g. discovered while on patrol) to a police agency for a small number of crimes. If you want to know, for example, how many murders or burglaries happened in your city last year, this is the dataset to turn to. This simplicity allows a much wider group of people to use the data; since it is monthly counts of crimes (with no breakdown by location, race, age, injury, etc.) you do not need much programming or analytic skills to use it. 

I argued earlier in this book that NIBRS is a far superior dataset than anything in SRS, and I stand by that. NIBRS is superior in nearly every way. But for most people - the general public, reporters, many academics, etc. - what is important is ease of use and very basic descriptive statistics such as how many crimes happened in my city last year^[Even some academic papers are little more than a difference between two or more cities over time and can be very good research even if the data is not that complex.], and is it getting more dangerous than it used to be? The Offenses Known data answers that, at least to a point. You can answer more complex questions using NIBRS but most people do not need those questions answered. They're content with what can be answered using the Offenses Known data. And for good reason. "Is crime increasing in my city" is really the first and most important question about crime that people have. 

Part of the superiority of NIBRS is that while it can answer much more complex questions than SRS datasets, it can also answer the same questions that the SRS can. That is because, by design, NIBRS collects the same information as SRS and can be converted to SRS data. Many agencies that submit NIBRS data do not submit SRS data at all, and the FBI converts the NIBRS data to its SRS counterpart for release to the public. This is an almost perfect comparison but not all of the same variables are collected, which will cause some issues that we will discuss in this chapter. 

One thing you may have heard about this data is that it uses something called the Hierarchy Rule. Basically the rule says that when an incident involves more than one crime, such as a robbery and a murder, you only count the most serious crime. And most serious is based on the hierarchy the FBI has created. This is true and therefore the number of crimes - other than murder which is the most serious - recorded in this data is always an undercount. But you really should not be too concerned about this. As we will get into below, the Hierarchy Rule affects only a relatively small share of incidents so does not undercount crime by too much - and when it does it is primarily undercounting property crime.

## Which crimes are included? {#indexCrimesOffensesKnown}

This dataset contains information on the number of "Index Crimes" (sometimes called Part I crimes) reported to each agency.^[While some people capitalize "Index Crime," I prefer the term in lowercase which is how I will write it.] These index crimes are a collection of eight crimes that, for historical reasons based largely by perceived importance and reliability of their reporting in the 1920s when the UCR program was first developed, are used as the primary measure of crime today. Other data sets in the UCR, such as the Arrests by Age, Sex, and Race data and the Hate Crime data have more crimes reported. 

The crimes are, in order by the Hierarchy Rule (which we will discuss next):

1. Homicide     
+ Murder and non-negligent manslaughter  
+ Manslaughter by negligence 
2. Rape     
+ Rape     
+ Attempted rape     
3. Robbery     
+ With a firearm     
+ With a knife of cutting instrument     
+ With a dangerous weapon not otherwise specified     
+ Unarmed - using hands, fists, feet, etc.     
4. Aggravated Assault (assault with a weapon or with the intent to cause serious bodily injury)     
+ With a firearm     
+ With a knife of cutting instrument     
+ With a dangerous weapon not otherwise specified     
+ Unarmed - using hands, fists, feet, etc.     
5. Burglary     
+ With forcible entry     
+ Without forcible entry      
+ Attempted burglary with forcible entry     
6. Theft (other than of a motor vehicle)     
7. Motor Vehicle Theft     
+ Cars     
+ Trucks and buses     
+ Other vehicles          
8. Arson     
9. Simple Assault     

Arson is considered an index crime but is not reported in this data - you need to use the separate Arson dataset of the UCR to get access to arson counts. See Chapter \@ref(arsonChapter) for an overview of the Arson data. The ninth crime on that list, simple assault, is not considered an index crime but is nevertheless included in this data. 

Each of the crimes in the list above, and their subcategories, are included in the UCR data. In most news and academic articles, however, you will see them reported as the total number of index crimes, summing up categories 1-7 and reporting that as "crime."^[I have encountered a shocking number of academic papers and researchers who seem to believe that the subcategories are not included in the data at all.] These index crimes are often divided into violent index crimes - murder, rape, robbery, and aggravated assault - and property index crimes - burglary, theft, motor vehicle theft. For more on index crimes, and the drawbacks of using them, please see Section \@ref(indexCrimes).

### Hierarchy Rule {#hierarchy}

This dataset uses what is called the Hierarchy Rule where only the most serious crime in an incident is reported (except for motor vehicle theft and arson, which are always included).^[FBI documentation actually differs on whether motor vehicle theft is always reported with some documentation saying it is while others placing it in the hierarchy. According to their "Summary Reporting System (SRS) User Manual" Version 1.0 released 6/20/2013, "The offenses of justifiable homicide, motor vehicle theft, and arson are exceptions to the Hierarchy Rule."] For example if there is an incident where the victim is robbed and then murdered, only the murder is counted as it is considered more serious than the robbery. That the data uses the Hierarchy Rule is a frequently cited (by academics, reporters, random people on Twitter) criticism of the data that is, in my opinion, overblown. 

In practice, the Hierarchy Rule has only modest effects on the data, undercounting few crimes. Though the Hierarchy Rule does mean this data is an undercount, data from other sources indicate that it is not much of an under count. NIBRS data contains every crime that occurs in an incident (i.e. it does not use the Hierarchy Rule). Using this we can measure how many crimes the Hierarchy Rule excludes. In approximately 90% of incidents, only one crime is committed.^[According to 2022 NIBRS, 88.15% of incidents have only a single offense.] Additionally, when people talk about "crime" they usually mean murder which, while incomplete to discuss crime, means the UCR data here is accurate on that measure. 

The FBI released a report [available here](https://ucr.fbi.gov/nibrs/2014/resource-pages/effects_of_nibrs_on_crime_statistics_final.pdf) in 2015 that directly examined this issue by taking NIBRS data from 2014 and examined how NIBRS data (which does not use the Hierarchy Rule) compares to using the Hierarchy Rule and keeping only the most serious crime. Figure \@ref(fig:fbiHierarchy) is a screenshot from their report showing the percent increases in crimes when including all crimes in an incident relative to following the Hierarchy Rule. They find that 10.6% of incidents have multiple crimes occurring. For violent crime, murder and rape have no change; for the remaining violent crimes - robbery and aggravated assault - crimes increased by 0.6%.^[Murder is not shown in this figure since murder is always reported so cannot change.] Burglary increased by 1% and the largest increases came from theft and motor vehicle theft, increasing by 2.6% and 2.7%, respectively. Curiously, motor vehicle theft increased even though the FBI's documentation for this data says that it is exempt from the Hierarchy Rule and should always be reported. This discrepancy suggests either non-compliance or errors in the FBI's manual.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{images/fbi_hierarchy} 

}

\caption{The FBI's findings of how crime reporting changes when using the Hierarchy Rule using NIBRS 2014 data.}(\#fig:fbiHierarchy)
\end{figure}

In Table \@ref(tab:nibrsHierarchy) I replicate the FBI's table using NIBRS 2022 data. Results are fairly close. Homicide and rape and unchanged; robbery and aggravated assault both increase by <1%; my count for theft and burglary are a bit smaller, and motor vehicle theft is almost triple the FBI's 2014 number. But these numbers are mostly consistent - particularly so for violent crime - and I expect the differences are just that 2014 and 2022 data are different. So using the Hierarchy Rule does undercount crime, but this is a small undercounting and is primarily led by property crime. Violent crime is only slightly undercounted. And compared to the number of crimes not counted because the victim does not reports it to the police, this is a very small share of crimes. 


\begin{longtable}[t]{ll}
\caption{(\#tab:nibrsHierarchy)The percent increase in reported crimes for each index crime if the Hierarchy Rule was not used, NIBRS 2022.}\\
\toprule
Crime & \% increase without Hierarchy Rule\\
\midrule
\endfirsthead
\caption[]{(\#tab:nibrsHierarchy)The percent increase in reported crimes for each index crime if the Hierarchy Rule was not used, NIBRS 2022. \textit{(continued)}}\\
\toprule
Crime & \% increase without Hierarchy Rule\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
Homicide & 0.00\\
Rape & 0.01\\
Robbery & 0.48\\
Aggravated Assault & 0.78\\
Burglary & 1.69\\
\addlinespace
Theft & 1.40\\
Motor Vehicle Theft & 7.12\\
Arson & 7.33\\*
\end{longtable}



### Index ("Part 1") crimes {#indexCrimes}

One of the first things that people tend to learn about SRS crime data is that it covers something called an "index crime."^[Index crimes are sometimes capitalized as "Index Crimes" though I have seen it written both ways. In this book I keep it lowercase as "index crimes."] Index crimes, sometimes written as Part 1 or Part I crimes, are the seven crimes originally chosen by the FBI to be included in their measure of crimes as these offenses were both considered serious and generally well-reported so would be a useful measure of crime. Index crimes are often broken down into property index crimes - burglary, theft, and motor vehicle theft (and arson now, though that is often not included and is reported less often by agencies) - and violent index crimes (murder, rape, robbery, and aggravated assault). The "index" is simply that all of the crimes are summed up into a total count of crimes (violent, property, or total) for that police agency. 

The biggest problem with index crimes is that it is simply the sum of 8 (or 7 since arson data usually isn’t included) crimes. Index crimes have a huge range in their seriousness - it includes, for example, both murder and theft - so summing up the crimes gives each crime equal weight. This approach is flawed as 100 murders is more serious than 100 thefts. This is especially a problem as less serious crimes (theft mostly) are far more common than more serious crimes. In 2017, for example, there were 1.25 million violent index crimes in the United States. That same year had 5.5 million thefts. So using index crimes as your measure of crimes fails to account for the seriousness of crimes. Looking at total index crimes is, in effect, mostly just looking at theft. Looking at violent index crimes alone mostly measures aggravated assault. This is especially a problem because it hides trends in violent crimes. As an example, San Francisco, shown in Figure \@ref(fig:sfThefts), has had a huge increase - about 50% - in index crimes in the last several years. When looking closer, that increase is driven almost entirely by the near doubling of theft since 2011. During the same years, index violent crimes have stayed fairly steady. So the city isn’t getting more dangerous - at least not in terms of violent index crimes increasing - but it appears like it is due to just looking at total index crimes.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/sfThefts-1} 

}

\caption{Thefts and total index crimes in San Francisco, 2000-2023.}(\#fig:sfThefts)
\end{figure}

Many researchers divide index crimes into violent and nonviolent categories, which helps but even this is not entirely sufficient. Take Chicago as an example. It is a city infamous for its large number of murders. But as a fraction of index crimes, Chicago has a rounding error worth of murders. Their 653 murders in 2017 is only 0.5% of total index crimes. For violent index crimes, murder made up 2.2% of crimes that year. As seen in Figure \@ref(fig:chicagoMurder), in no year where data is available did murders account for more than 3.5% of violent index crimes; and, while murders are increasing as a percent of violent index crimes they still account for no more than 2.5% in most recent years. What this means is that changes in murder are very difficult to detect. If Chicago had no murders this year, but a less serious crime (such as theft) increased slightly, we could not tell from looking at the number of index crimes, even from violent index crimes. As discussed in the below section, using this sample of crimes as the primary measure of crimes - and particularly of violent crimes - is also misleading as it excludes important - and highly common relative to index crimes - offenses, such as simple assault.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/chicagoMurder-1} 

}

\caption{Murders in Chicago as a percent of violent index crimes, 1960-2023.}(\#fig:chicagoMurder)
\end{figure}


#### What is a violent crime?

An important consideration in using this data is defining what a "violent crime" is. One definition, and the one that I think makes the most sense, is that a violent crime is one that uses force or the threat of force. For example, if I punch you in the face, that is a violent crime. If I stab you, that is a violent crime. While clearly different in terms of severity, both incidents used force so I believe would be classified as a violent crime. The FBI, and most researchers, reporters, and advocates would disagree. Organizations ranging from the [FBI itself](https://SRS.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/topic-pages/violent-crime) to [Pew Research Center](https://www.pewresearch.org/fact-tank/2020/11/20/facts-about-crime-in-the-u-s/) and advocacy groups like the [Vera Institute of Justice](https://arresttrends.vera.org/data-sources-methodology) and the [ACLU](https://www.aclu.org/report/tale-two-countries-racially-targeted-arrests-era-marijuana-reform) all define the first example as a non-violent crime and the second as a violent crime. They do this for three main reasons. 

The first reason is that simple assault is not an index crime, so they do not include it when measuring violent crime. It is almost a tautology in criminology that you use index crimes as the measure of crime since that is just what people do. As far as I am aware, this is really the main reason why researchers justify using index crimes: because people in the past used it so that is just what is done now.^[I have also seen the justification that aggravated assault is more serious since it uses a weapon, though as the SRS subcategory of aggravated assault without a weapon clearly shows, aggravated assault does not require use of a weapon.] This strikes me as a particularly awful way of doing anything, more so since simple assault data has been available almost as long as index crime data.^[Simple assault is first available in 1964. Index crime data is available since 1960.]

The second reason - and one that I think makes sense for reporters and advocates who are less familiar with the data, but should be unacceptable to researchers - is that people do not know that simple assault is included, or at least do not have easy access to it. Neither the FBI's annual report [page](https://SRS.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/home) not their official [crime data tool website](https://crime-data-explorer.fr.cloud.gov/) include simple assault since they only include index crimes. For people who rely only on these sources - and given that using the data itself requires at least some programming skills, I think this accounts for most users and certainly nearly all non-researchers - it is not possible to access simple assault crime data (arrest data does include simple assault on these sites) from these official sources.     

The final reason is that it benefits some people's goals to classify violent crime as only including index crimes. This is because simple assault is extremely common compared to violent index crimes - in many cities simple assault is more common than all violent index crimes put together - so excluding simple assault makes it seem like fewer arrests are violent than they are when including simple assault. For example, a number of articles have noted that marijuana arrests are more common than violent crime arrests [@ingraham2016; @kertscher2019; @devito2020; @earlenbaugh2020; @aclu2020] or that violent crime arrests are only 5\% of all arrests [@neusteter2019every; @speri2019].^[The FBI's report for arrests does include simple assault so the second reason people may not include it does not apply here.] While true when considering only violent index crimes, including simple assault as a violent crime makes these statements false. Some organizations call the violent index crimes "serious violent crimes" which is an improvement but even this is a misnomer since simple assault can lead to more serious harm than aggravated assault. An assault becomes aggravated if using a weapon or there is the *potential* for serious harm, even if no harm actually occurs.^[SRS data provides no information about the harm caused to victims. The new FBI dataset NIBRS actually does have a variable that includes harm to the victim so if you are interested in measuring harm (an understudied topic in criminology), that is the dataset to use.] 

As an example of this last point, Figure \@ref(fig:simpleIndex) shows the number of violent index crimes and simple assaults each year from 1960 to 2018 in Houston, Texas (simple assault is not reported in SRS until 1964, which is why 1960-1963 show zero simple assaults). In every year where simple assault is reported, there are more simple assaults than aggravated assaults. Beginning in the late 1980s, there are also more simple assaults than total violent index crimes. Excluding simple assault from being a violent crime greatly underestimates violence in the country. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/simpleIndex-1} 

}

\caption{Reported crimes in Houston, Texas, from 1960 to 2018. Violent index crimes are aggravated assault, rape, robbery, and murder.}(\#fig:simpleIndex)
\end{figure}



## Agencies reporting  {#offensesKnownReporting}

Figure \@ref(fig:offensesAgenciesReporting) shows the annual number of police agencies that reported at least one month that year. With data starting in 1960, there were a little under 7,500 agencies reporting a year until 1970 when the number of agencies began increasing. This continued until the late 1970s when about 14,000 agencies reported, and this remained steady for over a decade before declining in the 1990s until about 12,500 in the latter half of the decade. Then the number of agencies reporting increased steadily until about 16,500 agencies reported in 2010. The number of agencies has slowly increased since then, adding a few hundred agencies from 2010 to 2020. The drop and then partial recovery you see in 2021 and 2022 is from the FBI stopping collection of this data and then restarting that collection in 2021. Most agencies report to NIBRS but the only that still report SRS, and therefore could not report in 2021, caused the drop.

There are actually two lines throughout this entire figure, though they are nearly identical until 2018. That is because there are two ways of measuring how many months an agency reports data. The primary one - and the one the FBI itself uses - is through a variable in the data called the "last_month_reported." This is, as it sounds, the last month the agency sent data in. So if an agency reports data in December the variable will have "December" as the last month. If that agency only reported it December the variable will still say "December." Most people use this as the number of months that the agency reported. So a December value is 12 months reported, even though in our example it was the only month with data. 

In the data there are 12 columns - one for each month - that says whether the agency reported data in that month. That is what I use in the green line to measure how many months of data that agency reported. I refer to this in the figure and in the data I have released as the "number of months missing." When looking at agencies reporting only a single month the lines are nearly identical, though the last month reported measure is nearly always larger. This changes in 2018 as a result of the data changing, meaning I needed to use different columns to check starting in that year. That means that post-2018 data may not be comparable to 2018 and earlier using this variable.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/offensesAgenciesReporting-1} 

}

\caption{The annual number of agencies reporting at least one month of data and a full 12 months of data, 1960-2023.}(\#fig:offensesAgenciesReporting)
\end{figure}

Usually when you are looking at crime data you want annual data, so having agencies report a full year's of data is more important than them submitting just partial data. This is especially important when comparing an agency over time or two different agencies to each other. Obviously, an agency with 6 month of data will have fewer crimes reported than one with 12 months reported, all else being equal. But this is something easy to overlook as it is an easy assumption that agencies will report a full years-worth of data. Unfortunately, this is always true. Some agencies do not report any data and others report only part of the year - though if an agency reports one month they usually do report all 12. Figure \@ref(fig:offensesAgenciesReportingFull) repeats Figure \@ref(fig:offensesAgenciesReporting) but now showing only agencies reporting 12 months of data, using both of our measures. Since 1960 every year has had fewer agencies reporting full data using the "number of months missing" method than the "last month reported" method. 

## Negative numbers

One of the most common questions people have about this data is why there are negative numbers, and if they are a mistake. Negative numbers are not a mistake. The SRS data is monthly so police agencies report the number of monthly crimes that are known to them - either reported to them or discovered by the police. In some cases the police will determine that a crime reported to them did not actually occur - which they called an "unfounded crime." An example that the FBI gives for this is a person reports their wallet stolen (a theft) and then later finds it, so a crime was initially reported but no crime actually occurred. 

How this works when the police input the data is that an unfounded crime is reported both as an unfounded crime and as a negative actual crime - the negative is used to zero out the erroneous report of the actual crime. So the report would look like  1 actual theft (the crime being reported), -1 theft (the crime being discovered as not have happened), and 1 unfounded theft. If both incidents occurred in the same month then this would simply be a single unfounded theft occurring, with no actual theft - literally a value of 1 + -1 = 0 thefts. 

Negative values occur when the unfounding happens in a later month than the crime report. In the theft case, let us say the theft occurred in January and the discovery of the wallet happens in August. Assuming no other crimes occurred, January would have 1 theft, and August would have -1 thefts and 1 unfounded theft. There is no way of determining in which month (or even which year) an unfounded crime was initially reported in. When averaging over the long term, there should not be any negative numbers as the actual and unfounded reports will cancel themselves out. However, when looking at monthly crimes - particularly for rare crimes - you will still see negative numbers for this reason. Since crimes can be unfounded for reports in previous years, you can actually see entire year's crime counts be negative, though this is much rarer than monthly values.^[From 1960-2023, there were 39 agency-years with a negative count of murders.] 

So using the far more common last month reported method will overestimate how many agencies report a full year of data. In practice, though, this affects very little data and what it does affect is only overcounted very slightly. At least when aggregating nationally - which I generally advise against since local crime matters a lot more than national averages. Still, let us look the increase in the total number of crimes reported by 12-month reporting agencies increases from the "number of months missing" measure to the "last month reported" measure, shown in Figure \@ref(fig:murdersBothMeasures). The answer is an extremely small increase, averaging (mean = 0.93%, mean = 1.26%) about a one percent point increase each year. The differences in measuring how many months are reported can matter a great deal at the agency-level, but does very little when aggregating nationally.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/murdersBothMeasures-1} 

}

\caption{The percent change in the number of murders reported in the United States each year when moving from the number of months missing measure to the last month reported measure, 1960-2020.}(\#fig:murdersBothMeasures)
\end{figure}

## Important variables

Now let us talk about some important variables in this data such as what it actually measures. For each crime we have four different categories indicating the number of crimes actually committed, the number cleared, and the number determined to not have occurred. Like other UCR data, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. 

### Actual crimes {#actual}

This is the number of offenses that *actually* occurred - where *actually* means that a police investigation found that the crime report was accurate. Occurred is actually a bit of a strong word. These are crimes that come to the police's attention in that month, even if the crime actually occurred before. For example, if someone walks into a police department on February, 2025 and says "last year I killed five people" that would count as five murders in February, 2025 (that is assuming that the police believe that the person is telling the truth). It would not be counted in 2024 when the person says the murders took place. 

Crimes that are reported that the police find did not occur (e.g. report of an arson but turns that the fire began accidentally) are called "unfounded" crimes. So this variable is the one people use to measure *crime*. For example if 10 people are murdered in a city the number of "actual murders" would be 10. A crime is a crime incident, regardless of how many offenders there were. If there are multiple victims in a case, such as a double murder, then it would count as multiple crimes.

Figure \@ref(fig:newarkMurders), for example, shows the number of murders per 100,000 population in Newark, NJ, for 1960-2023. One things stands out. Or does not stand out, in a bad way. Newark Police did not report a full year of data in 2015; they reported only 11 months. It is imperceptible in the figure but if you look at the number of months reported in that year - using either the last month reported or the number of months missing measure - you can see that December is missing. While visualizing the data is often a good way to look for outliers or missingness, it is not enough alone. You need to look at the raw data as well to be safe. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/newarkMurders-1} 

}

\caption{The annual murder rate per 100,000 people in Newark, NJ, 1960-2023.}(\#fig:newarkMurders)
\end{figure}


Since this is the number of crimes reported and found to occurred, it undercounts the total number of reported crimes. To get that number you will need to add actual crimes to unfounded crimes, which we discuss in Section \@ref({unfounded}). However, unfounded crimes are increasingly not being reported as agencies move to NIBRS reporting which does not capture unfounded crimes. 

### Total cleared crimes {#clearedCrimes}

A crime is cleared when an offender is arrested or when the case is considered cleared by exceptional means. To be more specific, this data counts crime as a crime incident, regardless of the number of offenders. For example, if three people robbed a person, that is one crime of robbery, not three separate crimes. This crime is cleared when one of the three robbers is arrested - no matter the outcome for the other two robbers. Arresting all three still counts as a single robbery cleared. If those three people had robbed two people that would be reported as two robberies. The first year with clearance data is in 1963, though that is extremely rare; the vast majority of agencies started reporting this data in 1964.

Even though this dataset is formally named "Offenses Known and Clearances by Arrest" it does include clearances where no one is arrested, which are called "exceptional clearances" or "clearances by exceptional means." For exceptional clearances, police must have identified the offender, have sufficient evidence to arrest that offender, know where they are (so they can actually be apprehended) and only then be unable to make the arrest. Exceptional clearances include cases where the offender dies before an arrest (by any means, including suicide, accidental, illness, killed by someone including a police officer) or when the police are unable to arrest the person since they are already in custody by another jurisdiction (including out of the country or in custody of another agency) and extradition is denied. Two other potential causes of exceptional clearance are when prosecution of the case cannot go forward because the district attorney refuses to prosecute the case, for reasons other than lack of evidence, or when a victim refuses to assist the prosecution in the case. 

Unfortunately, this data does not differentiate between clearances by arrest or by exceptional means so there is no way to determine how many clearances mean the offender is actually arrested - and even more problematic, how many clearances have all of the offenders arrested. NIBRS data does differentiate these types of clearances, another advantage of using it. There is also some evidence that at least some police agencies report classify large numbers of clearances as clearances through exception means (again, we have no way to tell which is which using this data) even though exceptional clearances should be rare given that times where the offender is known but cannot be arrested are likely far less common than when they are arrested. For an investigation into this issue, see the @yeung2018comes article available on ProPublica's website [here](https://www.propublica.org/article/when-it-comes-to-rape-just-because-a-case-is-cleared-does-not-mean-solved).

Clearances are reported in the month that they occur, regardless of when the crime they are clearing occurred. In practice, however, most crimes are cleared in the month that they occur. According to the 2019 NIBRS, it takes on average 7 days between the incident and the arrest (median = 0 days) date when averaging across all crimes - for individual crimes these values will be different. This means that most of the clearances will be for the same month as the initial crime - though this will be less common for crimes that happen at the end of a month. Of course, police agencies can solve older cases - and even target cold cases to be solved - so this is still a degree of uncertainty for which month these clearances are for. 

This means that there are occasionally months - and even years - where there are more reported crimes cleared than crimes that occur.^[In about 1% of agency-years since 1964, the year most agencies started reporting this data, there were more cleared murders than actual murders.] Figure \@ref(fig:lapdClearance), for example, shows the number of actual and cleared murders from the Los Angeles Police Department. In 2013 there were more murders cleared (271) than actual murders (251) In 2020, both values are zero as the LAPD did not report data that year. 

This is actually a good check to see when people who use this data do not actually understand how it works. I have seen published academic papers that say that having more clearances than actual crimes is a data error; clearly they declined to read the official manual (or this book) before they, their editor, and their anonymous reviewers published the paper. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/lapdClearance-1} 

}

\caption{The annual number of actual and cleared murders from the Los Angeles Police Department, 1960-2023.}(\#fig:lapdClearance)
\end{figure}

### Crimes cleared where all offenders are under 18 years old

This variable is a subset of the Total Cleared variable and only includes clearances for offenses in which **every** offender is younger than age 18. Since this requires that the police know, or at least believe, the age of every offender, it is probably fairly inaccurate. This category includes cases where the juvenile is given a citation to show up in court for their trial and is not formally arrested and taken into custody. 

### Unfounded crimes {#unfounded}

An unfounded crime is one in which a police investigation has determined that the reported crime did not actually happen. The first year of data that included unfounded crimes was 1979, though most agencies began reporting in 1983. 

For example, I observed during a ride-along a report of a burglary where the homeowners said that they came home, and the front door was open and they thought it might have been their son who forgot to close it but were worried that it could be a burglar, so they called the police just in case. This would be recorded as a burglary and if it turned out to be the son, the police would then record this as an unfounded burglary. 

Other unfounded crimes would include when someone reports a crime but later says that the report was not true. For example, a person could report a burglary to the police to collect insurance money on the items they claim was stolen. If the police discover this they would unfound the case - and the lying to the police and fraud would not be counted as neither of those are crimes included in this dataset. The way that the police do this in the data is to record an unfounded crime as a negative actual crime. If there are 10 burglaries already reported and then the above example occurred they would take those 10, add 1 for the report, and then subtract one for when they decide the crime is unfounded. This evens out the data to "erase" the initial report. If the unfounding occurs in a different month than the reported crime then this could lead to negative crimes being reported. This is just another quirk of SRS data and is another good check to see if a person using the data actually understands it as I have also seen people say negative crimes is a data error. 

Figure \@ref(fig:frankenmuthRape) provides one example of this by showing the number of burglaries that the Frankenmuth Police, MI, say actually occurred from 1960-2023. In 1977 they reported -1 burglaries, the result of having more cleared than actual burglaries in that year.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/frankenmuthRape-1} 

}

\caption{The number of actual burglaries reported by the Frankenmuth Police Department, MI, 1960-2023.}(\#fig:frankenmuthRape)
\end{figure}

While this is a useful variable, it is not captured in NIBRS data. Instead the number of unfounded crimes is always reported as zero. For example, Figure \@ref(fig:denverUnfounded) shows the annual number of unfounded crimes (of any crime type) in Memphis, TN, and Denver, CO, which are two of the earliest large agencies to adopt NIBRS. Memphis started in reporting to NIBRS in 2000 and Denver did so in 2005. These agencies stopped reporting any unfounded crimes either in that or the following year.^[For Memphis, as agencies can report both SRS and NIBRS, that agency may have reported both in 2000 which is why we still see unfounded data that year.]


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/denverUnfounded-1} 

}

\caption{The annual number of unfounded crimes in Denver, CO, 1983-2023.}(\#fig:denverUnfounded)
\end{figure}


## Important changes

There are two major changes in recording practices over the life of this dataset: an expansion of what counts as rape, and a reduction in what counts as manslaughter. 

### Rape definition change

The FBI changed the definition of rape for UCR data starting in 2013 to a broader definition than the older definition, which is commonly called the "legacy definition" or "legacy" or "historical" rape. The legacy definition is "the carnal knowledge of a female **forcibly** and against her will" (emphasis added). This means that only rape is only included in UCR data when it is a female (of any age, there is no differentiation for child victims) forcibly vaginally penetrated by a penis. This is a narrow definition and excludes a number of sexual acts that people may consider rape such as forced oral or anal sex, and cases with a male victim. 

Starting in 2013, rape has a new, broader definition in the UCR to include oral and anal penetration (by a body part or object) and to allow men to be victims. The new definition is: "Penetration, no matter how slight, of the vagina or anus with any body part or object, or oral penetration by a sex organ of another person, without the consent of the victim." The previous definition included only forcible intercourse against a woman. This definition is far broader and is effectively any non-consensual sexual act. It also includes male victims though the data does not differentiate between male or female (or any other gender) victims. 

Both the current and legacy definitions exclude statutory rape and incest other than forcible incest.^[Both of these are recorded in NIBRS.] They both also include lack of consent as cases where the victim cannot give consent, such as if they are too young or are mentally or physically incapacitated - the FBI specifically give the example of being temporarily incapacitated through drugs or alcohol.

As this revised definition is broader than the original one post-2013, rape data is not comparable to pre-2013 data. 2013, however, is simply the year that the FBI required that agencies report using the new definition. As might not be too surprising, not all agencies followed this requirement. We will look at four examples to show when there is clear evidence that the agency did change their definition in 2013, when it is clear they did so a year later, when it is unclear exactly when they made the change, and when the agency seems to not follow the change at all. 

We will start with the Philadelphia Police Department shown in Figure \@ref(fig:rapePhilly). It is declining slowly but steadily over the 2000-2012 time period until spiking sharply in 2013. Since the rape definition change in 2013 is far broader than previous year's definition, this makes sense. A broader definition should lead to a sudden increase in reported rapes if the agency is reporting correctly. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/rapePhilly-1} 

}

\caption{The annual number of rapes reported in Philadelphia, San Francisco, New York City, and Jackson, MS, 2005-2019.}(\#fig:rapePhilly)
\end{figure}

In comparison, New York City has the sudden spike a year later, which indicates that they did not start using the new definition until 2014. Figure \@ref(fig:rapeNYC) shows that rape is fairly steady, though increasing, in the years leading up to 2013 and has almost no change from 2012 to 2013, but a huge increase in 2014 and then steadily increases from there, spiking again in 2018. This seems like a fairly clear indicator that NYC simply did not follow the new definition until 2014. 


Less clear is what is happening in San Francisco, shown in Figure \@ref(fig:rapeLA). Here we do see an increase in 2013 which while it appears small on the graph is actually a 49% increase from 2012. Then there is a much larger spike in 2014 - a 120% increase - which may suggest that part of the agency started following the new definition in 2013 and the remainder followed in 2014. Or maybe some months used the old definition and others the new definition in 2013, while all of 2014 used the new definition However, increases or decreases are relatively common in San Francisco so it could also be that the agency only switched to the new definition in 2014 and the spike in 2013 is just a coincidence.


Finally, we will look at Jackson Police Department in Mississippi where the definition change seems to have had no effect. As seen in Figure \@ref(fig:rapeJackson), reported rapes start to undulate in 2010 with 2013 data perfectly in line with the before and after trends - no sign that there is a change in reporting. This suggests that Jackson simply did not follow the definition change and continues to report using the old definition. 

My takeaway from this is that rape should not be used at all for years after 2012. While the definition change makes pre-2013 and 2013+ years non-comparable, the differences in agency responses to this change - i.e. if they follow the rules or not - is such a mess that the data is too flawed to use. 

### The decline of manslaughter

This data contains two different crime subcategories for homicide: "murder and non-negligent manslaughter," and "manslaughter by negligence." The first is our measure of murder, and it includes everything we traditionally think of when it comes to murder - shootings, stabbings, strangulation, basically any intentional killing of another person.^[Attempted murder is usually classified as an aggravated assault.] Suicides, killing a fetus, and accidental killings (e.g. car crashes) are not considered murders.^[Even the intentional killing of a fetus is classified as an aggravated assault against the mother, not a murder of the fetus.] The second, manslaughter by negligence - usually called just "manslaughter" - is when someone kills another person through "gross negligence" but does not kill them intentionally. This can include accidental killings when the death was caused by gross negligence. The FBI provide examples of this as kids playing with guns and shooting each other (and not knowing the gun was loaded) or a hunter accidentally shooting someone while hunting. After the late 1970s this excludes deaths from traffic accidents caused by negligence, such as hit and runs or DUIs. However, prior to this, these deaths were included, which is the cause of the very high number of manslaughters in the 1960s and 1970s.

Figure \@ref(fig:manslaughterVsMurder) shows the annual number of murders, manslaughters, and the sum of the two nationwide from 1960-2023. This just sums up the total reported counts from every agency each year so part of the increase is simply due to more agencies reporting as the year gets closer to the present day - so please pay attention to the diverging paths of each crime, not the trend for the individual crime over time. Murder is always more common than manslaughter, but these values are not that far apart in the early decade of data and manslaughter does not become rare until the end of the 1970s. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/manslaughterVsMurder-1} 

}

\caption{The annual number of murder and non-negligent manslaughter, manslaughter by negligence, and the sum of the two, nationwide from 1960-2023.}(\#fig:manslaughterVsMurder)
\end{figure}

Figure \@ref(fig:manslaughterPercent) shows another way to look at this data: manslaughter as a percent of reported murder. In the early years of our data manslaughter was fairly common, with about 70-80% as many manslaughters reported as murders. This declined sharply in the mid-1960s until there were around 45% as many manslaughters as murders in the mid-1970s. Again, this declined until it was about 4% in 1980, and it has remained around there ever since. As police behavior could reduce traffic fatalities - and arrests for DUIs and traffic tickets are designed to improve public safety - it is unfortunate the we no longer have data on traffic deaths. 

Manslaughter increased to over 1,000 for the first time since 1978 in 2020, increased against to over 1,700 in 2021 and continued at around that number in 2022. This is possibly related to the increase in murders over the last few years of available data. Unfortunately, this dataset does not allow us to do almost anything at figuring out more information than monthly or annual counts. NIBRS, in comparison, allows us to do this kind of deep dive, and for curious readers NIBRS also has manslaughter so you can investigate this question yourself. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{03_offenses_known_files/figure-latex/manslaughterPercent-1} 

}

\caption{Reported manslaughter by negligence as a percent of reported murder and non-negligent manslaughter, nationwide 1960-2023.}(\#fig:manslaughterPercent)
\end{figure}


<!--chapter:end:03_offenses_known.Rmd-->

# Property Stolen and Recovered (Supplement to Return A) {#stolen_property}





The Property Stolen and Recovered dataset, also known as the Supplement to Return A^[Return A being another name for the Offenses Known and Clearances by Arrest dataset.], tracks monthly data on property crimes (theft, burglary, robbery, and motor vehicle theft), with information on where the crime occurred, what was stolen, and the estimated value of the stolen property.  The "recovered" part of this dataset covers the type and value of property recovered. Like most other SRS datasets this is at the agency-month level so you can, for example, learn how often burglaries occur at the victim's home during the day, and if that rate changes over the year or differs across agencies. The data, however, provides no information about the offender or the victim (other than if the victim was an individual or a commercial business ^[Based on the location of the incident - "bank", "gas station", etc.]).

The value of stolen property is generally based on the victim's estimate. However, police are supposed to use the market value for items, even if that value is different than the victim's estimate. Because of this, the reported values should be treated as rough estimates. And since this is the victim's reporting it may be incomplete. For example, say a person was burglarized and had 10 of their possessions stolen but they only realized that nine items were taken. They would report these nine items to the police but the tenth item would be left out of our data. 

This dataset provides a rough estimate of the cost of crime, limited to the value of stolen property. It excludes other important costs such as physical injuries, emotional harm, or preventative expenses (e.g., home security systems). For some types of stolen property we also know the number of offenses that occurred meaning that we can use both of these numbers to create an average value of stolen property per offense. An issue here is that we only have the monthly number of offenses and monthly value of the property. We can make the average value per offense but will not know if our average is affected by having an outlier in the data - such as one theft of an extremely expensive item.

Before getting into the details of this data, let us look at one example of how this data can measure property crime in a few different ways, and look at common pitfalls. We will look at home burglaries that occur during the day in Philadelphia. Figure \@ref(fig:phillyHomeBurglaryCount) shows the annual number of daytime home burglaries Philadelphia and in recent years it has declined sharply into having the fewest on record in 2020 followed by a very low number of crimes in 2021 and 2022. So citywide, Philadelphia has never been safer (averaging across the last few years) when it comes to the number of daytime home burglaries. As you should be aware by this point in the book, SRS data is optional and not all agencies report data every year. 

In this case, 2019-2021 data are all partial-year reports, with only 9, 4, and 9 months, respectively, reported for these years. Every previous year other than 1974, 1975, 1988, and 1989^[1974 had11 months, 1975 had 9 months, 1988 had 10 months, and 1989 had 11 months of data.] had a full 12-months of data reported. So it makes sense the 2019-2021 had fewer crimes if they only submitted data for part of the year. This is something that is pretty obvious - you cannot compare 12 months of data with <12 months of data - but it is a common mistake so you should check how many months are reported every time you compare multiple years. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/phillyHomeBurglaryCount-1} 

}

\caption{The annual number of daytime home burglaries reported in Philadelphia, PA, 1960-2023.}(\#fig:phillyHomeBurglaryCount)
\end{figure}

When considering the cost of crime, we also want to know the actually monetary cost of that incident. Figure \@ref(fig:PhillyBurglaryCost) measures this cost of crime by showing the annual value of the property stolen for daytime home burglaries in Philadelphia. The years without 12 months of data are excluded from the figure. Like many variables in this dataset, there is no reported crime value until 1964, so the data shows a value of 0 from 1960-1963. 

The trend here is different than the previous graph which showed movement in the number of burglaries but not major trend changes until the 2010s; here is a steady increase over the long term, though with varying speed of increase, until it peaked in the late 2000s/early 2010s before declining substantially in recent years. While the number of burglaries peaked in the early 1980s, the total value of burglaries did not peak until the early 2010s, so the cost of this crime (even this very narrow measure of cost) cannot be ascertained from knowing the number of burglaries alone. From this measure we can say that daytime home burglaries were worse in the early 2010s and are substantially better currently.   

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/PhillyBurglaryCost-1} 

}

\caption{The total annual cost of daytime home burglaries in Philadelphia.}(\#fig:PhillyBurglaryCost)
\end{figure}

The final way we can measure daytime home burglaries is to put the previous variables together to look at the cost per burglary. This will give us the average amount of property stolen from each burglary victim. Figure \@ref(fig:phillyHomeCostPerBurglary) shows the average cost per burglary for each year of data available. Now we have a different story than the other graphs. Even though the number of daytime home burglaries declined substantially over the last decade and the total cost is around the level seen in the 1980s, the cost per burglary remains high in recent years, though down from the peak in the mid-2010s. This suggests that while burglaries are down, the burden on each burglary victim has continued to grow.

A perhaps obvious issue here is that we have no way to determining how much outliers are affecting results. If one year has, for example, a home burglary where \$10 million worth of jewelry is stolen then that year's total value of property stolen would be much higher just due to a single burglary. There is, unfortunately, no way to handle this in this dataset, though NIBRS has similar data which does allow you to check for outliers.^[Having an outlier, as long as it is not just a data entry error, should not necessarily mean you remove it. If we removed rare events after all we would have to drop murders from our data as murders are very uncommon crimes.] 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/phillyHomeCostPerBurglary-1} \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/phillyHomeCostPerBurglary-2} 

}

\caption{The annual cost per burglary for daytime home burglaries in Philadelphia, 1960-2023.}(\#fig:phillyHomeCostPerBurglary)
\end{figure}

Part of this - and part of the long-term increase seen in Figure \@ref(fig:PhillyBurglaryCost) - is simply due to inflation. A dollar in 1964, the first year we have data on the value of burglaries, is worth \$9.84 in 2023, according to the Bureau of Labor Statistics.^[Based on June of both years] The values in this data are *not* adjusted for inflation so you need to do that adjustment yourself before any analyses, otherwise your results will be quite a bit off. When we adjust all values to 2023 dollars, as shown in Figure \@ref(fig:phillyHomeCostPerBurglaryInflation), the trend becomes changes a bit. There's still a steady increase in cost per burglary over time but it is far more gradual than in Figure \@ref(fig:phillyHomeCostPerBurglary). And now the difference from the cost in early years and late years are far smaller. 

## Agencies reporting

The data is available from 1960 to the present, though olders years of data have fewer variables reported. Figure \@ref(fig:propertyAgencies) show the number of agencies each year that reported at least one month during that year. In the first several years of data barely any agencies reported data and then it spiked around 1966 to over 6,000 agencies per year then grew quickly until over 12,000 agencies reported data in the late 1970s. From here it actually gradually declined until fewer than 12,000 agencies in the late 1990s before reversing course again and growing to about 15,000 agencies by 2019 - down several hundred agencies from the peak a few years earlier. We see the now-typical drop in 2021 as a result of the FBI's death of SRS and then the partial recovery in 2022 when SRS was reborn. The agencies that still reported in 2021 did so by reporting NIBRS data which the FBI converted to this format.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/propertyAgencies-1} 

}

\caption{The annual number of police agencies that report at least month of data and 12 months of data that year.}(\#fig:propertyAgencies)
\end{figure}

Since this data is called the "Supplement to Return A" we would expect that the agencies that report here are the same as the ones that report to the Offenses Known and Clearances by Arrest data, which is also called the Return A dataset. Figure \@ref(fig:agenciesInBoth) shows the percent of agencies in this dataset that are report at least one month of Return A data. Except for the first several years of data in the 1960s, we can see that most years have nearly all agencies reporting to both, though this has declined slightly in recent years. Since the late 1970s, over 90% of agencies that report to the Offenses Known data also report to this dataset. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/agenciesInBoth-1} 

}

\caption{The percent of agencies in the Supplement to Return A data that report at least one month of data, and all 12 months of data, and are also in the Offenses Known and Clearances by Arrest (Return A) data in that year, 1960-2023.}(\#fig:agenciesInBoth)
\end{figure}

When filtering the data to agencies that report a full 12 months of both the Return A and the Supplement to Return A, shown in Figure \@ref(fig:agenciesInBoth12Month), trends are quite similar to Figure \@ref(fig:agenciesInBoth) though now the average percent is around 75% rather than 90%. This translates to around 11k agencies though it drops starting in 2018 until fewer than 8,500 agencies report full data to both datasets in 2022. 


## Important variables

This data can really be broken into two parts: the monthly number of property (as well as robbery) crimes that occur that are more detailed than in the Offenses Known data, and the value of the property stolen (and recovered) from these crimes. For each category I present the complete breakdown of the available offenses/items stolen and describe some of the important issues to know about them. Like other SRS data, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. 

### A more detailed breakdown of property (and robbery) crimes {#propertycount}

The first part of this data is just a monthly (or yearly if you aggregate the data) number of crimes of each type reported to the police and that a police investigation discovered actually happened.^[For more on this process, please see Section \@ref(actual)]. There are six crimes and their subsets included here: burglary, theft, robbery, and motor vehicle theft. The remaining two are rape and murder, but they do not break down these crimes into any subcategories and are only available starting in 1974.

Though this data starts in 1960, not all variables are available then. 1963 and 1964 saw many new variables added - the values in these variables are reported as 0 in previous years - and in 1974 and 1975 even more variables were added. In 1963 the value of burglaries where the time of the burglary was known, thefts broken down into categories based on the value of property taken, thefts of car parts, theft from cars, shoplifting, and "other" thefts was added to the data. In the following year this data began including the value of property stolen from burglaries where the time of the burglary was unknown was added as well as thefts of bicycles, from "coin operated machines" (i.e. vending machines), purse snatching, and pick pocketing. The value of property stolen during rapes and murders was first reported in 1974. Finally, 1975 was the last year with new variables, with this year including consumable goods, stolen guns, household goods, livestock, office equipment and electronics, and sound and picture equipment.  

The complete list of each subsection and a brief definition for the non-obvious ones are presented below. 

* Burglary
    + Home/residence during the day (6AM - 5:59PM)
    + Home/residence during the night (6PM - 5:59AM)
    + Home residence at unknown time
    + Non-residence (i.e. all buildings other than victim's home) during the day (6:00AM - 5:59PM)
    + Non-residence (i.e. all buildings other than victim's home) during the night (6:00PM - 5:59AM)
    + Non-residence (i.e. all buildings other than victim's home) at unknown time
* Theft/larceny (excluding of a motor vehicle)
    + Less than \$50
    + \$50-\$199
    + $200 and up
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

Burglary is reported based on whether the building burgled was the victim's residence or not, and also the time of the burglary. Time is either during the day (6AM-5:59PM) or night (6PM-5:59AM) or if the time is unknown. Data is available since 1960 for both the day and night burglaries, but only since 1964 for the unknown time burglaries. For robbery, the subcategories are based on where the robberies occurred such as if it happened in a bank, a gas station, or a street. 

Theft is divided into two groups. The first group is based on the value of items stolen: less than \$50, \$50-\$199, and \$200 and up. The second group of thefts is broken into the type of theft such as a shoplifting or stealing from someone's car. All theft variables begin in 1960 other than thefts from a coin machine and from a building which start in 1964 and the miscellaneous "All other thefts" variable that has data starting in 1961. Finally, motor vehicle theft is broken into where the stolen vehicle was stolen and found: stolen in the reporting agency's jurisdiction and found by the same agency, stolen in the reporting agency's jurisdiction and found by a different agency, and stolen in a different agency's jurisdiction and found by the reporting agency. 

The first group is a useful example of a problem in this data, which can be seen happening in 1974. In Figure \@ref(fig:theftByValue) we use data from all agencies in the United States that reported 12 months of data to see the share of the total value of thefts by the three value categories. Thefts of between \$50 and \$200 start as the most common at nearly 60% of thefts in 1960 and steadily decline to under 20% by 2022. Thefts of over \$200 increase steadily from about 28% of thefts in 1960 to almost 50% in 1973 and then drop to 16% in 1974. Then the share of thefts over \$200 slowly increases over time to end our data at over 55% of thefts. Thefts valued at under \$50 have a near mirror trend as over $200, starting at under 15% in 1960, declining a bit after that and then massively spiking to 49% in 1974 before starting a slow decline to 27% in 2022. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/theftByValue-1} 

}

\caption{The annual breakdown in total theft value by the three value categories: less than \$50, \$50-\$199, and \$200 and over, among all agencies that reported 12 months of data in that year, 1960-2023.}(\#fig:theftByValue)
\end{figure}

What caused this weird swap of the less than \$50 and at least \$200 values? Well, part of it is that different agencies report over time so year-to-year comparisons are not really appropriate. Even agencies that report every year may report only some months of data. But we corrected that by filtering the data shown in Figure \@ref(fig:theftByValue) to only agencies that reported 12 months of data. Unfortunately, even doing that is not sufficient, as we can see below. 

Figure \@ref(fig:theftByValueCalifornia) replicates Figure \@ref(fig:theftByValue) but now only for agencies in California and zooms in to 1960-1980. In every agency in California there were zero reported thefts under \$50 starting in 1969 and ending in 1974. The number of thefts between \$50 and \$200, and thefts over \$200 increased, suggesting that agencies still reported the data but in the wrong category. Then in 1974 the thefts under \$50 were reported once again and the number of thefts in the other categories dropped. Given that the entire state changed reporting practices I believe that this was from either a policy at the state-level or some data error by the state before they sent the data to the FBI. It certainly is not true that there were zero thefts under \$50 for five years in California. 

Luckily in this case it was a fairly easy error to find - though I suspect that California is only part of the problem. But it reveals a broader issue with UCR data. The purpose of the data is that it is "Uniform," but we see that entire states can stop reporting certain data even when they say that they report data for all 12 months. Since UCR data is voluntary, agencies can report some, all, or none of the data, which makes it frustrating and time-consuming for researchers to ensure that the results in the data are real and not simply caused by reporting issues. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/theftByValueCalifornia-1} 

}

\caption{The annual breakdown in total theft value by the three value categories: less than \$50, \$50-\$199, and \$200 and over, among agencies in California that reported 12 months of data in that year, 1960-1980}(\#fig:theftByValueCalifornia)
\end{figure}

### The value of property stolen

The next set of variables is the value of the property stolen in each crime, as well as the value of property stolen broken down by the type of property (e.g. clothing, electronics, etc.). To be clear, this is *only* the value of the property stolen during the crime. The cost of any injuries (mental or physical) or any lasting cost to the victim, their family, and society for these crimes are not included. This, of course, vastly underestimates the cost of these crimes so please understand that while this is a measure of the cost of crime, it is only a narrow slice of the true cost.

The cost is the cost for the victim to replace the stolen item. So the current market price for that item (though factoring in the current state the item is in, e.g. if it is already damaged) and, for businesses, the cost to buy that item and *not* the cost they sell it for. While the police can ask the victim how much the property was worth, they are not required to use the exact amount given as victims may exaggerate the value of items. This is not an exact science, so I recommend only interpreting these values as estimates - and potentially rough estimates. None of this data is adjusted for inflation so if you are comparing values over time you will need to do that adjustment yourself. 

The value of the property stolen is broken into two overlapping categories: by crime type, and by type of property that was stolen. These are the exact same categories as covered in Section \@ref(propertycount) but now is the dollar amount of the items stolen from those types of crimes. The second group is what type of item, based on several discrete categories, was stolen. Please note that multiple items can be stolen in each category  and this data counts the property stolen for each crime type *as well as* for each item type. So if you sum up all of the crime variables and all of the item type variables together you will over-count the value of property stolen. Each of the categories and their definitions are detailed below. 

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
    + Less than \$50
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
    + This includes all types of firearms other than toys or BB/pellet/paintball guns (which are in the "Miscellaneous/other" category). 
* Home furniture 
    + This includes all of the "big things" in a house: begs, chairs, AC units, washer/dryer units, etc. However, items that are in the "Office equipment and electronics" category do not apply. 
* Consumable goods 
    + This is anything that can be consumed such as food, drinks, and drugs, or anything you use in the bathroom.
* Livestock 
    + This is all animals other than ones that you would consider a pet
* Miscellaneous/other 
    + Anything that is not part of the above categories would fall in here. Cell phones and credit cards are included. 
    
    
### Value of recovered property by type of item stolen

For a subset of items (listen below), this data includes the value of the items that were recovered. The only information we have for the value of recovered property is for the breakdown in the items themselves - not breakdowns of crimes such as robbery or burglary. So we can know the value of guns recovered, but not if those guns were taken from a burglary, a robbery, a theft, etc. 

While this dataset began in 1960, the recovered property variables begin later, and in different years. For clothing and fur, currency, jewels and precious metals, motor vehicles, miscellaneous/other, and the variable that sums up all of the recovered property variables, the first year with data was 1961. The remaining variables - consumable goods, guns, household goods/home furniture, livestock, office equipment and electronics, and sound and picture equipment - began in 1975.

Another issue is that it uses the value of the property as it is recovered, not as it is stolen. For example, if someone steals a laptop that is worth \$1,000 and then the police recover it damaged and it is now worth only \$200, we would see \$1,000 for the stolen column for "office equipment and electronics" and only \$200 for the recovered column for that category. So an agency that recovers 100% of the items that were stolen can appear to only recover a fraction of them since the value of recovered items could be substantially lower than the value of stolen items. Therefore, there is a systematic bias in the data that shows a lower recovery value than stolen value in many cases. It is extremely unlikely that an item would be worth more when the police recover it than when it was stolen.

Unfortunately there is no way to know how many items are actually recovered (except for motor vehicles), only the value of the recovered property.^[Even if we look at the Offenses Known and Clearances by Arrest data, that only says if there was an arrest or exceptional clearance in the case, not if the property stolen was recovered] For these reasons I recommend against using this variable to try to measure a recovery rate. 

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

This dataset comes with a considerable number of data errors - basically enormous valuations for stolen property.^[Since the minimum value is 0 there is less chance of data errors underestimating the value of an item, though some errors must certainly occur.] Some of the values are so big that it is clearly an error and not just something very expensive stolen. Unfortunately we can't just assume that high values are always errors. For example, say someone stole an extremely expensive car in a city with otherwise very little stolen property. We'd see a huge spike in the value of stolen property which may appear to be an error but would in fact be real.

Some of the stolen property include variables for both the number of items of that type stolen and the total value of the items. From this we can make an average value per item stolen which can help our understanding of what was stolen. However, some items only have the value of the property stolen and the value of property recovered so we do not know how many of those items were stolen. These cases make it even harder to believe that a large value is true and not just a data error since we do not know if the number of these crimes increased, causing the increase in the value reported. We will look at a couple examples of this and see how difficult it can be to trust this data.

First, we will look at the value of livestock thefts in New York City. Livestock is one of the variables where we know the value stolen and recovered but not how many times it happened. Being a major urban city, we might expect that there are not many livestock animals in the city so the values should be low. Figure \@ref(fig:nycLivestock) shows the annual value of livestock thefts in NYC. There are two major issues here. First, in all but two years they report \$0 in livestock thefts. This is likely wrong since even New York City has some livestock (even just the police horses and the horse carriages tourists like) that probably got stolen. The second issue is the massive spike of reported livestock theft value in 1993 with over \$15 million stolen (the only other year with reported thefts is 1975 with \$87,651 stolen). Clearly NYC did not move from \$0 in thefts for decades to \$15 million in a year and then \$0 again so this appears to be a blatant data error. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/nycLivestock-1} 

}

\caption{The annual value of stolen livestock in New York City, 1960-2023.}(\#fig:nycLivestock)
\end{figure}

It gets harder to determine when a value is a mistake when it is simply a big spike - or drop - in data that otherwise looks correct. Take, for example, the annual value of stolen clothing and fur in Philadelphia from 1960-2019, shown in Figure \@ref(fig:phillyFurValue). The annual value of these stolen items more than doubled in 1989 compared to the previous year and then declined rapidly in the following year.

Is this real? Is it a data error? It is hard to tell. Here we do not know how many clothing/fur thefts there were, only the value of the total thefts that month (which is aggregated annually here). It continues a multi-year trend of increasing value of thefts but it is larger than previous increases in value. And while the spike is very large in percent terms, it is not so extraordinarily huge that we immediately think it is an error - though some outlier detection methods may think so if it is beyond the expected value for that year. 

Philadelphia had several years in this time period where only part of that year's data was reported. In fact both 1988 and 1989 had fewer than 12 months of data; as did 1974 and 1975. So the year with fewer than 12 months had an atypically high value of clothing and fur stolen. Normally we would expect less data to lead to smaller numbers. But that is not always true. Sometimes less data is a sign that there is something wrong with the data quality altogether and that we need to be cautious of any value in that year. And even though we know that some years are missing months of data just looking at this figure it is not clear which years those are. So while graphing data helps, it is only by looking at the data itself - and yes, this means you will likely need to pull out a programming language like R or python, or at the very least use Excel - and look at each data point before trusting this data. 

It is also important to have some understanding of what the data *should* look like when trying to figure out what data point may be incorrect. In this figure we see a huge spike in 1989. If we know, for example, that a ring of fur thieves were active this year, then that makes it far more likely that the data is real. This may be a rather odd example, but it is helpful to try to understand the context of the data to better understand when the "weird" data is an error and when it is just "weird but right."

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/phillyFurValue-1} 

}

\caption{The annual value of stolen clothing and fur in Philadelphia, PA, 1960-2019}(\#fig:phillyFurValue)
\end{figure}

Finally, some errors are so extreme that it is surprising they were not captured during any of the review points from the police officer entering data in their agency's computer to the FBI releasing this data to the public. For example, Figure \@ref(fig:romeBicycles) shows Rome, New York, a city of about 32,000 people in central New York State. Here's what the reported value of bicycles stolen was for Rome in our data.^[For this example we would not worry about years where <12 months of data were reported.]


2020 had a bit of a spike in their stolen bicycle value, from less than \$10,000 is the previous few years to over \$5 billion. Yes, that is billion with a "b." 2021 followed by slightly under \$3 billion worth of bicycles stolen. In both years 19 bicycles were reported stolen. 

Bicycles were not the only thing stolen in Rome. Consumable goods such as food and toiletries were stolen to the tune of \$5 billion in 2020 and \$1 billion in 2022, with only \$84,278 worth of goods stolen in 2021. To put this into perspective - not that it is needed - the total amount of property stolen by theft the United States during 2019, according to this dataset, was \$8 billion. Rome, NY, superseded that by far just through two groups of property stolen in 2020. 

Now, obviously this is not real. This is just an error with the police entering in the wrong price. But the issue is that through all the layers of checks that occurred - checks by the local police, by the state UCR system (though some agencies submit directly to the FBI) and the FBI themselves - failed to prevent this incorrect data from being published. This is an obvious, glaring error. If this slipped through the cracks, what less glaring issue did too? So you cannot just trust that this data is right. You need to check and recheck^[and check again.] everything before using it. This is the right approach for all data, and especially for this data. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{04_stolen_property_files/figure-latex/romeConsumable-1} 

}

\caption{The annual value of stolen consumable goods, bicycles, livestock, and thefts from pickpocketing, in Rome, New York, 1960-2023.}(\#fig:romeConsumable)
\end{figure}

The Property Stolen and Recovered dataset offers a useful, though imperfect, view of property crimes and their financial impact. While limitations such as reporting gaps and data inconsistencies exist, careful analysis can still reveal important trends in the types and values of stolen and recovered property. Researchers should approach this data with caution, especially when making year-to-year comparisons or analyzing categories with significant outliers.

<!--chapter:end:04_stolen_property.Rmd-->

# Arrests by Age, Sex, and Race {#arrests}





The Arrests by Age, Sex, and Race dataset (ASR)^[Sometimes called Arrests by Age, Sex, Race, and Ethnicity.] provides monthly counts of arrests broken down by age, sex, and race for a variety of crimes. This data includes a broader number of crime categories than the crime dataset (the Offenses Known and Clearances by Arrest data) though is less detailed on violent crimes since it does not breakdown aggravated assault or robberies by weapon type as the Offenses Known data does.

For each crime it says the number of arrests for each sex-age group with younger ages (15-24) showing the arrestee's age to the year (e.g. age 16, age 17) and other ages grouping years together (e.g. age 25-29, 30-34, "under 10"). It also breaks down arrests by race-age by including the number of arrestees of each race (American Indian, Asian, Black, and White are the only included races) and if the arrestee is a juvenile (<18 years old) or an adult. The data does technically include a breakdown by ethnicity-age (e.g. juvenile-Hispanic, juvenile-non-Hispanic) but almost no agencies report this data and most do not report ethnicity at all. So in practice the data does not include ethnicity. As the data includes counts of arrestees, people who are arrested multiple times are included in the data multiple times; it is not a measure of unique arrestees. 

## Agencies reporting

This data is available from 1974 through 2022 though after 2020 the measure for how many months of data an agency reported changed so post-2020 data is difficult to compare to 2020 and earlier.^[Post-2020 years do have considerably fewer agencies reporting than in previous years.] Figure \@ref(fig:arrestsAgenciesReporting) shows how many agencies reported at least one month of the year and every month of the year for 1974-2020. 

The first year of data has about 9,000 agencies reporting at least one month and that increases strongly to a little over 13,000 in the late 1970s, staying fairly steady until decreasing in the late 1980s then increasing in the 2000s until approximately 15,000 agencies report. The number of agencies reporting 12 months of data follows a similar trend, but at a lower level with about 4,000 fewer agencies each year. This 15,000, however, still remains under the estimated 18,000 police agencies in the United States and below the reporting rates of UCR data such as the Offenses Known and Clearances by Arrest data. This data is also missing some important cities such as New York City which has not reported even a single month since 2002 and Chicago which tends to only report a single month if at all.   

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{05_arrests_files/figure-latex/arrestsAgenciesReporting-1} 

}

\caption{The annual number of agencies reporting at least one month of data and 12 months of data in that year.}(\#fig:arrestsAgenciesReporting)
\end{figure}

## What is an arrest? (what unit is this data in?)

This dataset counts each arrest separately, meaning that individuals who are arrested multiple times will be counted multiple times. It reports the most serious crime for each arrest incident, so if someone commits multiple crimes during an incident, only the most serious one is recorded. Consider for example, a person who robs a bank, shooting and killing a guard and pointing their gun at other people in the bank. They are arrested and then released from jail (just imagine that this is true) and are then arrested the next day for shoplifting. And let us further assume that both arrests were in the same month in the same agency. How many arrests are here? They committed multiple crimes in the first incident (murder, robbery, aggravated assault) but in this dataset they would only be classified as an arrest for the most serious crime, murder. And then separately they would also be an arrested for shoplifting. So assuming that no other arrests occurred in that police agency that month, there would be two arrests reported: one for murder and one for shoplifting. 

There's no way to tell how many unique people were arrested, or of those arrested multiple times which crimes they were arrested for. So if you have 100 arrests there may be 1 person arrested 100 times or 100 people arrested once - though, of course, the true number is likely somewhere in between. This means that studies that try to use this data as a measure of unique people or even the percent of arrestees by group (age, sex, or race) relative to some base rate of the population such as the number of people living in that city are going to be wrong - though how wrong is unclear.

Common uses of this data - more common in more news articles or advocacy group reports than in peer-reviewed research articles - compare the percent of arrestees of a certain group to the percent of a city's population of that group. Any differences between the arrestee percent and the resident percent is, according to these reports, evidence of a disparity. This is most common for looking at differences by race.^[Disparity, of course, does not even mean discrimination.] For example, say a city is equally split between Black and White residents (and no other races are present, for the simplicity of this example). If >50% of arrestees for a particular crime are Black, that is often cited as evidence of anti-Black discrimination. 

There are two assumptions built into this. First, that offending rates are identical between Black and White residents; second, that reoffending rates are identical. If, for example, Black people in this example commit that crime at higher rates than White people then all else being equal you would expect this group to have a higher share of arrests than their share of the resident population. Second, it assumes that people of each race are rearrested at similar rates. Put another way, it assumes that if 100 Black people are arrested and 100 White people are arrested, there are an equal number of unique people in each group. If these assumptions are violated - and they certainly are violated to some degree in every use of the data - the conclusions will be wrong. Whether this distinction between arrests and unique people arrested affects your interpretation of the data depends on the study you are doing, but it is important to consider in your research. One way to address this is to use other data on the rate of rearrest by group, though you would have to be very careful to not extrapolate the results of the other study too far beyond what they could tell you about the specific time and place they studied. 

Another solution would be to try to bound results, such as calculating how extreme your assumptions (e.g. assuming how different the true offense rates between races are) can be for your conclusions to still hold. Going back to the example of a city with 50% White and 50% Black people, say that there are 10 arrests with a split of 1 White and 9 Black arrestees. If offense rates are identical you would expect 5 White and 5 Black people arrested, not a disparity of 9 to 1. So you could say that this disparity is reasonable if the Black people commit this offense at a rate of nine times as often than White people.^[This is a simplification as there are other things that affect arrests such as witness cooperation,  details of the offense like time of day and location, and (especially in the case of rare events like only 10 arrests) random chance.] 

Is this bounding assumption reasonable? In this context-less example, I have no idea. There certainly may be cases where it is reasonable but that is context dependent. And you need to understand the context of what you are studying. Numbers are not enough. If based on your understanding of the context of what you are studying you believe that it is unreasonable that Black people commit that offense at a rate nine times that of White people, then you may conclude that the disparity is not explained by differences in offending rates. Your next step is to identify another explanation and try to rule that out too. 

### The Hierarchy Rule

The Hierarchy Rule is used in this data which means that when someone is arrested for multiple crimes, only the most serious crime is recorded. For example, if a person commits murder, robbery, and theft, only the murder is reported. Essentially, the FBI chose seven crimes in 1929 that they call Index Crimes - or sometimes called Part I crimes - and these were considered the most important crimes to be recorded.^[Partly based on the quality of the data available as they considered these crimes to be a good combination of well-reported and serious.] If a person is arrested for multiple crimes and an Index Crime is one of those crimes, then the Index Crime at the top of the Hierarchy is the one recorded in this data. Below I have listed all crimes included in this dataset and the crimes 1-7 as well as 9 (arson) are the Index Crimes. The top of the Hierarchy is the crime with the lowest number. So murder is always reported in incidents where there is a murder; rape is always reported when there is an incident with rape but no murder; etc. 

The remaining crimes - the ones that are not Index crimes - are called Part II crimes and are not arranged in any particular way. So a lower value numbered crime is not higher on the Hierarchy than a higher value number - Part II crimes do not follow the Hierarchy. If all of the crimes in an incident are Part II crimes then the agency must decide for themselves which crime is the most serious. This can lead to agencies deciding their own hierarchy differently than others which makes this data much less comparable across agencies than if there was a standard rule.^[This here is another example of where the "Uniform" part of Uniform Crime Reporting is more of a suggestion than a rule.]  

1. Homicide
  a. Murder and non-negligent manslaughter
  b. Manslaughter by negligence
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
  a. Drug sale or manufacturing
    + Opium and cocaine, and their derivatives (including morphine and heroin)
    + Marijuana
    + Synthetic narcotics
    + Other dangerous non-narcotic drugs
  b Drug possession
    + Opium and cocaine, and their derivatives (including morphine and heroin)
    + Marijuana
    + Synthetic narcotics
    + Other dangerous non-narcotic drugs
19. Gambling - total
  a. Bookmaking - horse and sports
  b. Number and lottery
  c. All other gambling
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

In incidents where the arrestee committed both an Index Crime and a Part II crime, then only the top Index Crime is recorded. This can lead to rather silly results since some Part II crimes are certainly more serious than some Index Crimes. Consider, for example, a person arrested for simple assault, carrying a firearm, pimping, and theft. The first three crimes are, in my opinion, clearly more serious than theft. But since theft is an Index Crime, this person would be considered to have been arrested for theft. 

## Important variables

This data has the standard set of variables describing the agency that is reporting. This includes the agency ORI - which is the unique ID for that agency - the agency name, their state, the population under their jurisdiction, and the month and year of the data.

For each crime this data provides the number of arrests in that month (or year for the annual data) broken down by age (within this, by sex), by race (within this, by if they are a juvenile or an adult), and by ethnicity though this is an enormously flawed variable. Finally, we also know the number of juvenile arrests that ended in a few possible outcomes (e.g. released without charges, referred to juvenile court), though we do not know the crime that led to these arrests. We will get into each of these variables below. 

### Age

The dataset provides the number of arrests for each age group and gender. Specific ages are reported for younger individuals (e.g., 15-24), while older individuals are grouped into broader age ranges (e.g., 25-29, 30-34). Male and female arrestees are reported separately, and the dataset does not include any category for non-binary or transgender individuals. To get a total arrests for that crime for that age, just add the female and male variables together. Below are the ages or age categories included in the data, and these are the same for female and male arrestees.

* Under 10
* 10-12
* 13-14
* 15
* 16
* 17
* 18
* 19
* 20
* 21
* 22
* 23
* 24
* 25-29
* 30-34
* 35-39
* 40-44
* 45-49
* 50-54
* 55-59
* 60-64
* 65 and older
    
One way to use this data is to look at the age-crime curve of offending. The age-crime curve is a criminological finding that crime trends to increase in the early teenage years to peaking around age 18 before declining sharply. So essentially people commit crime as teenagers and then tend to fizzle out (or go to prison) as they get older. 

Figure \@ref(fig:phillyRapeAge) shows this trend for male arrestees of rape in Philadelphia from 1974-2023, which is every year of data we have available. A major problem with this figure is that some of the ages are for single years and some are for age categories. In the graph there were 793 arrests for rape for people aged 24. The next age is the category of aged 25-29 and there were 3,604 arrests for this age group. One way to address this is to assume that each age in the category has the same number of arrests, so dividing 3,604 by 5 gives us about 721 arrests per age. Assuming equal arrests by age, however, is not consistent with either the literature on the age-crime curve or the findings in this figure for previous ages, as the number of arrests by age is, overall, going down since age 18. So instead of assuming equality, would we assume that older ages have fewer arrests than younger ages (maybe taking the percent change from the previous years where we do have individual ages available)? This is a tricky question to answer and it makes these kinds of analyses really hard to do - and very imprecise since all of your assumptions will be wrong, though hopefully not *too* wrong. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{05_arrests_files/figure-latex/phillyRapeAge-1} 

}

\caption{The total number of rapes by male arrestees reported by arrestee age in Philadelphia, 1974-2023.}(\#fig:phillyRapeAge)
\end{figure}

### Race

The dataset categorizes arrests by race: American Indian, Asian, Black, and White. It does not account for mixed-race individuals or provide details on how race was determined (e.g., officer perception or arrestee self-reporting). This is further broken down into if the arrestee was an adult (18 years or older) or a juvenile (under 18). 

Whether the arrestee is Hispanic is in a separate (and nearly universally non-reported variable). Since the ethnicity variable is separate, and since the data is not at the arrestee-level unit, there is no way to interact the race and ethnicity variables. So, for example, there is no way to determine how many White-Hispanic or White-Non-Hispanic arrestees. Just total White arrestees and total Hispanic arrestees. 

As with race variables in other UCR datasets - and, really, any dataset - you should be cautious about using this variables since it is the officer's perception of the arrestee's race - though of course some arrests do have other data about the arrestee's race such as what they tell the officer. In cases where the arrestee is carrying identification such as a driver's license this variable is likely to be extremely well reported. However, we cannot tell from this data whether the race is based on something like a license or is merely the officer's perception.^[In my experience working directly with police data where I can identify a person arrested multiple times in about 5-10% of cases they have at least one arrest where their reported race is different than other arrests. Such as a person arrested five times and being reported as White four times and Black once. This is probably a mix of officers perceiving people differently (e.g. mixed race people) and having different officers report different race for the same person, and human error when entering data. But all of it suggests that there is at least some uncertainty in this variable.] 

Even though there is information about the specific age of arrestee (or the age range, depending on the arrestee's age) and their sex, there is no sex information combined with race and no age beyond the adult/juvenile binary. If you add up all arrests that are broken down by sex-age and compare it to the sum of all of the arrests broken down by adult/juvenile-race here, in some cases these numbers do not add up. That is because while most agencies do report the age variables, not all agencies report the race variables. So summing up the race variables will actually undercount the total number of arrests. 

* American Indian
* Asian
* Black
* White
    
Figure \@ref(fig:phillyMarijuanaRacePercent) shows one example of an analysis of this data by showing the percent of arrests of adults for marijuana possession by the arrestee's race in Philadelphia for all years of data we have with a full year of data reported, 1976-2018 At the bottom are American Indian and Asian arrestees who make up nearly none of the arrests for this crime. Black arrestees, shown in green, make up the bulk of arrests with only a few years making up under 60% of arrests and growing to around 80% of arrests since the mid-2000s. As White arrestees, shown in orange, are the only other race category included, they make up a near perfect mirror image of Black arrestees, composing of around 40% of arrests until decreasing starting in the 1990s to end up with about 20% of arrests in recent years. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{05_arrests_files/figure-latex/phillyMarijuanaRacePercent-1} 

}

\caption{The annual percent of adult marijuana possession arrests in Philadelphia by arrestee race, 1978-2018.}(\#fig:phillyMarijuanaRacePercent)
\end{figure}

Interestingly, while the disparity between Black-White arrests has grown dramatically in recent decades, the total number of arrests have a very different trend as shown in Figure \@ref(fig:phillyMarijuanaRaceCount). Total marijuana possession arrests declined in the mid-1980s then increased in the mid-1990s from only a few hundred arrests in the early 1990s to nearly 5,000 arrests in 2010 before dropping precipitously to under 700 each year in the late-2010s. 

Yet throughout this latter period as a percent of arrests, Black people consistently grew for years before plateauing around 2007 with a small decline in the last few years of full data. Philadelphia decriminalized marijuana possession in 2014 under Mayor Nutter which is right when the steepest decline in arrests happened. This suggests that who is arrested, in terms of race, is relatively unrelated to the total number of arrests, at least for marijuana in Philadelphia.
    
\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{05_arrests_files/figure-latex/phillyMarijuanaRaceCount-1} 

}

\caption{The annual number of adult marijuana possession arrests in Philadelphia by arrestee race, 1978:2018.}(\#fig:phillyMarijuanaRaceCount)
\end{figure}
  
### Ethnicity

While technically included, the ethnicity variable is largely useless since for most years no agencies reported it and for the years where agencies do report ethnicity, not all agencies do so. The ethnicities included are Hispanic and non-Hispanic and are broken down by if the arrestee is an adult (18+ years old) or a juvenile (<18 years old).

* Adult
    + Hispanic
    + Non-Hispanic
* Juvenile
    + Hispanic
    + Non-Hispanic

Figure \@ref(fig:theftHispanic) shows the annual number of Hispanic arrestees for theft for all agencies that reported any data that year.^[Theft is used as it is one of the most common crimes.] For several years no agencies reported until the number of Hispanic arrestees start climbing in 1980 and peaks in 1986 at about 136,000 arrestees. Then there are zero Hispanic arrestees for a few years, four Hispanic arrestees in 1990 and two non-Hispanic arrests in 1991, and then again zero Hispanic arrestees, this time for decades. Only in 2017 do the number of Hispanic theft arrestees begin to creep up. From 2017 to 2022 (the last year available at the time of this writing) there are Hispanic arrestees reported every year, though now only about 60,000 per year.
    
\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{05_arrests_files/figure-latex/theftHispanic-1} 

}

\caption{The national annual number of Hispanic arrestees for theft. This includes all agencies that year that reporting any number of months. Hispanic arrestees include both juvenile and adult arrestees}(\#fig:theftHispanic)
\end{figure}

Perhaps a better way to look at this data is to see what percent of agencies report ethnicity data. Figure \@ref(fig:theftHispanicPercentAgencies) show the percent of agencies each year that report at least one Hispanic or non-Hispanic (which are the only choices, but showing only Hispanic arrests would exclude agencies where no Hispanic people truly were arrested) arrest for theft. About 60% of agencies reported ethnicity data in the early 80s and then only a couple agencies report in 1990 and 1991. Other than those agencies, none report between 1987 and 2016. Starting in 2017, 36% of agencies report and this number has grown by about five percentage points a year until spiking to about 67% in 2021 and it remained steady in 2022. Given the fluctuations in reporting and how many years there is no data, I strongly recommend against using these variables, even for the recent years of data. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{05_arrests_files/figure-latex/theftHispanicPercentAgencies-1} 

}

\caption{The annual percent of agencies that report theft arrests that reported at least one Hispanic person or one non-Hispanic person arrested for theft. Arrestees include both juvenile and adult arrestees.}(\#fig:theftHispanicPercentAgencies)
\end{figure}

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

We can look at an example of this in Figure \@ref(fig:JuvenileReferrals) which shows the annual number of referral types in the entire United States from 1974-2023. For all the first couple of years almost all of the referrals have either been that the agency handles the arrest internally and releases the juvenile without any formal charges, or that the juvenile is formally arrested and referred to juvenile court. Since this only happens for a single year it appears to be a data issue.Starting in the late 1990s the number of referrals has declined over time, possibly due fewer juvenile arrests overall during this period. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{05_arrests_files/figure-latex/JuvenileReferrals-1} 

}

\caption{The annual number of juvenile referrals in the United States by referral type, 1974-2020.}(\#fig:JuvenileReferrals)
\end{figure}

In Figure \@ref(fig:JuvenileReferrals) there is a massive spike in referrals to welfare, handled internally, and juvenile court cases in 1976 that occurs for a single year. Was this a year of superpredators? No, it was a year of Michigan data errors. In 1976 many agencies in Michigan provided erroneous data for this variable. This includes, for example, Washtenaw County Sheriff's Office which had a population of 101,452 in 1976 and reported that 150,088 juvenile arrests were reported in welfare. Similarly, Otisville Police Department, population 760, had 10,000 referrals to welfare, and Saginaw Police Department, population 82,000, had 80,074 referrals to welfare, 27,213 referrals to juvenile court, and 6,230 juvenile arrests handled internally. When we remove Michigan, shown in Figure \@ref(fig:JuvenileReferralsNoMichigan), this spike disappears. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{05_arrests_files/figure-latex/JuvenileReferralsNoMichigan-1} 

}

\caption{The annual number of juvenile referrals in the United States excluding agencies in Michigan by referral type, 1974-2020.}(\#fig:JuvenileReferralsNoMichigan)
\end{figure}

Michigan is unlikely to be the sole state with data issues in 1976, and 1976 is unlikely to be the only year with problems. We can see other spikes in the data such as small ones in 1991 and 2016. I leave the task of discovering the cause of these spikes to the reader.

<!--chapter:end:05_arrests.Rmd-->

# Supplementary Homicide Reports (SHR) {#shr}



The Supplementary Homicide Reports dataset - often abbreviated to SHR - is the most detailed of the SRS datasets and provides information about the circumstances and participants (victim and offender demographics and relationship status) for homicides. For each homicide incident it tells you the age, gender, race, and ethnicity of each victim and offender as well as the relationship between the first victim and each of the offenders (but not the other victims in cases where there are multiple victims). It also tells you the weapon used by each offender and the circumstance of the killing, such as a "lovers triangle" or a gang-related murder. As with other SRS data, it also tells you the agency it occurred in and the month and year when the crime happened. 

One important point of clarification: this is not the number of murders, though it does track that. This data also includes the number of homicides that are manslaughter by negligence (e.g. children playing with a gun, hunting accident) and justifiable homicides (i.e. not criminal). So be carefully when speaking about this data. It is murders but not only murders so you want to speak precisely. 




## Agencies reporting

This data only has a report when the agency has a homicide that year and since homicides are relatively rare it is difficult to measure underreporting. One way we can look at reporting is to compare homicide in the SHR data with that of other datasets. We will look at two of them: the Offenses Known and Clearances by Arrest which is covered in detail in Chapter \@ref(offensesKnown), and the Center for Disease Control and Prevention (CDC) data on national deaths from homicide.^[CDC WONDER data is available here: https://wonder.cdc.gov/] Both this dataset and the Offenses Known and Clearances by Arrest data are SHR datasets so you may think that the numbers of homicides from each dataset should be the same. That is a perfectly reasonable assumption, but since this is SHR data we are talking about, you would be wrong. Police agencies are free to report to either, both, or neither dataset so while the number of homicides are close for each dataset, they are never equal. CDC WONDER data aggregates mortality data (among other data) from state death certificates which reduces the issue of voluntary reporting that we have in SHR data.

Figure \@ref(fig:shrVsOffenses) shows the annual number of homicide victims (including murders and manslaughters) from each of these datasets starting in 1976 for the SHR data and in 1999 for the CDC data.^[1975 is actually the first year that the Supplementary Homicide Reports data is available but that dataset only has info for a single victim and offender - all later years has info for up to 11 victims and offenders - so 1976 is often used as the first year of data] 

For the SHR data, in every year the numbers are fairly similar and the trends are the same over time, but the number of homicides is never equal. The numbers have actually gotten worse over time with the difference between the datasets increasing and the Offenses Known data having consistently more murders reported than the SHR data since the late 1990s. Compared to the CDC data, however, both SHR datasets - and in particular the SHR data - undercount the number of homicides. While trends are the same, SHR data reports thousands fewer murders per year than the CDC data, indicating how much of an issue underreporting is in this data.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrVsOffenses-1} 

}

\caption{The annual number of murders and nonngeligent manslaughters from the Supplementary Homicide Report and the Offenses Known and Clearances by Arrest dataset, and homicides from the Center for Disease Control (CDC). Numbers differ because agencies voluntarily report and may not report to both datasets.}(\#fig:shrVsOffenses)
\end{figure}

Let us look at Chicago for another example of the differences in reporting from the SHR and the Offenses Known data. Figure \@ref(fig:chicagoSHRvsOffensesKnown) shows the annual number of homicide victims from both datasets. In most years they are pretty similar, excluding a few really odd years in the 1980s and in 1990. But what is also strange is that most years have more SHR victims than Offenses Known victims. So nationally SHR has fewer homicides than Offenses Known but that pattern is reversed in Chicago? This is one of the many quirks of SHR data. And is a warning against treating national trends as local trends; what is true nationally is not always true in your community. So when you use this data, check everything closely. And once you have done that, check it again. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/chicagoSHRvsOffensesKnown-1} 

}

\caption{The annual number of homicide victims in Chicago, Supplementary Homicide Reports and Offenses Known and Clearances by Arrest, 1976-2023.}(\#fig:chicagoSHRvsOffensesKnown)
\end{figure}

Figures \@ref(fig:shrTopAgenciesCount) and \@ref(fig:shrTopAgenciesCountPercent) attempt to get at this question by looking the number and percent of all incidents that the top 100, 50 and 10 agencies based on number of homicide incidents make up out of all homicide incidents in each year. These agencies are massively disproportionate in how many homicides they represent - though they are also generally the largest cities in the country so are a small number of agencies but a large share of this nation's population. On average, the 10 agencies with the most homicide incidents each year - which may change every year - have over 4,000 homicide incidents and make up about 1/4 of all homicide incidents reported nationally. The top 50 have about 7,500 incidents a year, accounting for 46% of incidents. The top 100 agencies have a bit under 10,000 incidents a year and make up over 55% of all homicide incidents in the United States. So excluding the largest agencies in the country would certainly undercount homicides.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrTopAgenciesCount-1} 

}

\caption{The annual number of homicide incidents, showing all agencies, the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2023.}(\#fig:shrTopAgenciesCount)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrTopAgenciesCountPercent-1} 

}

\caption{The annual percent of homicide incidents by the top 100 agencies (by number of homicide incidents), top 50, and top 10 agencies, 1976-2023.}(\#fig:shrTopAgenciesCountPercent)
\end{figure}

## Important variables

The data has demographic information for up to 11 victims and 11 offenders, as well as the information on the weapon used by each offender, the relationship between the first victim and each offender, and the circumstance of the homicide. The data also has the traditional SHR set of variables about the agency: their ORI code, population, state, region and the month and year of this data. One key variable that is missing is the outcome of the homicide: there is no information on whether any of the offenders were arrested. 

While there is information on up to 11 victims and offenders, in most cases, there is only a single victim and a single offender in each incident. We can use the additional_victim_count and additional_offender_count columns to see how many additional victims/offenders there are. An additional victim/offender means in addition to the first one. Even though we have columns for up to 11 victims and offenders, in very rare instances the additional_[victim/offender]_count columns may say there are more than 11 victims/offenders.

To see how the breakdown for the number of victims in each incident looks, Figure \@ref(fig:numberSHRVictims) shows the percent of incidents with each possible number of victims.^[There are five incident where there are more than 11 victims. For simplicity of the graph, these incident are excluded.] In nearly all incidents - 96.0% - there was only a single victim. This drops to 3.3% of incidents for two victims, 0.5% for three victims, and only about 0.2% of incidents have four or more victims. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/numberSHRVictims-1} 

}

\caption{The percent of incidents that have 1-11 victims.}(\#fig:numberSHRVictims)
\end{figure}

Figure \@ref(fig:numberSHROffenders) shows the breakdown of the number of offenders per homicide incident.^[There are seven incidents with more than 11 offenders. For simplicity of the graph, these incidents are excluded.] It is a little less concentrated than with victims but the vast majority of homicides are committed by one offender - or at least the police only report one offender. About 87.6% of homicides have only one offender, 8.4% have two, 2.5% have three, and 1.5% have four. Fewer than 0.5% of homicides have more than four offenders. However, this is all a bit misleading. In cases where there is no information about the offender, including how many offenders there is, the data simply says that there is a single offender. So the number of homicides with a single offender is an over-count while the number with more offenders is an undercount. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/numberSHROffenders-1} 

}

\caption{The percent of incidents that have 1-11 offenders.}(\#fig:numberSHROffenders)
\end{figure}

The variable "situation" says what type of victim-offender number combination the incident is - e.g. "multiple victims/single offender", "single victim/multiple offenders", etc. - and does indicate if the number of offenders is unknown (though curiously there are over 4,000 instances where the number of offenders is unknown but they still say there are two offenders) so you can use this variable to determine if the police do not know how many offenders there is. You're still limited, of course, in that the number of offenders is always what the police think there are, and they may be wrong. So use this variable - and anything that comes from it like the percent of offenders of a certain race - with caution. 

We will now look at a number of important variables individually. Since the data can potentially have 11 victims and 11 offenders - but in practice has only one each in the vast majority of cases - we will only look at the first victim/offender for each of these variables. Therefore, the results will not be entirely accurate, but will still give you a good overview of the data. The figures below will use data for all homicides from 1976 to 2022 so will cover all currently available years of data. Keep in mind that national trends are not the same as local trends so what is shown in these figures will probably not be the same as what is happening in your community. And that looking at all homicides means we are including murders, manslaughters, and justifiable homicides. 

### Demographics

There are two broad categories of variables that we will cover: demographics of the victim and offenders, and characteristics of the case. We start with demographics.

#### Age

This data includes the age (in years) for each victim and each offender. For those under one years old, it also breaks this down into those from birth to six days old "including abandoned infant" and those seven days old to 364 days old. So there is a bit more info on homicides of babies. It also maxes out the age at 99 so for victims or offenders older than that we do not get their exact age, just text that says "99 years or older" (which I turn to the number 99 in the figures below).  

Figure \@ref(fig:shrOffenderAge) shows the percent of homicides where the first offender in the case is of each age from 0-99. Offenders with unknown ages are excluded from this graph and make up about 27% of cases. The average (mean) age is 31.1 years old (shown in orange) which is due to a long right tail; the median age is 28 years old. If you look closely at the left side of the graph you can see that there are some very young offenders, with at least one offender for each year of age from 0 to 10 included in the data. It is not clear from this alone that these ages are a data entry error. While a two-year-old certainly could not kill someone, the data does include deaths caused by "children playing with gun" (homicide circumstances will be discussed in Section \@ref(circumstance)) so these ages could potentially be correct. 

If you are familiar with the age-crime curve in criminology - which basically says crime peaks in late teen years then falls dramatically - this shows that exact curve, though is older and does not decline as the offender ages as quickly as we see with less serious crimes. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrOffenderAge-1} 

}

\caption{The age of homicide offenders, based on the first offender in any homicide incident. Offenders under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Offenders reported as '99 years or older' are considered 99 years old.}(\#fig:shrOffenderAge)
\end{figure}

Figure \@ref(fig:shrVictimAge) repeats Figure \@ref(fig:shrOffenderAge) but with victim age rather than offender age. The mean victim age (shown in orange) is 33 and the median age is 30. Though the average victim age is a bit younger than the average offender age, trends are relatively similar for teenagers and older where deaths spikes in the late teen years and then declines steadily. The major difference is the U-shape for younger victims - for victims under age 15, homicides peak at age 0 (i.e. younger than their first birthday) with ~1.4% of all homicides being this this age. They then decline until plateauing at around age 6 before increasing again in the early teen years. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrVictimAge-1} 

}

\caption{The age of homicide victims, based on the first victims in any homicide incident. Victims under age 1 (classified as 'birth to 7 days old, including abandoned infant' and '7 days to 364 days old') and considered 0 years old. Victims reported as '99 years or older' are considered 99 years old.}(\#fig:shrVictimAge)
\end{figure}

#### Sex 

We will next look at victim and offender sex, a simple variable since only male and female are included. About 62.2% of offenders, as seen in Figure \@ref(fig:shrOffenderSex), are male and about 8.2% are female, indicating a large disparity in the sex of homicide offenders. The remaining 29.6% of offenders do not have sex data available because the police do not know the sex of this individual. For offenders who are not arrested, this variable may be inaccurate since it is perceived sex of the offender.^[If we ignore unknown sex, essentially saying that the unknown people will have their sex distributed exactly as the known sex people, 88% are male and 12% are female. However, this assumption is probably wrong since the unknown people may be materially different than the known people, as evidence by them likely not being arrested and committing the crime in a way where even their sex cannot be identified. ] 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrOffenderSex-1} 

}

\caption{The sex of offender \#1, 1976-2023.}(\#fig:shrOffenderSex)
\end{figure}

There is far less uncertainty for victim sex, with under 0.17% of victims having an unknown sex. Here again there is a large disparity between male and female with about 78.2% of victims being male and 21.6% being female. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrVictimSex-1} 

}

\caption{The sex of victim \#1, 1976-2023.}(\#fig:shrVictimSex)
\end{figure}

#### Race

This data also includes the race of the victims and offenders. This includes the following races: American Indian or Alaskan Native, Asian, Black, Native Hawaiian or Other Pacific Islander, and White. These are the only races included in the data; Hispanic is considered an ethnicity and is available as a separate, though flawed, variable. There is no category for bi- or multi-racial. As with other demographics info for offenders, in cases where no arrest is made (and we do not know in this data if one is made), there is no way to confirm the person's race so these results may not be entirely accurate. 

Figure \@ref(fig:shrOffenderRace) shows the percent of homicides in the data by the race of offender #1. Black and White offenders are included are similar percentages, at 34.3% and 33.6% of victims, respectively. The next most common group is Unknown at about 30.6% of offenders. Given that so many offenders have an unknown race, the reliability of race measures is limited. The remaining races are Asian at 0.9% of offenders, American Indian or Alaskan Native at 0.6%, and Native Hawaiian or Other Pacific Islander at 0.02%. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrOffenderRace-1} 

}

\caption{The race of offender \#1, 1976-2023.}(\#fig:shrOffenderRace)
\end{figure}

For victim race, seen in Figure \@ref(fig:shrVictimRace), only about 1% of victim #1 races are unknown. This means we can be a lot more confident in the race of the victims than in the race of the offender. Similar to offenders, White and Black victims are the two most common races, with 48.4% and 48.1% of victims, respectively. There is a greater share of Asian victims than Asian offenders at 1.5% of victims. American Indian or Alaskan Natives make up 0.8% of victims while Native Hawaiian or Pacific Islanders make up 0.02% of victims.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrVictimRace-1} 

}

\caption{The race of victim \#1, 1976-2023}(\#fig:shrVictimRace)
\end{figure}

#### Ethnicity

The final demographic variable is ethnicity which is whether the victim or offender is Hispanic or not Hispanic. The SHR data has a weird relationship with this variable (which is also in the Arrests by Age, Sex, and Race dataset, discussed in Chapter \@ref(arrests)) where ethnicity is technically a variable in the data but very rarely collected. As such, this is an unreliable variable that if you really want to use needs careful attention to make sure it is being reported consistently by the agencies that you are looking at. 

The vast majority - 69.7% - of offenders have an unknown ethnicity while 23.4% are not Hispanic and 7.1% are Hispanic. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrOffenderEthnicity-1} 

}

\caption{The ethnicity of offender \#1, 1976-2023.}(\#fig:shrOffenderEthnicity)
\end{figure}

Unlike the other demographic variables, there is still a huge amount of underreporting when it comes to victim ethnicity, though still less than for offender ethnicity. 55.6% of victims have an unknown ethnicity. Approximately 33.2% of victim #1 are reported as not Hispanic while 11.1% are reported as Hispanic.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrVictimEthnicity-1} 

}

\caption{The ethnicity of victim \#1, 1976-2023.}(\#fig:shrVictimEthnicity)
\end{figure}

As an example of agencies under-reporting this variable, let us look at the number of offender #1s in Albuquerque, New Mexico, a city which the [US Census](https://www.census.gov/quickfacts/fact/table/albuquerquecitynewmexico,US/PST045222) says is about 50% Hispanic. Yet the Albuquerque police reported no ethnicity information for almost three decades of data. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/ABQ-1} 

}

\caption{Annual number of offender \#1 who is Hispanic in Albuquerque, New Mexico, 1976-2023.}(\#fig:ABQ)
\end{figure}


### Case characteristics

Now we will move to facts about each case such as what weapon was used, how people involved knew each other, and what was the (rough) cause of the homicide.

#### Weapon used

The first variable we will look at is the weapon used by each offender. Table \@ref(tab:shrWeapon) shows the weapon used by the first offender in every incident from 1976 to 2022. Each offender can only be reported as having a single weapon, so this table essentially shows the number (and percent) of homicides caused by this weapon. This is not entirely true since in reality an offender could use multiple weapons and there can be multiple offenders. In these cases the police include what they believe is the "primary" weapon used by this offender.

The most commonly used weapon is a handgun, which is used in nearly half of homicides. This is followed by a knife or other sharp weapon used to cut at almost 15% of homicides, and then by "firearm, type not stated" which is just a firearm where we do not know the exact type (it can include handguns) at 8.9% of homicides The fourth most common weapon is "personal weapons" at nearly 6% of homicides. "Personal weapons" is a weird term to mean that there was no weapon - the "weapon" was the offender who beat the victim to death. Shotguns are involved in almost 5% of homicides and all other weapons are involved in fewer than 5% of cases. In total there are 19 different weapons included though most are very uncommon. 


\begin{longtable}[t]{l|l|r}
\caption{(\#tab:shrWeapon)The weapon used in a homicide incident, 1976-2023. In cases where there are multiple offenders, shows only the primary weapon for the first offender.}\\
\hline
Weapon & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:shrWeapon)The weapon used in a homicide incident, 1976-2023. In cases where there are multiple offenders, shows only the primary weapon for the first offender. \textit{(continued)}}\\
\hline
Weapon & \# of Incidents & \% of Incidents\\
\hline
\endhead
Handgun & 397,337 & 48.72\textbackslash{}\%\\
\hline
Lethal Cutting Instrument (Knife, Ice Pick, Screwdriver, Ax, Etc.) & 101,410 & 12.43\textbackslash{}\%\\
\hline
Firearm (Type Not Stated) & 76,807 & 9.42\textbackslash{}\%\\
\hline
Personal Weapons (Hands, Feet, Teeth, Etc.) & 46,605 & 5.71\textbackslash{}\%\\
\hline
Other Or Unknown Weapon & 45,887 & 5.63\textbackslash{}\%\\
\hline
Shotgun & 37,038 & 4.54\textbackslash{}\%\\
\hline
Blunt Object (E.g., Club/Blackjack/Brass Knuckles) & 35,157 & 4.31\textbackslash{}\%\\
\hline
Rifle & 28,672 & 3.52\textbackslash{}\%\\
\hline
Knife Or Cutting Instrument & 16,091 & 1.97\textbackslash{}\%\\
\hline
Strangulation - Includes Hanging & 9,778 & 1.20\textbackslash{}\%\\
\hline
Fire & 5,482 & 0.67\textbackslash{}\%\\
\hline
Asphyxiation - Includes Death By Gas & 4,956 & 0.61\textbackslash{}\%\\
\hline
Other Firearm & 3,892 & 0.48\textbackslash{}\%\\
\hline
Drugs/Narcotics/Sleeping Pills & 3,834 & 0.47\textbackslash{}\%\\
\hline
Drowning & 1,384 & 0.17\textbackslash{}\%\\
\hline
Poison - Does Not Include Gas & 568 & 0.07\textbackslash{}\%\\
\hline
Explosives & 385 & 0.05\textbackslash{}\%\\
\hline
Pushed Or Thrown Out of Window & 258 & 0.03\textbackslash{}\%\\
\hline
Narcotics Or Drugs & 48 & 0.01\textbackslash{}\%\\
\hline
Undocumented Code & 1 & 0.00\textbackslash{}\%\\
\hline
Total & 815,590 & 100\textbackslash{}\%\\
\hline
\end{longtable}


You may have noticed from the table that AR-15 is not included. While AR-15 is the commonly discussed in the media and policy circles as a way to control gun violence, it is not in a category by itself. Instead it is combined with other rifles in the "rifle" weapon group, and makes up about 3.6% of the weapons used by offender #1 in the data. 

Let us check if AR-15s, through our rough proxy of the "rifle" weapon group, is getting more common over time. Figure \@ref(fig:shrRifle) shows the number of homicide incidents (including manslaughters, so not necessarily all murders) where offender #1 used a rifle. Figure \@ref(fig:shrRiflePercent) shows the percent of all homicide incidents where the the weapon was a rifle. Using both of these measures we can see the rifles are getting less common, declining substantially since 1980 though increasing again starting in the mid-2010s.  

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrRifle-1} 

}

\caption{The annual number of homicide incidents where offender \#1's weapon was a rifle, 1976-2023.}(\#fig:shrRifle)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{06_shr_files/figure-latex/shrRiflePercent-1} 

}

\caption{The annual share of homicide incidents where offender \#1's weapon was a rifle, 1976-2023.}(\#fig:shrRiflePercent)
\end{figure}

Now, maybe this weapon is more commonly used in some types of crimes such as school shootings. You could get at that question using this data by seeing if times when a rifle is used that victims or offenders are younger or if the circumstance is something that suggests a school shooting. Unfortunately there is no offense location variable here, though there is in NIBRS and we can largely recreate this data through NIBRS. And of course you cannot tell if the weapon is actually an AR-15, only if it is a rifle.

#### Relationship between first victim and offenders

An interesting and highly useful variable is the relationship between the first victim and each offender. To be clear, this is only for the first victim; we do not have the relationship between other victims and offenders. However, as seen earlier, this is not *too much* of an issue since nearly all incidents only have a single victim. There are 29 possible relationship types (including "unknown" relationship) which are broken into three categories: legal family members, people known to the victim but who are not family, and people not known to the victim. Table \@ref(tab:shrRelationship) shows these relationships and the number and percent of homicides with these relationships. 

The most common relationship, with about 28% of homicides, is that the police do not know the relationship. So there is a good deal of uncertainty in the relationship between victims and offenders. Next is that the victim is the offender's acquaintance at 19.7% or is a stranger at 15.3%. The next is "other - known to victim" which is similar to being an acquaintance at almost 5% of homicides. This is followed by the victim being the friend of the murderer at 3.6%. The 6th most common relationship, at 3.6% is that the victim is the wife of the offender, so she is murdered by her husband, and is the first familial relationship of this list. The remaining relationships all make up fewer than 3% of all homicides. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:shrRelationship)The relationship between the first victim and the first offender in a homicide incident, 1976-2023.}\\
\hline
Relationship & Category & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:shrRelationship)The relationship between the first victim and the first offender in a homicide incident, 1976-2023. \textit{(continued)}}\\
\hline
Relationship & Category & \# of Incidents & \% of Incidents\\
\hline
\endhead
Relationship Unknown &  & 307,131 & 37.66\textbackslash{}\%\\
\hline
Victim Was Acquaintance &  & 159,491 & 19.56\textbackslash{}\%\\
\hline
Victim Was Stranger &  & 124,083 & 15.21\textbackslash{}\%\\
\hline
Victim Was Otherwise Known &  & 39,899 & 4.89\textbackslash{}\%\\
\hline
Victim Was Friend &  & 29,310 & 3.59\textbackslash{}\%\\
\hline
Victim Was Wife &  & 28,516 & 3.50\textbackslash{}\%\\
\hline
Victim Was Girlfriend &  & 22,267 & 2.73\textbackslash{}\%\\
\hline
Victim Was Other Family &  & 12,242 & 1.50\textbackslash{}\%\\
\hline
Victim Was Husband &  & 12,219 & 1.50\textbackslash{}\%\\
\hline
Victim Was Son &  & 11,837 & 1.45\textbackslash{}\%\\
\hline
Victim Was Boyfriend &  & 10,332 & 1.27\textbackslash{}\%\\
\hline
Victim Was Daughter &  & 8,414 & 1.03\textbackslash{}\%\\
\hline
Victim Was Neighbor &  & 8,266 & 1.01\textbackslash{}\%\\
\hline
Victim Was Brother &  & 7,209 & 0.88\textbackslash{}\%\\
\hline
Victim Was Father &  & 5,936 & 0.73\textbackslash{}\%\\
\hline
Victim Was Mother &  & 5,486 & 0.67\textbackslash{}\%\\
\hline
Victim Was In-Law &  & 4,694 & 0.58\textbackslash{}\%\\
\hline
Victim Was Common-Law Wife &  & 3,350 & 0.41\textbackslash{}\%\\
\hline
Victim Was Common-Law Husband &  & 2,736 & 0.34\textbackslash{}\%\\
\hline
Victim Was Ex-Wife &  & 2,397 & 0.29\textbackslash{}\%\\
\hline
Victim Was Stepfather &  & 1,915 & 0.23\textbackslash{}\%\\
\hline
Victim Was In A Homosexual Relationship With The Offender &  & 1,708 & 0.21\textbackslash{}\%\\
\hline
Victim Was Sister &  & 1,567 & 0.19\textbackslash{}\%\\
\hline
Victim Was Stepson &  & 1,530 & 0.19\textbackslash{}\%\\
\hline
Victim Was Ex-Husband &  & 951 & 0.12\textbackslash{}\%\\
\hline
Victim Was Stepdaughter &  & 808 & 0.10\textbackslash{}\%\\
\hline
Victim Was Employer &  & 575 & 0.07\textbackslash{}\%\\
\hline
Victim Was Employee &  & 466 & 0.06\textbackslash{}\%\\
\hline
Victim Was Stepmother &  & 255 & 0.03\textbackslash{}\%\\
\hline
Total &  & 815,590 & 100\textbackslash{}\%\\
\hline
\end{longtable}



#### Homicide circumstance {#circumstance}

We also have information on the type of the homicide, which this data calls the "circumstance." This comes as relatively broad categories that leave a lot to be desired in our understanding of what led to the homicide. Table \@ref(tab:shrCircumstance) shows the number and percent of each circumstance for the first victim of each homicide from 1976 to 2022. This data has 33 possible circumstances which it groups into four main categories: murders that coincide with committing another crime ("felony type" murders), murders that do not coincide with another crime ("non-felony type" murders), justifiable homicides, and negligent manslaughter. 

The felony type murders are simply ones where another crime occurred during the homicide. While this is called "felony type" it does include other crimes such as theft and gambling (which are not always a felony) so is a bit of a misnomer. The "non-felony type" are murders that happen without another crime. This includes gang killings (where, supposedly, only the murder occurred), children killed by babysitters, fights among intoxicated (both of alcohol and drugs) people, and "lover's triangle" killings.  Justifiable homicides are when a person (civilian or police officer) kill a person who is committing a crime. Negligent manslaughter includes accidental shootings such as when children find and shoot a gun, but excludes deaths from traffic accidents. 

The most common circumstances, accounting for 27.4%, 26.9%, and 12.5%, respectively, are "Unknown", "Other Arguments", and "Other Non-Felony Type - Not Specified." Since the data includes "Argument Over Money Or Property" as one category, the "Other Arguments" mean that it is an argument for a reason other than over money or property. The "Other Non-Felony Type" one does not mean that the murder did not occur alongside another crime, but also does not fall into the non-felony categories included. Robbery is the only remaining circumstance with more than 5% of murders, at 7.4%. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:shrCircumstance)The circumstance of the homicide for the first offender in a homicide incident.}\\
\hline
Circumstance & Category & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:shrCircumstance)The circumstance of the homicide for the first offender in a homicide incident. \textit{(continued)}}\\
\hline
Circumstance & Category & \# of Incidents & \% of Incidents\\
\hline
\endhead
Unknown &  & 228,621 & 28.03\textbackslash{}\%\\
\hline
Other Arguments & Non-Felony Type & 218,716 & 26.82\textbackslash{}\%\\
\hline
Other Non-Felony Type - Not Specified & Non-Felony Type & 101,778 & 12.48\textbackslash{}\%\\
\hline
Robbery & Felony Type & 59,295 & 7.27\textbackslash{}\%\\
\hline
Narcotic Drug Laws & Felony Type & 29,109 & 3.57\textbackslash{}\%\\
\hline
Juvenile Gang Killings & Non-Felony Type & 24,345 & 2.98\textbackslash{}\%\\
\hline
Felon Killed By Police & Justifiable Homicide & 18,039 & 2.21\textbackslash{}\%\\
\hline
Other Felony Type - Not Specified & Felony Type & 15,760 & 1.93\textbackslash{}\%\\
\hline
Brawl Due To Influence of Alcohol & Non-Felony Type & 15,235 & 1.87\textbackslash{}\%\\
\hline
Argument Over Money Or Property & Non-Felony Type & 15,004 & 1.84\textbackslash{}\%\\
\hline
Felon Killed By Private Citizen & Justifiable Homicide & 14,627 & 1.79\textbackslash{}\%\\
\hline
All Suspected Felony Type & Felony Type & 12,996 & 1.59\textbackslash{}\%\\
\hline
All Other Manslaughter By Negligence Except Traffic Deaths & Negligent Manslaughter & 10,983 & 1.35\textbackslash{}\%\\
\hline
Burglary & Felony Type & 6,467 & 0.79\textbackslash{}\%\\
\hline
Domestic Violence (Historically Called Lovers Triangle/Quarrel) &  & 6,456 & 0.79\textbackslash{}\%\\
\hline
Gangland Killings & Non-Felony Type & 6,206 & 0.76\textbackslash{}\%\\
\hline
Brawl Due To Influence of Narcotics & Non-Felony Type & 4,715 & 0.58\textbackslash{}\%\\
\hline
Rape & Felony Type & 4,160 & 0.51\textbackslash{}\%\\
\hline
Lovers Triangle & Non-Felony Type & 4,158 & 0.51\textbackslash{}\%\\
\hline
Other Negligent Handling of Gun Which Resulted In Death of Another & Negligent Manslaughter & 4,111 & 0.50\textbackslash{}\%\\
\hline
Arson & Felony Type & 3,358 & 0.41\textbackslash{}\%\\
\hline
Motor Vehicle Theft & Felony Type & 1,554 & 0.19\textbackslash{}\%\\
\hline
Children Playing With Gun & Negligent Manslaughter & 1,520 & 0.19\textbackslash{}\%\\
\hline
Other Sex Offenses & Felony Type & 1,440 & 0.18\textbackslash{}\%\\
\hline
Institutional Killings & Non-Felony Type & 1,371 & 0.17\textbackslash{}\%\\
\hline
Child Killed By Babysitter & Non-Felony Type & 1,353 & 0.17\textbackslash{}\%\\
\hline
Gambling & Felony Type & 1,041 & 0.13\textbackslash{}\%\\
\hline
Larceny & Felony Type & 975 & 0.12\textbackslash{}\%\\
\hline
Prostitution And Commercialized Vice & Felony Type & 631 & 0.08\textbackslash{}\%\\
\hline
Other - Not Specified & Felony Type & 554 & 0.07\textbackslash{}\%\\
\hline
Sniper Attack & Non-Felony Type & 480 & 0.06\textbackslash{}\%\\
\hline
Victim Shot In Hunting Accident & Negligent Manslaughter & 359 & 0.04\textbackslash{}\%\\
\hline
Gun Cleaning Death - Other Than Self-Inflicted & Negligent Manslaughter & 157 & 0.02\textbackslash{}\%\\
\hline
Abortion & Felony Type & 14 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking/Involuntary Servitude &  & 1 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking/Commercial Sex Acts &  & 1 & 0.00\textbackslash{}\%\\
\hline
Total &  & 815,590 & 100\textbackslash{}\%\\
\hline
\end{longtable}



#### Homicide subcircumstance

The "subcircumstance" just tells you more information about justifiable homicides. This includes the circumstance leading up to the "felon" - which is how the person killed is described, though technically they do not need to have committed a felony - was killed. It includes if this person attacked an officer (the one who killed them), a different officer, a civilian, or was committing or fleeing a crime. 

This dataset is one source of information on how many people police kill each year. But it is a large undercount compared to other sources such as the Washington Post collection, so is not a very useful source of information on this topic. 


\begin{longtable}[t]{l|l|r}
\caption{(\#tab:shrSubCircumstance)The circumstance for the first offender in a homicide incident in cases where the offender is killed. This includes incidents where the only person who dies in the offender.}\\
\hline
Subcircumstance & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:shrSubCircumstance)The circumstance for the first offender in a homicide incident in cases where the offender is killed. This includes incidents where the only person who dies in the offender. \textit{(continued)}}\\
\hline
Subcircumstance & \# of Incidents & \% of Incidents\\
\hline
\endhead
Felon Killed In Commission of A Crime & 11,312 & 34.63\textbackslash{}\%\\
\hline
Felon Attacked Police Officer & 9,486 & 29.04\textbackslash{}\%\\
\hline
Felon Attacked A Civilian & 5,976 & 18.29\textbackslash{}\%\\
\hline
Not Enough Information To Determine & 2,572 & 7.87\textbackslash{}\%\\
\hline
Felon Resisted Arrest & 1,296 & 3.97\textbackslash{}\%\\
\hline
Felon Attacked Fellow Police Officer & 1,175 & 3.60\textbackslash{}\%\\
\hline
Felon Attempted Flight From A Crime & 849 & 2.60\textbackslash{}\%\\
\hline
Total & 32,666 & 100\textbackslash{}\%\\
\hline
\end{longtable}




<!--chapter:end:06_shr.Rmd-->

# Law Enforcement Officers Killed and Assaulted (LEOKA) {#leoka}





The Law Enforcement Officers Killed and Assaulted data (sometimes referred to as the "Police Employees" dataset), often called just by its acronym LEOKA ("LEE-OH-KUH"), has two main purposes. First, it provides counts of employees employed by each agency - broken down by if they are civilian employees or sworn officers, and also broken down by sex (male and female are the only options). And second, it measures how many officers were assaulted or killed (including officers who die accidentally such as in a car crash) in a given month. The assault data is also broken down into shift type (e.g. alone, with a partner, on foot, in a car, etc.), the offender's weapon, and type of call they are responding to (e.g. robbery, disturbance, traffic stop). The killed data simply says how many officers are killed feloniously (i.e. murdered) or died accidentally (e.g. car crash) in a given month. The employee information is at the year-level so you know, for example, how many male police officers were employed in a given year at an agency, but do not know any more than that such as if the number employed changed over the year. This dataset is commonly used as a measure of police employees and is a generally reliable measure of how many police are employed by a police agency. The second part of this data, measuring assaults and deaths, is more flawed with missing data issues and data error issues (e.g. more officers killed than employed in an agency).

## Agencies reporting

Figure \@ref(fig:leokaAgencies) shows the annual number of police agencies that reported at least one month that year. The first year of data available, 1960, has about 8,400 agencies reporting though this quickly drops to a trough of around 4,800 agencies that last for several years. After some undulations in the 1970s, reporting agencies steadily increases to nearly 14,000 agencies in the 1980s and remains steady until declining to around 12,000 by the late 1990s. Then reporting again steadily increases through 2020 to about 16,000 agencies by the end. 2021 has a massive drop in reporting to only about 5,000 agencies and then slightly increasing in 2022.^[This returns us to the low point of historical collection all the back in the 1960s.] 

The decline after 2020 is part of what I have referred to as the "death and rebirth" of the SRS. 2020 was the last year that the FBI accepted SRS data - though in 2022 they began accepting SRS submissions again. As noted in previous chapters, this death and rebirth led to changes in both which agencies reported and what data was reported. In 2021 when only NIBRS was collected, no SRS agencies could report, but even once they began to accept SRS data again the damage was done. Some agencies were transitioning from SRS to NIBRS so reported neither, while others likely made the decision to stick to NIBRS only - perhaps caused by their data vendor no longer supporting SRS data. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaAgencies-1} 

}

\caption{The annual number of police agencies that report at least month of data, at least one employee, and at least one assault against an officer, 1960-2023}(\#fig:leokaAgencies)
\end{figure}

Part of the decline we see in Figure \@ref(fig:leokaAgencies) is because starting in 2018 - for reasons I am unsure of - many more agencies started reporting having zero employees. In Figure \@ref(fig:leokaAgenciesEmployees) we can see the annual number of agencies that report having at least one employee (civilian or sworn officer). Compared to Figure \@ref(fig:leokaAgencies) we see more agencies reporting since the 200s, and an earlier but less steep drop in reporting.

I mentioned that LEOKA has two purposes: employee information and assaults on officers information. You should really think about this data as two separate datasets as agencies can report one, both, or neither part. In practice, more agencies report data on the number of employees they have than they do for assaults on officers. In Figure \@ref(fig:leokaAgenciesAssaults) we can see that in most years of data fewer than 6,000 (out of ~18k agencies in the country) report having at least one officer assaulted. The year with the most agencies reporting >1 assault was 2022 with 6,397 agencies. Most years average about 5,000 agencies reporting at least one assault on an officer. Though there is variation over time, the trend is much more settled than in the previous figures without any sharp decline in recent years. Assaults on officers is *relatively* rare, at least considering how many officer-civilian interactions occur. And many agencies are small with relatively little crime. So agencies that say they had zero assaults on officers may in fact truly have zero assaults. However, there are agencies that likely do have assaults on officers - such as large, high crime agencies which report assaults in other years - which report zero assaults in some months or years. So you will need to be careful when determining if a zero report is a true zero rather than an agency submitting incomplete data.


## Important variables

The important variables can be divided into two sections: information on people employed by the department, and information about assaults against officers. The employee information is a snapshot in time during the year while the assault information tells you the number of assaults, broken down several different ways, for each month of the year. Like other UCR data, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. 

### Number of employees 

This data includes the number of people employed by the department with breakdowns by if they are civilian employees or sworn officers (i.e. carries a gun and badge and can make arrests) as well as by gender. The only genders available are female and male. This is the number of employees as of Halloween that year so it is a single point in time. Though this helps us as it is consistent every year, we do not know exactly when certain officer classes start, which we would likely see through a jump in employment that year, or if employment or hiring patterns change over the year. 

* Officers
* Civilians

One of the claims made around the massive crime spike during Covid is that it was caused, at least in part, by an exodus of police officers. Fewer police officers led to more crime. Luckily, we can easily determine if there were fewer officers employed starting in 2020. In Figure \@ref(fig:leokaNationalEmployees) we have the total number of sworn officers and civilian employees in the country from 1960 through 2022. The number of both groups has fairly steadily increased since 1960 until plateuing around 2010 and then fairly sharply dropping in 2018 before rebounding a bit in 2022. So the number of employees dropped before 2020, actually increased a tiny bit in 20202 itself, and increased in 2022. Obviously all the claims about a declining number of officers was wrong. 

Well, not quite. This country's population has grown quite a bit since 1960 so we really want to do some kind of rate of officers per civilian population. And as we saw earlier not all agencies report data. So changes over time may really just be changes in which agencies report data. For a good comparison we need to look at only agencies that have reported data for every year we are interested in. And that is all assuming we actually care about national trends which we really should not. Crime is a local issue; what happens in your community - be it whether officers are leaving or crime is increasing - matters a whole lot more than what is happening across the country.^[Of course what happens nationally may be reflected locally, but there is no good reason to focus on national data in lieu of local data.]

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaNationalEmployees-1} 

}

\caption{The number of civilian employees and sworn officers in the United States, 1960-2023}(\#fig:leokaNationalEmployees)
\end{figure}



So now lets look at a local example: the Philadelphia Police Department as shown in Figure \@ref(fig:leokaCivilianOfficers). The number of civilian employees has remained at a little under 1,000 employees from about 1970 through the end of our data, though declining very slightly since the middle 2000s. This is curious since the city's population and crime trends have changed dramatically over this time and the ability of civilian employees to contribute has also changed, such as that they now have computers.^[The last time I heard, which was several years ago, patrol officers in Philadelphia still had to write up certain reports using typewriters. So tech apparently is still about 1960 level.] In contrast, the number of police has changed far more than civilians, growing rapidly in the 1960s and 1970s to peaking at a little over 8,000 officers in the mid-1970s before declining substantially to the 6,000s. in the late-1980s. As with some larger agencies nationwide, the number of officers increased in the 1990s and then has decreased steadily in ensuing years. By recent years there are about as many officers as in the late-1980s, even though the city's population has grown substantially since then. What stands out is that in 2020 there are zero sworn officers or civilians employees. By 2022 there are fewer sworn officers but more civilian employees than in 2020. 2021 is simply due to Philly reporting zero employees in that year, though obviously this is not actually a reflection of reality. When looking at only one city like we do here it is glaringly obvious that there is a data issue. The problem is that when looking at aggregate data, like we do in Figure \@ref(fig:leokaNationalEmployees) it is much harder, without additional data cleaning steps, to determine what is a data error and what is a true change.  

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaCivilianOfficers-1} 

}

\caption{The number of civilian employees and sworn officers in the Philadelphia Police Department, 1960-2023}(\#fig:leokaCivilianOfficers)
\end{figure}

We can also look at the number of officers (or civilian employees) by gender. Figure \@ref(fig:leokaOfficersGender) shows the percent of Philadelphia police officers by gender while Figure \@ref(fig:leokaOfficersGenderCount) shows the number of officers. For the first decade of data all female officers (or civilians) were recorded as male, so that variable should be interpreted as "total officers" until 1971 when it is split into gender. Starting at basically 0% of officers in 1971, female officers grew until they made up about a quarter of officers in 2000 and then has declined slowly since then.^[Please note that since Philly did not report in 2021 the 2021 value is NA, and is shown in the figure as the 2020 data point drawing a straight line to the 2022 data point.] 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaOfficersGender-1} 

}

\caption{The percent of female and male sworn officers in Philadelphia, 1960-2023}(\#fig:leokaOfficersGender)
\end{figure}


### Officers killed

There is almost no information about officers killed. The data only breaks this down into if they died "feloniously" which just means that someone killed them on purpose (e.g. shooting them, intentionally hitting them with a car) or if they died "accidentally" such as if they die during a car crash while on duty. The FBI actually collects more information on officer deaths than they release in this data. This includes the circumstances of each death such as the type of death (e.g. car crash, shooting, ambush, etc.), what weapon the offender had if feloniously killed, and even a detailed written summary of what occurred for each officer killed. They post this information in their annual LEOKA report which is part of their Crime in the United States report. The 2019 report, for example, can be found on their site [here](https://ucr.fbi.gov/leoka/2019/home).

We can look at what data is available through Figure \@ref(fig:leokaOfficersKilled) which shows the number of Los Angeles Police Department officers killed over time. There are no accidental killings until 1975 though this is misleading because that accidental killings variable is not reported until 1971, which is a year in which many other variables in this data began reporting. So we actually have no idea how many officers were killed accidentally from 1960-1970 since this variable is always reported as 0. In general it seems like there is about one officer killed per year in recent decades while the period from 1980 to 2000 was the time of highest danger with as many as five officers killed in a single year. We can also see some trend changes with felonious killings more common than accidental killings in the 1990s and then accidental killings becoming far more common starting in 2000.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaOfficersKilled-1} 

}

\caption{The number of officers killed by felony and killed accidentally in New York City, 1960-2023}(\#fig:leokaOfficersKilled)
\end{figure}

We can also look at the national number of officers killed as shown in Figure \@ref(fig:leokaOfficersKilledNational). Please note that this is simply summing up the number of officers killed by all agencies that report that year so changes over time are certainly partially due to different agencies reporting each year. Therefore, we will focus on interpreting the different between felony and accidental killings rather than counts over time - though even this may be off if agencies that reported more felony or more accidental killings differ in their reporting over time. Again we see that there are no officers killed accidentally, due to that variable not being reported, until 1971. The difference between officers killed by felony and killed accidentally is widest are the start of our data and narrows considerable until there are only several more felonious killings than accidental killings by the late 1990s. This trend reverses in the early 2010s with accidental killings decreasing and felonious killings increasing again. 

The last several years of data have extremely few officers killed accidentally, with fewer than 10 a year since 2018 and even zero officers killed in 2021. According to the website [Officer Down Memorial Page](https://www.odmp.org/search/year?year=2021), there were 719 officers who died in 2021, including some that should meet the killed accidentally criteria.^[The vast majority of officers who died in 2021 died from Covid.] For example, 23 officers were reported to have been killed by an automobile crash. So this data on officers killed is incorrect, is an undercount, and should be used only with a great deal of caution. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaOfficersKilledNational-1} 

}

\caption{The national number of officers killed by felony and killed accidentally, 1960-2023}(\#fig:leokaOfficersKilledNational)
\end{figure}

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

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaAssaultTypeInjury-1} 

}

\caption{The total number of assaults on officers by injury sustained and offender weapon in Los Angeles, 1960-2023.}(\#fig:leokaAssaultTypeInjury)
\end{figure}

We can also look at assaults over time. Figure \@ref(fig:leokaAssaultsInjuryYear) shows the number of assaults, assaults with injury, and assault without injury for the Los Angeles Police Department from 1960 to 2018. We can immediately see some data issues are there are years with no assaults recorded. And in the late-2000s there is a sudden drop from about 250 assaults with injuries per year in the previous few decades to nearly zero officer injuries reported a year. This strongly suggests some change in reporting rather than a true decrease in assaults with injuries. For the decades where the data is less obviously wrong, there is a consistent trend of most assaults leading to no injuries, though the distance between the number of injury and non-injury assaults fluctuates over time. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaAssaultsInjuryYear-1} 

}

\caption{The annual number of assaults on officers by injury sustained in New York City, 1960-2023.}(\#fig:leokaAssaultsInjuryYear)
\end{figure}


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

Figure \@ref(fig:leokaAssaultCallType) shows the number of assaults on Los Angeles Police Department officers by the type of call for 1960-2023. There were about 41,000 assaults against Los Angeles Police Department officers with a little over 33,500 of these assaults cleared. An important thing to note is that the number of assaults here is less than the nearly 43,000 assaults for the same agency over the same time period we saw in Figure \@ref(fig:leokaAssaultTypeInjury). This is because some variables are not reported for all years and agencies are free to report which variables they want to report in any given year. This makes it massively tricky to use this data since even simple statistics for the same agency for supposedly the same variable (here it is technically different variables but should still be the total number of officers assaulted) can be different.

The most common type of call where officers are assaulted are disturbance calls which include domestic violence and reports of dangerous individuals such as people carrying guns in public. The least common call type is ambush calls, though in these calls the police are called to a scene by the offender who intends to assault or kill the officers, so is likely far more dangerous than other call types, even though it is rare. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaAssaultCallType-1} 

}

\caption{Assaults on Los Angeles Police Department officers by type of call where they were assaulted at, 1960-2023.}(\#fig:leokaAssaultCallType)
\end{figure}

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

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaDisturbanceWeapon-1} 

}

\caption{The number of assaults on Los Angeles Police Department officers in disturbance calls by the injury sustained by the officer, 1960-2023.}(\#fig:leokaDisturbanceWeapon)
\end{figure}

Again using disturbance calls for the Los Angeles Police Department, we can look at assaults by the officer assignment, as seen in Figure \@ref(fig:leokaShiftAssignment). In the vast majority of assaults it is of officers who are in a vehicle along with a partner. This drops very sharply to several hundred assaults on detectives who are assisting other officers and then increasingly declines to the other shift assignments to the least common assault being against detectives who are acting alone. So are officers in two-man vehicles are much higher risk of assaults than officers alone or of detectives? Almost certainly not. To determine the risk for officers we need to know how officers are generally deployed. If the vast majority of officers are in two-man cars then it makes sense that the vast majority of assaults are on these assignments. Like most FBI data - and most crime data in general - we have the numerator (in this case the number of assaults by shift assignment type) and do not have a proper denominator (such as the distribution of shift assignments for all LAPD officers) to determine a rate of risk. Without this we can present some descriptive statistics but cannot be more useful by determining, for example, if officers in certain shift assignments are at higher risks of being assaulted. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/leokaShiftAssignment-1} 

}

\caption{The number of assaults on Los Angeles Police Department officers in disturbance calls by the injury sustained by the shift assignment of the officer, 1960-2023.}(\#fig:leokaShiftAssignment)
\end{figure}


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

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{07_leoka_files/figure-latex/phoenixAssaultTimes-1} 

}

\caption{The number of assaults against Phoenix Police Department officers by hourly grouping for all years with data available, 1971-2018.}(\#fig:phoenixAssaultTimes)
\end{figure}


<!--chapter:end:07_leoka.Rmd-->

# Arson {#arsonChapter}





The arson dataset provides monthly counts of reported arson incidents, with detailed breakdowns by type (e.g., arson of residential properties, vehicles, or public buildings) and the estimated value of property damage. The data spans from 1979 to the present and includes additional information on arrests, clearances, and unfounded cases.

This data includes all arsons reported to the police or otherwise known to the police such as when an officer discovers it while on patrol. It also has a count of arsons that lead to an arrest (of at least one person who committed the arson) and of reports that turned out to not be arsons, such as if an investigation found that the fire was started accidentally. This is essentially the Offenses Known and Clearances by Arrest data, detailed in Chapter \@ref(offensesKnown), but for arsons. The data even follows the same definitions for categories such as what counts as a cleared or unfounded crime. The primary additional variable is the estimated damage in dollars caused by the arson. As much of this information is the same as detailed in Chapter \@ref(offensesKnown), this chapter will be brief. If you have a question about definitions, please refer to that chapter. 

The dataset includes a variable indicating whether the arson occurred in an uninhabited structure, which refers to buildings that are vacant, abandoned, or not in regular use. This allows for estimates of how many building arsons had the potential to harm people, distinguishing between, for example, a vacant warehouse and a home where people could be harmed.

In cases where the arson led to a death, that death would be recorded as a murder on the Offenses Known and Clearances by Arrest dataset - but not indicated anywhere on this dataset. If an individual who responds to the arson dies because of it, such as a police officer or a firefighter, this is not considered a homicide (though the officer death is still included in the Law Enforcement Officers Killed and Assaulted data) unless the arsonist intended to cause their deaths.

## Agencies reporting

This dataset measures how many months that an agency reports data over a year in the same way as the Offenses Known data does: the standard FBI definition using the last month reported, and my own measure counting how many months reported data according to a column for each month that says so.^[This is different than identifying how many months have an arson as there may be months that truly do not have any arsons. We do not want to count those are non-reporting months.] And just like the Offenses Known data, the variable I use for my own measurement changed in 2018, leading to fewer months of data reported and making it non-comparable to pre-2018 data. The variable changed again in 2021 and said that all agencies always reported data in every month, making the variable useless. 

In Figure \@ref(fig:arsonAgencies) we can see the annual number of agencies that reported at least one month of data using both measures. These measures are nearly identical every year with the last month reported having slightly more agencies reported, but they are effectively the same. This changes in 2018 as my measure declines considerably and then skyrockets to nearly 25,000 agencies in 2021 and 2022. The last month reported variable declines considerably in 2021, consistent with the FBI ending SRS collection, and then rebounds in 2022 when the FBI reopens SRS collection. How can there be more than 18k agencies reporting? The 18k number is the estimated number of agencies that are active: agencies that can respond to crimes and do investigations. Remember that SRS data goes back decades - the Offenses Known data is available since 1930. So agencies can come and go, with agencies shutting down or joining with other agencies. Over time this adds up to thousands of agencies other than the 18k we normal think about. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{08_arson_files/figure-latex/arsonAgencies-1} 

}

\caption{The annual number of police agencies that report at least month of data and all 12 months of data, using both measures of how many months are reported, 1979-2023.}(\#fig:arsonAgencies)
\end{figure}




## Important variables

Similar to the Offenses Known and Clearances by Arrest data, this data shows the monthly number of crimes - in this case only arsons - reported or discovered by the police, the number found by police to be unfounded, and the number cleared by the police. In addition, it includes the number of arsons in structures that were uninhabited, and the estimated cost of the damage caused by the arsons. For each variable, the arsons are also broken into several categories of arsons, which we will talk about in Section \@ref(arsonType). As with other SRS datasets, there are also variables that provide information about the agency - ORI codes, population under jurisdiction - the month and year that the data covers, and how many months reported data. When another agency submits data for the given agency, that is noted in the data through the "covered_by_ori" variable.

### Types of arsons {#arsonType}

For each of the outcome categories detailed below, this dataset has information for ten different *types* of arson. Arsons are categorized into three main groups: building arsons, vehicle arsons, and other arsons (e.g., fires in outdoor areas like parks or forests). Building arsons are further subdivided into seven types, such as single-family homes, industrial buildings, and public structures. For each of the building arsons we also have variables that say how many of the arsons were of uninhabited buildings. Vehicle arsons are split between motor vehicles and other mobile objects, such as boats or airplanes.

* Total structures (buildings)
  + Single occupancy (e.g. single family homes)
  + Other residential (e.g. hotel, apartment)
  + Storage (warehouses, storage facilities)
  + Industrial
  + Other commercial (e.g. restaurant, office building, car dealership)
  + Community/public (e.g. government buildings, hospitals, community centers, places of worship)
  + All other structures (all buildings that do not fit in another category')
* Total mobile vehicles (vehicles)
  + Motor vehicles (a car that runs on a road such as a SUV, sedan, motorcycle)
  + Other mobile vehicles (other mobile objects such as airplanes and boats)
* Other (everything that does not fit in a previous category)
* Grand total (all arsons of any category)

Some arsons can burn down multiple types or structures or cars - fire, after all, tends to spread. This data defines the arson based on where the fire originated, regardless of what burns after that. This is true even if the damage is more severe for a type other than where the fire started. For example, a [recent fire in California](https://www.nbcnews.com/news/us-news/man-pushing-burning-car-ravine-started-park-fire-burning-45000-acres-c-rcna163697) was started by a man "pushing a burning car into a ravine." That fire, known as the Park Fire has burned over 429,000 acres and over 700 buildings. This fire would be classified as a motor vehicle arson because the fire started in a vehicle.

### Actual arsons

This variable includes the number of arsons either reported to the police or otherwise known to the police in that month and that the police determine to actually be arsons - that is, reports that are not unfounded. This is the number of arsons, regardless of their severity. An arson that burns down a single vehicle is treated as one arson, as is an arson that burns down a vehicle, 429 thousand acres of land, and 600 buildings. 


### Unfounded arsons

This variable shows the number of arsons reports that the police determined to not actually be arsons. For example, if a house burns down and police think it was arson but later determine that it was an accident, it would be an unfounded arson. Whether an arson is unfounded is based only on the police's determination about that event, not the decision of other groups like a court or the conviction of someone for the crime. However, this doesn't mean that the officer makes that decision in a vacuum as they can use evidence such as the findings from firefighters for if the fire was an arson. 

### Reported arsons

This variable is the sum of actual arsons and unfounded arsons - it is the total number of arsons that were reported or known to the police, even if a later investigation found that it was not actually an arson. 

### Cleared arsons

This shows the number of arsons where at least one offender is arrested or when an arrest cannot be made for some reason, but the police know who the offender is - the latter option is called "exceptional clearances" or "clearances by exceptional means." There is no way to tell if a clearance is due to an arrest or due to exceptional means.^[NIBRS data does tell more information about the type of arrest, but SRS data does not.]

Please note that this data is at the incident-level which means that having multiple people arrested for an incident still only is a clearance for that single incident. If there are multiple people who committed the arson only one needs to be arrested or exceptionally cleared for the incident to be cleared.

Clearances are reported in the month they occur, which may be different than the month when the arson happened. This can create the illusion that more crimes are solved than were reported in certain time periods. Figure \@ref(fig:arsonClearance), for example, shows the number of actual arsons (reports that are founded) and clearances for single-family home arsons in League City, Texas, a city of about 100,000 outside of Houston. In most years there were fewer clearances than arsons, but in four years (1982, 1981, 1992, and 2007) there were more clearances than arsons. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{08_arson_files/figure-latex/arsonClearance-1} 

}

\caption{The annual number of single-family home arsons and clearances in League City, Texas, 1979-2023.}(\#fig:arsonClearance)
\end{figure}

### Cleared for arsons where all offenders are under age 18

This variable is the same for normal clearances but only for arsons where every offender is under the age of 18. For juvenile offenders, a clearance can still occur if the juvenile is issued a citation to appear in court, even if they are not formally arrested and taken into custody. As this variable requires that the police know the identity of every offender (to be able to determine that they are all under 18), it is likely flawed and merits caution when using. 

### Uninhabited building arsons

This data also includes the number of arsons that occur in uninhabited structures. These structures must be uninhabited in the long-term, not simply having no one inside them when the arson occurs. In the FBI's manual for this data they define uninhabited buildings as ones that are "uninhabited, abandoned, deserted, or not normally in use" at the time of the arson. For example, a vacation home whose owners are not living in at the time would be "not normally in use" so would be an uninhabited building. A business that is closed when the fire started, but is open during the day, is not an uninhabited building. 

### Estimated damage cost

The final variable is the estimated cost of the arson. This is how much the police estimates the value (in dollars) of the damaged or destroyed property is. Since this is the value of property damage, injuries to people (including non-physical injuries such as trauma or mental health costs) are not included. Since this is estimated damage it may be inaccurate to some degree. This variable is the sum of monthly estimated cost so while you can get the average cost by dividing this by the number of actual offenses, this average may be significantly off due to having extremely small or large values in your data. This value may be $0 since arsons include attempted arsons which may cause little or no damage. Please note that this value is not inflation-adjusted so you will have to adjust the value yourself. 

## Data errors

As with other SRS datasets, the arson data sometimes includes clear data entry errors, such as reporting implausibly high numbers of arsons for small jurisdictions or recording unrealistic damage estimates. For example, Figure \@ref(fig:residenceArson) shows the annual number of single-family home arsons in Byron City, Illinois, which has a population of slightly over 3,600 people. In every year there are zero arsons reported until 2003 when 469 arsons are reported. Since it is exceedingly unlikely that suddenly an eighth of the city each suffered different arson attacks, and that the city never again had a residence arson, this is almost certainly a data entry error. As arsons are relatively rare, having errors - and especially ones like this - can drastically change the results of your analysis so it is important to check your data carefully for more errors. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{08_arson_files/figure-latex/residenceArson-1} 

}

\caption{Annual single-family home arsons in Byron  City, Illinois. The sudden spike to over 400 arsons in a single year is an example of data errors in this dataset, 1979-2023. }(\#fig:residenceArson)
\end{figure}

There are also cases where it is less clear when a value is a data error or is simply due to an outlier - but real - value. For example, Figure \@ref(fig:arsonCost) shows the annual average cost of a single-family home fire in Los Angeles, California. In most years the value is low. Since an arson can cause little or no damage, these low values likely mean that on average only part of the house was damaged, rather than the entire house burning down. In 2009, however, the average damage is about $540,000 per arson. Is this a data entry error that simply inputs a damage value that is too high? It certainly appears to be a data error since it is a sudden huge jump in damage value. However, it could also be that some extraordinarily expensive homes were destroyed that year. In 2009, Los Angeles reported only 63 single-family home arsons so having one, or a few, super mansions - which LA has plenty of - destroyed could mean that this huge value is real. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{08_arson_files/figure-latex/arsonCost-1} 

}

\caption{The annual cost per arson for single family homes in Los Angeles, California, 1979-2023.}(\#fig:arsonCost)
\end{figure}

<!--chapter:end:08_arson.Rmd-->

# Hate Crime Data {#hate_crimes}





This dataset covers crimes that are reported to the police and judged by the police to be motivated by hate. More specifically, they are crimes which were motivated - at least in part - by bias towards a certain person or group of people because of characteristics about them such as race, sexual orientation, or religion. The first part is key: incidents must first be crimes—specifically, the types of crimes the FBI includes in this dataset. Actions motivated by bias that do not meet the legal standard of a crime, or fall outside the specific crime categories covered by this data, are not recorded as hate crimes.

For example, if someone yells racial slurs at a Black person, it’s clearly a biased and racist action, but it wouldn’t be included in this data unless it involved a specific crime like intimidation. Racial slurs alone, without additional criminal behavior, are generally not illegal and thus wouldn’t be reported as a hate crime in this dataset. For the second part, the bias motivation, it must be against a group that the FBI includes in this data. For example, when this data collection began in 1991, there was no way to collect information about hate crimes against transgender people specifically. Instead it would be counted in the "Anti-Lesbian, Gay, Bisexual, Or Transgender, Mixed Group (LGBT) bias motivation. So if a transgender person was assaulted or killed because they were transgender, there would not be a way to count that until 2013 when anti-transgender was first recorded in this data. 

In the previous example the offender shouted a racial slur, clear that the actions were motivated by bias. What about a hate crime where there is no explicit evidence of hate? Say, a White man robs a Black man and targets him because he is Black. The offender does not wear any insignia suggesting bias and never says a word to the victim. If the offender is never caught this robbery would not be considered a hate crime as there is no evidence that it is motivated by hate. Even if the offender is caught this would only be considered a hate crime if the police uncover evidence of bias, such as a confession or text messages between the offender and another person explaining why the victim was targeted. I think many - perhaps even most - hate crimes fall into this category. Where it was in fact a hate crime but there is not sufficient evidence - both in terms of evidence the police can gather and even the victim's own perception - that it was a hate crime. 

This data is a more limited measure of hate crimes than it may initially appear. It represents only (some) crimes, motivated by (some) types of hate, that are both reported to the police and where the police have gathered sufficient evidence to determine bias. It is also the dataset with the fewest agencies reporting, with most agencies not reporting any hate crimes to the FBI in a given year. This may be true for most agencies as hate crimes are rare and many agencies are small with relatively few crimes of any type reported. However, there is evidence that some agencies that likely have hate crimes still do not report. This leads to gaps in the data with some states having few agencies that report hate crimes, agencies reporting some bias motivations but not others, and agencies reporting some years but not others. While these problems exist for all of the SRS datasets, it is more severe in this data. This problem is further complicated by hate crimes being rare even in agencies that report them. With such rare events, even minor changes in which agencies report or whether victims report the crime to the police can drastically change the reported number of hate crimes. For these reasons I strongly advise caution to anyone using these data. 

## Agencies reporting

We will start by looking at how many agencies report hate crime each year. This is a bit tricky since there can be multiple ways to examine how agencies report, and since agencies can truly have no hate crimes in a year it is hard to differentiate the true zeroes from the non-reporters. 

Figure \@ref(fig:hateAgencies) shows the number of agencies that report at least one hate crime incident in that year. During the first year of data in 1991 there were about 750 agencies reporting and that grew steadily to about 2,000 agencies in year 2000. From there it increased a bit over the next decade before declining to below 1,750 in the early 2010s and rising again to around 3,000 agencies at the end of our data.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateAgencies-1} 

}

\caption{The annual number of police agencies that report at least one hate crime incident in that year.}(\#fig:hateAgencies)
\end{figure}

The 3,000 or so agencies that report each year are not the same every year. Figure \@ref(fig:hateCrimesEver) shows the cumulative number of agencies that have reported at least one hate crime between 1991 and 2022. There is a steady growth in the cumulative number of agencies, with about 350 new agencies each year. In each year some new agencies report hate crimes for the first time while some agencies that reported a hate crime in previous years do not report any hate crimes in the current year.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesEver-1} 

}

\caption{The cumulative number of agencies that have reported one or more hate crimes between 1991 and 2022}(\#fig:hateCrimesEver)
\end{figure}

Figure \@ref(fig:hateCrimesPreviousYear) puts this into hard numbers by showing the percent of agencies who reported a hate crime in a certain year who *also* reported a hate crime in the previous year. For most years between 50% and 60% of agencies which reported a hate crime in the year shown on the x-axis also reported a hate crime in the previous year, indicating somewhat high consistency in which agencies have hate crimes. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesPreviousYear-1} 

}

\caption{The percent of agencies that report a hate crime in a given year that also reported a hate crime in the previous year, 1992-2023}(\#fig:hateCrimesPreviousYear)
\end{figure}

Another way to understand reporting is to look at the number of reported hate crimes by state and see which states report and which do not. Figure \@ref(fig:hateCrimesMap) does this for 2022 data by showing the number of reported hate crime incidents by state. Unfortunately what we have done here is basically create a population map, though with California as a clear outlier. Counting up and graphing or mapping the number of crimes is a common first response to getting new data but is not actually that helpful. Here we see that the states with the biggest populations - California, New York, Texas,  - have the most hate crimes. To be more useful let us look at state-level reporting after adjusting to the number of agencies in the state and to the civilian population.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesMap-1} 

}

\caption{Total reported hate crimes by state, 2023}(\#fig:hateCrimesMap)
\end{figure}


We will start with the rate of agencies reporting though this incorrectly assumes that each agency in the state is comparable. For example, say a state has 10 agencies; one that has jurisdiction over 91% of the state's population, and nine that have jurisdiction over 1% of the population each. If the one big agency reports and none of the nine do then we will say that only 10% of agencies report data. But this one covers 91% of the state so this is actually great coverage. Conversely, having that one agency not report means that even with the other nine agencies reporting we actually cover less than one-tenth of the state's population. Still, this is a useful starting point for understanding this data's reporting and usually answering these kinds of questions requires multiple answers that are all wrong in their own way.

Figure \@ref(fig:statePercentReporting) shows the percent of agencies for each state that reported at least one hate crime in 2022. In New Jersey, the state with the highest percent of agencies reporting, 39% of agencies reported at least one hate crime. It is neighboring states of Pennsylvania, Delaware, and New York have a much lower rate of reporting at 4% (the lowest of any state), 11%, and 14%, respectively. This difference is likely due to a 2019 request by the New Jersey Attorney General to police officers that they [https://www.washingtonpost.com/national-security/2022/01/29/hate-crimes-nj-fbi-asian/]("more thoroughly report on bias incidents.") To me this suggests that decisions at the state level can lead to drastic changes in reporting rates by agencies, and is a possible solution to low reporting rates. 

In 15 states, fewer than 10% of agencies reported a hate crime, and in one state (Pennsylvania) fewer than 5% of agencies did so. One interesting finding from this map is the more liberal states - New Jersey, Washington, California, Connecticut, etc. - have the highest share of agencies reporting a hate crime, indicating that the culture of the state may influence either the propensity of hate crimes, whether victims report, whether agencies report hate crimes, or simply that more hate crimes happen in these areas.   

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/statePercentReporting-1} 

}

\caption{The percent of agencies in each state that reported at least one hate crime in 2022, excluding agencies covered by another agency.}(\#fig:statePercentReporting)
\end{figure}

To examine how population affects our results, Figure \@ref(fig:statePercentReportingPop) shows the percent of each state's population that is covered by an agency that reported at least one hate crime. Results are similar to Figure \@ref(fig:statePercentReporting) but now show that there is more reporting than it appeared in that figure. That is because while not all agencies report a hate crime, the ones that do report are generally larger (in terms of population) than the ones that do not. And that is to be expected since smaller agencies will have fewer crimes than larger ones meaning that it is less likely that have a hate crime.

So measuring by population we see that about half of the people in the country lives in the jurisdiction of an agency which reported at least one hate crime. The average state also covers about half of the population in a hate-crime-reporting agency. The state with the lowest population covered is Mississippi with 17% of its residents in a jurisdiction with an agency reporting data; the state with the highest share is Hawaii at 86%.

Is this good? We do not necessarily want 100% of agencies to report a hate crime since not all agencies will experience a hate crime in their jurisdiction. The ideal dataset would have all hate crimes reported but without knowing how many hates crimes there actually are we cannot tell how well this data captures hate crimes.

This is also a fairly poor measure of reporting as it just measures agencies reporting at least one hate crime. If an agency had many hate crimes but only reported very few - and here let us think about that as both agencies not knowing a crime was a hate crime and also knowing but not reporting a hate crime - that is also quite bad for our understanding of hate crimes. However, it is far more likely that a hate crime is not reported than a non-hate crime being reported as a hate crime. Since we know the likely direction of any errors we can think about this entire dataset as being the lower-bound of hate crime data.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/statePercentReportingPop-1} 

}

\caption{The percent of population in each state in agencies that reported at least one hate crime in 2022, excluding agencies that are covered by another agency.}(\#fig:statePercentReportingPop)
\end{figure}

## Tree of Life synagogue shooting {#treeOfLife}

One way I like to check the quality of data is to see how it reports something that I know occurred. Here we will look at how the anti-Semitic attack on a synagogue in Pittsburgh was reported. In October of 2018 the deadliest attack on Jewish people in US history occurred at the Tree of Life synagogue in Pittsburgh, PA. There, 11 congregants were murdered, and several other people, including police officers, were injured by the shooter. Yet according to this data, however, those murders never occurred. Not in Pittsburgh at least. No murders with an anti-Jewish bias were reported in Pittsburgh in 2018. Instead, the shooting was reported by the FBI's Pittsburgh field office, which, like many federal agencies that have offices across the country, is included in the data as its own agency.

This is good and bad. Of course it is good that when a crime happens it is reported in the data. The bad part is that it is counted as hate crimes that occurred in the FBI's Pittsburgh agency, and not the Pittsburgh Police Department. Most research occurs at the local level - usually studying an agency or county. So if a study is examining agency-level characteristics that are related to hate crimes it would almost certainly exclude these murders as they are reported by a federal agency and not the local Pittsburgh agency. 

This also gets complicated as FBI rules say that a crime should be reported by the most local jurisdiction. This is true even when there is overlapping jurisdiction. 11 people were murdered in Pittsburgh, and several Pittsburgh Police officers were injured. That should mean that the crime is reported by Pittsburgh Police, not by the FBI. Pittsburgh does report these murders in their Offenses Known data, making it even more odd that they are Pittsburgh crimes in one dataset and not another.^[The murders of nine Black parishioners in the Emanuel African Methodist Episcopal Church in Charleston, South Carolina, in 2015 was reported by the Charleston Police Department, making it even more inconsistent for when the FBI reports hate crime murders.] 

## Important variables

This data has the standard set of variables describing the agency that is reporting. This includes the agency ORI - which is the unique ID for that agency - the agency name, their state, and the population under their jurisdiction. It then has more detailed information about each crime such as what crime happened, what type of bias it involved, where it occurred, and some demographics of the offender.

### Date and time

This data says the exact date that the hate crime occurred on - though not the date it was reported on. Figure \@ref(fig:hateCrimesByDay) shows the percent of hates crimes between 1991 and 2022 that occurred on each day of the week. Interestingly, the most common days for a hate crime to occur is on Friday, which is also when non-hate crimes most frequently occur. This suggests that hate crimes do follow the same trends - at least partially - as other crimes.




\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesByDay-1} 

}

\caption{The day of the week that hate crimes occurred on, 1991-2023}(\#fig:hateCrimesByDay)
\end{figure}

We can also look at which day of the month is most common, as shown in Figure \@ref(fig:hateCrimesByMonthDay). There's no pattern that I can see other than the the 1st of the most has the most hate crimes and the end of the month has the fewest. Not all months have more than 28 days so it makes sense that the 29th, 30th, and 31st are the least common days. Is the 1st of the month really the most dangerous? I think this is likely just a quirk of the data, and is something we also see in NIBRS data. When an agency does not report an actual date they may use the 1st of the month as a placeholder which then looks to us like the 1st is an especially prolific day for hate crimes. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimesByMonthDay-1} 

}

\caption{The day of the month that hate crimes occurred on, 1991-2023}(\#fig:hateCrimesByMonthDay)
\end{figure}

### The bias motivation (who the hate is against)

The most important variable in this data is the "bias motivation" which is the FBI's term for the cause of the hate. A hate crime targeted against Black people would be an "anti-Black" bias motivation. For the police to classify an incident as a hate crime, and to assign a particular bias motivation, the police must have *some* evidence that the crime was motivated by hate. The victim saying that the crime is a hate crime alone is not sufficient - though if large portions of the victim's community believe that the crime is a hate crime, this can be a factor in the police's assessment. 

The evidence required is not major. It includes evidence as explicit as slurs said during an incident and less obvious factors like the crime occurring on an important holiday for that community (e.g. Martin Luther King Day, religious holidays). The FBI also encourages police to consider the totality of the evidence even if none alone strongly suggests that the crime was a hate crime in making their determination about whether the incident was a hate crime or not. This also means that many (perhaps most) hate crimes will not be recorded as hate crimes since there is no evidence that the crime is motivated by hate. 

Consider, for example, a person who is biased against Asian people and decides to rob them because they are Asian. This is clearly a hate crime. And say this persons robs 10 Asian people in 10 different incidents, causing 10 hate crimes. All of the victims report it to the police but only two of them tell the police that they think it was a hate crime; the other eight do not think it is a hate crime. Without additional information the police would likely not report any of these robberies as hate crimes. And if all ten of the victims happened to be surveyed about crime victimization, such as through the Bureau of Justice Statistics' National Crime Victimization Survey, only two of the 10 victims would report being the victim of a hate crime. Using FBI data the anti-Asian hate crimes would be zero; using victimization surveys would undercount anti-Asian hate crimes enormously. This is the main problem with using hate crime data, even with perfect reporting or surveys of everyone possibly victimized we may still be getting data that is completely incorrect.

In the FBI data bias motivation is based on the offender's perceptions of the victim so even if they are incorrect in who their victim is, if they intended to target someone for their perceived group membership, that is still a hate crime. For example, if a person assaults a man because they think he is gay, that is a hate crime because the assault was motivated by hate towards gay people. Whether the victim is actually gay or not is not relevant - the offender perceived him to be gay so it is an anti-gay hate crime. To make this even more complicated, the offender must have committed the crime because they are motivated, at least to some degree, by their bias against the victim. Being biased against the victim but targeting them for some other reason means that the crime is not a hate crime. 

The biases that the FBI includes in this data have grown over time, with new bias motivations being added in 1997, 2012, 2013, and 2015. Table \@ref(tab:hateBiasMotivation) shows each bias motivation in this data, the year it was first reported, how many hate crimes there were for this bias motivation from 1991-2023 and what percent of hate crimes that bias motivation makes up. 

To make the most common bias motivations easier to identify, the table is sorted by the frequency of incidents. The "first year" column reflects the first year that the bias motivation was officially recorded, though some biases may have existed earlier but were not yet captured in the data. The last column in this table shows the percent of hate crime incidents from 1991-2023. 

This sorting makes it easy to see the most common bias motivations, but that is not actually that useful to most people since we usually care more about a rate than a count. For example, according to this table there were almost three times as many anti-Black hate crimes than anti-Jewish hate crimes, showing that anti-Black hate crimes are more of a problem in this country. But this is not right. We cannot just count of the number of offenses or we risk accidentally just measuring the population of these groups. Black people, for example, make up about 14% of the United States population while Jewish people make up about 2%.^[For simplicity I am treating these groups as independent though of course some Black people can be Jewish.] If we adjust the numbers to equalize population then we see that there is a much higher anti-Jewish hate crime rate than anti-Black rate. 

And even this is not that useful since you really need a much deeper dive into the data before pulling out these seemingly simple statistics. For example, maybe areas with more Jewish people have better reporting than areas with more Black people. Or that Jewish victims would report to the police at higher rates than Black victims. Maybe these are both true at certain times between 1992 and 2022 but have changed over the years. It is not hard to think of possible explanations for differences between groups so without running down each of these explanations I recommend caution before putting out even something as seemingly simple at the number of crimes by bias group. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hateBiasMotivation)The bias motivation for hate crime incidents. In incidents with multiple bias motivation, this shows only the first bias motivation recorded.}\\
\hline
Bias Motivation & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateBiasMotivation)The bias motivation for hate crime incidents. In incidents with multiple bias motivation, this shows only the first bias motivation recorded. \textit{(continued)}}\\
\hline
Bias Motivation & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endhead
Total &  & 252,093 & 100\textbackslash{}\%\\
\hline
Anti-Black & 1991 & 84,508 & 33.52\textbackslash{}\%\\
\hline
Anti-Jewish & 1991 & 31,838 & 12.63\textbackslash{}\%\\
\hline
Anti-White & 1991 & 28,192 & 11.18\textbackslash{}\%\\
\hline
Anti-Gay (Male) & 1991 & 24,927 & 9.89\textbackslash{}\%\\
\hline
Anti-Hispanic Or Latino & 1991 & 16,231 & 6.44\textbackslash{}\%\\
\hline
Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 1991 & 11,899 & 4.72\textbackslash{}\%\\
\hline
Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 1991 & 8,684 & 3.44\textbackslash{}\%\\
\hline
Anti-Asian & 1991 & 8,088 & 3.21\textbackslash{}\%\\
\hline
Anti-Multiple Races, Group & 1991 & 5,876 & 2.33\textbackslash{}\%\\
\hline
Anti-Lesbian (Female) & 1991 & 5,041 & 2.00\textbackslash{}\%\\
\hline
Anti-Islamic (Muslim) & 1991 & 4,468 & 1.77\textbackslash{}\%\\
\hline
Anti-Other Religion & 1991 & 3,741 & 1.48\textbackslash{}\%\\
\hline
Anti-American Indian Or Native Alaskan & 1991 & 2,878 & 1.14\textbackslash{}\%\\
\hline
Anti-Catholic & 1991 & 1,894 & 0.75\textbackslash{}\%\\
\hline
Anti-Transgender & 2013 & 1,855 & 0.74\textbackslash{}\%\\
\hline
Anti-Arab & 1991 & 1,633 & 0.65\textbackslash{}\%\\
\hline
Anti-Mental Disability & 1997 & 1,439 & 0.57\textbackslash{}\%\\
\hline
Anti-Protestant & 1991 & 1,389 & 0.55\textbackslash{}\%\\
\hline
Anti-Multiple Religions, Group & 1991 & 1,352 & 0.54\textbackslash{}\%\\
\hline
Anti-Physical Disability & 1997 & 870 & 0.35\textbackslash{}\%\\
\hline
Anti-Sikh & 2015 & 821 & 0.33\textbackslash{}\%\\
\hline
Anti-Bisexual & 1991 & 684 & 0.27\textbackslash{}\%\\
\hline
Anti-Gender Non-Conforming & 2012 & 653 & 0.26\textbackslash{}\%\\
\hline
Anti-Heterosexual & 1991 & 627 & 0.25\textbackslash{}\%\\
\hline
Anti-Female & 2012 & 539 & 0.21\textbackslash{}\%\\
\hline
Anti-Other Christian & 2015 & 472 & 0.19\textbackslash{}\%\\
\hline
Anti-Eastern Orthodox (Greek, Russian, Other) & 2015 & 441 & 0.17\textbackslash{}\%\\
\hline
Anti-Atheism/Agnosticism & 1991 & 218 & 0.09\textbackslash{}\%\\
\hline
Anti-Native Hawaiian Or Other Pacific Islander & 2013 & 198 & 0.08\textbackslash{}\%\\
\hline
Anti-Male & 2013 & 194 & 0.08\textbackslash{}\%\\
\hline
Anti-Buddhist & 2015 & 130 & 0.05\textbackslash{}\%\\
\hline
Anti-Hindu & 2015 & 128 & 0.05\textbackslash{}\%\\
\hline
Anti-Church of Jesus Christ (Mormon) & 2015 & 118 & 0.05\textbackslash{}\%\\
\hline
Anti-Jehovahs Witness & 2015 & 67 & 0.03\textbackslash{}\%\\
\hline
\end{longtable}



2015 is the year with the most bias additions, as of data through 2022. This year added a number of religions such as Anti-Buddhist, Anti-Sikh, and Anti-Jehovah's Witness. In 2013, anti-Transgender was added and this is the most common of the bias motivations added since data began in 1991 with 1500 hate crimes between 2013-2023 - 0.62% of all hate crime incidents from 1991-2023. That year also added anti-male and Anti-Native Hawaiian or Other Pacific Islander, which is the most recent racial group added. In 2012, anti-gender non-conforming and anti-female were included, while in 1997 both anti-mental and anti-physical disability were added. In part due to having fewer years of data available, these newer bias motivations make up a small percent of total hate crimes. 

The original hate crimes - that is, those in the data in 1991 when this dataset was released - are far more common. The most common bias motivation is anti-Black at 34% of hate crimes, anti-Jewish at 12%, anti-White at 11%, anti-male homosexual (gay) at 10%, anti-Hispanic at 6%, and anti-ethnicity other than Hispanic (this group means a crime against an ethnic group that is not Hispanic, though it is occasionally reported as anti-non-Hispanic which is incorrect.) at 5%. All other bias motivations are less than 5% of hate crimes and consist of a variety of ethnic, racial, religious, or sexual orientation. Some hate crimes can potentially fall in multiple categories. For example, there is a bias motivation of "anti-male homosexual (gay)" and of "anti-lesbian, gay, bisexual, or transgender, mixed group (LGBT)" so there is some overlap between them. When an incident involves multiple bias motivations we can track that in the data as police can report up to 10 bias motivations per incident. In practice, however, most incidents involve only a single bias motivation.

### The crime that occurred

The "crime" part of hate crimes is which criminal offense occurred during the incident. A hateful act where the action is not one of the crimes that the FBI records would not be considered a hate crime. This is likely most common when considering something like a person calling someone by a hateful slur (e.g. "You're a [slur]," "go back to your own country", etc.) but where the action is not technically a crime. Another layer of difficulty in using this data is that not all crimes that the FBI includes were initially included when data become available in 1991. Every several years the FBI adds new crimes to be included in this data. Table \@ref(tab:hateOffense) shows each crime in the data, the first year that this crime was reported, the total number of these crimes reported between 1991 and 2022, and the percent of all incidents this crime makes up.^[This tables uses only the first offense in an incident so counts are slightly lower than if all crimes in every incident is used.] 

Each hate crime incident can cover up to 10 different crimes occurring - for example, a person who burglarizes a synagogue and spray paints a swastika on the wall would have both burglary and vandalism reported in this data. With each crime, this data has the bias motivation for that crime, the location of the crime (in broad categories, not the actual location in the city like a street address would have), and the number of victims for that offense. In practice, in most hate crimes with multiple offenses recorded, the bias motivation, location, and victim count is the same for each offense.

Figure \@ref(fig:crimesPerHateCrime) shows the number of crimes per incident for each hate crime reported between 1991 and 2022. In 96.6% of cases, there is only one offense in that incident.^[In 0.0004% of hate crimes there is no recorded offense. This is not shown in the graph.] This drops sharply to 3.2% of incidents having two offenses, 0.21% having three offenses, 0.019% having four offenses, and 0.002% having five offenses. Even though this data does allow up to 10 offenses per hate crime incident, there has never been a recorded case with more than five offenses. Results are nearly identical when examining the number of bias motivations and locations reported in an incident. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/crimesPerHateCrime-1} 

}

\caption{The number of offenses per hate crime incident.}(\#fig:crimesPerHateCrime)
\end{figure}

Nearly all hate crimes are vandalism/destruction of property (30%), intimidation (30%), and simple assault (20%) or aggravated assault (11%) with no remaining crime making up more than 2% of total hate crimes. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hateOffense)The offense type for hate crime incidents. In incidents with multiple offense types, this shows only the first offense type recorded.}\\
\hline
Offense & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateOffense)The offense type for hate crime incidents. In incidents with multiple offense types, this shows only the first offense type recorded. \textit{(continued)}}\\
\hline
Offense & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endhead
Total &  & 252,094 & 100\textbackslash{}\%\\
\hline
Destruction/Damage/Vandalism of Property & 1991 & 75,524 & 29.96\textbackslash{}\%\\
\hline
Assault Offenses - Intimidation & 1991 & 75,381 & 29.90\textbackslash{}\%\\
\hline
Assault Offenses - Simple Assault & 1991 & 50,410 & 20.00\textbackslash{}\%\\
\hline
Assault Offenses - Aggravated Assault & 1991 & 28,127 & 11.16\textbackslash{}\%\\
\hline
Robbery & 1991 & 4,509 & 1.79\textbackslash{}\%\\
\hline
Burglary/Breaking And Entering & 1991 & 4,023 & 1.60\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - All Other Larceny & 1993 & 3,010 & 1.19\textbackslash{}\%\\
\hline
Arson & 1991 & 1,518 & 0.60\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug/Narcotic Violations & 1993 & 1,462 & 0.58\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Motor Vehicle & 1993 & 942 & 0.37\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Other & 1991 & 925 & 0.37\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Shoplifting & 1993 & 853 & 0.34\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft From Building & 1994 & 685 & 0.27\textbackslash{}\%\\
\hline
Motor Vehicle Theft & 1992 & 614 & 0.24\textbackslash{}\%\\
\hline
Weapon Law Violations & 1993 & 501 & 0.20\textbackslash{}\%\\
\hline
Drug/Narcotic Offenses - Drug Equipment Violations & 1995 & 403 & 0.16\textbackslash{}\%\\
\hline
Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1997 & 378 & 0.15\textbackslash{}\%\\
\hline
Murder/Nonnegligent Manslaughter & 1991 & 348 & 0.14\textbackslash{}\%\\
\hline
Sex Offenses - Rape & 1991 & 329 & 0.13\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 1993 & 265 & 0.11\textbackslash{}\%\\
\hline
Sex Offenses - Fondling - Indecent Liberties/Child Molest & 1993 & 265 & 0.11\textbackslash{}\%\\
\hline
Counterfeiting/Forgery & 1993 & 256 & 0.10\textbackslash{}\%\\
\hline
Fraud Offenses - Credit Card/Atm Fraud & 1995 & 189 & 0.07\textbackslash{}\%\\
\hline
Kidnapping/Abduction & 1994 & 173 & 0.07\textbackslash{}\%\\
\hline
Fraud Offenses - Impersonation & 2001 & 155 & 0.06\textbackslash{}\%\\
\hline
Stolen Property Offenses (Receiving, Selling, Etc.) & 1996 & 148 & 0.06\textbackslash{}\%\\
\hline
Fraud Offenses - Other & 2016 & 122 & 0.05\textbackslash{}\%\\
\hline
Pornography/Obscene Material & 1995 & 89 & 0.04\textbackslash{}\%\\
\hline
Sex Offenses - Sodomy & 1995 & 86 & 0.03\textbackslash{}\%\\
\hline
Extortion/Blackmail & 1997 & 77 & 0.03\textbackslash{}\%\\
\hline
Embezzlement & 1995 & 71 & 0.03\textbackslash{}\%\\
\hline
Sex Offenses - Sexual Assault With An Object & 1996 & 50 & 0.02\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Purse-Snatching & 1995 & 31 & 0.01\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Pocket-Picking & 1996 & 30 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Wire Fraud & 2006 & 29 & 0.01\textbackslash{}\%\\
\hline
Sex Offenses - Statutory Rape & 1999 & 22 & 0.01\textbackslash{}\%\\
\hline
Undocumented Code & 2018 & 17 & 0.01\textbackslash{}\%\\
\hline
Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & 1999 & 16 & 0.01\textbackslash{}\%\\
\hline
Prostitution Offenses - Prostitution & 2001 & 15 & 0.01\textbackslash{}\%\\
\hline
Fraud Offenses - Welfare Fraud & 1996 & 10 & 0.00\textbackslash{}\%\\
\hline
Negligent Manslaughter & 1999 & 8 & 0.00\textbackslash{}\%\\
\hline
Prostitution Offenses - Assisting Or Promoting Prostitution & 2013 & 7 & 0.00\textbackslash{}\%\\
\hline
Sex Offenses - Incest & 1997 & 7 & 0.00\textbackslash{}\%\\
\hline
Bribery & 2014 & 6 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Commercial Sex Acts & 2017 & 4 & 0.00\textbackslash{}\%\\
\hline
Prostitution Offenses - Purchasing Prostitution & 2013 & 2 & 0.00\textbackslash{}\%\\
\hline
Human Trafficking - Involuntary Servitude & 2021 & 1 & 0.00\textbackslash{}\%\\
\hline
Gambling Offenses - Betting/Wagering & 2017 & 1 & 0.00\textbackslash{}\%\\
\hline
\end{longtable}



Agencies that report to the FBI's National Incident-Based Reporting System (NIBRS) can also report bias motivations for their crimes, and these reports are included in this dataset. One tricky thing is that the crimes included are different depending on if the agency reported through NIBRS or to the dataset directly, and are not NIBRS reporting agencies. NIBRS agencies report all of the crimes as the agencies directly submitting SRS data, but have a wider variety of crimes they can report. In practice, however, both NIBRS and SRS reporting agencies can report the most common offenses so there is relatively little difference.



\begin{longtable}[t]{l|l|l|r|r}
\caption{(\#tab:hateBiasOffense)The number and percent of offenses by bias motivation, 2023.}\\
\hline
  & Bias Motivation & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateBiasOffense)The number and percent of offenses by bias motivation, 2023. \textit{(continued)}}\\
\hline
  & Bias Motivation & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
...1 & Anti-American Indian Or Native Alaskan & Assault Offenses - Simple Assault & 561 & 19.49\textbackslash{}\%\\
\hline
...2 & Anti-American Indian Or Native Alaskan & Assault Offenses - Intimidation & 432 & 15.01\textbackslash{}\%\\
\hline
...3 & Anti-American Indian Or Native Alaskan & Destruction/Damage/Vandalism of Property & 415 & 14.42\textbackslash{}\%\\
\hline
...4 & Anti-American Indian Or Native Alaskan & Assault Offenses - Aggravated Assault & 284 & 9.87\textbackslash{}\%\\
\hline
...5 & Anti-American Indian Or Native Alaskan & Larceny/Theft Offenses - All Other Larceny & 202 & 7.02\textbackslash{}\%\\
\hline
...6 & Anti-American Indian Or Native Alaskan & All Other & 984 & 34.16\textbackslash{}\%\\
\hline
...7 & Anti-American Indian Or Native Alaskan & Total & 2,878 & 100\textbackslash{}\%\\
\hline
...8 & Anti-Arab & Assault Offenses - Intimidation & 634 & 38.82\textbackslash{}\%\\
\hline
...9 & Anti-Arab & Assault Offenses - Simple Assault & 385 & 23.58\textbackslash{}\%\\
\hline
...10 & Anti-Arab & Destruction/Damage/Vandalism of Property & 308 & 18.86\textbackslash{}\%\\
\hline
...11 & Anti-Arab & Assault Offenses - Aggravated Assault & 182 & 11.15\textbackslash{}\%\\
\hline
...12 & Anti-Arab & Burglary/Breaking And Entering & 21 & 1.29\textbackslash{}\%\\
\hline
...13 & Anti-Arab & All Other & 103 & 6.27\textbackslash{}\%\\
\hline
...14 & Anti-Arab & Total & 1,633 & 100\textbackslash{}\%\\
\hline
...15 & Anti-Asian & Assault Offenses - Intimidation & 2,683 & 33.17\textbackslash{}\%\\
\hline
...16 & Anti-Asian & Destruction/Damage/Vandalism of Property & 2,067 & 25.56\textbackslash{}\%\\
\hline
...17 & Anti-Asian & Assault Offenses - Simple Assault & 1,920 & 23.74\textbackslash{}\%\\
\hline
...18 & Anti-Asian & Assault Offenses - Aggravated Assault & 803 & 9.93\textbackslash{}\%\\
\hline
...19 & Anti-Asian & Burglary/Breaking And Entering & 157 & 1.94\textbackslash{}\%\\
\hline
...20 & Anti-Asian & All Other & 458 & 5.63\textbackslash{}\%\\
\hline
...21 & Anti-Asian & Total & 8,088 & 100\textbackslash{}\%\\
\hline
...22 & Anti-Atheism/Agnosticism & Destruction/Damage/Vandalism of Property & 75 & 34.40\textbackslash{}\%\\
\hline
...23 & Anti-Atheism/Agnosticism & Assault Offenses - Simple Assault & 25 & 11.47\textbackslash{}\%\\
\hline
...24 & Anti-Atheism/Agnosticism & Larceny/Theft Offenses - All Other Larceny & 24 & 11.01\textbackslash{}\%\\
\hline
...25 & Anti-Atheism/Agnosticism & Assault Offenses - Intimidation & 21 & 9.63\textbackslash{}\%\\
\hline
...26 & Anti-Atheism/Agnosticism & Burglary/Breaking And Entering & 14 & 6.42\textbackslash{}\%\\
\hline
...27 & Anti-Atheism/Agnosticism & All Other & 59 & 27.09\textbackslash{}\%\\
\hline
...28 & Anti-Atheism/Agnosticism & Total & 218 & 100\textbackslash{}\%\\
\hline
...29 & Anti-Bisexual & Assault Offenses - Simple Assault & 196 & 28.65\textbackslash{}\%\\
\hline
...30 & Anti-Bisexual & Assault Offenses - Intimidation & 134 & 19.59\textbackslash{}\%\\
\hline
...31 & Anti-Bisexual & Destruction/Damage/Vandalism of Property & 93 & 13.60\textbackslash{}\%\\
\hline
...32 & Anti-Bisexual & Assault Offenses - Aggravated Assault & 67 & 9.80\textbackslash{}\%\\
\hline
...33 & Anti-Bisexual & Larceny/Theft Offenses - All Other Larceny & 47 & 6.87\textbackslash{}\%\\
\hline
...34 & Anti-Bisexual & All Other & 147 & 21.49\textbackslash{}\%\\
\hline
...35 & Anti-Bisexual & Total & 684 & 100\textbackslash{}\%\\
\hline
...36 & Anti-Black & Assault Offenses - Intimidation & 30,996 & 36.68\textbackslash{}\%\\
\hline
...37 & Anti-Black & Destruction/Damage/Vandalism of Property & 24,150 & 28.58\textbackslash{}\%\\
\hline
...38 & Anti-Black & Assault Offenses - Simple Assault & 15,481 & 18.32\textbackslash{}\%\\
\hline
...39 & Anti-Black & Assault Offenses - Aggravated Assault & 10,128 & 11.98\textbackslash{}\%\\
\hline
...40 & Anti-Black & Burglary/Breaking And Entering & 1,003 & 1.19\textbackslash{}\%\\
\hline
...41 & Anti-Black & All Other & 2,750 & 3.23\textbackslash{}\%\\
\hline
...42 & Anti-Black & Total & 84,508 & 100\textbackslash{}\%\\
\hline
...43 & Anti-Buddhist & Destruction/Damage/Vandalism of Property & 41 & 31.54\textbackslash{}\%\\
\hline
...44 & Anti-Buddhist & Assault Offenses - Simple Assault & 17 & 13.08\textbackslash{}\%\\
\hline
...45 & Anti-Buddhist & Larceny/Theft Offenses - All Other Larceny & 13 & 10.00\textbackslash{}\%\\
\hline
...46 & Anti-Buddhist & Assault Offenses - Aggravated Assault & 8 & 6.15\textbackslash{}\%\\
\hline
...47 & Anti-Buddhist & Burglary/Breaking And Entering & 6 & 4.62\textbackslash{}\%\\
\hline
...48 & Anti-Buddhist & All Other & 45 & 34.65\textbackslash{}\%\\
\hline
...49 & Anti-Buddhist & Total & 130 & 100\textbackslash{}\%\\
\hline
...50 & Anti-Catholic & Destruction/Damage/Vandalism of Property & 1,115 & 58.87\textbackslash{}\%\\
\hline
...51 & Anti-Catholic & Assault Offenses - Intimidation & 213 & 11.25\textbackslash{}\%\\
\hline
...52 & Anti-Catholic & Assault Offenses - Simple Assault & 97 & 5.12\textbackslash{}\%\\
\hline
...53 & Anti-Catholic & Burglary/Breaking And Entering & 86 & 4.54\textbackslash{}\%\\
\hline
...54 & Anti-Catholic & Larceny/Theft Offenses - All Other Larceny & 63 & 3.33\textbackslash{}\%\\
\hline
...55 & Anti-Catholic & All Other & 320 & 16.89\textbackslash{}\%\\
\hline
...56 & Anti-Catholic & Total & 1,894 & 100\textbackslash{}\%\\
\hline
...57 & Anti-Church of Jesus Christ (Mormon) & Destruction/Damage/Vandalism of Property & 51 & 43.22\textbackslash{}\%\\
\hline
...58 & Anti-Church of Jesus Christ (Mormon) & Assault Offenses - Intimidation & 14 & 11.86\textbackslash{}\%\\
\hline
...59 & Anti-Church of Jesus Christ (Mormon) & Burglary/Breaking And Entering & 13 & 11.02\textbackslash{}\%\\
\hline
...60 & Anti-Church of Jesus Christ (Mormon) & Assault Offenses - Simple Assault & 12 & 10.17\textbackslash{}\%\\
\hline
...61 & Anti-Church of Jesus Christ (Mormon) & Arson & 7 & 5.93\textbackslash{}\%\\
\hline
...62 & Anti-Church of Jesus Christ (Mormon) & All Other & 21 & 17.78\textbackslash{}\%\\
\hline
...63 & Anti-Church of Jesus Christ (Mormon) & Total & 118 & 100\textbackslash{}\%\\
\hline
...64 & Anti-Eastern Orthodox (Greek, Russian, Other) & Destruction/Damage/Vandalism of Property & 74 & 16.78\textbackslash{}\%\\
\hline
...65 & Anti-Eastern Orthodox (Greek, Russian, Other) & Assault Offenses - Simple Assault & 49 & 11.11\textbackslash{}\%\\
\hline
...66 & Anti-Eastern Orthodox (Greek, Russian, Other) & Larceny/Theft Offenses - All Other Larceny & 49 & 11.11\textbackslash{}\%\\
\hline
...67 & Anti-Eastern Orthodox (Greek, Russian, Other) & Drug/Narcotic Offenses - Drug/Narcotic Violations & 41 & 9.30\textbackslash{}\%\\
\hline
...68 & Anti-Eastern Orthodox (Greek, Russian, Other) & Burglary/Breaking And Entering & 34 & 7.71\textbackslash{}\%\\
\hline
...69 & Anti-Eastern Orthodox (Greek, Russian, Other) & All Other & 194 & 44.02\textbackslash{}\%\\
\hline
...70 & Anti-Eastern Orthodox (Greek, Russian, Other) & Total & 441 & 100\textbackslash{}\%\\
\hline
...71 & Anti-Female & Assault Offenses - Intimidation & 149 & 27.64\textbackslash{}\%\\
\hline
...72 & Anti-Female & Assault Offenses - Simple Assault & 137 & 25.42\textbackslash{}\%\\
\hline
...73 & Anti-Female & Assault Offenses - Aggravated Assault & 69 & 12.80\textbackslash{}\%\\
\hline
...74 & Anti-Female & Destruction/Damage/Vandalism of Property & 67 & 12.43\textbackslash{}\%\\
\hline
...75 & Anti-Female & Sex Offenses - Rape & 16 & 2.97\textbackslash{}\%\\
\hline
...76 & Anti-Female & All Other & 101 & 18.76\textbackslash{}\%\\
\hline
...77 & Anti-Female & Total & 539 & 100\textbackslash{}\%\\
\hline
...78 & Anti-Gay (Male) & Assault Offenses - Simple Assault & 7,944 & 31.87\textbackslash{}\%\\
\hline
...79 & Anti-Gay (Male) & Assault Offenses - Intimidation & 6,771 & 27.16\textbackslash{}\%\\
\hline
...80 & Anti-Gay (Male) & Destruction/Damage/Vandalism of Property & 4,271 & 17.13\textbackslash{}\%\\
\hline
...81 & Anti-Gay (Male) & Assault Offenses - Aggravated Assault & 3,999 & 16.04\textbackslash{}\%\\
\hline
...82 & Anti-Gay (Male) & Robbery & 1,079 & 4.33\textbackslash{}\%\\
\hline
...83 & Anti-Gay (Male) & All Other & 863 & 3.48\textbackslash{}\%\\
\hline
...84 & Anti-Gay (Male) & Total & 24,927 & 100\textbackslash{}\%\\
\hline
...85 & Anti-Gender Non-Conforming & Assault Offenses - Simple Assault & 150 & 22.97\textbackslash{}\%\\
\hline
...86 & Anti-Gender Non-Conforming & Destruction/Damage/Vandalism of Property & 104 & 15.93\textbackslash{}\%\\
\hline
...87 & Anti-Gender Non-Conforming & Assault Offenses - Intimidation & 74 & 11.33\textbackslash{}\%\\
\hline
...88 & Anti-Gender Non-Conforming & Larceny/Theft Offenses - All Other Larceny & 58 & 8.88\textbackslash{}\%\\
\hline
...89 & Anti-Gender Non-Conforming & Assault Offenses - Aggravated Assault & 57 & 8.73\textbackslash{}\%\\
\hline
...90 & Anti-Gender Non-Conforming & All Other & 210 & 32.16\textbackslash{}\%\\
\hline
...91 & Anti-Gender Non-Conforming & Total & 653 & 100\textbackslash{}\%\\
\hline
...92 & Anti-Heterosexual & Assault Offenses - Intimidation & 156 & 24.88\textbackslash{}\%\\
\hline
...93 & Anti-Heterosexual & Destruction/Damage/Vandalism of Property & 154 & 24.56\textbackslash{}\%\\
\hline
...94 & Anti-Heterosexual & Assault Offenses - Simple Assault & 116 & 18.50\textbackslash{}\%\\
\hline
...95 & Anti-Heterosexual & Assault Offenses - Aggravated Assault & 43 & 6.86\textbackslash{}\%\\
\hline
...96 & Anti-Heterosexual & Larceny/Theft Offenses - All Other Larceny & 24 & 3.83\textbackslash{}\%\\
\hline
...97 & Anti-Heterosexual & All Other & 134 & 21.41\textbackslash{}\%\\
\hline
...98 & Anti-Heterosexual & Total & 627 & 100\textbackslash{}\%\\
\hline
...99 & Anti-Hindu & Assault Offenses - Intimidation & 39 & 30.47\textbackslash{}\%\\
\hline
...100 & Anti-Hindu & Destruction/Damage/Vandalism of Property & 33 & 25.78\textbackslash{}\%\\
\hline
...101 & Anti-Hindu & Assault Offenses - Simple Assault & 25 & 19.53\textbackslash{}\%\\
\hline
...102 & Anti-Hindu & Assault Offenses - Aggravated Assault & 8 & 6.25\textbackslash{}\%\\
\hline
...103 & Anti-Hindu & Burglary/Breaking And Entering & 5 & 3.91\textbackslash{}\%\\
\hline
...104 & Anti-Hindu & All Other & 18 & 14.04\textbackslash{}\%\\
\hline
...105 & Anti-Hindu & Total & 128 & 100\textbackslash{}\%\\
\hline
...106 & Anti-Hispanic Or Latino & Assault Offenses - Intimidation & 5,033 & 31.01\textbackslash{}\%\\
\hline
...107 & Anti-Hispanic Or Latino & Assault Offenses - Simple Assault & 4,278 & 26.36\textbackslash{}\%\\
\hline
...108 & Anti-Hispanic Or Latino & Assault Offenses - Aggravated Assault & 2,994 & 18.45\textbackslash{}\%\\
\hline
...109 & Anti-Hispanic Or Latino & Destruction/Damage/Vandalism of Property & 2,694 & 16.60\textbackslash{}\%\\
\hline
...110 & Anti-Hispanic Or Latino & Robbery & 544 & 3.35\textbackslash{}\%\\
\hline
...111 & Anti-Hispanic Or Latino & All Other & 688 & 4.24\textbackslash{}\%\\
\hline
...112 & Anti-Hispanic Or Latino & Total & 16,231 & 100\textbackslash{}\%\\
\hline
...113 & Anti-Islamic (Muslim) & Assault Offenses - Intimidation & 1,808 & 40.47\textbackslash{}\%\\
\hline
...114 & Anti-Islamic (Muslim) & Destruction/Damage/Vandalism of Property & 1,174 & 26.28\textbackslash{}\%\\
\hline
...115 & Anti-Islamic (Muslim) & Assault Offenses - Simple Assault & 856 & 19.16\textbackslash{}\%\\
\hline
...116 & Anti-Islamic (Muslim) & Assault Offenses - Aggravated Assault & 332 & 7.43\textbackslash{}\%\\
\hline
...117 & Anti-Islamic (Muslim) & Arson & 61 & 1.37\textbackslash{}\%\\
\hline
...118 & Anti-Islamic (Muslim) & All Other & 237 & 5.28\textbackslash{}\%\\
\hline
...119 & Anti-Islamic (Muslim) & Total & 4,468 & 100\textbackslash{}\%\\
\hline
...120 & Anti-Jehovahs Witness & Destruction/Damage/Vandalism of Property & 22 & 32.84\textbackslash{}\%\\
\hline
...121 & Anti-Jehovahs Witness & Assault Offenses - Intimidation & 10 & 14.93\textbackslash{}\%\\
\hline
...122 & Anti-Jehovahs Witness & Assault Offenses - Simple Assault & 9 & 13.43\textbackslash{}\%\\
\hline
...123 & Anti-Jehovahs Witness & Assault Offenses - Aggravated Assault & 6 & 8.96\textbackslash{}\%\\
\hline
...124 & Anti-Jehovahs Witness & Larceny/Theft Offenses - All Other Larceny & 4 & 5.97\textbackslash{}\%\\
\hline
...125 & Anti-Jehovahs Witness & All Other & 16 & 23.89\textbackslash{}\%\\
\hline
...126 & Anti-Jehovahs Witness & Total & 67 & 100\textbackslash{}\%\\
\hline
...127 & Anti-Jewish & Destruction/Damage/Vandalism of Property & 20,381 & 64.01\textbackslash{}\%\\
\hline
...128 & Anti-Jewish & Assault Offenses - Intimidation & 8,246 & 25.90\textbackslash{}\%\\
\hline
...129 & Anti-Jewish & Assault Offenses - Simple Assault & 1,665 & 5.23\textbackslash{}\%\\
\hline
...130 & Anti-Jewish & Assault Offenses - Aggravated Assault & 471 & 1.48\textbackslash{}\%\\
\hline
...131 & Anti-Jewish & Burglary/Breaking And Entering & 341 & 1.07\textbackslash{}\%\\
\hline
...132 & Anti-Jewish & All Other & 734 & 2.32\textbackslash{}\%\\
\hline
...133 & Anti-Jewish & Total & 31,838 & 100\textbackslash{}\%\\
\hline
...134 & Anti-Lesbian (Female) & Assault Offenses - Intimidation & 1,684 & 33.41\textbackslash{}\%\\
\hline
...135 & Anti-Lesbian (Female) & Assault Offenses - Simple Assault & 1,284 & 25.47\textbackslash{}\%\\
\hline
...136 & Anti-Lesbian (Female) & Destruction/Damage/Vandalism of Property & 1,100 & 21.82\textbackslash{}\%\\
\hline
...137 & Anti-Lesbian (Female) & Assault Offenses - Aggravated Assault & 620 & 12.30\textbackslash{}\%\\
\hline
...138 & Anti-Lesbian (Female) & Burglary/Breaking And Entering & 64 & 1.27\textbackslash{}\%\\
\hline
...139 & Anti-Lesbian (Female) & All Other & 289 & 5.74\textbackslash{}\%\\
\hline
...140 & Anti-Lesbian (Female) & Total & 5,041 & 100\textbackslash{}\%\\
\hline
...141 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Destruction/Damage/Vandalism of Property & 2,488 & 28.65\textbackslash{}\%\\
\hline
...142 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Intimidation & 2,122 & 24.44\textbackslash{}\%\\
\hline
...143 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Simple Assault & 2,104 & 24.23\textbackslash{}\%\\
\hline
...144 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Assault Offenses - Aggravated Assault & 1,027 & 11.83\textbackslash{}\%\\
\hline
...145 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Larceny/Theft Offenses - All Other Larceny & 320 & 3.68\textbackslash{}\%\\
\hline
...146 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & All Other & 623 & 7.16\textbackslash{}\%\\
\hline
...147 & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & Total & 8,684 & 100\textbackslash{}\%\\
\hline
...148 & Anti-Male & Assault Offenses - Simple Assault & 50 & 25.77\textbackslash{}\%\\
\hline
...149 & Anti-Male & Assault Offenses - Intimidation & 41 & 21.13\textbackslash{}\%\\
\hline
...150 & Anti-Male & Destruction/Damage/Vandalism of Property & 21 & 10.82\textbackslash{}\%\\
\hline
...151 & Anti-Male & Assault Offenses - Aggravated Assault & 19 & 9.79\textbackslash{}\%\\
\hline
...152 & Anti-Male & Burglary/Breaking And Entering & 10 & 5.15\textbackslash{}\%\\
\hline
...153 & Anti-Male & All Other & 53 & 27.38\textbackslash{}\%\\
\hline
...154 & Anti-Male & Total & 194 & 100\textbackslash{}\%\\
\hline
...155 & Anti-Mental Disability & Assault Offenses - Simple Assault & 381 & 26.48\textbackslash{}\%\\
\hline
...156 & Anti-Mental Disability & Assault Offenses - Intimidation & 223 & 15.50\textbackslash{}\%\\
\hline
...157 & Anti-Mental Disability & Destruction/Damage/Vandalism of Property & 177 & 12.30\textbackslash{}\%\\
\hline
...158 & Anti-Mental Disability & Assault Offenses - Aggravated Assault & 147 & 10.22\textbackslash{}\%\\
\hline
...159 & Anti-Mental Disability & Larceny/Theft Offenses - All Other Larceny & 118 & 8.20\textbackslash{}\%\\
\hline
...160 & Anti-Mental Disability & All Other & 393 & 27.35\textbackslash{}\%\\
\hline
...161 & Anti-Mental Disability & Total & 1,439 & 100\textbackslash{}\%\\
\hline
...162 & Anti-Multiple Races, Group & Destruction/Damage/Vandalism of Property & 2,899 & 49.34\textbackslash{}\%\\
\hline
...163 & Anti-Multiple Races, Group & Assault Offenses - Intimidation & 1,570 & 26.72\textbackslash{}\%\\
\hline
...164 & Anti-Multiple Races, Group & Assault Offenses - Simple Assault & 657 & 11.18\textbackslash{}\%\\
\hline
...165 & Anti-Multiple Races, Group & Assault Offenses - Aggravated Assault & 415 & 7.06\textbackslash{}\%\\
\hline
...166 & Anti-Multiple Races, Group & Burglary/Breaking And Entering & 105 & 1.79\textbackslash{}\%\\
\hline
...167 & Anti-Multiple Races, Group & All Other & 230 & 3.93\textbackslash{}\%\\
\hline
...168 & Anti-Multiple Races, Group & Total & 5,876 & 100\textbackslash{}\%\\
\hline
...169 & Anti-Multiple Religions, Group & Destruction/Damage/Vandalism of Property & 793 & 58.65\textbackslash{}\%\\
\hline
...170 & Anti-Multiple Religions, Group & Assault Offenses - Intimidation & 204 & 15.09\textbackslash{}\%\\
\hline
...171 & Anti-Multiple Religions, Group & Assault Offenses - Simple Assault & 94 & 6.95\textbackslash{}\%\\
\hline
...172 & Anti-Multiple Religions, Group & Larceny/Theft Offenses - All Other Larceny & 54 & 3.99\textbackslash{}\%\\
\hline
...173 & Anti-Multiple Religions, Group & Burglary/Breaking And Entering & 49 & 3.62\textbackslash{}\%\\
\hline
...174 & Anti-Multiple Religions, Group & All Other & 158 & 11.68\textbackslash{}\%\\
\hline
...175 & Anti-Multiple Religions, Group & Total & 1,352 & 100\textbackslash{}\%\\
\hline
...176 & Anti-Native Hawaiian Or Other Pacific Islander & Assault Offenses - Simple Assault & 40 & 20.20\textbackslash{}\%\\
\hline
...177 & Anti-Native Hawaiian Or Other Pacific Islander & Assault Offenses - Intimidation & 27 & 13.64\textbackslash{}\%\\
\hline
...178 & Anti-Native Hawaiian Or Other Pacific Islander & Destruction/Damage/Vandalism of Property & 21 & 10.61\textbackslash{}\%\\
\hline
...179 & Anti-Native Hawaiian Or Other Pacific Islander & Assault Offenses - Aggravated Assault & 19 & 9.60\textbackslash{}\%\\
\hline
...180 & Anti-Native Hawaiian Or Other Pacific Islander & Larceny/Theft Offenses - All Other Larceny & 14 & 7.07\textbackslash{}\%\\
\hline
...181 & Anti-Native Hawaiian Or Other Pacific Islander & All Other & 77 & 38.94\textbackslash{}\%\\
\hline
...182 & Anti-Native Hawaiian Or Other Pacific Islander & Total & 198 & 100\textbackslash{}\%\\
\hline
...183 & Anti-Other Christian & Destruction/Damage/Vandalism of Property & 238 & 50.42\textbackslash{}\%\\
\hline
...184 & Anti-Other Christian & Assault Offenses - Intimidation & 80 & 16.95\textbackslash{}\%\\
\hline
...185 & Anti-Other Christian & Assault Offenses - Simple Assault & 33 & 6.99\textbackslash{}\%\\
\hline
...186 & Anti-Other Christian & Arson & 28 & 5.93\textbackslash{}\%\\
\hline
...187 & Anti-Other Christian & Burglary/Breaking And Entering & 25 & 5.30\textbackslash{}\%\\
\hline
...188 & Anti-Other Christian & All Other & 68 & 14.4\textbackslash{}\%\\
\hline
...189 & Anti-Other Christian & Total & 472 & 100\textbackslash{}\%\\
\hline
...190 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Intimidation & 4,131 & 34.72\textbackslash{}\%\\
\hline
...191 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Destruction/Damage/Vandalism of Property & 3,378 & 28.39\textbackslash{}\%\\
\hline
...192 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Simple Assault & 2,343 & 19.69\textbackslash{}\%\\
\hline
...193 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Assault Offenses - Aggravated Assault & 1,164 & 9.78\textbackslash{}\%\\
\hline
...194 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Burglary/Breaking And Entering & 190 & 1.60\textbackslash{}\%\\
\hline
...195 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & All Other & 693 & 5.84\textbackslash{}\%\\
\hline
...196 & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & Total & 11,899 & 100\textbackslash{}\%\\
\hline
...197 & Anti-Other Religion & Destruction/Damage/Vandalism of Property & 2,111 & 56.43\textbackslash{}\%\\
\hline
...198 & Anti-Other Religion & Assault Offenses - Intimidation & 746 & 19.94\textbackslash{}\%\\
\hline
...199 & Anti-Other Religion & Assault Offenses - Simple Assault & 238 & 6.36\textbackslash{}\%\\
\hline
...200 & Anti-Other Religion & Burglary/Breaking And Entering & 161 & 4.30\textbackslash{}\%\\
\hline
...201 & Anti-Other Religion & Assault Offenses - Aggravated Assault & 119 & 3.18\textbackslash{}\%\\
\hline
...202 & Anti-Other Religion & All Other & 366 & 9.8\textbackslash{}\%\\
\hline
...203 & Anti-Other Religion & Total & 3,741 & 100\textbackslash{}\%\\
\hline
...204 & Anti-Physical Disability & Assault Offenses - Simple Assault & 248 & 28.51\textbackslash{}\%\\
\hline
...205 & Anti-Physical Disability & Assault Offenses - Intimidation & 182 & 20.92\textbackslash{}\%\\
\hline
...206 & Anti-Physical Disability & Destruction/Damage/Vandalism of Property & 91 & 10.46\textbackslash{}\%\\
\hline
...207 & Anti-Physical Disability & Assault Offenses - Aggravated Assault & 78 & 8.97\textbackslash{}\%\\
\hline
...208 & Anti-Physical Disability & Larceny/Theft Offenses - All Other Larceny & 69 & 7.93\textbackslash{}\%\\
\hline
...209 & Anti-Physical Disability & All Other & 202 & 23.13\textbackslash{}\%\\
\hline
...210 & Anti-Physical Disability & Total & 870 & 100\textbackslash{}\%\\
\hline
...211 & Anti-Protestant & Destruction/Damage/Vandalism of Property & 818 & 58.89\textbackslash{}\%\\
\hline
...212 & Anti-Protestant & Assault Offenses - Intimidation & 134 & 9.65\textbackslash{}\%\\
\hline
...213 & Anti-Protestant & Burglary/Breaking And Entering & 93 & 6.70\textbackslash{}\%\\
\hline
...214 & Anti-Protestant & Assault Offenses - Simple Assault & 72 & 5.18\textbackslash{}\%\\
\hline
...215 & Anti-Protestant & Larceny/Theft Offenses - All Other Larceny & 64 & 4.61\textbackslash{}\%\\
\hline
...216 & Anti-Protestant & All Other & 208 & 14.97\textbackslash{}\%\\
\hline
...217 & Anti-Protestant & Total & 1,389 & 100\textbackslash{}\%\\
\hline
...218 & Anti-Sikh & Destruction/Damage/Vandalism of Property & 124 & 15.10\textbackslash{}\%\\
\hline
...219 & Anti-Sikh & Larceny/Theft Offenses - All Other Larceny & 116 & 14.13\textbackslash{}\%\\
\hline
...220 & Anti-Sikh & Assault Offenses - Simple Assault & 100 & 12.18\textbackslash{}\%\\
\hline
...221 & Anti-Sikh & Drug/Narcotic Offenses - Drug/Narcotic Violations & 62 & 7.55\textbackslash{}\%\\
\hline
...222 & Anti-Sikh & Burglary/Breaking And Entering & 53 & 6.46\textbackslash{}\%\\
\hline
...223 & Anti-Sikh & All Other & 366 & 44.56\textbackslash{}\%\\
\hline
...224 & Anti-Sikh & Total & 821 & 100\textbackslash{}\%\\
\hline
...225 & Anti-Transgender & Assault Offenses - Simple Assault & 610 & 32.88\textbackslash{}\%\\
\hline
...226 & Anti-Transgender & Assault Offenses - Intimidation & 467 & 25.18\textbackslash{}\%\\
\hline
...227 & Anti-Transgender & Assault Offenses - Aggravated Assault & 345 & 18.60\textbackslash{}\%\\
\hline
...228 & Anti-Transgender & Destruction/Damage/Vandalism of Property & 164 & 8.84\textbackslash{}\%\\
\hline
...229 & Anti-Transgender & Robbery & 71 & 3.83\textbackslash{}\%\\
\hline
...230 & Anti-Transgender & All Other & 198 & 10.65\textbackslash{}\%\\
\hline
...231 & Anti-Transgender & Total & 1,855 & 100\textbackslash{}\%\\
\hline
...232 & Anti-White & Assault Offenses - Simple Assault & 8,233 & 29.20\textbackslash{}\%\\
\hline
...233 & Anti-White & Assault Offenses - Intimidation & 6,280 & 22.28\textbackslash{}\%\\
\hline
...234 & Anti-White & Assault Offenses - Aggravated Assault & 4,528 & 16.06\textbackslash{}\%\\
\hline
...235 & Anti-White & Destruction/Damage/Vandalism of Property & 3,811 & 13.52\textbackslash{}\%\\
\hline
...236 & Anti-White & Robbery & 1,153 & 4.09\textbackslash{}\%\\
\hline
...237 & Anti-White & All Other & 4,187 & 14.83\textbackslash{}\%\\
\hline
...238 & Anti-White & Total & 28,192 & 100\textbackslash{}\%\\
\hline
1 & Undocumented Code & Destruction/Damage/Vandalism of Property & 1 & 100.00\textbackslash{}\%\\
\hline
NA & NA & NA & NA & NA\\
\hline
NA.1 & NA & NA & NA & NA\\
\hline
NA.2 & NA & NA & NA & NA\\
\hline
NA.3 & NA & NA & NA & NA\\
\hline
...244 & Undocumented Code & All Other & NA & NA\textbackslash{}\%\\
\hline
...245 & Undocumented Code & Total & 1 & 100\textbackslash{}\%\\
\hline
\end{longtable}





\begin{longtable}[t]{l|l|l|r|r}
\caption{(\#tab:hateOffenseBias)The number and percent of biases by offense, 2023.}\\
\hline
  & Offense & Bias Motivation & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateOffenseBias)The number and percent of biases by offense, 2023. \textit{(continued)}}\\
\hline
  & Offense & Bias Motivation & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
...1 & Arson & Anti-Black & 449 & 29.58\textbackslash{}\%\\
\hline
...2 & Arson & Anti-Jewish & 178 & 11.73\textbackslash{}\%\\
\hline
...3 & Arson & Anti-Other Religion & 110 & 7.25\textbackslash{}\%\\
\hline
...4 & Arson & Anti-Gay (Male) & 97 & 6.39\textbackslash{}\%\\
\hline
...5 & Arson & Anti-White & 96 & 6.32\textbackslash{}\%\\
\hline
...6 & Arson & All Other & 588 & 38.75\textbackslash{}\%\\
\hline
...7 & Arson & Total & 1,518 & 100\textbackslash{}\%\\
\hline
...8 & Assault Offenses - Aggravated Assault & Anti-Black & 10,128 & 36.01\textbackslash{}\%\\
\hline
...9 & Assault Offenses - Aggravated Assault & Anti-White & 4,528 & 16.10\textbackslash{}\%\\
\hline
...10 & Assault Offenses - Aggravated Assault & Anti-Gay (Male) & 3,999 & 14.22\textbackslash{}\%\\
\hline
...11 & Assault Offenses - Aggravated Assault & Anti-Hispanic Or Latino & 2,994 & 10.64\textbackslash{}\%\\
\hline
...12 & Assault Offenses - Aggravated Assault & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 1,164 & 4.14\textbackslash{}\%\\
\hline
...13 & Assault Offenses - Aggravated Assault & All Other & 5,314 & 18.89\textbackslash{}\%\\
\hline
...14 & Assault Offenses - Aggravated Assault & Total & 28,127 & 100\textbackslash{}\%\\
\hline
...15 & Assault Offenses - Intimidation & Anti-Black & 30,996 & 41.12\textbackslash{}\%\\
\hline
...16 & Assault Offenses - Intimidation & Anti-Jewish & 8,246 & 10.94\textbackslash{}\%\\
\hline
...17 & Assault Offenses - Intimidation & Anti-Gay (Male) & 6,771 & 8.98\textbackslash{}\%\\
\hline
...18 & Assault Offenses - Intimidation & Anti-White & 6,280 & 8.33\textbackslash{}\%\\
\hline
...19 & Assault Offenses - Intimidation & Anti-Hispanic Or Latino & 5,033 & 6.68\textbackslash{}\%\\
\hline
...20 & Assault Offenses - Intimidation & All Other & 18,055 & 23.96\textbackslash{}\%\\
\hline
...21 & Assault Offenses - Intimidation & Total & 75,381 & 100\textbackslash{}\%\\
\hline
...22 & Assault Offenses - Simple Assault & Anti-Black & 15,481 & 30.71\textbackslash{}\%\\
\hline
...23 & Assault Offenses - Simple Assault & Anti-White & 8,233 & 16.33\textbackslash{}\%\\
\hline
...24 & Assault Offenses - Simple Assault & Anti-Gay (Male) & 7,944 & 15.76\textbackslash{}\%\\
\hline
...25 & Assault Offenses - Simple Assault & Anti-Hispanic Or Latino & 4,278 & 8.49\textbackslash{}\%\\
\hline
...26 & Assault Offenses - Simple Assault & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 2,343 & 4.65\textbackslash{}\%\\
\hline
...27 & Assault Offenses - Simple Assault & All Other & 12,131 & 24.06\textbackslash{}\%\\
\hline
...28 & Assault Offenses - Simple Assault & Total & 50,410 & 100\textbackslash{}\%\\
\hline
...29 & Bribery & Anti-Black & 2 & 33.33\textbackslash{}\%\\
\hline
...30 & Bribery & Anti-White & 1 & 16.67\textbackslash{}\%\\
\hline
...31 & Bribery & Anti-Heterosexual & 1 & 16.67\textbackslash{}\%\\
\hline
...32 & Bribery & Anti-Arab & 1 & 16.67\textbackslash{}\%\\
\hline
...33 & Bribery & Anti-Gay (Male) & 1 & 16.67\textbackslash{}\%\\
\hline
...34 & Bribery & All Other & NA & NA\textbackslash{}\%\\
\hline
...35 & Bribery & Total & 6 & 100\textbackslash{}\%\\
\hline
...36 & Burglary/Breaking And Entering & Anti-Black & 1,003 & 24.93\textbackslash{}\%\\
\hline
...37 & Burglary/Breaking And Entering & Anti-White & 641 & 15.93\textbackslash{}\%\\
\hline
...38 & Burglary/Breaking And Entering & Anti-Jewish & 341 & 8.48\textbackslash{}\%\\
\hline
...39 & Burglary/Breaking And Entering & Anti-Gay (Male) & 241 & 5.99\textbackslash{}\%\\
\hline
...40 & Burglary/Breaking And Entering & Anti-Hispanic Or Latino & 212 & 5.27\textbackslash{}\%\\
\hline
...41 & Burglary/Breaking And Entering & All Other & 1,585 & 39.4\textbackslash{}\%\\
\hline
...42 & Burglary/Breaking And Entering & Total & 4,023 & 100\textbackslash{}\%\\
\hline
...43 & Counterfeiting/Forgery & Anti-White & 103 & 40.23\textbackslash{}\%\\
\hline
...44 & Counterfeiting/Forgery & Anti-Black & 25 & 9.77\textbackslash{}\%\\
\hline
...45 & Counterfeiting/Forgery & Anti-American Indian Or Native Alaskan & 21 & 8.20\textbackslash{}\%\\
\hline
...46 & Counterfeiting/Forgery & Anti-Catholic & 11 & 4.30\textbackslash{}\%\\
\hline
...47 & Counterfeiting/Forgery & Anti-Sikh & 10 & 3.91\textbackslash{}\%\\
\hline
...48 & Counterfeiting/Forgery & All Other & 86 & 33.54\textbackslash{}\%\\
\hline
...49 & Counterfeiting/Forgery & Total & 256 & 100\textbackslash{}\%\\
\hline
...50 & Destruction/Damage/Vandalism of Property & Anti-Black & 24,150 & 31.98\textbackslash{}\%\\
\hline
...51 & Destruction/Damage/Vandalism of Property & Anti-Jewish & 20,381 & 26.99\textbackslash{}\%\\
\hline
...52 & Destruction/Damage/Vandalism of Property & Anti-Gay (Male) & 4,271 & 5.66\textbackslash{}\%\\
\hline
...53 & Destruction/Damage/Vandalism of Property & Anti-White & 3,811 & 5.05\textbackslash{}\%\\
\hline
...54 & Destruction/Damage/Vandalism of Property & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 3,378 & 4.47\textbackslash{}\%\\
\hline
...55 & Destruction/Damage/Vandalism of Property & All Other & 19,533 & 25.87\textbackslash{}\%\\
\hline
...56 & Destruction/Damage/Vandalism of Property & Total & 75,524 & 100\textbackslash{}\%\\
\hline
...57 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-White & 131 & 32.51\textbackslash{}\%\\
\hline
...58 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-American Indian Or Native Alaskan & 58 & 14.39\textbackslash{}\%\\
\hline
...59 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-Eastern Orthodox (Greek, Russian, Other) & 26 & 6.45\textbackslash{}\%\\
\hline
...60 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-Sikh & 24 & 5.96\textbackslash{}\%\\
\hline
...61 & Drug/Narcotic Offenses - Drug Equipment Violations & Anti-Black & 19 & 4.71\textbackslash{}\%\\
\hline
...62 & Drug/Narcotic Offenses - Drug Equipment Violations & All Other & 145 & 35.96\textbackslash{}\%\\
\hline
...63 & Drug/Narcotic Offenses - Drug Equipment Violations & Total & 403 & 100\textbackslash{}\%\\
\hline
...64 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-White & 495 & 33.86\textbackslash{}\%\\
\hline
...65 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-Black & 248 & 16.96\textbackslash{}\%\\
\hline
...66 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-American Indian Or Native Alaskan & 156 & 10.67\textbackslash{}\%\\
\hline
...67 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-Sikh & 62 & 4.24\textbackslash{}\%\\
\hline
...68 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Anti-Hispanic Or Latino & 46 & 3.15\textbackslash{}\%\\
\hline
...69 & Drug/Narcotic Offenses - Drug/Narcotic Violations & All Other & 455 & 31.15\textbackslash{}\%\\
\hline
...70 & Drug/Narcotic Offenses - Drug/Narcotic Violations & Total & 1,462 & 100\textbackslash{}\%\\
\hline
...71 & Embezzlement & Anti-White & 24 & 33.80\textbackslash{}\%\\
\hline
...72 & Embezzlement & Anti-American Indian Or Native Alaskan & 9 & 12.68\textbackslash{}\%\\
\hline
...73 & Embezzlement & Anti-Mental Disability & 6 & 8.45\textbackslash{}\%\\
\hline
...74 & Embezzlement & Anti-Black & 5 & 7.04\textbackslash{}\%\\
\hline
...75 & Embezzlement & Anti-Physical Disability & 5 & 7.04\textbackslash{}\%\\
\hline
...76 & Embezzlement & All Other & 22 & 31.02\textbackslash{}\%\\
\hline
...77 & Embezzlement & Total & 71 & 100\textbackslash{}\%\\
\hline
...78 & Extortion/Blackmail & Anti-Gay (Male) & 17 & 22.08\textbackslash{}\%\\
\hline
...79 & Extortion/Blackmail & Anti-White & 9 & 11.69\textbackslash{}\%\\
\hline
...80 & Extortion/Blackmail & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 7 & 9.09\textbackslash{}\%\\
\hline
...81 & Extortion/Blackmail & Anti-Black & 7 & 9.09\textbackslash{}\%\\
\hline
...82 & Extortion/Blackmail & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 7 & 9.09\textbackslash{}\%\\
\hline
...83 & Extortion/Blackmail & All Other & 30 & 38.97\textbackslash{}\%\\
\hline
...84 & Extortion/Blackmail & Total & 77 & 100\textbackslash{}\%\\
\hline
...85 & Fraud Offenses - Credit Card/Atm Fraud & Anti-White & 57 & 30.16\textbackslash{}\%\\
\hline
...86 & Fraud Offenses - Credit Card/Atm Fraud & Anti-American Indian Or Native Alaskan & 18 & 9.52\textbackslash{}\%\\
\hline
...87 & Fraud Offenses - Credit Card/Atm Fraud & Anti-Sikh & 14 & 7.41\textbackslash{}\%\\
\hline
...88 & Fraud Offenses - Credit Card/Atm Fraud & Anti-Mental Disability & 14 & 7.41\textbackslash{}\%\\
\hline
...89 & Fraud Offenses - Credit Card/Atm Fraud & Anti-Black & 10 & 5.29\textbackslash{}\%\\
\hline
...90 & Fraud Offenses - Credit Card/Atm Fraud & All Other & 76 & 40.23\textbackslash{}\%\\
\hline
...91 & Fraud Offenses - Credit Card/Atm Fraud & Total & 189 & 100\textbackslash{}\%\\
\hline
...92 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-White & 123 & 32.54\textbackslash{}\%\\
\hline
...93 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-Black & 34 & 8.99\textbackslash{}\%\\
\hline
...94 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-Mental Disability & 29 & 7.67\textbackslash{}\%\\
\hline
...95 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-Sikh & 28 & 7.41\textbackslash{}\%\\
\hline
...96 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Anti-American Indian Or Native Alaskan & 18 & 4.76\textbackslash{}\%\\
\hline
...97 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & All Other & 146 & 38.62\textbackslash{}\%\\
\hline
...98 & Fraud Offenses - False Pretenses/Swindle/Confidence Game & Total & 378 & 100\textbackslash{}\%\\
\hline
...99 & Fraud Offenses - Impersonation & Anti-White & 43 & 27.74\textbackslash{}\%\\
\hline
...100 & Fraud Offenses - Impersonation & Anti-Black & 23 & 14.84\textbackslash{}\%\\
\hline
...101 & Fraud Offenses - Impersonation & Anti-American Indian Or Native Alaskan & 23 & 14.84\textbackslash{}\%\\
\hline
...102 & Fraud Offenses - Impersonation & Anti-Hispanic Or Latino & 11 & 7.10\textbackslash{}\%\\
\hline
...103 & Fraud Offenses - Impersonation & Anti-Catholic & 5 & 3.23\textbackslash{}\%\\
\hline
...104 & Fraud Offenses - Impersonation & All Other & 50 & 32.32\textbackslash{}\%\\
\hline
...105 & Fraud Offenses - Impersonation & Total & 155 & 100\textbackslash{}\%\\
\hline
...106 & Fraud Offenses - Other & Anti-White & 34 & 27.87\textbackslash{}\%\\
\hline
...107 & Fraud Offenses - Other & Anti-Sikh & 12 & 9.84\textbackslash{}\%\\
\hline
...108 & Fraud Offenses - Other & Anti-Black & 12 & 9.84\textbackslash{}\%\\
\hline
...109 & Fraud Offenses - Other & Anti-American Indian Or Native Alaskan & 12 & 9.84\textbackslash{}\%\\
\hline
...110 & Fraud Offenses - Other & Anti-Mental Disability & 6 & 4.92\textbackslash{}\%\\
\hline
...111 & Fraud Offenses - Other & All Other & 46 & 37.72\textbackslash{}\%\\
\hline
...112 & Fraud Offenses - Other & Total & 122 & 100\textbackslash{}\%\\
\hline
1...113 & Fraud Offenses - Welfare Fraud & Anti-White & 6 & 60.00\textbackslash{}\%\\
\hline
2...114 & Fraud Offenses - Welfare Fraud & Anti-Mental Disability & 2 & 20.00\textbackslash{}\%\\
\hline
3...115 & Fraud Offenses - Welfare Fraud & Anti-American Indian Or Native Alaskan & 1 & 10.00\textbackslash{}\%\\
\hline
4...116 & Fraud Offenses - Welfare Fraud & Anti-Arab & 1 & 10.00\textbackslash{}\%\\
\hline
NA...117 & NA & NA & NA & NA\\
\hline
...118 & Fraud Offenses - Welfare Fraud & All Other & NA & NA\textbackslash{}\%\\
\hline
...119 & Fraud Offenses - Welfare Fraud & Total & 10 & 100\textbackslash{}\%\\
\hline
...120 & Fraud Offenses - Wire Fraud & Anti-White & 8 & 27.59\textbackslash{}\%\\
\hline
...121 & Fraud Offenses - Wire Fraud & Anti-Gender Non-Conforming & 3 & 10.34\textbackslash{}\%\\
\hline
...122 & Fraud Offenses - Wire Fraud & Anti-Catholic & 2 & 6.90\textbackslash{}\%\\
\hline
...123 & Fraud Offenses - Wire Fraud & Anti-Female & 2 & 6.90\textbackslash{}\%\\
\hline
...124 & Fraud Offenses - Wire Fraud & Anti-Multiple Races, Group & 2 & 6.90\textbackslash{}\%\\
\hline
...125 & Fraud Offenses - Wire Fraud & All Other & 12 & 41.4\textbackslash{}\%\\
\hline
...126 & Fraud Offenses - Wire Fraud & Total & 29 & 100\textbackslash{}\%\\
\hline
1...127 & Gambling Offenses - Betting/Wagering & Anti-Physical Disability & 1 & 100.00\textbackslash{}\%\\
\hline
NA...128 & NA & NA & NA & NA\\
\hline
NA.1...129 & NA & NA & NA & NA\\
\hline
NA.2...130 & NA & NA & NA & NA\\
\hline
NA.3...131 & NA & NA & NA & NA\\
\hline
...132 & Gambling Offenses - Betting/Wagering & All Other & NA & NA\textbackslash{}\%\\
\hline
...133 & Gambling Offenses - Betting/Wagering & Total & 1 & 100\textbackslash{}\%\\
\hline
1...134 & Human Trafficking - Commercial Sex Acts & Anti-Transgender & 1 & 25.00\textbackslash{}\%\\
\hline
2...135 & Human Trafficking - Commercial Sex Acts & Anti-Asian & 1 & 25.00\textbackslash{}\%\\
\hline
3...136 & Human Trafficking - Commercial Sex Acts & Anti-Physical Disability & 1 & 25.00\textbackslash{}\%\\
\hline
4...137 & Human Trafficking - Commercial Sex Acts & Anti-Black & 1 & 25.00\textbackslash{}\%\\
\hline
NA...138 & NA & NA & NA & NA\\
\hline
...139 & Human Trafficking - Commercial Sex Acts & All Other & NA & NA\textbackslash{}\%\\
\hline
...140 & Human Trafficking - Commercial Sex Acts & Total & 4 & 100\textbackslash{}\%\\
\hline
1...141 & Human Trafficking - Involuntary Servitude & Anti-Female & 1 & 100.00\textbackslash{}\%\\
\hline
NA...142 & NA & NA & NA & NA\\
\hline
NA.1...143 & NA & NA & NA & NA\\
\hline
NA.2...144 & NA & NA & NA & NA\\
\hline
NA.3...145 & NA & NA & NA & NA\\
\hline
...146 & Human Trafficking - Involuntary Servitude & All Other & NA & NA\textbackslash{}\%\\
\hline
...147 & Human Trafficking - Involuntary Servitude & Total & 1 & 100\textbackslash{}\%\\
\hline
...148 & Kidnapping/Abduction & Anti-Black & 31 & 17.92\textbackslash{}\%\\
\hline
...149 & Kidnapping/Abduction & Anti-White & 31 & 17.92\textbackslash{}\%\\
\hline
...150 & Kidnapping/Abduction & Anti-Gay (Male) & 13 & 7.51\textbackslash{}\%\\
\hline
...151 & Kidnapping/Abduction & Anti-Hispanic Or Latino & 11 & 6.36\textbackslash{}\%\\
\hline
...152 & Kidnapping/Abduction & Anti-Transgender & 9 & 5.20\textbackslash{}\%\\
\hline
...153 & Kidnapping/Abduction & All Other & 78 & 45.08\textbackslash{}\%\\
\hline
...154 & Kidnapping/Abduction & Total & 173 & 100\textbackslash{}\%\\
\hline
...155 & Larceny/Theft Offenses - All Other Larceny & Anti-White & 824 & 27.38\textbackslash{}\%\\
\hline
...156 & Larceny/Theft Offenses - All Other Larceny & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 320 & 10.63\textbackslash{}\%\\
\hline
...157 & Larceny/Theft Offenses - All Other Larceny & Anti-Black & 271 & 9.00\textbackslash{}\%\\
\hline
...158 & Larceny/Theft Offenses - All Other Larceny & Anti-American Indian Or Native Alaskan & 202 & 6.71\textbackslash{}\%\\
\hline
...159 & Larceny/Theft Offenses - All Other Larceny & Anti-Mental Disability & 118 & 3.92\textbackslash{}\%\\
\hline
...160 & Larceny/Theft Offenses - All Other Larceny & All Other & 1,275 & 42.36\textbackslash{}\%\\
\hline
...161 & Larceny/Theft Offenses - All Other Larceny & Total & 3,010 & 100\textbackslash{}\%\\
\hline
...162 & Larceny/Theft Offenses - Other & Anti-Black & 178 & 19.24\textbackslash{}\%\\
\hline
...163 & Larceny/Theft Offenses - Other & Anti-Jewish & 176 & 19.03\textbackslash{}\%\\
\hline
...164 & Larceny/Theft Offenses - Other & Anti-Gay (Male) & 84 & 9.08\textbackslash{}\%\\
\hline
...165 & Larceny/Theft Offenses - Other & Anti-White & 76 & 8.22\textbackslash{}\%\\
\hline
...166 & Larceny/Theft Offenses - Other & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 62 & 6.70\textbackslash{}\%\\
\hline
...167 & Larceny/Theft Offenses - Other & All Other & 349 & 37.73\textbackslash{}\%\\
\hline
...168 & Larceny/Theft Offenses - Other & Total & 925 & 100\textbackslash{}\%\\
\hline
...169 & Larceny/Theft Offenses - Pocket-Picking & Anti-Black & 8 & 26.67\textbackslash{}\%\\
\hline
...170 & Larceny/Theft Offenses - Pocket-Picking & Anti-White & 7 & 23.33\textbackslash{}\%\\
\hline
...171 & Larceny/Theft Offenses - Pocket-Picking & Anti-Hispanic Or Latino & 4 & 13.33\textbackslash{}\%\\
\hline
...172 & Larceny/Theft Offenses - Pocket-Picking & Anti-American Indian Or Native Alaskan & 3 & 10.00\textbackslash{}\%\\
\hline
...173 & Larceny/Theft Offenses - Pocket-Picking & Anti-Physical Disability & 2 & 6.67\textbackslash{}\%\\
\hline
...174 & Larceny/Theft Offenses - Pocket-Picking & All Other & 6 & 19.98\textbackslash{}\%\\
\hline
...175 & Larceny/Theft Offenses - Pocket-Picking & Total & 30 & 100\textbackslash{}\%\\
\hline
...176 & Larceny/Theft Offenses - Purse-Snatching & Anti-White & 10 & 32.26\textbackslash{}\%\\
\hline
...177 & Larceny/Theft Offenses - Purse-Snatching & Anti-Black & 3 & 9.68\textbackslash{}\%\\
\hline
...178 & Larceny/Theft Offenses - Purse-Snatching & Anti-American Indian Or Native Alaskan & 3 & 9.68\textbackslash{}\%\\
\hline
...179 & Larceny/Theft Offenses - Purse-Snatching & Anti-Gay (Male) & 2 & 6.45\textbackslash{}\%\\
\hline
...180 & Larceny/Theft Offenses - Purse-Snatching & Anti-Bisexual & 2 & 6.45\textbackslash{}\%\\
\hline
...181 & Larceny/Theft Offenses - Purse-Snatching & All Other & 11 & 35.51\textbackslash{}\%\\
\hline
...182 & Larceny/Theft Offenses - Purse-Snatching & Total & 31 & 100\textbackslash{}\%\\
\hline
...183 & Larceny/Theft Offenses - Shoplifting & Anti-White & 285 & 33.41\textbackslash{}\%\\
\hline
...184 & Larceny/Theft Offenses - Shoplifting & Anti-Black & 92 & 10.79\textbackslash{}\%\\
\hline
...185 & Larceny/Theft Offenses - Shoplifting & Anti-American Indian Or Native Alaskan & 88 & 10.32\textbackslash{}\%\\
\hline
...186 & Larceny/Theft Offenses - Shoplifting & Anti-Sikh & 35 & 4.10\textbackslash{}\%\\
\hline
...187 & Larceny/Theft Offenses - Shoplifting & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 31 & 3.63\textbackslash{}\%\\
\hline
...188 & Larceny/Theft Offenses - Shoplifting & All Other & 322 & 37.77\textbackslash{}\%\\
\hline
...189 & Larceny/Theft Offenses - Shoplifting & Total & 853 & 100\textbackslash{}\%\\
\hline
...190 & Larceny/Theft Offenses - Theft From Building & Anti-White & 206 & 30.07\textbackslash{}\%\\
\hline
...191 & Larceny/Theft Offenses - Theft From Building & Anti-Black & 61 & 8.91\textbackslash{}\%\\
\hline
...192 & Larceny/Theft Offenses - Theft From Building & Anti-American Indian Or Native Alaskan & 54 & 7.88\textbackslash{}\%\\
\hline
...193 & Larceny/Theft Offenses - Theft From Building & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 47 & 6.86\textbackslash{}\%\\
\hline
...194 & Larceny/Theft Offenses - Theft From Building & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 33 & 4.82\textbackslash{}\%\\
\hline
...195 & Larceny/Theft Offenses - Theft From Building & All Other & 284 & 41.49\textbackslash{}\%\\
\hline
...196 & Larceny/Theft Offenses - Theft From Building & Total & 685 & 100\textbackslash{}\%\\
\hline
...197 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-White & 313 & 33.23\textbackslash{}\%\\
\hline
...198 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-American Indian Or Native Alaskan & 102 & 10.83\textbackslash{}\%\\
\hline
...199 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-Black & 91 & 9.66\textbackslash{}\%\\
\hline
...200 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-Sikh & 43 & 4.56\textbackslash{}\%\\
\hline
...201 & Larceny/Theft Offenses - Theft From Motor Vehicle & Anti-Hispanic Or Latino & 40 & 4.25\textbackslash{}\%\\
\hline
...202 & Larceny/Theft Offenses - Theft From Motor Vehicle & All Other & 353 & 37.46\textbackslash{}\%\\
\hline
...203 & Larceny/Theft Offenses - Theft From Motor Vehicle & Total & 942 & 100\textbackslash{}\%\\
\hline
...204 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-White & 91 & 34.34\textbackslash{}\%\\
\hline
...205 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-Black & 27 & 10.19\textbackslash{}\%\\
\hline
...206 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-American Indian Or Native Alaskan & 26 & 9.81\textbackslash{}\%\\
\hline
...207 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-Sikh & 14 & 5.28\textbackslash{}\%\\
\hline
...208 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 10 & 3.77\textbackslash{}\%\\
\hline
...209 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & All Other & 97 & 36.59\textbackslash{}\%\\
\hline
...210 & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & Total & 265 & 100\textbackslash{}\%\\
\hline
...211 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-White & 4 & 25.00\textbackslash{}\%\\
\hline
...212 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-American Indian Or Native Alaskan & 3 & 18.75\textbackslash{}\%\\
\hline
...213 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-Physical Disability & 3 & 18.75\textbackslash{}\%\\
\hline
...214 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-Black & 2 & 12.50\textbackslash{}\%\\
\hline
...215 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Anti-Sikh & 1 & 6.25\textbackslash{}\%\\
\hline
...216 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & All Other & 3 & 18.75\textbackslash{}\%\\
\hline
...217 & Larceny/Theft Offenses - Theft Rom Coin-Operated Machine Or Device & Total & 16 & 100\textbackslash{}\%\\
\hline
...218 & Motor Vehicle Theft & Anti-White & 173 & 28.18\textbackslash{}\%\\
\hline
...219 & Motor Vehicle Theft & Anti-Black & 87 & 14.17\textbackslash{}\%\\
\hline
...220 & Motor Vehicle Theft & Anti-American Indian Or Native Alaskan & 81 & 13.19\textbackslash{}\%\\
\hline
...221 & Motor Vehicle Theft & Anti-Sikh & 31 & 5.05\textbackslash{}\%\\
\hline
...222 & Motor Vehicle Theft & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 25 & 4.07\textbackslash{}\%\\
\hline
...223 & Motor Vehicle Theft & All Other & 217 & 35.34\textbackslash{}\%\\
\hline
...224 & Motor Vehicle Theft & Total & 614 & 100\textbackslash{}\%\\
\hline
...225 & Murder/Nonnegligent Manslaughter & Anti-Black & 82 & 23.56\textbackslash{}\%\\
\hline
...226 & Murder/Nonnegligent Manslaughter & Anti-Gay (Male) & 65 & 18.68\textbackslash{}\%\\
\hline
...227 & Murder/Nonnegligent Manslaughter & Anti-White & 52 & 14.94\textbackslash{}\%\\
\hline
...228 & Murder/Nonnegligent Manslaughter & Anti-Hispanic Or Latino & 42 & 12.07\textbackslash{}\%\\
\hline
...229 & Murder/Nonnegligent Manslaughter & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 16 & 4.60\textbackslash{}\%\\
\hline
...230 & Murder/Nonnegligent Manslaughter & All Other & 91 & 26.14\textbackslash{}\%\\
\hline
...231 & Murder/Nonnegligent Manslaughter & Total & 348 & 100\textbackslash{}\%\\
\hline
...232 & Negligent Manslaughter & Anti-American Indian Or Native Alaskan & 2 & 25.00\textbackslash{}\%\\
\hline
...233 & Negligent Manslaughter & Anti-Physical Disability & 2 & 25.00\textbackslash{}\%\\
\hline
...234 & Negligent Manslaughter & Anti-Black & 2 & 25.00\textbackslash{}\%\\
\hline
...235 & Negligent Manslaughter & Anti-Hispanic Or Latino & 1 & 12.50\textbackslash{}\%\\
\hline
...236 & Negligent Manslaughter & Anti-White & 1 & 12.50\textbackslash{}\%\\
\hline
...237 & Negligent Manslaughter & All Other & NA & NA\textbackslash{}\%\\
\hline
...238 & Negligent Manslaughter & Total & 8 & 100\textbackslash{}\%\\
\hline
...239 & Pornography/Obscene Material & Anti-Black & 15 & 16.85\textbackslash{}\%\\
\hline
...240 & Pornography/Obscene Material & Anti-White & 10 & 11.24\textbackslash{}\%\\
\hline
...241 & Pornography/Obscene Material & Anti-Female & 7 & 7.87\textbackslash{}\%\\
\hline
...242 & Pornography/Obscene Material & Anti-Gay (Male) & 6 & 6.74\textbackslash{}\%\\
\hline
...243 & Pornography/Obscene Material & Anti-American Indian Or Native Alaskan & 6 & 6.74\textbackslash{}\%\\
\hline
...244 & Pornography/Obscene Material & All Other & 45 & 50.54\textbackslash{}\%\\
\hline
...245 & Pornography/Obscene Material & Total & 89 & 100\textbackslash{}\%\\
\hline
...246 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-Mental Disability & 2 & 28.57\textbackslash{}\%\\
\hline
...247 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-White & 1 & 14.29\textbackslash{}\%\\
\hline
...248 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-Gender Non-Conforming & 1 & 14.29\textbackslash{}\%\\
\hline
...249 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-Black & 1 & 14.29\textbackslash{}\%\\
\hline
...250 & Prostitution Offenses - Assisting Or Promoting Prostitution & Anti-Male & 1 & 14.29\textbackslash{}\%\\
\hline
...251 & Prostitution Offenses - Assisting Or Promoting Prostitution & All Other & 1 & 14.29\textbackslash{}\%\\
\hline
...252 & Prostitution Offenses - Assisting Or Promoting Prostitution & Total & 7 & 100\textbackslash{}\%\\
\hline
1...253 & Prostitution Offenses - Prostitution & Anti-White & 10 & 66.67\textbackslash{}\%\\
\hline
2...254 & Prostitution Offenses - Prostitution & Anti-Asian & 3 & 20.00\textbackslash{}\%\\
\hline
3...255 & Prostitution Offenses - Prostitution & Anti-Lesbian (Female) & 1 & 6.67\textbackslash{}\%\\
\hline
4...256 & Prostitution Offenses - Prostitution & Anti-Other Religion & 1 & 6.67\textbackslash{}\%\\
\hline
NA...257 & NA & NA & NA & NA\\
\hline
...258 & Prostitution Offenses - Prostitution & All Other & NA & NA\textbackslash{}\%\\
\hline
...259 & Prostitution Offenses - Prostitution & Total & 15 & 100\textbackslash{}\%\\
\hline
1...260 & Prostitution Offenses - Purchasing Prostitution & Anti-Asian & 1 & 50.00\textbackslash{}\%\\
\hline
2...261 & Prostitution Offenses - Purchasing Prostitution & Anti-Heterosexual & 1 & 50.00\textbackslash{}\%\\
\hline
NA...262 & NA & NA & NA & NA\\
\hline
NA.1...263 & NA & NA & NA & NA\\
\hline
NA.2...264 & NA & NA & NA & NA\\
\hline
...265 & Prostitution Offenses - Purchasing Prostitution & All Other & NA & NA\textbackslash{}\%\\
\hline
...266 & Prostitution Offenses - Purchasing Prostitution & Total & 2 & 100\textbackslash{}\%\\
\hline
...267 & Robbery & Anti-White & 1,153 & 25.57\textbackslash{}\%\\
\hline
...268 & Robbery & Anti-Gay (Male) & 1,079 & 23.93\textbackslash{}\%\\
\hline
...269 & Robbery & Anti-Black & 673 & 14.93\textbackslash{}\%\\
\hline
...270 & Robbery & Anti-Hispanic Or Latino & 544 & 12.06\textbackslash{}\%\\
\hline
...271 & Robbery & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 215 & 4.77\textbackslash{}\%\\
\hline
...272 & Robbery & All Other & 845 & 18.71\textbackslash{}\%\\
\hline
...273 & Robbery & Total & 4,509 & 100\textbackslash{}\%\\
\hline
...274 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-White & 62 & 23.40\textbackslash{}\%\\
\hline
...275 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-Black & 33 & 12.45\textbackslash{}\%\\
\hline
...276 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-Gay (Male) & 32 & 12.08\textbackslash{}\%\\
\hline
...277 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-Mental Disability & 18 & 6.79\textbackslash{}\%\\
\hline
...278 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Anti-American Indian Or Native Alaskan & 14 & 5.28\textbackslash{}\%\\
\hline
...279 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & All Other & 106 & 39.98\textbackslash{}\%\\
\hline
...280 & Sex Offenses - Fondling - Indecent Liberties/Child Molest & Total & 265 & 100\textbackslash{}\%\\
\hline
...281 & Sex Offenses - Incest & Anti-White & 2 & 28.57\textbackslash{}\%\\
\hline
...282 & Sex Offenses - Incest & Anti-American Indian Or Native Alaskan & 1 & 14.29\textbackslash{}\%\\
\hline
...283 & Sex Offenses - Incest & Anti-Heterosexual & 1 & 14.29\textbackslash{}\%\\
\hline
...284 & Sex Offenses - Incest & Anti-Lesbian (Female) & 1 & 14.29\textbackslash{}\%\\
\hline
...285 & Sex Offenses - Incest & Anti-Bisexual & 1 & 14.29\textbackslash{}\%\\
\hline
...286 & Sex Offenses - Incest & All Other & 1 & 14.29\textbackslash{}\%\\
\hline
...287 & Sex Offenses - Incest & Total & 7 & 100\textbackslash{}\%\\
\hline
...288 & Sex Offenses - Rape & Anti-White & 83 & 25.23\textbackslash{}\%\\
\hline
...289 & Sex Offenses - Rape & Anti-Lesbian (Female) & 50 & 15.20\textbackslash{}\%\\
\hline
...290 & Sex Offenses - Rape & Anti-Black & 46 & 13.98\textbackslash{}\%\\
\hline
...291 & Sex Offenses - Rape & Anti-Mental Disability & 20 & 6.08\textbackslash{}\%\\
\hline
...292 & Sex Offenses - Rape & Anti-Female & 16 & 4.86\textbackslash{}\%\\
\hline
...293 & Sex Offenses - Rape & All Other & 114 & 34.63\textbackslash{}\%\\
\hline
...294 & Sex Offenses - Rape & Total & 329 & 100\textbackslash{}\%\\
\hline
...295 & Sex Offenses - Sexual Assault With An Object & Anti-Gay (Male) & 12 & 24.00\textbackslash{}\%\\
\hline
...296 & Sex Offenses - Sexual Assault With An Object & Anti-Black & 7 & 14.00\textbackslash{}\%\\
\hline
...297 & Sex Offenses - Sexual Assault With An Object & Anti-White & 7 & 14.00\textbackslash{}\%\\
\hline
...298 & Sex Offenses - Sexual Assault With An Object & Anti-Lesbian (Female) & 5 & 10.00\textbackslash{}\%\\
\hline
...299 & Sex Offenses - Sexual Assault With An Object & Anti-Transgender & 4 & 8.00\textbackslash{}\%\\
\hline
...300 & Sex Offenses - Sexual Assault With An Object & All Other & 15 & 30\textbackslash{}\%\\
\hline
...301 & Sex Offenses - Sexual Assault With An Object & Total & 50 & 100\textbackslash{}\%\\
\hline
...302 & Sex Offenses - Sodomy & Anti-Gay (Male) & 27 & 31.40\textbackslash{}\%\\
\hline
...303 & Sex Offenses - Sodomy & Anti-White & 11 & 12.79\textbackslash{}\%\\
\hline
...304 & Sex Offenses - Sodomy & Anti-Lesbian, Gay, Bisexual, Or Transgender (Mixed Group) & 10 & 11.63\textbackslash{}\%\\
\hline
...305 & Sex Offenses - Sodomy & Anti-Heterosexual & 8 & 9.30\textbackslash{}\%\\
\hline
...306 & Sex Offenses - Sodomy & Anti-Transgender & 7 & 8.14\textbackslash{}\%\\
\hline
...307 & Sex Offenses - Sodomy & All Other & 23 & 26.75\textbackslash{}\%\\
\hline
...308 & Sex Offenses - Sodomy & Total & 86 & 100\textbackslash{}\%\\
\hline
...309 & Sex Offenses - Statutory Rape & Anti-White & 7 & 31.82\textbackslash{}\%\\
\hline
...310 & Sex Offenses - Statutory Rape & Anti-Gay (Male) & 2 & 9.09\textbackslash{}\%\\
\hline
...311 & Sex Offenses - Statutory Rape & Anti-Black & 2 & 9.09\textbackslash{}\%\\
\hline
...312 & Sex Offenses - Statutory Rape & Anti-Heterosexual & 2 & 9.09\textbackslash{}\%\\
\hline
...313 & Sex Offenses - Statutory Rape & Anti-American Indian Or Native Alaskan & 2 & 9.09\textbackslash{}\%\\
\hline
...314 & Sex Offenses - Statutory Rape & All Other & 7 & 31.85\textbackslash{}\%\\
\hline
...315 & Sex Offenses - Statutory Rape & Total & 22 & 100\textbackslash{}\%\\
\hline
...316 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-White & 47 & 31.76\textbackslash{}\%\\
\hline
...317 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-American Indian Or Native Alaskan & 20 & 13.51\textbackslash{}\%\\
\hline
...318 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-Black & 17 & 11.49\textbackslash{}\%\\
\hline
...319 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-Sikh & 8 & 5.41\textbackslash{}\%\\
\hline
...320 & Stolen Property Offenses (Receiving, Selling, Etc.) & Anti-Mental Disability & 6 & 4.05\textbackslash{}\%\\
\hline
...321 & Stolen Property Offenses (Receiving, Selling, Etc.) & All Other & 50 & 33.79\textbackslash{}\%\\
\hline
...322 & Stolen Property Offenses (Receiving, Selling, Etc.) & Total & 148 & 100\textbackslash{}\%\\
\hline
...323 & Undocumented Code & Anti-White & 5 & 29.41\textbackslash{}\%\\
\hline
...324 & Undocumented Code & Anti-Black & 4 & 23.53\textbackslash{}\%\\
\hline
...325 & Undocumented Code & Anti-American Indian Or Native Alaskan & 3 & 17.65\textbackslash{}\%\\
\hline
...326 & Undocumented Code & Anti-Catholic & 1 & 5.88\textbackslash{}\%\\
\hline
...327 & Undocumented Code & Anti-Male & 1 & 5.88\textbackslash{}\%\\
\hline
...328 & Undocumented Code & All Other & 3 & 17.64\textbackslash{}\%\\
\hline
...329 & Undocumented Code & Total & 17 & 100\textbackslash{}\%\\
\hline
...330 & Weapon Law Violations & Anti-Black & 179 & 35.73\textbackslash{}\%\\
\hline
...331 & Weapon Law Violations & Anti-White & 98 & 19.56\textbackslash{}\%\\
\hline
...332 & Weapon Law Violations & Anti-American Indian Or Native Alaskan & 26 & 5.19\textbackslash{}\%\\
\hline
...333 & Weapon Law Violations & Anti-Hispanic Or Latino & 26 & 5.19\textbackslash{}\%\\
\hline
...334 & Weapon Law Violations & Anti-Other Race, Ethnicity, Ancestry, Or National Origin & 20 & 3.99\textbackslash{}\%\\
\hline
...335 & Weapon Law Violations & All Other & 152 & 30.38\textbackslash{}\%\\
\hline
...336 & Weapon Law Violations & Total & 501 & 100\textbackslash{}\%\\
\hline
\end{longtable}




### The location of the crime

This data is interesting because it includes the location - in categories for types of places, not actual addresses - of the incident. This is important since the type of location can be a factor in whether the incident is classified as a hate crime. For example, spray paint on a synagogue or a mosque is much more likely to be a hate crime than spray paint on a wall of an abandoned building. Table \@ref(tab:hateLocations) shows the locations of hate crimes, including the first year that location was reported. Each hate crime incident can have multiple locations (up to ten) since each offense can have its own incident, but in most cases (96.6%) a hate crime only has a single location. 

As with the crime and the bias motivation, the available locations have increased as time went on, though these newer locations are relatively uncommon. One important change in location is that starting in 2010 the location of "school/college" was split to have one location be for elementary and high schools and another location be for colleges and universities. The majority of hate crimes occur in the victim's home (30%), on a road or alley (19%), in an other or unknown location (13%), and in a parking lot or parking garage (6%). All other locations occur in fewer than 5% of hate crimes. 


\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hateLocations)The location of hate crime incidents. In incidents with multiple locations, this shows only the first location recorded.}\\
\hline
Location & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hateLocations)The location of hate crime incidents. In incidents with multiple locations, this shows only the first location recorded. \textit{(continued)}}\\
\hline
Location & First Year Reported & \# of Incidents & \% of Incidents\\
\hline
\endhead
Total &  & 252,094 & 100\textbackslash{}\%\\
\hline
Residence/Home & 1991 & 73,887 & 29.31\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & 1991 & 47,006 & 18.65\textbackslash{}\%\\
\hline
Other/Unknown & 1991 & 32,073 & 12.72\textbackslash{}\%\\
\hline
School/College & 1991 & 17,679 & 7.01\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & 1991 & 14,389 & 5.71\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & 1991 & 9,454 & 3.75\textbackslash{}\%\\
\hline
Commercial/Office Building & 1991 & 5,673 & 2.25\textbackslash{}\%\\
\hline
Restaurant & 1991 & 5,419 & 2.15\textbackslash{}\%\\
\hline
School - Elementary/Secondary & 2010 & 4,899 & 1.94\textbackslash{}\%\\
\hline
Bar/Nightclub & 1991 & 4,270 & 1.69\textbackslash{}\%\\
\hline
Government/Public Building & 1991 & 3,785 & 1.50\textbackslash{}\%\\
\hline
Convenience Store & 1991 & 3,531 & 1.40\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & 1991 & 2,926 & 1.16\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & 1991 & 2,728 & 1.08\textbackslash{}\%\\
\hline
Service/Gas Station & 1991 & 2,414 & 0.96\textbackslash{}\%\\
\hline
Park/Playground & 2010 & 2,356 & 0.93\textbackslash{}\%\\
\hline
School - College/University & 2010 & 2,351 & 0.93\textbackslash{}\%\\
\hline
Grocery/Supermarket & 1991 & 2,325 & 0.92\textbackslash{}\%\\
\hline
Field/Woods & 1991 & 2,241 & 0.89\textbackslash{}\%\\
\hline
Department/Discount Store & 1991 & 2,159 & 0.86\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & 1991 & 2,121 & 0.84\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & 1991 & 1,858 & 0.74\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & 1991 & 1,738 & 0.69\textbackslash{}\%\\
\hline
Construction Site & 1991 & 698 & 0.28\textbackslash{}\%\\
\hline
Bank/Savings And Loan & 1991 & 596 & 0.24\textbackslash{}\%\\
\hline
Undocumented Code & 2016 & 590 & 0.23\textbackslash{}\%\\
\hline
Liquor Store & 1991 & 492 & 0.20\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & 1991 & 436 & 0.17\textbackslash{}\%\\
\hline
Shopping Mall & 2010 & 325 & 0.13\textbackslash{}\%\\
\hline
Rental Storage Facility & 1991 & 276 & 0.11\textbackslash{}\%\\
\hline
Community Center & 2013 & 264 & 0.10\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & 2011 & 202 & 0.08\textbackslash{}\%\\
\hline
Industrial Site & 2010 & 155 & 0.06\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & 2011 & 106 & 0.04\textbackslash{}\%\\
\hline
Camp/Campground & 2010 & 94 & 0.04\textbackslash{}\%\\
\hline
Auto Dealership New/Used & 2011 & 92 & 0.04\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & 2011 & 90 & 0.04\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & 2010 & 79 & 0.03\textbackslash{}\%\\
\hline
Rest Area & 2011 & 68 & 0.03\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & 2012 & 55 & 0.02\textbackslash{}\%\\
\hline
Daycare Facility & 2011 & 52 & 0.02\textbackslash{}\%\\
\hline
Amusement Park & 2011 & 52 & 0.02\textbackslash{}\%\\
\hline
Farm Facility & 2011 & 39 & 0.02\textbackslash{}\%\\
\hline
Tribal Lands & 2011 & 27 & 0.01\textbackslash{}\%\\
\hline
Atm Separate From Bank & 2011 & 18 & 0.01\textbackslash{}\%\\
\hline
Military Installation & 2015 & 6 & 0.00\textbackslash{}\%\\
\hline
\end{longtable}





\begin{longtable}[t]{l|l|r|r}
\caption{(\#tab:hatelocationOffense)The number and percent of offenses by location, 2023.}\\
\hline
Location & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endfirsthead
\caption[]{(\#tab:hatelocationOffense)The number and percent of offenses by location, 2023. \textit{(continued)}}\\
\hline
Location & Offense & \textbackslash{}\# of Incidents & \textbackslash{}\% of Incidents\\
\hline
\endhead
Abandoned/Condemned Structure & Destruction/Damage/Vandalism of Property & 51 & 56.67\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Assault Offenses - Intimidation & 9 & 10.00\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Assault Offenses - Simple Assault & 8 & 8.89\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Burglary/Breaking And Entering & 6 & 6.67\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Assault Offenses - Aggravated Assault & 4 & 4.44\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & All Other & 12 & 13.32\textbackslash{}\%\\
\hline
Abandoned/Condemned Structure & Total & 90 & 100\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Assault Offenses - Simple Assault & 1,088 & 39.88\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Assault Offenses - Intimidation & 588 & 21.55\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Assault Offenses - Aggravated Assault & 458 & 16.79\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Destruction/Damage/Vandalism of Property & 415 & 15.21\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Robbery & 106 & 3.89\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & All Other & 73 & 2.7\textbackslash{}\%\\
\hline
Air/Bus/Train Terminal & Total & 2,728 & 100\textbackslash{}\%\\
\hline
Amusement Park & Assault Offenses - Intimidation & 16 & 30.77\textbackslash{}\%\\
\hline
Amusement Park & Assault Offenses - Simple Assault & 15 & 28.85\textbackslash{}\%\\
\hline
Amusement Park & Destruction/Damage/Vandalism of Property & 8 & 15.38\textbackslash{}\%\\
\hline
Amusement Park & Assault Offenses - Aggravated Assault & 6 & 11.54\textbackslash{}\%\\
\hline
Amusement Park & Larceny/Theft Offenses - All Other Larceny & 3 & 5.77\textbackslash{}\%\\
\hline
Amusement Park & All Other & 4 & 7.68\textbackslash{}\%\\
\hline
Amusement Park & Total & 52 & 100\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Assault Offenses - Simple Assault & 48 & 45.28\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Assault Offenses - Intimidation & 24 & 22.64\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Destruction/Damage/Vandalism of Property & 21 & 19.81\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Assault Offenses - Aggravated Assault & 8 & 7.55\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Larceny/Theft Offenses - All Other Larceny & 1 & 0.94\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & All Other & 4 & 3.76\textbackslash{}\%\\
\hline
Arena/Stadium/Fairgrounds/Coliseum & Total & 106 & 100\textbackslash{}\%\\
\hline
Atm Separate From Bank & Assault Offenses - Simple Assault & 5 & 27.78\textbackslash{}\%\\
\hline
Atm Separate From Bank & Assault Offenses - Intimidation & 4 & 22.22\textbackslash{}\%\\
\hline
Atm Separate From Bank & Larceny/Theft Offenses - All Other Larceny & 2 & 11.11\textbackslash{}\%\\
\hline
Atm Separate From Bank & Fraud Offenses - Credit Card/Atm Fraud & 2 & 11.11\textbackslash{}\%\\
\hline
Atm Separate From Bank & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 1 & 5.56\textbackslash{}\%\\
\hline
Atm Separate From Bank & All Other & 4 & 22.24\textbackslash{}\%\\
\hline
Atm Separate From Bank & Total & 18 & 100\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Assault Offenses - Intimidation & 32 & 34.78\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Destruction/Damage/Vandalism of Property & 13 & 14.13\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Assault Offenses - Simple Assault & 12 & 13.04\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Larceny/Theft Offenses - All Other Larceny & 8 & 8.70\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories & 6 & 6.52\textbackslash{}\%\\
\hline
Auto Dealership New/Used & All Other & 21 & 22.83\textbackslash{}\%\\
\hline
Auto Dealership New/Used & Total & 92 & 100\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Assault Offenses - Intimidation & 191 & 32.05\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Destruction/Damage/Vandalism of Property & 103 & 17.28\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Assault Offenses - Simple Assault & 73 & 12.25\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Counterfeiting/Forgery & 57 & 9.56\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Assault Offenses - Aggravated Assault & 39 & 6.54\textbackslash{}\%\\
\hline
Bank/Savings And Loan & All Other & 133 & 22.32\textbackslash{}\%\\
\hline
Bank/Savings And Loan & Total & 596 & 100\textbackslash{}\%\\
\hline
Bar/Nightclub & Assault Offenses - Simple Assault & 1,968 & 46.09\textbackslash{}\%\\
\hline
Bar/Nightclub & Assault Offenses - Aggravated Assault & 1,021 & 23.91\textbackslash{}\%\\
\hline
Bar/Nightclub & Assault Offenses - Intimidation & 793 & 18.57\textbackslash{}\%\\
\hline
Bar/Nightclub & Destruction/Damage/Vandalism of Property & 285 & 6.67\textbackslash{}\%\\
\hline
Bar/Nightclub & Robbery & 64 & 1.50\textbackslash{}\%\\
\hline
Bar/Nightclub & All Other & 139 & 3.22\textbackslash{}\%\\
\hline
Bar/Nightclub & Total & 4,270 & 100\textbackslash{}\%\\
\hline
Camp/Campground & Destruction/Damage/Vandalism of Property & 28 & 29.79\textbackslash{}\%\\
\hline
Camp/Campground & Assault Offenses - Simple Assault & 20 & 21.28\textbackslash{}\%\\
\hline
Camp/Campground & Assault Offenses - Intimidation & 18 & 19.15\textbackslash{}\%\\
\hline
Camp/Campground & Assault Offenses - Aggravated Assault & 12 & 12.77\textbackslash{}\%\\
\hline
Camp/Campground & Larceny/Theft Offenses - All Other Larceny & 6 & 6.38\textbackslash{}\%\\
\hline
Camp/Campground & All Other & 10 & 10.61\textbackslash{}\%\\
\hline
Camp/Campground & Total & 94 & 100\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Destruction/Damage/Vandalism of Property & 6,329 & 66.95\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Assault Offenses - Intimidation & 1,820 & 19.25\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Burglary/Breaking And Entering & 380 & 4.02\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Arson & 337 & 3.56\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Assault Offenses - Simple Assault & 251 & 2.65\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & All Other & 337 & 3.57\textbackslash{}\%\\
\hline
Church/Synagogue/Temple/Mosque & Total & 9,454 & 100\textbackslash{}\%\\
\hline
Commercial/Office Building & Assault Offenses - Intimidation & 2,416 & 42.59\textbackslash{}\%\\
\hline
Commercial/Office Building & Destruction/Damage/Vandalism of Property & 1,837 & 32.38\textbackslash{}\%\\
\hline
Commercial/Office Building & Assault Offenses - Simple Assault & 722 & 12.73\textbackslash{}\%\\
\hline
Commercial/Office Building & Assault Offenses - Aggravated Assault & 256 & 4.51\textbackslash{}\%\\
\hline
Commercial/Office Building & Burglary/Breaking And Entering & 121 & 2.13\textbackslash{}\%\\
\hline
Commercial/Office Building & All Other & 321 & 5.68\textbackslash{}\%\\
\hline
Commercial/Office Building & Total & 5,673 & 100\textbackslash{}\%\\
\hline
Community Center & Assault Offenses - Intimidation & 108 & 40.91\textbackslash{}\%\\
\hline
Community Center & Destruction/Damage/Vandalism of Property & 84 & 31.82\textbackslash{}\%\\
\hline
Community Center & Assault Offenses - Simple Assault & 44 & 16.67\textbackslash{}\%\\
\hline
Community Center & Assault Offenses - Aggravated Assault & 14 & 5.30\textbackslash{}\%\\
\hline
Community Center & Burglary/Breaking And Entering & 4 & 1.52\textbackslash{}\%\\
\hline
Community Center & All Other & 10 & 3.8\textbackslash{}\%\\
\hline
Community Center & Total & 264 & 100\textbackslash{}\%\\
\hline
Construction Site & Destruction/Damage/Vandalism of Property & 390 & 55.87\textbackslash{}\%\\
\hline
Construction Site & Assault Offenses - Intimidation & 109 & 15.62\textbackslash{}\%\\
\hline
Construction Site & Assault Offenses - Simple Assault & 57 & 8.17\textbackslash{}\%\\
\hline
Construction Site & Burglary/Breaking And Entering & 44 & 6.30\textbackslash{}\%\\
\hline
Construction Site & Assault Offenses - Aggravated Assault & 39 & 5.59\textbackslash{}\%\\
\hline
Construction Site & All Other & 59 & 8.45\textbackslash{}\%\\
\hline
Construction Site & Total & 698 & 100\textbackslash{}\%\\
\hline
Convenience Store & Assault Offenses - Intimidation & 1,193 & 33.79\textbackslash{}\%\\
\hline
Convenience Store & Assault Offenses - Simple Assault & 956 & 27.07\textbackslash{}\%\\
\hline
Convenience Store & Assault Offenses - Aggravated Assault & 501 & 14.19\textbackslash{}\%\\
\hline
Convenience Store & Destruction/Damage/Vandalism of Property & 397 & 11.24\textbackslash{}\%\\
\hline
Convenience Store & Larceny/Theft Offenses - Shoplifting & 114 & 3.23\textbackslash{}\%\\
\hline
Convenience Store & All Other & 370 & 10.48\textbackslash{}\%\\
\hline
Convenience Store & Total & 3,531 & 100\textbackslash{}\%\\
\hline
Daycare Facility & Destruction/Damage/Vandalism of Property & 18 & 34.62\textbackslash{}\%\\
\hline
Daycare Facility & Assault Offenses - Intimidation & 13 & 25.00\textbackslash{}\%\\
\hline
Daycare Facility & Assault Offenses - Simple Assault & 10 & 19.23\textbackslash{}\%\\
\hline
Daycare Facility & Assault Offenses - Aggravated Assault & 3 & 5.77\textbackslash{}\%\\
\hline
Daycare Facility & Burglary/Breaking And Entering & 3 & 5.77\textbackslash{}\%\\
\hline
Daycare Facility & All Other & 5 & 9.6\textbackslash{}\%\\
\hline
Daycare Facility & Total & 52 & 100\textbackslash{}\%\\
\hline
Department/Discount Store & Assault Offenses - Intimidation & 590 & 27.33\textbackslash{}\%\\
\hline
Department/Discount Store & Assault Offenses - Simple Assault & 487 & 22.56\textbackslash{}\%\\
\hline
Department/Discount Store & Larceny/Theft Offenses - Shoplifting & 320 & 14.82\textbackslash{}\%\\
\hline
Department/Discount Store & Destruction/Damage/Vandalism of Property & 279 & 12.92\textbackslash{}\%\\
\hline
Department/Discount Store & Assault Offenses - Aggravated Assault & 167 & 7.74\textbackslash{}\%\\
\hline
Department/Discount Store & All Other & 316 & 14.63\textbackslash{}\%\\
\hline
Department/Discount Store & Total & 2,159 & 100\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Assault Offenses - Simple Assault & 20 & 36.36\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Destruction/Damage/Vandalism of Property & 10 & 18.18\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Assault Offenses - Intimidation & 10 & 18.18\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Assault Offenses - Aggravated Assault & 7 & 12.73\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Robbery & 5 & 9.09\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & All Other & 3 & 5.45\textbackslash{}\%\\
\hline
Dock/Wharf/Freight/Modal Terminal & Total & 55 & 100\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Assault Offenses - Intimidation & 881 & 41.54\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Assault Offenses - Simple Assault & 556 & 26.21\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Destruction/Damage/Vandalism of Property & 399 & 18.81\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Assault Offenses - Aggravated Assault & 147 & 6.93\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Larceny/Theft Offenses - Shoplifting & 22 & 1.04\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & All Other & 116 & 5.46\textbackslash{}\%\\
\hline
Drug Store/Doctors Office/Hospital & Total & 2,121 & 100\textbackslash{}\%\\
\hline
Farm Facility & Destruction/Damage/Vandalism of Property & 9 & 23.08\textbackslash{}\%\\
\hline
Farm Facility & Burglary/Breaking And Entering & 7 & 17.95\textbackslash{}\%\\
\hline
Farm Facility & Assault Offenses - Aggravated Assault & 6 & 15.38\textbackslash{}\%\\
\hline
Farm Facility & Assault Offenses - Simple Assault & 5 & 12.82\textbackslash{}\%\\
\hline
Farm Facility & Larceny/Theft Offenses - All Other Larceny & 4 & 10.26\textbackslash{}\%\\
\hline
Farm Facility & All Other & 8 & 20.5\textbackslash{}\%\\
\hline
Farm Facility & Total & 39 & 100\textbackslash{}\%\\
\hline
Field/Woods & Destruction/Damage/Vandalism of Property & 667 & 29.76\textbackslash{}\%\\
\hline
Field/Woods & Assault Offenses - Simple Assault & 530 & 23.65\textbackslash{}\%\\
\hline
Field/Woods & Assault Offenses - Aggravated Assault & 447 & 19.95\textbackslash{}\%\\
\hline
Field/Woods & Assault Offenses - Intimidation & 302 & 13.48\textbackslash{}\%\\
\hline
Field/Woods & Robbery & 118 & 5.27\textbackslash{}\%\\
\hline
Field/Woods & All Other & 177 & 7.88\textbackslash{}\%\\
\hline
Field/Woods & Total & 2,241 & 100\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Assault Offenses - Simple Assault & 33 & 41.77\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Assault Offenses - Intimidation & 12 & 15.19\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Larceny/Theft Offenses - All Other Larceny & 8 & 10.13\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Destruction/Damage/Vandalism of Property & 8 & 10.13\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Assault Offenses - Aggravated Assault & 4 & 5.06\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & All Other & 14 & 17.74\textbackslash{}\%\\
\hline
Gambling Facility/Casino/Race Track & Total & 79 & 100\textbackslash{}\%\\
\hline
Government/Public Building & Destruction/Damage/Vandalism of Property & 1,426 & 37.68\textbackslash{}\%\\
\hline
Government/Public Building & Assault Offenses - Intimidation & 1,383 & 36.54\textbackslash{}\%\\
\hline
Government/Public Building & Assault Offenses - Simple Assault & 581 & 15.35\textbackslash{}\%\\
\hline
Government/Public Building & Assault Offenses - Aggravated Assault & 195 & 5.15\textbackslash{}\%\\
\hline
Government/Public Building & Larceny/Theft Offenses - All Other Larceny & 36 & 0.95\textbackslash{}\%\\
\hline
Government/Public Building & All Other & 164 & 4.34\textbackslash{}\%\\
\hline
Government/Public Building & Total & 3,785 & 100\textbackslash{}\%\\
\hline
Grocery/Supermarket & Assault Offenses - Intimidation & 702 & 30.19\textbackslash{}\%\\
\hline
Grocery/Supermarket & Assault Offenses - Simple Assault & 619 & 26.62\textbackslash{}\%\\
\hline
Grocery/Supermarket & Destruction/Damage/Vandalism of Property & 329 & 14.15\textbackslash{}\%\\
\hline
Grocery/Supermarket & Assault Offenses - Aggravated Assault & 246 & 10.58\textbackslash{}\%\\
\hline
Grocery/Supermarket & Larceny/Theft Offenses - Shoplifting & 199 & 8.56\textbackslash{}\%\\
\hline
Grocery/Supermarket & All Other & 230 & 9.87\textbackslash{}\%\\
\hline
Grocery/Supermarket & Total & 2,325 & 100\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Assault Offenses - Simple Assault & 13,746 & 29.24\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Assault Offenses - Aggravated Assault & 10,788 & 22.95\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Assault Offenses - Intimidation & 10,312 & 21.94\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Destruction/Damage/Vandalism of Property & 7,701 & 16.38\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Robbery & 2,241 & 4.77\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & All Other & 2,218 & 4.69\textbackslash{}\%\\
\hline
Highway/Road/Alley/Street/Sidewalk & Total & 47,006 & 100\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Assault Offenses - Intimidation & 541 & 31.13\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Assault Offenses - Simple Assault & 495 & 28.48\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Destruction/Damage/Vandalism of Property & 256 & 14.73\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Assault Offenses - Aggravated Assault & 242 & 13.92\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Robbery & 31 & 1.78\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & All Other & 173 & 9.99\textbackslash{}\%\\
\hline
Hotel/Motel/Etc. & Total & 1,738 & 100\textbackslash{}\%\\
\hline
Industrial Site & Assault Offenses - Intimidation & 58 & 37.42\textbackslash{}\%\\
\hline
Industrial Site & Destruction/Damage/Vandalism of Property & 41 & 26.45\textbackslash{}\%\\
\hline
Industrial Site & Assault Offenses - Simple Assault & 18 & 11.61\textbackslash{}\%\\
\hline
Industrial Site & Assault Offenses - Aggravated Assault & 13 & 8.39\textbackslash{}\%\\
\hline
Industrial Site & Larceny/Theft Offenses - All Other Larceny & 9 & 5.81\textbackslash{}\%\\
\hline
Industrial Site & All Other & 16 & 10.35\textbackslash{}\%\\
\hline
Industrial Site & Total & 155 & 100\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Simple Assault & 978 & 52.64\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Aggravated Assault & 396 & 21.31\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Assault Offenses - Intimidation & 344 & 18.51\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Destruction/Damage/Vandalism of Property & 51 & 2.74\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Drug/Narcotic Offenses - Drug/Narcotic Violations & 23 & 1.24\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & All Other & 66 & 3.52\textbackslash{}\%\\
\hline
Jail/Prison/Penitentiary/Corrections Facility & Total & 1,858 & 100\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Assault Offenses - Simple Assault & 136 & 31.19\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Assault Offenses - Aggravated Assault & 104 & 23.85\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Destruction/Damage/Vandalism of Property & 87 & 19.95\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Assault Offenses - Intimidation & 65 & 14.91\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Robbery & 17 & 3.90\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & All Other & 27 & 6.21\textbackslash{}\%\\
\hline
Lake/Waterway/Beach & Total & 436 & 100\textbackslash{}\%\\
\hline
Liquor Store & Assault Offenses - Intimidation & 174 & 35.37\textbackslash{}\%\\
\hline
Liquor Store & Assault Offenses - Simple Assault & 112 & 22.76\textbackslash{}\%\\
\hline
Liquor Store & Assault Offenses - Aggravated Assault & 93 & 18.90\textbackslash{}\%\\
\hline
Liquor Store & Destruction/Damage/Vandalism of Property & 55 & 11.18\textbackslash{}\%\\
\hline
Liquor Store & Robbery & 17 & 3.46\textbackslash{}\%\\
\hline
Liquor Store & All Other & 41 & 8.33\textbackslash{}\%\\
\hline
Liquor Store & Total & 492 & 100\textbackslash{}\%\\
\hline
Military Installation & Destruction/Damage/Vandalism of Property & 2 & 33.33\textbackslash{}\%\\
\hline
Military Installation & Larceny/Theft Offenses - All Other Larceny & 1 & 16.67\textbackslash{}\%\\
\hline
Military Installation & Human Trafficking - Involuntary Servitude & 1 & 16.67\textbackslash{}\%\\
\hline
Military Installation & Assault Offenses - Simple Assault & 1 & 16.67\textbackslash{}\%\\
\hline
Military Installation & Murder/Nonnegligent Manslaughter & 1 & 16.67\textbackslash{}\%\\
\hline
Military Installation & All Other & NA & NA\textbackslash{}\%\\
\hline
Military Installation & Total & 6 & 100\textbackslash{}\%\\
\hline
Other/Unknown & Destruction/Damage/Vandalism of Property & 11,530 & 35.95\textbackslash{}\%\\
\hline
Other/Unknown & Assault Offenses - Intimidation & 9,923 & 30.94\textbackslash{}\%\\
\hline
Other/Unknown & Assault Offenses - Simple Assault & 6,021 & 18.77\textbackslash{}\%\\
\hline
Other/Unknown & Assault Offenses - Aggravated Assault & 2,641 & 8.23\textbackslash{}\%\\
\hline
Other/Unknown & Robbery & 593 & 1.85\textbackslash{}\%\\
\hline
Other/Unknown & All Other & 1,365 & 4.27\textbackslash{}\%\\
\hline
Other/Unknown & Total & 32,073 & 100\textbackslash{}\%\\
\hline
Park/Playground & Destruction/Damage/Vandalism of Property & 1,193 & 50.64\textbackslash{}\%\\
\hline
Park/Playground & Assault Offenses - Simple Assault & 405 & 17.19\textbackslash{}\%\\
\hline
Park/Playground & Assault Offenses - Intimidation & 342 & 14.52\textbackslash{}\%\\
\hline
Park/Playground & Assault Offenses - Aggravated Assault & 282 & 11.97\textbackslash{}\%\\
\hline
Park/Playground & Robbery & 66 & 2.80\textbackslash{}\%\\
\hline
Park/Playground & All Other & 68 & 2.86\textbackslash{}\%\\
\hline
Park/Playground & Total & 2,356 & 100\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Destruction/Damage/Vandalism of Property & 4,392 & 30.52\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Assault Offenses - Simple Assault & 3,318 & 23.06\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Assault Offenses - Intimidation & 2,951 & 20.51\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Assault Offenses - Aggravated Assault & 2,392 & 16.62\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Robbery & 345 & 2.40\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & All Other & 991 & 6.88\textbackslash{}\%\\
\hline
Parking Lot/Drop Lot/Parking Garage & Total & 14,389 & 100\textbackslash{}\%\\
\hline
Rental Storage Facility & Destruction/Damage/Vandalism of Property & 106 & 38.41\textbackslash{}\%\\
\hline
Rental Storage Facility & Assault Offenses - Intimidation & 45 & 16.30\textbackslash{}\%\\
\hline
Rental Storage Facility & Burglary/Breaking And Entering & 41 & 14.86\textbackslash{}\%\\
\hline
Rental Storage Facility & Assault Offenses - Simple Assault & 25 & 9.06\textbackslash{}\%\\
\hline
Rental Storage Facility & Assault Offenses - Aggravated Assault & 19 & 6.88\textbackslash{}\%\\
\hline
Rental Storage Facility & All Other & 40 & 14.47\textbackslash{}\%\\
\hline
Rental Storage Facility & Total & 276 & 100\textbackslash{}\%\\
\hline
Residence/Home & Assault Offenses - Intimidation & 27,096 & 36.67\textbackslash{}\%\\
\hline
Residence/Home & Destruction/Damage/Vandalism of Property & 23,877 & 32.32\textbackslash{}\%\\
\hline
Residence/Home & Assault Offenses - Simple Assault & 9,733 & 13.17\textbackslash{}\%\\
\hline
Residence/Home & Assault Offenses - Aggravated Assault & 5,264 & 7.12\textbackslash{}\%\\
\hline
Residence/Home & Burglary/Breaking And Entering & 2,470 & 3.34\textbackslash{}\%\\
\hline
Residence/Home & All Other & 5,447 & 7.36\textbackslash{}\%\\
\hline
Residence/Home & Total & 73,887 & 100\textbackslash{}\%\\
\hline
Rest Area & Destruction/Damage/Vandalism of Property & 40 & 58.82\textbackslash{}\%\\
\hline
Rest Area & Assault Offenses - Simple Assault & 11 & 16.18\textbackslash{}\%\\
\hline
Rest Area & Assault Offenses - Intimidation & 9 & 13.24\textbackslash{}\%\\
\hline
Rest Area & Assault Offenses - Aggravated Assault & 7 & 10.29\textbackslash{}\%\\
\hline
Rest Area & Larceny/Theft Offenses - All Other Larceny & 1 & 1.47\textbackslash{}\%\\
\hline
Rest Area & All Other & NA & NA\textbackslash{}\%\\
\hline
Rest Area & Total & 68 & 100\textbackslash{}\%\\
\hline
Restaurant & Assault Offenses - Intimidation & 1,944 & 35.87\textbackslash{}\%\\
\hline
Restaurant & Assault Offenses - Simple Assault & 1,591 & 29.36\textbackslash{}\%\\
\hline
Restaurant & Destruction/Damage/Vandalism of Property & 937 & 17.29\textbackslash{}\%\\
\hline
Restaurant & Assault Offenses - Aggravated Assault & 641 & 11.83\textbackslash{}\%\\
\hline
Restaurant & Robbery & 58 & 1.07\textbackslash{}\%\\
\hline
Restaurant & All Other & 248 & 4.6\textbackslash{}\%\\
\hline
Restaurant & Total & 5,419 & 100\textbackslash{}\%\\
\hline
School - College/University & Destruction/Damage/Vandalism of Property & 1,238 & 52.66\textbackslash{}\%\\
\hline
School - College/University & Assault Offenses - Intimidation & 668 & 28.41\textbackslash{}\%\\
\hline
School - College/University & Assault Offenses - Simple Assault & 254 & 10.80\textbackslash{}\%\\
\hline
School - College/University & Assault Offenses - Aggravated Assault & 64 & 2.72\textbackslash{}\%\\
\hline
School - College/University & Burglary/Breaking And Entering & 29 & 1.23\textbackslash{}\%\\
\hline
School - College/University & All Other & 98 & 4.16\textbackslash{}\%\\
\hline
School - College/University & Total & 2,351 & 100\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Assault Offenses - Intimidation & 1,814 & 37.03\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Destruction/Damage/Vandalism of Property & 1,655 & 33.78\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Assault Offenses - Simple Assault & 1,043 & 21.29\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Assault Offenses - Aggravated Assault & 175 & 3.57\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Burglary/Breaking And Entering & 44 & 0.90\textbackslash{}\%\\
\hline
School - Elementary/Secondary & All Other & 168 & 3.41\textbackslash{}\%\\
\hline
School - Elementary/Secondary & Total & 4,899 & 100\textbackslash{}\%\\
\hline
School/College & Destruction/Damage/Vandalism of Property & 7,964 & 45.05\textbackslash{}\%\\
\hline
School/College & Assault Offenses - Intimidation & 5,287 & 29.91\textbackslash{}\%\\
\hline
School/College & Assault Offenses - Simple Assault & 3,182 & 18.00\textbackslash{}\%\\
\hline
School/College & Assault Offenses - Aggravated Assault & 694 & 3.93\textbackslash{}\%\\
\hline
School/College & Burglary/Breaking And Entering & 134 & 0.76\textbackslash{}\%\\
\hline
School/College & All Other & 418 & 2.38\textbackslash{}\%\\
\hline
School/College & Total & 17,679 & 100\textbackslash{}\%\\
\hline
Service/Gas Station & Assault Offenses - Intimidation & 803 & 33.26\textbackslash{}\%\\
\hline
Service/Gas Station & Assault Offenses - Simple Assault & 610 & 25.27\textbackslash{}\%\\
\hline
Service/Gas Station & Assault Offenses - Aggravated Assault & 400 & 16.57\textbackslash{}\%\\
\hline
Service/Gas Station & Destruction/Damage/Vandalism of Property & 257 & 10.65\textbackslash{}\%\\
\hline
Service/Gas Station & Larceny/Theft Offenses - All Other Larceny & 106 & 4.39\textbackslash{}\%\\
\hline
Service/Gas Station & All Other & 238 & 9.85\textbackslash{}\%\\
\hline
Service/Gas Station & Total & 2,414 & 100\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Simple Assault & 105 & 51.98\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Intimidation & 50 & 24.75\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Assault Offenses - Aggravated Assault & 31 & 15.35\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Destruction/Damage/Vandalism of Property & 11 & 5.45\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Sex Offenses - Sodomy & 1 & 0.50\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & All Other & 4 & 2\textbackslash{}\%\\
\hline
Shelter - Mission/Homeless & Total & 202 & 100\textbackslash{}\%\\
\hline
Shopping Mall & Assault Offenses - Simple Assault & 92 & 28.31\textbackslash{}\%\\
\hline
Shopping Mall & Assault Offenses - Intimidation & 88 & 27.08\textbackslash{}\%\\
\hline
Shopping Mall & Destruction/Damage/Vandalism of Property & 73 & 22.46\textbackslash{}\%\\
\hline
Shopping Mall & Assault Offenses - Aggravated Assault & 35 & 10.77\textbackslash{}\%\\
\hline
Shopping Mall & Larceny/Theft Offenses - Shoplifting & 16 & 4.92\textbackslash{}\%\\
\hline
Shopping Mall & All Other & 21 & 6.49\textbackslash{}\%\\
\hline
Shopping Mall & Total & 325 & 100\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Assault Offenses - Intimidation & 1,116 & 38.14\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Destruction/Damage/Vandalism of Property & 945 & 32.30\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Assault Offenses - Simple Assault & 419 & 14.32\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Assault Offenses - Aggravated Assault & 141 & 4.82\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Larceny/Theft Offenses - Shoplifting & 59 & 2.02\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & All Other & 246 & 8.37\textbackslash{}\%\\
\hline
Specialty Store (Tv, Fur, Etc.) & Total & 2,926 & 100\textbackslash{}\%\\
\hline
Tribal Lands & Assault Offenses - Intimidation & 6 & 22.22\textbackslash{}\%\\
\hline
Tribal Lands & Assault Offenses - Simple Assault & 6 & 22.22\textbackslash{}\%\\
\hline
Tribal Lands & Assault Offenses - Aggravated Assault & 6 & 22.22\textbackslash{}\%\\
\hline
Tribal Lands & Destruction/Damage/Vandalism of Property & 5 & 18.52\textbackslash{}\%\\
\hline
Tribal Lands & Undocumented Code & 1 & 3.70\textbackslash{}\%\\
\hline
Tribal Lands & All Other & 3 & 11.1\textbackslash{}\%\\
\hline
Tribal Lands & Total & 27 & 100\textbackslash{}\%\\
\hline
Undocumented Code & Assault Offenses - Intimidation & 529 & 89.66\textbackslash{}\%\\
\hline
Undocumented Code & Fraud Offenses - Other & 16 & 2.71\textbackslash{}\%\\
\hline
Undocumented Code & Pornography/Obscene Material & 8 & 1.36\textbackslash{}\%\\
\hline
Undocumented Code & Fraud Offenses - False Pretenses/Swindle/Confidence Game & 8 & 1.36\textbackslash{}\%\\
\hline
Undocumented Code & Extortion/Blackmail & 7 & 1.19\textbackslash{}\%\\
\hline
Undocumented Code & All Other & 22 & 3.74\textbackslash{}\%\\
\hline
Undocumented Code & Total & 590 & 100\textbackslash{}\%\\
\hline
\end{longtable}




### Number and race of offenders

There are two variables that have information about the people who commit the hate crime: the number of offenders and the race of the offenders. The offender race is recorded as a single value with the race of the group if all are of the same race or it will say a "multi-racial" group if there are offenders of different races. Unfortunately, important information like the age of the offenders, their criminal history, their relationship to the victim, their gender, or whether they are arrested are completely unavailable in this dataset. These variables, however, are available in NIBRS data. 

As shown in Figure \@ref(fig:hateCrimeOffenderNumber), the most common racial group is "unknown" since the police do not know the race of the offenders. Next are White offenders at nearly 40% of hate crimes followed by Black offenders at nearly 13% of hate crimes. The remaining racial groups are rare with about 2% of hate crimes being committed by a multi-racial group of offenders and 0.8 % of hate crimes committed by Asian or Pacific Islander offenders and 0.6 % committed by American Indian or Native Alaskan offenders. Only 0.05% of offenders are Native Hawaiian or Other Pacific Islander.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimeOffenderRace-1} 

}

\caption{The race of offenders, as a group, for hate crime incidents, 1991-2023.}(\#fig:hateCrimeOffenderRace)
\end{figure}

When the police do not have any information about the number of offenders (which is common in cases of property crimes such as vandalism but rare in violent crimes), this data considers that to have zero offenders. The zero is just a placeholder that means that the police do not know how many offenders there are, not that they think there were actually no offenders. Figure \@ref(fig:hateCrimeOffenderNumber) shows the percent of hate crimes from 1991-2023 that have each number of offenders recorded. In the actual data it says the actual number of offenders, with the largest group in the current data going to 99 offenders - in this graph I group 10 or more offenders together for simplicity. I also relabel zero offenders as "Unknown" offenders since that is more accurate. The most common number of offenders per hate crime is one offender, at about 49% of hate crimes from 1991-2023 having only one offender. This drops sharply to 9% of hate crimes having two offenders and continues to drop as the number of offenders increase. However, about a third (36%) of hate crimes have an unknown number of offenders. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/hateCrimeOffenderNumber-1} 

}

\caption{The race of offenders, as a group, for hate crime incidents, 1991-2023.}(\#fig:hateCrimeOffenderNumber)
\end{figure}

### Number of victims 

When considering the data itself, hate crime data is very similar to most other datasets. It is just the number of crimes that were reported to the police, though with the additional step of having evidence of bias. But the difference in use is that while in other crimes the victim is usually, well, the victim, in hate crimes the victim may be a much wider group. Consider a burglary: the homeowner is the direct victim, as their property was targeted. However, the crime can also affect their neighbors, who may now feel unsafe in their own homes, as well as the victim’s family, who may worry about their safety.

Hate crimes, however, tend to affect not just the direct victim but also the entire targeted group, or at least a broader community. A swastika painted on a synagogue, for example, impacts not only the synagogue's congregation but may instill fear in the broader Jewish community. If a swastika, for example, is spray painted on the front door of a synagogue, who is the victim? Directly it would be whomever owns the synagogue building. But it also affects all members of that congregation. And what about members of other synagogues in the city? What about Jewish people in the city who do not go to synagogue? Even though only a single crime occurred - a vandalism - it is very difficult to count how many victims there were. Is a swastika on a synagogue worse if the synagogue has a small congregation versus a large one? What if it is in a city with only one synagogue compared to a city with many? Is it worse to have a large swastika than a small one? 

If we are trying to use this data to measure hate against a particular group these are questions we need to answer, but are of course impossible to answer with this data. Remember, all of the FBI data is essentially just abstract contextless numbers in a spreadsheet. This is true for all UCR data but especially so for hate crimes where no two hate crimes are equal. One burglary in City A is about equivalent to one burglary in City B. For hate crimes a single incident may affect far more people in City A than in City B. 

In fact, I would argue that this issue is bad enough that we should be extraordinarily cautious when using this data. Just aggregating up the number of incidents is insufficient to measuring either hate or fear. Sure, you can measure the number of hate crimes reported to the police and where the police found adequate evidence to label the crime as bias motivated. But is that really what you want be measuring when using hate crime data? 

Nonetheless, this is a book about the data. So let us look at one final variable in this data, the number of victims for each incident. This is not going to be true number of people affected by the crime. It is more the number of direct victims for the incident. Whether that is actually better than just counting incidents is dependent on the context of your question and the hate crimes in question. In Figure \@ref(fig:jewishIncidentVictim) I show the annual number of anti-Jewish hate crimes reported by all agencies in the country. As may be expected, there are always more victims than incidents though the trends are extremely similar over the entire period of data. This trend is also present for other bias motivations, such as anti-Black hate crimes shown in Figure \@ref(fig:blackIncidentVictim). 

While this variable is available in the data, I actually think it is best not to use it. I think there is always a danger in being overly precise and, therefore, overly confident about what the data shows. When you use the number of incidents you implicitly allow for each incident to affect multiple people^[One of the points of hate crimes is to cause fear in more than just the direct victim of the crime.] and readers understand that. But if you use this variable and say that "this is the number of victims of this crime" you are implicitly closing that door and therefore being too confident about how many victims of a crime there is. This is especially true for readers who are not paying close attention - such as academics reviewing papers or New York Times reporters - since they may think you are measuring the number of victims in a better way than you actually are. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/jewishIncidentVictim-1} 

}

\caption{The annual number of anti-Jewish hate crime incidents and victims in the United States, 1991-2023.}(\#fig:jewishIncidentVictim)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{09_hate_crime_files/figure-latex/blackIncidentVictim-1} 

}

\caption{The annual number of anti-Black hate crime incidents and victims in the United States, 1991-2023.}(\#fig:blackIncidentVictim)
\end{figure}


<!--chapter:end:09_hate_crime.Rmd-->

# County-Level Data





SRS data is only available at the agency-level.^[Even for county-level agencies such as Sheriff's Offices, the data is only for crimes in that agency's jurisdiction. So the county sheriff reports crimes that they responded to but not crimes within the county that other agencies, such as a city police force, responded to.] This has caused a lot of problems for researchers because many variables from other datasets (e.g. CDC data, economic data) is primarily available at the county-level. Their solution to this problem is to aggregate the data to the county-level by summing all the agencies in a particular county.^[Because the county-level data imputes missing months, this dataset is only available at the annual-level, not at the monthly level.]

More specifically, nearly all researchers who use this county-level data use the National Archive for Criminal Justice Data (NACJD)'s [datasets](https://www.icpsr.umich.edu/web/NACJD/series/57) which have done the aggregation themselves^[Full disclosure, I used to have my own version of this data available on openICPSR and followed NACJD's method. My reasoning was that people were using it anyways and I wanted to make sure that they knew the problem of the data, so I included the issues with this data in the documentation when downloading it. However, I decided that the data was more flawed than I originally thought so I took down the data.]. These are not official FBI datasets but "UCR staff were consulted in developing the new adjustment procedures".^[This chapter is not a critique of NACJD, merely of a single dataset collection that they released using imputation methods from decades ago.] The "new" procedures is because NACJD changed their missing data imputation procedure starting with 1994 SRS data, and for this chapter I will only focus on this "new" procedure. 

It makes sense to aggregate SRS data to the county-level. That level is often times more useful to analyze than the agency-level. But there are two problems with county-level SRS data: 1) agencies in multiple counties, 2) and agencies with missing data.^[These problems are in addition to all the other quirks and issues with SRS data that have been discussed throughout this book.]

The first issue is in distributing crimes across counties when an agency is in multiple counties. If, for example, New York City had 100 murders in a given year, how do you create county-level data from this? SRS data only tells you how many crimes happened in a particular agency, not where in the jurisdiction it happened. So we have no idea how many of these 100 murders happened in Kings County, how many happened in Bronx County, and so on. 

SRS data does, however, tell you how many counties the agency is in and the population of each. They only do this for up to three counties so in cases like New York City you do not actually have every county the agency is part of.^[For New York City specifically NACJD does distribute to all five counties, and does so by county population.] NACJD's method is to distribute crimes *according to the population of the agency in each county*. In the New York City example, Kings County is home to about 31% of the people in NYC while Bronx County is home to about 17%. So Kings County would get 31 murders while Bronx County gets 17 murders. The problem with this is the crime is not evenly distributed by population. Indeed, crime is generally extremely concentrated in a small number of areas in a city. Even if 100% of the murders in NYC actually happened in Bronx County, only 17% would get assigned there. So for agencies in multiple counties could have their crimes distributed among their different counties incorrectly. This is not that big of a deal, however, as most agencies are only in a single county. It is likely incorrect given how crime is concentrated, but affects relatively little in our data so is not worth much worry. 

The second problem is the one we need to be concerned about. This issue is that not all agencies report data, and even those that do may report only partially (e.g. report fewer than 12 months of the year). So by necessity the missing data has to be filled in somehow. All methods of estimating missing data are wrong, some are useful. How useful are the methods used for SRS data? I will argue that they are not useful enough to be used in most crime research. This is by no means the first argument against using that data. Most famously is [Maltz and Targonski's (2002)](https://link.springer.com/article/10.1023/A:1016060020848) paper in the Journal of Quantitative Criminology about the issues with this data. They concluded that "Until improved methods of imputing county-level crime data are developed, tested, and implemented, they should not be used, especially in policy studies" which is a conclusion I also hold. 

County-level data aggregates both crimes from the Offenses Known and Clearances by Arrests dataset and arrests from the Arrests by Age, Sex, and Race dataset, which has lower reporting (and thus more missingness) than the crime data. For simplicity, in this chapter we will use the crime data as an example. We will do so in a number of different ways to try to really understand how much data is missing and how it changed over time. Estimation is largely the same for arrests and county-level arrests is far less commonly used

Since these methods are for dealing with missing data, if there is no missing data then it does not matter how good or bad the estimation process is. Counties where all agencies report full data are perfectly fine to use without concerning yourself with anything from this chapter. In this chapter we will also look at where counties have missing data and how that changed over time. 

## Current usage

Even with the well-known flaws of this data, it remains a popular dataset. A search on Google Scholar for ["county-level UCR"](https://scholar.google.com/scholar?q=county-level+ucr&hl=en&as_sdt=0,20) returns 5,580 results as of this writing in summer 2024. About half of these results are from 2015 or later. In addition to use by researchers, the county-level UCR data is used by organizations such as the FBI in their annual [Crimes in the United States](https://ucr.fbi.gov/crime-in-the-u.s) report (which is essentially the report that informs the media and the public about crime, even though it is actually only a subset of their published UCR data) and [Social Explorer](https://www.socialexplorer.com/explore-maps), a website that makes it extremely convenient to examine US Census data. 

## How much data is missing

Since estimating missing data only matters when the data is missing, let us look at how many agencies report less than a full year of data.

For each of the below graphs and tables we use the Offenses Known and Clearances by Arrest data for 1960-2023 and exclude any agency that are "special jurisdictions". Special jurisdiction agencies are, as it seems, special agencies that tend to have an extremely specific jurisdiction and goals. These include agencies such as port authorities, alcohol beverage control, university police, and airport police. These agencies tend to cover a tiny geographic area and have both very low crime and very low reporting rates.[^ucr_county-7] So to prevent missingness being overcounted due to these weird agencies I am excluding them from the below examples. I am also excluding federal agencies as these operate much the same as special jurisdiction agencies. Since some estimation is based on state-level data and I present maps that exclude territories, I am also going to subset the data to only agencies in a state or in Washington DC. 

[^ucr_county-7]: Even though these are unusual agencies, in real analyses using UCR data at the county-level you would like want to include them. Or justify why you are not including them.

We will first look at how many months are reported in the 2017. Table \@ref(tab:countyMonthsReportedDefinitions) shows the number of months reported using two ways to measure how many months an agency has reported data, the "last month reported" and the "number of months missing" measure that we considered in Section \@ref(offensesKnownReporting). The data changed how some of the variables were used starting in 2018, making post-2017 data unreliable for the "number of months missing variable. 

The table shows what percent of agencies that reported data had data for each possible number of months: 0 through 12 months. Column 2 shows the percent for the "last month reported" method while column 3 shows the percent for my "number of months missing" method. And the final column shows the percent change^[Not the percentage point difference.] from moving from the 1st to 2nd measure. 

Ultimately the measures are quite similar though systematically overcount reporting using the 1st method. Both show that about 27% of agencies reported zero months. The 1st method has about 69% of agencies reporting 12 months while the 2nd method has 66%, a difference of about 5% which is potentially a sizable difference depending on exactly which agencies are missing. The remaining nearly 4% of agencies all have far more people in the 2nd method than in the first, which is because in the 1st method those agencies are recorded as having 12 months since they reported in December but not actually all 12 months of the year. There are huge percent increases in moving from the 1st to 2nd method for 1-11 months reported though this is due to having very few agencies report this many months. Most months have only about 50 agencies in the 1st method and about 70 in the 2nd, so the actual difference is not that large. 


\begin{longtable}[t]{l|r|r|r}
\caption{(\#tab:countyMonthsReportedDefinitions)The number of months reported to the 2016 Offenses Known and Clearances by Arrest data using two definitions of months reported. The 'Last Month' definition is the preferred measure of months reported by both the FBI and researchers, though this overcounts months.}\\
\hline
Months Reported & Last Month Definition & Months Not Missing Definition & Percent Difference\\
\hline
\endfirsthead
\caption[]{(\#tab:countyMonthsReportedDefinitions)The number of months reported to the 2016 Offenses Known and Clearances by Arrest data using two definitions of months reported. The 'Last Month' definition is the preferred measure of months reported by both the FBI and researchers, though this overcounts months. \textit{(continued)}}\\
\hline
Months Reported & Last Month Definition & Months Not Missing Definition & Percent Difference\\
\hline
\endhead
0 & 4,360 (22.55\%) & 4,364 (22.57\%) & +0.09\\
\hline
1 & 29 (0.15\%) & 79 (0.41\%) & +172.41\\
\hline
2 & 34 (0.18\%) & 69 (0.36\%) & +102.94\\
\hline
3 & 42 (0.22\%) & 65 (0.34\%) & +54.76\\
\hline
4 & 29 (0.15\%) & 43 (0.22\%) & +48.28\\
\hline
5 & 28 (0.14\%) & 66 (0.34\%) & +135.71\\
\hline
6 & 39 (0.2\%) & 64 (0.33\%) & +64.10\\
\hline
7 & 30 (0.16\%) & 54 (0.28\%) & +80.00\\
\hline
8 & 45 (0.23\%) & 68 (0.35\%) & +51.11\\
\hline
9 & 47 (0.24\%) & 88 (0.46\%) & +87.23\\
\hline
10 & 70 (0.36\%) & 115 (0.59\%) & +64.29\\
\hline
11 & 129 (0.67\%) & 241 (1.25\%) & +86.82\\
\hline
12 & 14,451 (74.75\%) & 14,017 (72.5\%) & -3.00\\
\hline
\end{longtable}



We can look at how these trends change over time in Figure \@ref(fig:countyAnyMonthReported) that shows the annual number of agencies that reported at least one month of data in that year. Both measures have the exact same trend with the last month reported measure always being a bit higher than the number of months missing method, at least until the data change in 2018 that renders my method unreliable. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{10_ucr_county_files/figure-latex/countyAnyMonthReported-1} 

}

\caption{The annual number of agencies that reported data in that year.}(\#fig:countyAnyMonthReported)
\end{figure}

For the remainder of this chapter we will treat the last month reported variable as our measure of how many months an agency reports data. I believe that pre-2018 this is not as good a measure at the number of months missing, but it has the benefit of consistency post-2017. So keep in mind that the true number of agencies reporting fewer than 12 months of data is a bit larger than what it seems when using this measure. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{10_ucr_county_files/figure-latex/stateMap2022-1} 

}

\caption{The share of the population in each state covered by an agency reporting 12 months of data based on their last month reported being December, 2023.}(\#fig:stateMap2022)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{10_ucr_county_files/figure-latex/countyMap2022-1} 

}

\caption{The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2023.}(\#fig:countyMap2022)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{10_ucr_county_files/figure-latex/countyMap2010-1} 

}

\caption{The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2010.}(\#fig:countyMap2010)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{10_ucr_county_files/figure-latex/countyMap2000-1} 

}

\caption{The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2000.}(\#fig:countyMap2000)
\end{figure}

## Current imputation practices

There are three paths that the county-level UCR data takes when dealing with the agency-level data before aggregating it to the county-level. The path each agency is on is dependent on how many months of data they report. Figure \@ref(fig:countyImputation) shows each of these three paths. We will look in detail at these paths in the below sections, but for now we will briefly summarize each path. 

First, if an agency reports only two or fewer months, the entire agency's data (that is, any month that they do report) is deleted and their annual data is replaced with the average of agencies that are: 1) in the same state, 2) in the same population group (i.e. very roughly the same size), 3) and that reported all 12 months of the year (i.e. reported in December but potentially not any other month). 

When an agency reports 3-11 months, those months of data are multiplied by 12/numbers-of-months-reported so it just upweights the available data to account for the missing months, assuming that missing months are like the present months. 

Finally, for agencies that reported all 12 months there is nothing missing so it just uses the data as it is.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{images/segments_flowchart} 

}

\caption{The imputation procedure for missing data based on the number of months missing.}(\#fig:countyImputation)
\end{figure}

### 1-9 months missing

When there are 1-9 months reported the missing months are imputed by multiplying the reported months of data by 12/numbers-of-months-reported, essentially just scaling up the reported months. For example, if 6 months are reported then it multiplies each crime values by 12/6=2, doubling each reported crime value. This method makes the assumption that missing values are similar to present ones, at on average. Given that there are seasonal differences in crime - which tends to increase in the summer and decrease in the winter - how accurate this replacement is depends on how consistent crime is over the year and which months are missing. Miss the summer months and you will undercount crime. Miss the winter months and you will overcount crime. Miss random months and you will be wrong randomly (and maybe it'll balance out but maybe it would not).

We will look at a number of examples and simulations about how accurate this method is. For each example we will use agencies that reported in 2018 so we have a real comparison when using their method of replacing "missing" months.

Starting with Table \@ref(tab:CountyPhillyMurders), we will see the change in the actual annual count of murders in Philadelphia when replacing data from each month. Each row shows what happens when you assume that month - and only that month - is missing and interpolate using the current 12/numbers-of-months-reported method. Column 1 shows the month that we are "replacing" while column 2 shows the actual number of murders in that month and the percent of annual murders in parentheses. Column 3 shows the actual annual murders which is 351 in 2018; column 4 shows the annual murder count when imputing the "missing" month" and column 5 shows the percent change between columns 3 and 4.

If each month had the same number of crimes we would expect each month to account for 8.33% of the year's total. That is not what we are seeing in Philadelphia for murders as the percentages range from 5.13% in both January and April to 12.25% in December. This means that replacing these months will not give us an accurate count of crimes as crime is not distributed evenly across months. Indeed, as seen in column 5, on average, the annual sum of murders when imputing a single month is 1.85% off from the real value. When imputing the worst (as far as its effect on results) months you can report murder as either 4.27% lower than it is or 3.5% higher than it is.


\begin{longtable}[t]{l|r|r|r|r}
\caption{(\#tab:CountyPhillyMurders)The imputed number of murders in Philadelphia in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing.}\\
\hline
Month & Murders That Month & Actual Annual Murders & Imputed Annual Murders & Percent Change\\
\hline
\endfirsthead
\caption[]{(\#tab:CountyPhillyMurders)The imputed number of murders in Philadelphia in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing. \textit{(continued)}}\\
\hline
Month & Murders That Month & Actual Annual Murders & Imputed Annual Murders & Percent Change\\
\hline
\endhead
January & 46 (8.95\%) & 514 & 511 & -0.58\\
\hline
February & 38 (7.39\%) & 514 & 519 & +0.97\\
\hline
March & 40 (7.78\%) & 514 & 517 & +0.58\\
\hline
April & 34 (6.61\%) & 514 & 524 & +1.95\\
\hline
May & 56 (10.89\%) & 514 & 500 & -2.72\\
\hline
June & 52 (10.12\%) & 514 & 504 & -1.95\\
\hline
July & 55 (10.70\%) & 514 & 501 & -2.53\\
\hline
August & 46 (8.95\%) & 514 & 511 & -0.58\\
\hline
September & 40 (7.78\%) & 514 & 517 & +0.58\\
\hline
October & 42 (8.17\%) & 514 & 515 & +0.19\\
\hline
November & 25 (4.86\%) & 514 & 533 & +3.70\\
\hline
December & 40 (7.78\%) & 514 & 517 & +0.58\\
\hline
\end{longtable}



Part of the reason for the percent difference for murders when replacing a month found above is that there was high variation in the number of murders per month with some months having more than double the number as other months. We will look at what happens when crimes are far more evenly distributed across months in Table \@ref(tab:countyPhillyThefts). This table replicates Table \@ref(tab:CountyPhillyMurders) but uses thefts in Philadelphia in 2022 instead of murders. Here the monthly share of thefts ranged only from 6.85% to 9.16% so month-to-month variation is not very large. Now the percent change never increases above an absolute value of 1.62 and changes by an average of 0.77%. In cases like this, the imputation method is less of a problem.


\begin{longtable}[t]{l|r|r|r|r}
\caption{(\#tab:countyPhillyThefts)The imputed number of thefts in Philadelphia in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing.}\\
\hline
Month & Thefts That Month & Actual Annual Thefts & Imputed Annual Thefts & Percent Change\\
\hline
\endfirsthead
\caption[]{(\#tab:countyPhillyThefts)The imputed number of thefts in Philadelphia in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing. \textit{(continued)}}\\
\hline
Month & Thefts That Month & Actual Annual Thefts & Imputed Annual Thefts & Percent Change\\
\hline
\endhead
January & 3,080 (6.41\%) & 48,067 & 49,077 & +2.10\\
\hline
February & 2,929 (6.09\%) & 48,067 & 49,241 & +2.44\\
\hline
March & 3,546 (7.38\%) & 48,067 & 48,568 & +1.04\\
\hline
April & 3,619 (7.53\%) & 48,067 & 48,489 & +0.88\\
\hline
May & 4,063 (8.45\%) & 48,067 & 48,004 & -0.13\\
\hline
June & 4,425 (9.21\%) & 48,067 & 47,609 & -0.95\\
\hline
July & 4,566 (9.50\%) & 48,067 & 47,456 & -1.27\\
\hline
August & 4,798 (9.98\%) & 48,067 & 47,203 & -1.80\\
\hline
September & 4,477 (9.31\%) & 48,067 & 47,553 & -1.07\\
\hline
October & 4,618 (9.61\%) & 48,067 & 47,399 & -1.39\\
\hline
November & 4,022 (8.37\%) & 48,067 & 48,049 & -0.04\\
\hline
December & 3,924 (8.16\%) & 48,067 & 48,156 & +0.19\\
\hline
\end{longtable}



Given that the imputation method is largely dependent on consistency across months, what happens when crime is very rare? Table \@ref(tab:countyDanvilleVehicle) shows what happens when replacing a single month for motor vehicle thefts in Danville, California, a small town which had 22 of these thefts in 2022. While possible to still have an even distribution of crimes over months, this is less likely when it comes to rare events. Here, having so few motor vehicle thefts means that small changes in monthly crimes can have an outsize effect. The average absolute value percent change now is 7.3% and this ranges from a -15.68% difference to a +9.1% difference from the real annual count. This means that having even a single month missing can vastly overcount or undercount the real values.


\begin{longtable}[t]{l|r|r|r|r}
\caption{(\#tab:countyDanvilleVehicle)The imputed number of motor vehicle thefts in Danville, California, in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing.}\\
\hline
Month & Vehicle Thefts That Month & Actual Annual Vehicle Thefts & Imputed Annual Vehicle Thefts & Percent Change\\
\hline
\endfirsthead
\caption[]{(\#tab:countyDanvilleVehicle)The imputed number of motor vehicle thefts in Danville, California, in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing. \textit{(continued)}}\\
\hline
Month & Vehicle Thefts That Month & Actual Annual Vehicle Thefts & Imputed Annual Vehicle Thefts & Percent Change\\
\hline
\endhead
January & 2 (7.41\%) & 27 & 27 & +0.00\\
\hline
February & 2 (7.41\%) & 27 & 27 & +0.00\\
\hline
March & 1 (3.70\%) & 27 & 28 & +3.70\\
\hline
April & 4 (14.81\%) & 27 & 25 & -7.41\\
\hline
May & 6 (22.22\%) & 27 & 23 & -14.81\\
\hline
June & 0 (0.00\%) & 27 & 29 & +7.41\\
\hline
July & 2 (7.41\%) & 27 & 27 & +0.00\\
\hline
August & 1 (3.70\%) & 27 & 28 & +3.70\\
\hline
September & 1 (3.70\%) & 27 & 28 & +3.70\\
\hline
October & 3 (11.11\%) & 27 & 26 & -3.70\\
\hline
November & 3 (11.11\%) & 27 & 26 & -3.70\\
\hline
December & 2 (7.41\%) & 27 & 27 & +0.00\\
\hline
\end{longtable}



In the above three tables we looked at what happens if a single month is missing. Below we will look at the results of simulating when between 1 and 9 months are missing for an agency. Table \@ref(tab:countyPhillyMurderMonthsMissing) looks at murder in Philadelphia again but now randomizes removing between 1 and 9 months of the year and interpolating the annual murder count using the current method. For each number of months removed I run 10,000 simulations.[^ucr_county-8] Given that I am literally randomly choosing which months to say are missing, I am assuming that missing data is missing completely at random. This is a very bold assumption and one that is the best-case scenario since it means that missing data is not related to crimes, police funding/staffing, or anything else relevant. So you should read the below tables as the most optimistic (and thus likely wrong) outcomes.

[^ucr_county-8]: This is actually more than I need to run to get the same results..

For each number of months reported the table shows the actual annual murder (which never changes) and the imputed mean, median, modal, minimum, and maximum annual murder count. As a function of the randomization, the imputed mean is always nearly identical to the real value. The most important columns, I believe, are the minimum and maximum imputed value since these show the worst-case scenario - that is, what happens when the month(s) least like the average month is replaced. Since as researchers we should try to minimize the harm caused from our work if it is wrong, I think it is safest to assume that if data is missing it is missing in the worst possible way. While this is a conservative approach, doing so otherwise leads to the greatest risk of using incorrect data, and incorrect results - and criminology is a field important enough to necessitate this caution.

As might be expected, as the number of months missing increases the quality of the imputation decreases. The minimum is further and further below the actual value while the maximum is further and further above the actual value.


\begin{longtable}[t]{l|r|r|r|r}
\caption{(\#tab:countyPhillyMurderMonthsMissing)A simulation showing how the imputed values of murders in Philadelphia in 2022 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run removing and imputing those months of data.}\\
\hline
\# of Months Missing & Mean Imputed Value & Median Imputed Value & Minimum Imputed Value & Maximum Imputed Value\\
\hline
\endfirsthead
\caption[]{(\#tab:countyPhillyMurderMonthsMissing)A simulation showing how the imputed values of murders in Philadelphia in 2022 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run removing and imputing those months of data. \textit{(continued)}}\\
\hline
\# of Months Missing & Mean Imputed Value & Median Imputed Value & Minimum Imputed Value & Maximum Imputed Value\\
\hline
\endhead
No Missing Data & 514.00 & 514.00 & 514.00 & 514.00\\
\hline
1 month & 514.08 & 517.09 & 499.64 & 533.45\\
\hline
2 & 514.12 & 513.60 & 483.60 & 546.00\\
\hline
3 & 513.81 & 513.33 & 468.00 & 556.00\\
\hline
4 & 514.15 & 513.00 & 457.50 & 565.50\\
\hline
5 & 513.95 & 514.29 & 444.00 & 577.71\\
\hline
6 & 514.05 & 514.00 & 434.00 & 594.00\\
\hline
7 & 514.45 & 513.60 & 424.80 & 612.00\\
\hline
8 & 513.85 & 516.00 & 411.00 & 627.00\\
\hline
9 & 513.02 & 512.00 & 388.00 & 652.00\\
\hline
\end{longtable}



This problem is even more pronounced when looking at agencies with fewer crimes and less evenly distributed crimes. Table \@ref(tab:countyDanvilleBurglaryMonthsMissing) repeats the above table but now looks at motor vehicle thefts in Danville, California. By the time 5 months are missing, the minimum value is nearly half of the actual value while the maximum value is a little under 50% larger than the actual value. By 9 months missing, possible imputed values range from 0% of the actual value to over twice as large as the actual value.


\begin{longtable}[t]{l|r|r|r|r}
\caption{(\#tab:countyDanvilleBurglaryMonthsMissing)A simulation showing how the imputed values of motor vehicle thefts in Danville, California, in 2022 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run for removing and imputing those months of data.}\\
\hline
\# of Months Missing & Mean Imputed Value & Median Imputed Value & Minimum Imputed Value & Maximum Imputed Value\\
\hline
\endfirsthead
\caption[]{(\#tab:countyDanvilleBurglaryMonthsMissing)A simulation showing how the imputed values of motor vehicle thefts in Danville, California, in 2022 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run for removing and imputing those months of data. \textit{(continued)}}\\
\hline
\# of Months Missing & Mean Imputed Value & Median Imputed Value & Minimum Imputed Value & Maximum Imputed Value\\
\hline
\endhead
No Missing Data & 27.00 & 27.00 & 27.00 & 27.00\\
\hline
1 month & 26.99 & 27.27 & 22.91 & 29.45\\
\hline
2 & 27.01 & 27.60 & 20.40 & 31.20\\
\hline
3 & 26.98 & 28.00 & 18.67 & 33.33\\
\hline
4 & 26.96 & 27.00 & 16.50 & 36.00\\
\hline
5 & 26.89 & 27.43 & 15.43 & 37.71\\
\hline
6 & 26.94 & 26.00 & 14.00 & 40.00\\
\hline
7 & 26.96 & 26.40 & 12.00 & 43.20\\
\hline
8 & 27.01 & 27.00 & 9.00 & 48.00\\
\hline
9 & 26.93 & 24.00 & 8.00 & 52.00\\
\hline
\end{longtable}




\begin{longtable}[t]{l|r|r|r|r}
\caption{(\#tab:countyMurderMonthsMissing)A simulation showing how the imputed values of murder in Danville, California, in 2019 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run for removing and imputing those months of data.}\\
\hline
\# of Months Missing & Mean Imputed Value & Median Imputed Value & Minimum Imputed Value & Maximum Imputed Value\\
\hline
\endfirsthead
\caption[]{(\#tab:countyMurderMonthsMissing)A simulation showing how the imputed values of murder in Danville, California, in 2019 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run for removing and imputing those months of data. \textit{(continued)}}\\
\hline
\# of Months Missing & Mean Imputed Value & Median Imputed Value & Minimum Imputed Value & Maximum Imputed Value\\
\hline
\endhead
No Missing Data & 1.00 & 1.00 & 1 & 1.00\\
\hline
1 month & 1.00 & 1.09 & 0 & 1.09\\
\hline
2 & 1.00 & 1.20 & 0 & 1.20\\
\hline
3 & 1.01 & 1.33 & 0 & 1.33\\
\hline
4 & 1.01 & 1.50 & 0 & 1.50\\
\hline
5 & 1.01 & 1.71 & 0 & 1.71\\
\hline
6 & 1.01 & 2.00 & 0 & 2.00\\
\hline
7 & 1.00 & 0.00 & 0 & 2.40\\
\hline
8 & 1.01 & 0.00 & 0 & 3.00\\
\hline
9 & 1.01 & 0.00 & 0 & 4.00\\
\hline
\end{longtable}



### 10-12 months missing

In cases where there are more than 9 months of data missing, the current imputation method replaces the entire year of data for that agency with the average of the crime for agencies who reported 12 months of data, are in the same state and in the same population group as the given agency. Considering that when an agency reports data it tends to report every month of the year - and about a quarter of agencies still do not report any months of data - this is a far bigger issue than when agencies are missing 1-9 months of data. The imputation process is also far worse here.

Whereas with 1-9 months missing the results were at least based on the own agency's data, and were actually not terribly wrong (depending on the specific agency and crime patterns) when only a small number of months were missing, the imputation for 10+ months missing is nonsensical. It assumes that these agencies are much like similarly sized agencies in the same state.

There are two major problems here. First, similarly sized agencies are based on the population group which is quite literally just a category indicating how big the agency is when grouped into rather arbitrary categories. These categories can range quite far - with agencies having millions more people than other agencies in the same category in some cases - so in most cases "similarly sized" agencies are not that similarly sized. The second issue is simply the assumption that population is all that important to crime rates. Population is certainly important to crime counts; New York City is going to have many more crimes than small towns purely due to its huge population, even though NYC has a low crime rate. But there is still huge variation in crimes among cities of the same or similar size as crime tends to concentrate in certain areas. So replacing an agency's annual crime counts with that or other agencies (even the average of other agencies) will give you a very wrong count.

For this method of replacing missing data to be accurate agencies in the same population group in each state would need to have very similar crime counts. Otherwise it is assuming that missing agencies are just average (literally) in terms of crime. This again assumes that missing data is missing at random, which is unlikely to be true.

In each of the below examples we use data from 2022 Offenses Known and Clearances by Arrest and use only agencies whose final month reported was December. This makes it the actual agencies in each population group that would replace agencies that are missing 10 or more months of data in 2022. As agencies can - and do - report different numbers of months each year, these numbers would be a little different if using any year other than 2022.

For each population group we will look at the mean, median, and maximum number of murders plus aggravated assaults with a gun.[^ucr_county-9] This is essentially a measure of the most serious violent crimes as the difference between gun assaults and murders is, to some degree, a matter of luck (e.g. where the person is shot can make the difference between an assault and a murder).[^ucr_county-10] This is actually not available in NACJD's county-level UCR data as they do not separate gun assaults from other aggravated assaults, though that data is available in the agency-level UCR data. If we see a wide range in the number of murders+gun-assaults in the below table, that'll indicate that this method of imputing missing data is highly flawed.

[^ucr_county-9]: Aggravated assaults with a gun include but are not limited to shootings. The gun does not need to be fired to be considered an aggregated assault.

[^ucr_county-10]: Attempted murders are considered aggravated assaults in the UCR.

Table \@ref(tab:countyPopulationGroupStatsNational) shows these values for all agencies in the United States who reported 12 months of data (based on the "December last month reported" definition) in 2022. The actual imputation process only looks at agencies in the same state, but this is still information at seeing broad trends - and we will look at two specific states below. Column 1 shows each of the population groups in the data while the remaining columns show the mean, median, minimum, and maximum number of murders+gun-assaults in 2022, respectively.[^ucr_county-11] For each population group there is a large range of values, as seen from the minimum and maximum values. There are also large differences in the mean and median values for larger (25,000+ population) agencies, particularly when compared to the top and bottom of the range of values. Using this imputation method will, in most cases (but soon we will see an instance where there is an exception) provide substantially different values than the real (but unknown) values.

[^ucr_county-11]: The agency-level UCR data actually has more population groups than this list, but NACJD has grouped some together. Given that some states may have few (or no) agencies in a population group, combining more groups together does alleviate the problem of having no comparison cities but at the tradeoff of making the comparison less similar to the given agency.


\begin{longtable}[t]{l|r|r|r|r|l}
\caption{(\#tab:countyPopulationGroupStatsNational)The mean, median, minimum, and maximum agency-level murder count nationwide for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December.}\\
\hline
Population Group & Mean Murder & Median Murder & 90th Percentile Murder & Minimum Murder & Max Murder\\
\hline
\endfirsthead
\caption[]{(\#tab:countyPopulationGroupStatsNational)The mean, median, minimum, and maximum agency-level murder count nationwide for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December. \textit{(continued)}}\\
\hline
Population Group & Mean Murder & Median Murder & 90th Percentile Murder & Minimum Murder & Max Murder\\
\hline
\endhead
City Under 2,500 & 0 & 0 & 0 & 0 & 10\\
\hline
City 2,500-9,999 & 0 & 0 & 1 & 0 & 9\\
\hline
City 10,000-24,999 & 0 & 0 & 2 & 0 & 14\\
\hline
City 25,000-49,999 & 1 & 0 & 4 & 0 & 31\\
\hline
City 50,000-99,999 & 2 & 1 & 7 & 0 & 47\\
\hline
City 100,000-249,999 & 9 & 6 & 23 & 0 & 122\\
\hline
City 250,000+ & 86 & 40 & 237 & 2 & 499\\
\hline
MSA Counties and MSA State Police & 1 & 0 & 4 & 0 & 122\\
\hline
Non-MSA Counties and Non-MSA State Police & 0 & 0 & 1 & 0 & 46\\
\hline
\end{longtable}




\begin{longtable}[t]{l|r|r|r|r|l}
\caption{(\#tab:countyPopulationGroupStats)The mean, median, minimum, 90th percentile, and maximum agency-level murder count nationwide for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December.}\\
\hline
Population Group & Mean Murder & Median Murder & 90th Percentile Murder & Minimum Murder & Max Murder\\
\hline
\endfirsthead
\caption[]{(\#tab:countyPopulationGroupStats)The mean, median, minimum, 90th percentile, and maximum agency-level murder count nationwide for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December. \textit{(continued)}}\\
\hline
Population Group & Mean Murder & Median Murder & 90th Percentile Murder & Minimum Murder & Max Murder\\
\hline
\endhead
City Under 2,500 & 0 & 0 & 0 & 0 & 10\\
\hline
City 2,500-9,999 & 0 & 0 & 1 & 0 & 9\\
\hline
City 10,000-24,999 & 0 & 0 & 2 & 0 & 14\\
\hline
City 25,000-49,999 & 1 & 0 & 4 & 0 & 31\\
\hline
City 50,000-99,999 & 2 & 1 & 7 & 0 & 47\\
\hline
City 100,000-249,999 & 9 & 6 & 23 & 0 & 122\\
\hline
City 250,000+ & 86 & 40 & 237 & 2 & 499\\
\hline
MSA Counties and MSA State Police & 1 & 0 & 4 & 0 & 122\\
\hline
Non-MSA Counties and Non-MSA State Police & 0 & 0 & 1 & 0 & 46\\
\hline
\end{longtable}



Since the actual imputation process looks only at agencies in the same state, we will look at two example states - Texas and Maine - and see how trends differ from nationally. These states are chosen as Texas is a very large (both in population and in number of jurisdictions) state with some areas of high crime while Maine is a small, more rural state with very low crime. Table \@ref(tab:countyPopulationGroupStatsTexas) shows results in Texas. Here, the findings are very similar to that of Table \@ref(tab:countyPopulationGroupStatsNational). While the numbers are different, and the maximum value is substantially smaller than using all agencies in the country, the basic findings of a wide range of values - especially at larger population groups - is the same.


\begin{longtable}[t]{l|r|r|r|r|l}
\caption{(\#tab:countyPopulationGroupStatsTexas)The mean, median, minimum, 90th percentile, and maximum agency-level murder count in Texas for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December.}\\
\hline
Population Group & Mean Murder & Median Murder & 90th Percentile Murder & Minimum Murder & Max Murder\\
\hline
\endfirsthead
\caption[]{(\#tab:countyPopulationGroupStatsTexas)The mean, median, minimum, 90th percentile, and maximum agency-level murder count in Texas for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December. \textit{(continued)}}\\
\hline
Population Group & Mean Murder & Median Murder & 90th Percentile Murder & Minimum Murder & Max Murder\\
\hline
\endhead
City Under 2,500 & 0 & 0 & 0 & 0 & 1\\
\hline
City 2,500-9,999 & 0 & 0 & 1 & 0 & 4\\
\hline
City 10,000-24,999 & 0 & 0 & 2 & 0 & 4\\
\hline
City 25,000-49,999 & 1 & 1 & 4 & 0 & 7\\
\hline
City 50,000-99,999 & 2 & 1 & 6 & 0 & 9\\
\hline
City 100,000-249,999 & 6 & 6 & 12 & 0 & 17\\
\hline
City 250,000+ & 84 & 27 & 234 & 3 & 343\\
\hline
MSA Counties and MSA State Police & 1 & 0 & 3 & 0 & 121\\
\hline
Non-MSA Counties and Non-MSA State Police & 0 & 0 & 1 & 0 & 9\\
\hline
\end{longtable}



Now we will look at data from Maine, as shown in Table \@ref(tab:countyPopulationGroupStatsMaine). Here, results are much better: there is a narrow range in values meaning that the imputation would be very similar to the real values. This is driven mainly by Maine being a tiny state, with only one city larger than 50,000 people (Portland) and Maine being an extremely safe state so most places have zero murders+gun-assaults. In cases like this, where both crime and population size are consistent across the state (which is generally caused by everywhere having low crime), this imputation process can work well.


\begin{longtable}[t]{l|r|r|r|r|r}
\caption{(\#tab:countyPopulationGroupStatsMaine)The mean, median, minimum, 90th percentile, and maximum agency-level murder count in Maine for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December.}\\
\hline
Population Group & Mean Murder & Median Murder & 90th Percentile Murder & Minimum Murder & Max Murder\\
\hline
\endfirsthead
\caption[]{(\#tab:countyPopulationGroupStatsMaine)The mean, median, minimum, 90th percentile, and maximum agency-level murder count in Maine for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December. \textit{(continued)}}\\
\hline
Population Group & Mean Murder & Median Murder & 90th Percentile Murder & Minimum Murder & Max Murder\\
\hline
\endhead
City Under 2,500 & 0 & 0 & 0 & 0 & 1\\
\hline
City 2,500-9,999 & 0 & 0 & 1 & 0 & 2\\
\hline
City 10,000-24,999 & 0 & 0 & 1 & 0 & 3\\
\hline
City 25,000-49,999 & 7 & 1 & 16 & 0 & 20\\
\hline
City 50,000-99,999 & 2 & 2 & 2 & 2 & 2\\
\hline
City 100,000-249,999 & - & - & - & - & -\\
\hline
City 250,000+ & - & - & - & - & -\\
\hline
MSA Counties and MSA State Police & 0 & 0 & 0 & 0 & 0\\
\hline
Non-MSA Counties and Non-MSA State Police & 1 & 0 & 0 & 0 & 18\\
\hline
\end{longtable}



<!--chapter:end:10_ucr_county.Rmd-->

# (PART) National Incident-Based Reporting System (NIBRS) {-}

# NIBRS Overview






Nearly a century ago the FBI started collecting data on crime that occurred in the United States as a way to better understand and respond to crime. This data, the [Uniform Crime Reporting (UCR) Program Data](https://ucrbook.com/), is a monthly count of the number of crime incidents (in cases where more than one crime happens per incident, only the most serious crime is included) in each police agency that reports data.^[This data has been expanded since it began in 1929 to include information on arrests, hate crimes, and stolen property.] Other than for homicides (which provides information about each victim and offender), only the number of crimes that occurred is included. So we know, for example, the number of robberies in a city but nothing about who the victims or offenders were, when in that month (day or time of day) the robberies occurred, or the type of location where they happened. To address these limitations the FBI started a new dataset in 1991, the National Incident-Based Reporting System data - which is known by its abbreviation NIBRS - and is the topic of this book. Relative to the FBI's UCR data there are far fewer "weird things" in NIBRS data. Still, we will cover instances of the "weirdness" in the data, such as the why crime always goes up on the 1st of the month, or why there are more crimes at noon than at nearly all other hours of the day. We will also be discussing how much of the detailed information that should be available in the data is missing, and when that affects which questions we can answer.

NIBRS data provides detailed information on every crime reported to the police, including victim and offender demographics, whether the offender was arrested (and the type of arrest it was), what date and time of day (by hour only) it happened on, the victim-offender relationship, and the crime location (as a location type, not the exact address). It also covers a far wider range of crimes than UCR data did. With the exception of UCR data on assaults against police officers, all NIBRS data can be converted back to UCR data, making it fully backwards compatible and, therefore, comparable to UCR data. In many ways NIBRS data is a massive improvement over UCR data. This data allows for a deeper understanding of crime and it has led to an explosion of research that allows a far more detailed analysis of crime and crime-policies than the blunt UCR data. 

However, there is a major limitation to this data: most agencies do not use it. [According to the FBI](https://www.fbi.gov/news/pressrel/press-releases/fbi-releases-2019-nibrs-crime-data) only about 8,500 police agencies, covering about 45% of the US population, reported NIBRS data in 2019 (the latest year currently available). This is fewer than half of the about 18,000 police agencies in the United States. This is an even larger problem than it seems as the agencies that do report - especially in earlier years of the data - are disproportionately small and rural. So we are missing out of data from most major cities. A number of states do not have any agencies reporting, making this data relatively biased at least in terms of geography and city size. **Even so, the FBI has said that they are moving entirely to NIBRS data starting in 2021, and will no longer even collect UCR data.** While NIBRS can be converted to UCR data, meaning we can have consistent statistics over time, for agencies that do not report to NIBRS, we have no information on their crimes. In effect, unless the majority of agencies suddenly switch to NIBRS - which, given that the high level of detail relative to UCR data makes moving to NIBRS a costly and timely switch - we will be flying blind for most crime in the country. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{11_nibrs_general_files/figure-latex/nibrsSegmentsAgencies-1} 

}

\caption{The number of agencies reporting data for each of the NIBRS Segments, 1991-2023.}(\#fig:nibrsSegmentsAgencies)
\end{figure}

## Problems with NIBRS

There are three major problems with NIBRS data, with the first two related to the lack of reporting. First, we are potentially looking at a massive loss of data when UCR data ends in 2020 - it takes over a year for data to be released so even though I am writing this in Spring 2021, 2019 UCR and NIBRS data are the latest years available. 2020 data would not be released by the FBI until September or October of this year. Considering the huge crime changes during 2020 - and the latest evidence suggests that the violent crime increase is continuing (and in places even accelerating) in 2021 - losing standardized crime data for most cities (and especially the largest cities) is a very bad thing. Moving the majority of agencies over to NIBRS so quickly may also risk the integrity of the data.^["Quickly" is a bit of a misnomer as agencies were free to report to NIBRS since it began in 1991 and the FBI had announced many years ago that they would only collect NIBRS in 2021. Still, given that the majority of agencies do not report to NIBRS and 2020 had a plague, the switch is likely to introduce issues and should be delayed.] As they rush to comply with the FBI's order that they only will accept NIBRS data, there will likely be more mistakes made and erroneous data included in NIBRS data. This will likely include both knowledge problems with agencies not understanding how to properly report data and the simply issue of typos leading to wrong information being entered. Though the FBI does do quality assurance checks, no check is foolproof - and their checks in UCR data have still allowed clearly impossible data to be entered (e.g. millions of arsons reported in a month in a small town). So while I always urge caution when using any data - caution that should be accompanied by a thorough examination of your data before using it - NIBRS data from 2020 and beyond merits extra attention.

The second problem is that even if suddenly all agencies do start reporting in 2021, we would only have a single year of data available. Even for agencies that already report, we generally do not have too many years of data for them. This really limits the kind of research since we can do since it is hard to know if a finding is based on a trend or is just a weird outlier without having many years of data available. For the agencies where 2020 is the first year, we will likely to have to wait a few years to even figure out what "normal" crime is supposed to look like. This means that for the next several years at least we will be mostly using NIBRS data as UCR-like datasets, aggregated to the month- or year-level so we can compare it with UCR data from the past. Luckily, this problem will be alleviated the longer we wait as more years of data will become available. 

The final issue is that this data is massive. A single year of 2019 data - with <50% of agencies reporting, and few large agencies reporting - has about 6.5 million crime incidents recorded. Since each crime incident can have multiple victims, offenders, and crimes, there are more rows for these datasets.^[While people generally refer to NIBRS just as "NIBRS data" it is actually a collection multiple different datasets all - with a few exceptions - corresponding to a single crime incident. For example, if you care about victim information you will look in the victim file called the "Victim Segment" (each of the datasets are called "Segments" since they are part of the whole picture of the crime incident) and likely will merge it with other data, such as when are where the crime occurred which is in the "Offense Segment". In most cases you will merge together multiple datasets from the NIBRS collection to be able to answer the question that you have.] Once all agencies report - though it is doubtful that'll ever occur, though we may come close - we are looking at tens of millions of rows per year. And even now if we wanted to look at a decade of data we are going to be dealing with over 50 million rows of data. So this data requires both good hardware - a strong laptop or server is necessary - and good programming skills, which most academics sorely lack. If you can, buy more RAM for your computer as that is much easier than having to write complicated code to deal with large data. I want to stress this point. If you intend to work with NIBRS data for any significant amount of time you should buy the most RAM your computer can use (RAM is very cheap now) and install it. I would recommend at least 16GB but more is better. While computers can handle NIBRS with less RAM, it'll just lead to you spending more time writing code to deal with big data and it'll inevitably still run slower than buying extra RAM. 

### NIBRS allows for different units of analysis

A major benefit of UCR data is that you have very limited choices. If you wanted to measure crime your only choice was to use their monthly aggregated police agency-level data. This makes working with the data relatively easy, even though what work you could do was limited. NIBRS data takes an opposite approach. It provides detailed data and largely leaves it up to the users for what to do with it. This flexibility is also a curse. For every use of this data you will need to decide which unit of analysis to use - and NIBRS provides a few options.

If you are interested in measuring rape you could do so in several different ways, each of which addresses a different part of crime measurement and will lead to different answers to your questions: the number of crime incidents, the number of victims, the number of offenders, and the number of crimes. Let us use an incident where four men rape a single woman as an example. Even if we somehow solve the issue of victims not reporting their rapes, we still have a few different ways of even measuring rape.  First, we can follow the old UCR measure of incident-level and say that this is one rape since only one crime incident occurred (even though there were multiple offenders). Second, we could look at the victim-level, which again is one rape as there was only one victim. Or at the offender-level, which now has four rapes since each offender would be responsible the rape. Finally we could look at the offense-level. Even though the four men were involved in the rape incident, potentially not all of them would have actually committed the rape (and would have the offense in NIBRS data as something else such as assault or attempted rape if they did not complete the act). Some could have acted as, for example, lookouts so would be involved with the incident but not the rape. So through this measure we would have between one and four rapes, depending on the exact circumstances. Each way of measuring could lead to substantially different understandings of rape, and this is the kind of complexity that we will have to wrangle with when using NIBRS data.

Since this data includes multiple crimes in each criminal incident, unlike the UCR which includes only the most serious crime per incident, we can also measure crime in its relationship to other crimes. In the above example we are interested in rapes. The UCR method would measure it as the number of rapes in incidents where rape is the most serious charge ("most serious" is based on the FBI's hierarchy of offenses, following what they call the Hierarchy Rule) but this undercounts crimes where rape happened alongside another, more serious, offense.^[Based on the Hierarchy Rule, only murder is more serious.] So we can also look at incidents where any offense that occurred was a rape. Using this method we can examine how often rape - or any crime we are interested in - co-occurs with other offenses, which provides more information on how crime happens that looking at one crime alone. For example, we could see how often burglary-rapes occur, a crime which is far different than spousal-rape, and in UCR data we would have no way of differentiating the two. In most cases, however, only one offense occurs per criminal incident (at least as reported in the data), so the opportunity to explore co-occurrence is relatively limited.

## Which agencies report data

So if this data has the same information (other than unfounded and negative crimes) as UCR data, but is also far more detailed, why do people ever use UCR data? Besides NIBRS being more complicated to use, far fewer agencies report NIBRS data than do UCR data. Nearly all agencies report crime data for UCR, though fewer do so for some of the UCR datasets such as arrests or arsons - for more, please see my [UCR book](https://ucrbook.com/). In comparison, fewer than half of agencies report to NIBRS, and these agencies are disproportionately smaller and more rural. Starting with 2021 data, the FBI has stopped collecting UCR data, instead only collecting NIBRS data. So if - and this is a very large if - many more agencies move to NIBRS in 2021, we will start having much more detail from a very representative sample of agencies. Even so, most research - especially policy analyses - requires many years of data so it'll take many years before the full potential of NIBRS data can be realized.

We will look here at how many agencies report at least one crime each year between 1991 - the first year of data - and 2019 - the latest year of data - as well as compare NIBRS reporting to UCR reporting. Figure \@ref(fig:agenciesReporting) shows the number of agencies each year that reported at least one incident. Keep in mind that there are about 18,000 police agencies in the United States. Only a little over 600 agencies reported in 1991. This has grown pretty linearly, adding a few hundred agencies each year though that trend accelerated in recent years. In 2019, nearly 8,200 agencies reported at least some data to NIBRS. Compared to the estimated 18,000 police agencies in the United States, however, this is still fewer than half of agencies. The data shown here is potentially an overcount, however, as it includes agencies reporting any crime that year, even if they do not report every month. 

Another way to look at reporting is comparing it to reporting to UCR. Figure \@ref(fig:agenciesReportingMap) shows the number of agencies in each state that report NIBRS data in 2019. Since 2019 is the year with the most participation, this does overstate reporting for previous years. This map pretty closely follows a population map of the US. Texas had the most agencies, followed by Michigan and Ohio. The southern states have more agencies reporting than the lightly populated northern states. The issue here is that a number of states are in white, indicating that very few agencies reported. Indeed, four of the most populated states - California, New York, Florida, and New Jersey - do not have any agencies at all that report NIBRS data.

Since the number of agencies in a state is partially just a factor of population, Figure \@ref(fig:agenciesReportingMapPercent) shows each state as a percent of agencies in that state that report to NIBRS that also reported to the UCR Offenses Known and Clearances by Arrest (the "crime" dataset) in 2019.^[This is the UCR dataset which has the highest reporting rate.] Not all agencies in the US reported to UCR in 2019 -  and a small number reported to NIBRS but not UCR in 2019 - but this is a fairly good measure of reporting rates. Here the story looks a bit different than in the previous figure. Now we can tell that among north-western states and states along the Appalachian Mountains, nearly all agencies report. In total, 18 states have 90% or more of agencies that reported to UCR in 2019 also reporting to NIBRS. Thirteen agencies have fewer than 10% of agencies reporting to NIBRS that also reported to UCR, with 5 of these having 0% of agencies reporting. The remaining states average about 56% of agencies reporting. So when using NIBRS data, keep in mind that you have very good coverage of certain states, and very poor coverage of other states. And the low - or zero - reporting states are systematically high population states.    

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{11_nibrs_general_files/figure-latex/nibrsAnnualNumberAgencies-1} 

}

\caption{The annual number of police agencies that report data to NIBRS.}(\#fig:nibrsAnnualNumberAgencies)
\end{figure}




\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{11_nibrs_general_files/figure-latex/nibrsAnnualPercentPopulation-1} 

}

\caption{The annual percent of the United States population that is covered by an agency reporting data to NIBRS.}(\#fig:nibrsAnnualPercentPopulation)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{11_nibrs_general_files/figure-latex/nibrsStateParticipation2000-1} 

}

\caption{The percent of each state's population that is covered by police agencies reporting at least one month of data to NIBRS, 2000}(\#fig:nibrsStateParticipation2000)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{11_nibrs_general_files/figure-latex/nibrsStateParticipation2010-1} 

}

\caption{The percent of each state's population that is covered by police agencies reporting at least one month of data to NIBRS, 2010}(\#fig:nibrsStateParticipation2010)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{11_nibrs_general_files/figure-latex/nibrsStateParticipation2022-1} 

}

\caption{The percent of each state's population that is covered by police agencies reporting at least one month of data to NIBRS, 2023 (using 2022 ACS 5-year Census data)}(\#fig:nibrsStateParticipation2022)
\end{figure}

## Crimes included in NIBRS

NIBRS data contains far more crime categories than in the UCR data, particularly far more than [UCR crime data](https://ucrbook.com/ucrGeneral.html#crimes-in-the-offenses-known-and-clearances-by-arrest-dataset) which contained only eight crimes (and their subcategories of crimes). It also includes several more crime categories than in the [UCR arrest data](https://ucrbook.com/ucrGeneral.html#crimes-in-the-arrests-by-age-sex-and-race-dataset) which is far more expansive than the UCR crime dataset. Compared to UCR data, however, there are occasionally more steps you must take to get the same crime category. For example, UCR crime data has the number of gun assaults each month. NIBRS data has the number of aggravated assaults only, but has a variable indicating what weapon the offender used. So you can find out how many aggravated assaults used a gun, giving you the same data as in the UCR, but you need to take extra steps to get there. 

Likewise the UCR arrest data has the number of people arrested for selling drugs (broken down into a few different categories of drugs). NIBRS data has if the crime type was a "drug/narcotic violation" which means any crime having to deal with drugs possession, sale, or manufacturing, and excluding drug equipment crimes. We then have to look first at the subcategory of offenses to see if the arrest was for possession, for sale, for manufacturing, or some other kind of drug crime. The final step to be comparable to UCR data is to look at the type of drug involved in the crime. You'll often have to do steps like this during NIBRS research. NIBRS data is available in multiple files that all (for the most part) correspond with each other so you will tend to have to combine them together to get the complete data you want. 

The crimes included in NIBRS are broken into two categories: Group A and Group B crimes.

### Group A crimes

The first set of crimes included are Group A crimes and these are really the main crimes included in NIBRS. For each of these crimes we have full data on the victim, the offender, the offense, any property stolen or damaged (or for drug crimes, seized by the police), and information about the arrestee (if any). Of course, not all of this data may be available (e.g. information on the offender is unknown) so there can be significant amounts of missing data, but each crime incident does have corresponding files with this information.

The complete list of Group A crimes is below. I have bolded the Index Crimes which are a flawed, but ubiquitous measure of crime used in the UCR crime data as the main measure of crime in the United States. The Index Crimes are murder, rape (sexual assault with an object and sodomy are only considered rape using the FBI new definition that began in 2013), aggravated assault, robbery (these four are the "Violent Index Crimes"), burglary, motor vehicle theft, and theft (these are the "Property Index Crimes". Theft here is broken down into several types of theft like purse-snatching and shoplifting. In the UCR crime dataset it is only "theft".). Arson is also technically an Index Crime (arson is considered a property crime) but is generally excluded. 

                             
* Animal Cruelty                                                     
* Arson                                                              
* __Assault Offenses - Aggravated Assault__                              
* Assault Offenses - Intimidation                                    
* __Assault Offenses - Simple Assault__
* Bad Checks                                                         
* Bribery                                                            
* __Burglary/Breaking And Entering__
* *Commerce Violations - Import Violations*
* *Commerce Violations - Export Violations*
* Commerce Violations - Federal Liquor Offenses    
* *Commerce Violations - Federal Tobacco Offenses*     
* *Commerce Violations - Wildlife Trafficking*
* Counterfeiting/Forgery                                              
* Destruction/Damage/Vandalism of Property                                       
* Driving Under The Influence                                        
* Drug/Narcotic Offenses - Drug Equipment Violations                 
* Drug/Narcotic Offenses - Drug/Narcotic Violations                  
* Drunkenness                                                        
* Embezzlement
* *Espionage*
* Extortion/Blackmail                                                
* Fraud Offenses - Credit Card/Atm Fraud                             
* Fraud Offenses - False Pretenses/Swindle/Confidence Game           
* Fraud Offenses - Hacking/Computer Invasion                         
* Fraud Offenses - Identity Theft                                    
* Fraud Offenses - Impersonation        
* *Fraud Offenses - Money Laundering*
* Fraud Offenses - Welfare Fraud                                     
* Fraud Offenses - Wire Fraud                                        
* Fugitive Offenses - Flight To Avoid Prosecution       
* *Fugitive Offenses - Flight to Avoid Deportation*      
* Fugitive Offenses - Harboring Escappee/Concealing From Arrest      
* Gambling Offenses - Betting/Wagering                               
* Gambling Offenses - Gambling Equipment Violations                  
* Gambling Offenses - Operating/Promoting/Assisting Gambling         
* Gambling Offenses - Sports Tampering                               
* Human Trafficking - Commercial Sex Acts                            
* Human Trafficking - Involuntary Servitude                          
* Immigration Violations - Illegal Entry Into The United States      
* *Immigration Violations - False Citizenship*
* *Immigration Violations - Smuggling Aliens*
* *Immigration Violations - Re-entry after Deportation*      
* Kidnapping/Abduction                                               
* __Larceny/Theft Offenses - All Other Larceny__
* __Larceny/Theft Offenses - Pocket-Picking__
* __Larceny/Theft Offenses - Purse-Snatching__
* __Larceny/Theft Offenses - Shoplifting__
* __Larceny/Theft Offenses - Theft From Building__
* __Larceny/Theft Offenses - Theft From Coin-Operated Machine Or Device__
* __Larceny/Theft Offenses - Theft From Motor Vehicle__
* __Larceny/Theft Offenses - Theft of Motor Vehicle Parts/Accessories__                                   
* __Motor Vehicle Theft__
* __Murder/Nonnegligent Manslaughter__
* __Negligent Manslaughter__
* Peeping Tom                                                          
* Pornography/Obscene Material                                       
* Prostitution Offenses - Assisting Or Promoting Prostitution        
* Prostitution Offenses - Prostitution                               
* Prostitution Offenses - Purchasing Prostitution                    
* __Robbery__                                             
* Sex Offenses - Failure To Register As A Sex Offender               
* Sex Offenses - Fondling (Indecent Liberties/Child Molest)          
* Sex Offenses - Incest                                              
* __Sex Offenses - Rape__
* __Sex Offenses - Sexual Assault With An Object__
* __Sex Offenses - Sodomy__
* Sex Offenses - Statutory Rape                                      
* Stolen Property Offenses (Receiving, Selling, Etc.)    
* *Treason*
* Weapon Law Violations - Explosives                                 
* *Weapon Law Violations - Violation of National Firearm Act of 1934*                                 
* Weapon Law Violations - Weapon Law Violations 
* *Weapon Law Violations - Weapons of Mass Destruction*

### Group B crimes

The other set of crimes included in NIBRS are called Group B crimes. For these crimes, only the arrestee segment is available, meaning that we have far more limited data on these incidents than for Group A crimes. Unlike Group A, we only have data here when a person was arrested for the crime, so we do not know how often they occur without an arrest made. These crimes are considered Group B rather than Group A, according to the FBI, because they are less serious or less common than Group A crimes. This is not really true though. They are certainly less serious than the most serious Group A crimes but include offenses more serious than some Group A crimes. For example, DUIs can potentially lead to serious injury if they crash into someone (if they did then that would likely be considered a charge like manslaughter or assault, but DUIs still have the *potential* to cause great harm) and peeping toms are an invasion of privacy and can cause serious distress to their victims. Relative to crimes like shoplifting, Group B offenses can indeed be more serious. Group B crimes are also quite common, particularly the catch-all category All Other Offenses. 

One way I like to think of Group B crimes is that they are mostly - excluding peeping tom - victim-less crimes, or more specifically crimes without a specific victim. For example, in DUIs there is no individual victim; public drunkenness may disturb certain people around the event but they are not the victims of the drunkenness. There are Group A crimes where the same is true, such as drug offenses, but I think this is a helpful way of thinking about Group B crimes. 

* All Other Offenses - excludes traffic violations
* Bad Checks (removed starting in 2021)
* Curfew/Loitering/Vagrancy Violations
* Disorderly Conduct
* Driving Under The Influence (DUI)
* Drunkenness (removed starting in 2021)
* Failure To Appear
* Family Offenses, Nonviolent
* Federal Resource Violations
* Liquor Law Violations
* Peeping Tom (removed starting in 2021)
* Perjury
* Runaway
* Trespass of Real Property

## Differences from SRS data

While NIBRS data is a far more expansive and detailed dataset than the SRS data, in most cases you can convert NIBRS to SRS which allows for continuation of data over time. So the switch from SRS to NIBRS adds a lot of information but loses relatively little. That relatively little amount of difference, however, can impact the types of questions we can ask so they are detailed below.

### NIBRS does not have unfounded crimes

In SRS data, which provides monthly counts of crimes (as well as more detailed information on hate crimes and homicides, and monthly counts of arrests), there is a count of "unfounded" crimes in each month. An unfounded crime is just one which was previously reported and then new evidence finds out that it never actually occurred (or that it is not for the crime that was reported). For example, if you misplace your wallet but think it is stolen you may call the police and report it stolen. This would be recorded in SRS data as a theft. If you then find your wallet and tell the police, then it would be changed to an unfounded crime since the reported theft never actually happened. NIBRS data does not include unfounded data at all so you do not know how many reported crimes turn out to not be true. In practice, this does not matter too much as unfounded crimes are rare, constituting generally under 2% of each crime type. The major exception is in rape, where some agencies report that over 10% of rapes in certain years are unfounded. 

Unfounded crimes are also a way that the SRS used to identify justifiable homicides and when police killed someone. But that way was not always used properly and NIBRS data already includes justifiable homicide as a crime category so this is not a problem.

#### NIBRS does not have negative numbers

Negative numbers in SRS data are because when a crime is reported and then later unfounded, in the month that it is unfounded it is classified as -1 crimes. This is so over the long term (i.e. more than a single month) the positive (but incorrect, and therefore later unfounded) reports and the negative reports to deal with unfounding would equal out so you have the actual number of crimes. In practice though this tended to end up confusing users - though only users who did not read the manual. Since NIBRS does not have unfounded data, and since it is not aggregated beyond the incident-level anyways, there are no negative numbers in NIBRS data.


## A summary of each segment file

NIBRS data is often discussed - and is used - as if it were a single file with all of this information available. But it actually comes as multiple different files that each provide different information about a crime incident, including at different levels of analysis so users must clean each segment before merging them together. In this section we will discuss each of the segments and how they are related to each other. First, keep in mind that NIBRS is at its core an incident-level dataset (hence the "Incident-Based" part of its name). Everything that we have stems from the incident, even though we can get more detailed and look at, for example, individual victims in an incident or even offenses within an incident. Figure \@ref(fig:segmentFlowchart) shows the seven main segments and how they relate to each other. There are also three segments called "window segments" - there is one for arrestees, one of exceptional clearances (i.e. police could have made an arrest but did not for some reason but still consider the case closed), and one for property - that do not have an associated segment with them, they only have the information available in the given "window" segment. We will talk about window segments more in Section \@ref(window) below.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{images/nibrsSegments} 

}

\caption{The association of each segment file in the NIBRS dataset.}(\#fig:segmentFlowchart)
\end{figure}

The first two boxes in Figure \@ref(fig:segmentFlowchart), colored in orange, are not part of NIBRS but are part of the data generating process. First, obviously, a crime has to occur. The police then have to learn about the crime. This can happen in two ways. First, they can discover it themselves while on patrol. This is common in crimes such as drug possession or sale as well as any crime that occurs outdoors, which is largely where police are able to observe behavior. The second way is that the victim or witness to a crime reports it. So if they call the police to report a crime, the police learn about it from that call. We do not actually know from the data how the police learned of a crime but it is important to think about this data generating process when using the data. 
Alongside the crime being reported (or discovered) to the police, agencies must then report the crime to NIBRS. All crimes that occur in that agency's jurisdiction *should* be reported, but that is not always the case. Since reporting is voluntary (at least nationally, though some states do require agencies to report data), agencies are free to report as many or as few crimes as they wish. This often occurs when agencies report only parts of the year, excluding certain months, so you should ensure that the agency reported data for each month you are interested in.

Once a crime occurs and is reported to the police, it can be recorded to NIBRS in two ways, depending on the type of crime that occurred. If it is one of the Group B crimes, then we only get a Group B Arrestee Segment which is the same as the normal arrestee segment which we discuss in more detail below as well as in Chapter \@ref(arrestee). In this segment we have useful variables including the type of arrest (e.g. arrested by a warrant), what crime was committed, demographics of the arrestee, and weapon use. However, we are missing a wealth of information that is available in the other segments. When the crime is one of the Group A crimes, we get all of this additional information.

For Group A crimes, we get every other segment, starting with the Administrative Segment. The Administrative Segment is largely a meta-segment - it provides information about other segments. The Administrative Segment is the only incident-level segment of the collection and provides information that is consistent across every offense in the incident such as the incident date and time (in hours of the day). It also includes the type of exceptional clearance for the incident, if the incident was exceptionally cleared. The key part of this segment, however, is that it tells you how many of the Offense, Offender, Victim, and Property segments that are associated with this incident. There are always at least one of these segments per incident, but can potentially be multiple of each segment. These other segments do exactly what their name suggests, providing information about the offenses, offender, victims, and stolen or damaged property for each crime incident. Each of these segments, including the Administrative Segment, have the agency identifier code (the ORI code which is discussed on Section \@ref(ori)) and an incident number (which is just a randomly generated unique identifier for that incident) so you can merge the files together. Please note that the incident number of only unique *within* an agency. So there can - and are - incident numbers that are identical across different agencies but are for different incidents. To avoid this issue, make sure you match based on *both* the ORI code and the incident number (or make a new variable with just combines the ORI code and incident number together).

At the bottom is the Arrestee Segment which is only available when a person was arrested for that incident. This provides a bit more detailed data than the Offender Segment for everyone who was arrested for the incident. Now, in reality arrestees are not necessarily a subset of offenders as some people arrested may not be the ones included in the offender data. Consider, for example, a crime where police initially think two people committed it but end up arresting three people for the crime. The third person would be in the arrestee file but not the offender file. However, in this data there is never a case where there are more arrestees than offenders so it appears that if an offender is arrested who was not previously known to the police, they add a corresponding offender segment row for that arrestee.

### Administrative Segment

The Administrative Segment provides information about the incident itself, such as how many victims or offenders there were. In practice this means that it tells us how many other segments - offense, offender, victim, and arrestee segments - there are for this particular incident. It also has several important variables at the incident-level such as what hour of the day the incident occurred and whether the incident date variable is actually just the date the incident was reported. Finally, it tells us whether the case was cleared exceptionally and, if so, what type of exceptional clearance it was. This can tell us, for example, how many crimes were cleared because the offender died or the victim refused to cooperate. As the UCR data does not differentiate between normal clearances (i.e. arrest the offender) and exceptional clearances, this provides a far deeper understanding of case outcomes. 

### Offense Segment

This segment provides information about the offense that occurred, and each incident can have multiple offenses. This data tells you which offense occurred and for a subset of offenses it also provides a more detailed subcategory of offense, allowing a deeper dive into what exactly happened. For example, for animal abuse there are four subcategories of offenses: simple/gross neglect of an animal, intentional abuse or torture, animal sexual abuse (bestiality), and organized fighting of animals such as dog or cock fights. This segment also says what date the crime occurred on, where the crime occurred - in categories such as residence or sidewalk rather than exact coordinates in a city - whether the offender is suspected of using drugs, alcohol, or "computer equipment" (which includes cell phones) during the crime, and which weapon was used. In cases where the weapon was a firearm it says whether that weapon was fully automatic or not. It also provides information on if the crime was a hate crime by including a variable on the bias motivation (if any) of the offender. This is based on evidence that the crime was motivated, at least in part, by the victim's group (e.g. race, sexuality, religion, etc.). There are 34 possible bias motivations and while hate crimes could potentially be motivated by bias against multiple groups, this data only allows for a single bias motivation.

### Offender Segment

As might be expected, the Offender Segment provides information about who the offender is for each incident, though this is limited to only demographic variables. So we know the age, sex, and race of each offender but nothing else. This means that important variables such as criminal history, ethnicity, socioeconomic status, and motive are missing. In the Victim Segment we learn about the relationship between the victim and offender, and in the Offense Segment we learn which weapon (if any) the offender used. So there is some other data on the offender in other segments but it is quite limited. This data has one row per offender so incidents with multiple offenders have multiple rows. In cases where there is no information about the offender there will be a single row where all of the offender variables will be "unknown." In these cases having a single row for the offender is merely a placeholder and does not necessarily mean that there was only one offender for that incident. However, there is no indicator for when this is a placeholder and when there was actually one offender but whose demographic information is unknown.

### Victim Segment

The Victim Segment provides data at the victim-level and includes information about who the victim is and their relationship to offenders. This data tells us what "type" of victim it is with the type meaning if they are a police officer, a civilian (called an "Individual" victim and basically any person who is not a police officer), a business, the government, etc. It also includes the standard demographics variables in other segments - age, race, sex, ethnicity - as well as whether the victim is a resident (i.e. do they live there?) of the jurisdiction where they were victimized. We also learn from this data what types of injuries (if any) the victim suffered as a result of the crime. This is limited to physical injuries - excluding important outcomes such as mental duress or PTSD - but allows for a much better measure of harm from crime than simply assuming (or using past studies that tend to be old and only look at the cost of crime) what harm comes from certain offenses. There are seven possible injury types (including no injury at all) and victims can report up to five of these injuries so we have a fairly detailed measure of victim injury.

One highly interesting variable in this segment is the relationship between the victim and the offender (for up to 10 offenders). This includes, for example, if the victim was the offender's wife, their child, employee, or if the stranger was unknown to them, with 27 total possible relationship categories. You can use this to determine which incidents were crimes by strangers, identify domestic violence, or simply learn about the victim-offender relationship for certain types of crimes. This variable is only available when the victim is a police officer or an "individual." This makes some sense though there could actually be cases where non-human victims (e.g. businesses, religious organizations) do have a relationship with the offender such as an employee stealing from a store. Related to the victim-offender relationship, this segment provides a bit of information about the motive for the crime. For aggravated assaults and homicides, there is a variable with the "circumstance" of the offense which is essentially the reason why the crime occurred. For example, possible circumstances include arguments between people, hunting accidents, child playing with weapon, and mercy killings. 

### Arrestee and Group B Arrestee Segment

The Arrestee Segment has information on the person arrested in an incident and has a number of variables that look at same as in previous segments but with subtle differences. This segment covers the arrestee's age, sex, and race, ethnicity, and residency status (of the city, not as a United States citizen). Age, sex, and race are also in the Offender Segment but can differ as not all offenders are arrested. It also says the crime the arrestee was arrested for (which in some cases is different than the crime committed in the offense since an arrest can clear multiple incidents), the weapon carried during the arrest (which may be different than the weapon used during the offense) and if this weapon (if it is a firearm) was an automatic weapon. There are a few completely new variables including the date of the arrest and the type of arrest. The type of arrest is simply whether the person was arrested by police who viewed the crime, if the arrest followed an arrest warrant or a previous arrest (i.e. arrested for a different crime and then police find out you also committed this one so they consider you arrested for this one too), and whether the person was cited by police and ordered to appear in court but not formally taken into custody. Finally, for juvenile arrestees it says whether arrestees were "handled within the department" which means they were released without formal sanctions or were "referred to other authorities" such as juvenile or criminal court, a welfare agency, or probation or parole department (for those on probation or parole). 

### Property Segment

The Property Segment provides a bit more information than would be expected from the name. For each item involved in the crime it tells you what category that items falls into, with 68 total categories of types of property (including "other") ranging from explosives and pets to money and alcohol. It also tells you the estimated value of that item. This data covers more than just items stolen during a crime. For each item it tells you what happened to that item such as if it was stolen, damaged, seized by police (such as illegal items like drugs), recovered by police, or burned during an arson.

For drug offenses it includes the drugs seized by police. For these offenses, the data tells us the type of drug, with 16 different drug categories ranging from specific ones like marijuana or heroin to broader categories such as "other narcotics". There can be up to three different drugs included in this data - if the person has more than three types of drugs seized then the third drug category will simply indicate that there are more than three drugs, so we learn what the first two drugs are but not the third or greater drugs are in these cases. For each drug we also know exactly how much was seized with one variable saying the amount the police found and another saying the units we should we reading that amount as (e.g. pills, grams, plants). 

### Window segments {#window}

The final set of segments are the "Window" segments which are partial reports meaning that the incident does not have all of the other segment files associated with it. There are three window segments Window Arrestee, Window Property, and Window Exceptional Clearance. All three are very rare relative to non-window data and are generally no more than several thousand incidents per year (the non-window data is several million per year). Window files are here when the crime occurred before the agency started reporting to NIBRS and then the arrest happened after they switched to NIBRS. 


<!--chapter:end:11_nibrs_general.Rmd-->

# Administrative Segment 





The Administrative Segment provides information about the incident itself, such as how many victims or offenders there were. In practice this means that it tells us how many other segments - Offense, Offender, Victim, and Arrestee Segments - there are for this particular incident. It also has several important variables at the incident-level such as what hour of the day the incident occurred and whether the "incident date" variable refers to the date the incident occurred or the date it was reported to the police. Finally, it tells us whether the case was cleared exceptionally and, if so, what type of exceptional clearance it was. An exceptional clearance is one where the police can declare the case closed but without making an arrest. This can tell us, for example, how many crimes were cleared because the offender died or the victim refused to cooperate. In comparison, the Offenses Known and Clearances by Arrest data that is part of the SRS and is detailed in Chapter \@ref(offensesKnown), tells us how many offenses were cleared by either arrest or exceptional clearance, but does not differentiate between the two. NIBRS, therefore, provides a deeper understanding of case outcomes. 

## The incident and report date

An important variable, especially for policy analyses, is when the crime happened. NIBRS tells you both the date and the hour of the day for when the crime occurred. We will start with the date. We can convert the date a few different ways, such as daily, weekly, monthly, quarterly. We could use this precise date to do regression discontinuity studies where we look at days just before and just after some policy change or natural experiment. In this chapter we will look simply at the percent of crimes each month and each day of the month (overall, not within each month). And we will look at all incidents; if you want to see the distribution for certain offenses or victim/offender groups you will need to merge this segment with one of the other segments. 

Figure \@ref(fig:administrativeIncidentMonth) shows the percent of incidents in the 2022 for each month. Past research has found that crimes are lowest when it is cold and highest when it is hot^[Summer also comes with many teens and young adults out of school so have more free time to offend or be victimized, so the weather is only part of the cause.]. Consistent with previous research, we find that crime rates are lowest in February, steadily increasing through the warmer months before peaking in July and August, then decreasing as temperatures cool. These seasonal patterns are important in understanding how environmental factors, such as weather, influence criminal activity, and they can help law enforcement agencies plan how many officers they want on patrol since they can determine which times of the year have the highest expected crime.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeIncidentMonth-1} 

}

\caption{The percent of crime incidents in 2022 NIBRS by the month of incident.}(\#fig:administrativeIncidentMonth)
\end{figure}

We can also look at the days of the month to see if there is any variation there. Figure \@ref(fig:administrativeMonthDayIncident) shows the percent of incidents on each day of the month. There's not much variation other than a few days. The 29th and 30th day of the month have fewer incidents than average, and the 31st day has by far the fewest incidents These findings are reasonable since not all months have more than 28 days so by definition there are fewer 31st (and 29th, and 30th) days of the month for crimes to occur on. 

The most common day of the month is the 1st which accounts for 3.95% of all incidents. In this data the agencies must report a date, even if they do not know the exact date; there is no option to put "unknown date". When agencies are unsure of the exact date of a crime, they appear to default to entering the 1st of the month as a placeholder. This practice introduces a potential source of error, and researchers should be cautious when analyzing trends that rely on specific dates, as the 1st of the month may disproportionately represent incidents with unknown dates.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeMonthDayIncident-1} 

}

\caption{The percent of incidents that occur using the day of the incident, even if the incidents was not reported that day, each day of the month for all agencies reporting to NIBRS in 2022.}(\#fig:administrativeMonthDayIncident)
\end{figure}

The above graph showed the days of the month where the incident was said to occur. There is also a variable that says if the date included was the incident date or the date the crime was reported to the police. Figure \@ref(fig:administrativeMonthDayReport) replicates Figure \@ref(fig:administrativeMonthDayIncident) but now shows only report dates rather than incident date. Here too we see the same pattern of the 1st of the month having a disproportionate share of data, again suggesting that it is a placeholder for "unknown" dates.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeMonthDayReport-1} 

}

\caption{The percent of incidents that are reported (the day of the report, even if not the day of the incident) each day of the month for all agencies reporting to NIBRS in 2022.}(\#fig:administrativeMonthDayReport)
\end{figure}

## Hour of incident

Understanding the exact time of day when crimes occur is crucial for developing effective anti-crime strategies. For example, if crime spikes consistently at the end of the local high school day, this may indicate that students are involved in these incidents, either as victims or offenders. Law enforcement agencies can use this information to adjust patrol schedules and allocate resources more effectively to areas and times with higher crime rates. Luckily, NIBRS data does have the time of each incident, though it is only at the hour level.

Figure \@ref(fig:administrativeHours) shows the distribution of incidents that occurred in the 2022 for each hour of the day. There are two key trends in this figure. First, past research has found that crime tends to increase during the night (this is especially true during weekends), drop to a daily low in the couple of hours before sunrise, and then slowly increase as the day progresses.^[In all of the nighttime police ride-alongs I have been on the police tend to stop patrolling in early morning (e.g. 3-4am) and go back to the station to do paperwork. I think this likely partially explains the findings that crime is lowest around 4-5am.] What we find here is a little different. Crime peaks at night at 5-5:59pm which is far earlier than other estimates. Since this is all crimes it could be biased by large increases of certain crimes at this time, such as people coming home from work and finding their house burgled. As crimes differ in their timing (e.g. burglary happens often during the day, fights are more common at night), you will need to merge this segment with the Offense Segment to be able to look at certain types of crimes alone.

The substantial spike at midnight is unlikely to reflect actual crime patterns, as the number of incidents during this hour is more than triple that of neighboring hours. The noon hour is about 50% larger than in the neighboring hours, so is a sizable increase though continues the trend of increasing crime during the day and is a far smaller increase than at midnight. This suggests that, similar to the "1st of the month" issue, officers may be using midnight and (less so) noon as a placeholder when the exact time of the crime is unknown. Researchers should exclude the midnight and noon hours from time-sensitive analyses to avoid skewed results.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeHours-1} 

}

\caption{The percent of crimes that are reported each hour for all agencies reporting to NIBRS in 2022.}(\#fig:administrativeHours)
\end{figure}

To look at these trends over time, Figure \@ref(fig:nibrsAdministrativeHours) shows the percent of incidents each year that are reported at noon, at midnight, and where the hour is unknown. The noon hour has slowly and steadily become more common, moving from about 4% in 1991 to 6% in 2022. The midnight hour has seen more fluctuations, increasing to 9% by 1993 before steadily decreasing until a large and sustained spike to 9% in 2017. The spike was caused by the end of data being reported as having an unknown hour. While the share of incidents with an unknown hour has also fluctuated - from around 2.5% to 5% of incidents depending on the year - that dropped to 0% in 2017, as unknown hours stopped being reported after 2016.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/nibrsAdministrativeHours-1} 

}

\caption{Annual percent of incidents that occurred at midnight, noon, and at an unknown time, 1991-2023.}(\#fig:nibrsAdministrativeHours)
\end{figure}

Another way to visualize this is to see what hour is most and least common for every year we have data, as shown in Table \@ref(tab:nibrsAdministrativeCommonHours). Results are strikingly similar for the entire time period we have NIBRS. In every year except for 1991 the most common hour is midnight, and in every year the least common is 5am. When excluding midnight the most common hours are are the end of the work day at 5PM-5:59PM and 6PM-6:59PM, or at noon. 

NIBRS data is available since 1991, and the number of agencies reporting has grown each year. This is also a time period which has seen considerable changes in crimes, an increase in the 1990s followed by a sustained decrease since then until a (now seemingly temporary) spike starting in 2020. Yet throughout all these changes the most and least common hours remain very consistent, suggesting that there appear to strong rules of when crime occurs regardless of other changes. Or at least strong rules in what appears in our data, as I do not believe the midnight or noon hour results are real. 


\begin{longtable}[t]{l|l|r|r|l}
\caption{(\#tab:nibrsAdministrativeCommonHours)The most and least common incident hours, and the most common hours excluding midnight and noon.}\\
\hline
Year & Most Common & Least Common & Most Common, Exclude Midnight & Most Common, Exclude Midnight/Noon\\
\hline
\endfirsthead
\caption[]{(\#tab:nibrsAdministrativeCommonHours)The most and least common incident hours, and the most common hours excluding midnight and noon. \textit{(continued)}}\\
\hline
Year & Most Common & Least Common & Most Common, Exclude Midnight & Most Common, Exclude Midnight/Noon\\
\hline
\endhead
1991 & 6PM & 5AM & 6PM & 6PM\\
\hline
1992 & Midnight & 5AM & 6PM & 6PM\\
\hline
1993 & Midnight & 5AM & 6PM & 6PM\\
\hline
1994 & Midnight & 5AM & 6PM & 6PM\\
\hline
1995 & Midnight & 5AM & 6PM & 6PM\\
\hline
1996 & Midnight & 5AM & 6PM & 6PM\\
\hline
1997 & Midnight & 5AM & 6PM & 6PM\\
\hline
1998 & Midnight & 5AM & 6PM & 6PM\\
\hline
1999 & Midnight & 5AM & 5PM & 5PM\\
\hline
2000 & Midnight & 5AM & 5PM & 5PM\\
\hline
2001 & Midnight & 5AM & 5PM & 5PM\\
\hline
2002 & Midnight & 5AM & 5PM & 5PM\\
\hline
2003 & Midnight & 5AM & 5PM & 5PM\\
\hline
2004 & Midnight & 5AM & 5PM & 5PM\\
\hline
2005 & Midnight & 5AM & 5PM & 5PM\\
\hline
2006 & Midnight & 5AM & 5PM & 5PM\\
\hline
2007 & Midnight & 5AM & 5PM & 5PM\\
\hline
2008 & Midnight & 5AM & 5PM & 5PM\\
\hline
2009 & Midnight & 5AM & Noon & 5PM\\
\hline
2010 & Midnight & 5AM & Noon & 5PM\\
\hline
2011 & Midnight & 5AM & Noon & 5PM\\
\hline
2012 & Midnight & 5AM & Noon & 5PM\\
\hline
2013 & Midnight & 5AM & Noon & 5PM\\
\hline
2014 & Midnight & 5AM & Noon & 5PM\\
\hline
2015 & Midnight & 5AM & Noon & 5PM\\
\hline
2016 & Midnight & 5AM & Noon & 5PM\\
\hline
2017 & Midnight & 5AM & Noon & 5PM\\
\hline
2018 & Midnight & 5AM & Noon & 5PM\\
\hline
2019 & Midnight & 5AM & Noon & 5PM\\
\hline
2020 & Midnight & 5AM & Noon & 5PM\\
\hline
2021 & Midnight & 5AM & Noon & 5PM\\
\hline
2022 & Midnight & 5AM & Noon & 5PM\\
\hline
2023 & Midnight & 5AM & Noon & 5PM\\
\hline
\end{longtable}




## Exceptional clearance

When we speak of clearances we generally mean that a person was arrested for the crime.^[While a more expansive definition may include a conviction in a court for that crime (including pleading guilty), NIBRS data only extends to the arrest stage so we never know the judicial outcome of the case.] Cases may also be cleared "through exceptional means" which is also called an "exceptional clearance." Exceptional clearances, which occur in about 3% of cases, are important because they indicate that the police have identified the offender and have enough evidence to arrest them, but are unable to do so for specific reasons. Unlike standard clearances, which involve arrests, exceptional clearances may result from factors such as the offender's death, the victim's refusal to cooperate, or the prosecution's decision not to pursue the case. Basically, if they could arrest them they would but for some reason they cannot. NIBRS data tells us if the case is exceptionally cleared as well as the reason for the exceptional clearance. 

Figure \@ref(fig:administrativeExceptionalClearances) shows the breakdown of reasons why the case was cleared for these ~3 of cases that are exceptionally cleared. The most common reason, at 45% of exceptional clearances, is that the victim refused to cooperate with the police or prosecution. This can include cases where the victim reported their crime to the police and then later decide to stop assisting. The next most common reason, also at at 45% of exceptionally cleared cases, is that the prosecution decides to not prosecute the case. This excludes cases where the prosecution believes that there is not probable cause to make the arrest. Therefore it largely includes cases that the prosecution either does not believe they could win or where the agency has a policy of non-prosecution - this is likely increasingly common in jurisdiction which has "progressive prosecutors" who de facto legalize certain crimes.  

Next we have when the offender is a juvenile and the police chose to avoid arresting them due to their age, which makes up about 7% of these incidents. This generally occurs in minor offenses such as property crimes and the police do give notice to the juvenile offender's parents or guardians about the situation. If the offender is in another agency's jurisdiction (including out of the country) and the agency reporting data is unable to make an arrest, including when the agency who has the offender in their jurisdiction refuses to extradite the offender, the case can be exceptionally cleared. This occurs in 2% of exceptional clearances. In these cases we do not know any information about which jurisdiction the offender is in at the time of the exceptional clearance. Finally, if the offender dies (by any means) before the arrest they cannot be arrested so the case is exceptionally cleared. This makes up about 1% of exceptional clearances. 

The values shown in Figure \@ref(fig:administrativeExceptionalClearances) are for all incidents so can be quite different when examining subsets of the data such as by offender demographics or incident type. Doing this would require merging the Administrative Segment with another segment such as Offense or Victim. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeExceptionalClearances-1} 

}

\caption{The distribution of exceptional clearances for all exceptional clearances reported to NIBRS, 1991-2023.}(\#fig:administrativeExceptionalClearances)
\end{figure}

In Figure \@ref(fig:nibrsAdministrativeClearance) we can see trends in the percent of incidents that involve an arrest or an exceptional clearance. Ignoring the spike in the arrest rate in the first few years of data, likely part of growing pains of any new dataset, the share of incidents with an arrest is relatively steady over time, increasing until it peaks at a little under 30% of incidents in the mid-2010s and then declining since then. The share of incidents that are exceptionally cleared likewise are relatively steady but do show a slow decline over time, moving from a bit over 5% at the start of our data to about 3% by the end. These changes may simply be due to different agencies reporting over time but they are steady enough that I think the trend likely accurately reflects arrest and exceptional clearance rates in the US. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/nibrsAdministrativeClearance-1} 

}

\caption{Percent of incidents with an arrest or exceptional clearance, 1991-2023.}(\#fig:nibrsAdministrativeClearance)
\end{figure}

## Number of other segments

The "Administrative" part of this segment is that it tells us about other segments related to this incident. Here we know how many Offense, Offender, Victim, and Arrestee segments there are for the incident. In effect it says how many crimes were committed, how many offenders involved (at least the number known to police), how many victims there were, and how many people were arrested for this particular incident. This can be useful both as a check to make sure you are not missing anything when looking at the other segments and to quickly subset data, such as to only single-victim or only multiple-offender incidents. 

### Offense Segments

This variable indicates how many offense segments there are associated with this incident. Each incident can have multiple offenses, so this just says how many of these crimes there were. For example, if a person is raped and robbed then there would be two offense segments related to that incident. 

Figure \@ref(fig:administrativeOffenseSegments) shows the number of offense segments - and thus the number of crimes - associated with each incident. The vast majority of incidents only have one offense reported, making up 88% of incidents.^[In reality a person who commits a crime may be arrested or charged with many (often highly related) offenses related to a single criminal incident. So this data does report fewer incidents than you would likely find in other data sources, such as if you request data from a local police agency or district attorney's office.] This drops considerably to 10% of incidents having two offenses, 1% having three, and then under 0.15% of incidents having four through nine offenses.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeOffenseSegments-1} 

}

\caption{The distribution for the number of Offender Segments per incident, for all incidents in NIBRS 2022.}(\#fig:administrativeOffenseSegments)
\end{figure}

This trend is consistent over time. As shown in Figure \@ref(fig:nibrsAdministrativeNumberOffense), the median number of offense segments each year is one, while the mean number is slightly over one.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/nibrsAdministrativeNumberOffense-1} 

}

\caption{Annual mean and median number of Offense Segments, 1991-2023.}(\#fig:nibrsAdministrativeNumberOffense)
\end{figure}

### Offender Segments

The Administrative Segment tells you how many offenders are involved with an incident. This is, of course, an estimate because in some incidents the police do not know how many people are involved. If, for example, someone was robbed then they can tell the police how many robbers there were. But if someone comes home to find their home burglarized then they do not know how many burglars there were. If there is no video evidence (e.g. a home security camera) and neighbors did not see anything then the police would not know how many offenders were involved in the incident. In these cases they put in a single offender and in the Offender Segment all of the information about the offender is "unknown." The remaining number of offenders are still estimates as the police may not know for sure how many offenders were involved, but this is more reliable than when there is only a single offender reported. 

With that major caveat in mind, Figure \@ref(fig:administrativeOffenderSegments) shows the distribution in how many offenders there were per incident. The vast majority of incidents have only one (or potentially an unknown number) offenders, at 91% percent of incidents. Incidents with two offenders make up only 7% of incidents while those with three make up 1% of incidents. No other number of offenders make up more than 0.5% of incidents. The data does have the exact number of offenders but I have top coded it to 10 in the graph for simplicity. There can potentially be a large number of offenders involved in an incident and in the 2022 NIBRS data the incident with the higher number of offenders had 86. However, it is exceedingly rare for there to be even more than a handful of offenders. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeOffenderSegments-1} 

}

\caption{The distribution for the number of Offender Segments per incident, for all incidents in NIBRS 2022.}(\#fig:administrativeOffenderSegments)
\end{figure}

As seen in Figure \@ref(fig:nibrsAdministrativeNumberOffender), in every year the median number of offenders is one and the mean number is just above one.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/nibrsAdministrativeNumberOffender-1} 

}

\caption{Annual mean and median number of Offender Segments, 1991-2023.}(\#fig:nibrsAdministrativeNumberOffender)
\end{figure}

### Victim Segments

In cases where the offense is a "victimless crime" (or at least one where there is no specific victim) such as a drug offense, the victim and the offender can be the same individual. For other cases, being a victim in an incident just means that you were the victim of at least one offense committed in the incident. 

Figure \@ref(fig:administrativeVictimSegments) shows the distribution in the number of victims per incident. Like the number of offenses and offenders, this is massively skewed to the left with 91% of incidents having a single victim. Incidents with two victims make up 8% of the data while incidents with three victims are 1%. All remaining numbers of victims are less than one third of 0.5% of the data each. The data does have the exact number of victims but I have top coded it to 10 in the graph for simplicity. The incident with the most victims in 2022 had 163 victims.  

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeVictimSegments-1} 

}

\caption{The distribution for the number of Victim Segments per incident, for all incidents in NIBRS 2022.}(\#fig:administrativeVictimSegments)
\end{figure}

Similar to what we have seen with offenses and offenders, we can see in Figure \@ref(fig:nibrsAdministrativeNumberVictim) that the median number of victims is one and the mean number is just a bit more than one. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/nibrsAdministrativeNumberVictim-1} 

}

\caption{Annual mean and median number of Victim Segments, 1991-2023.}(\#fig:nibrsAdministrativeNumberVictim)
\end{figure}

### Arrestee Segments

Unlike the previous segments, there may not always be an arrestee segment since not all crimes lead to an arrest. Figure \@ref(fig:administrativeArresteeSegments) shows the distribution in the number of arrestee segments per incident in the 2022 NIBRS data. Indeed, the vast majority - 77% of incidents - did not lead to a single arrest. In 21% of incidents a single person was arrested while in 2% of incidents two people were arrested. The remaining numbers of people arrested are increasingly small with fewer than 0.3% of incidents having more than three people arrested. The incident with the most arrests in 2022 led to 65 people arrested. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeArresteeSegments-1} 

}

\caption{The distribution for the number of Arrestee Segments per incident, for all incidents in NIBRS 2022.}(\#fig:administrativeArresteeSegments)
\end{figure}

Of course, to really understand these arrests we would need to know how many people committed the crime. Having one arrest for an incident with one offender is good, having one arrest when there are multiple offenders means some criminals are walking free. While we do not know the true number of offenders (as police may not know how many there actually were), we can use the Offender Segment count as an estimate. Figure \@ref(fig:administrativeArrestsAny) shows the percent of incidents where at least one offender was arrested and where all offenders were arrested, broken down by the number of reported offenders. 

There is wide variability in the percent of offenders arrested by the number of offenders in an incident. In cases with one offender, there was an arrest made only 22% of the time. Given that this includes incidents without a known offender, I expect the true arrest rate for incidents that actually have one offender to be higher. 

When there are two offenders, about 39% of incidents have at least one arrest and 26% of incidents have both offenders arrested. For having at least one person arrested we see a fairly steady rate of mid- to high-30% for each number of offenders. In contrast, the share of incidents where all offenders are arrested declines with each additional offender, reaching to only 9% with 10 or more offenders. 


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/administrativeArrestsAny-1} 

}

\caption{The percent of incidents by number of offenders where at least one offender is arrested and where all offenders are arrested.}(\#fig:administrativeArrestsAny)
\end{figure}

The median number of arrestee segments over time, as shown in Figure \@ref(fig:nibrsAdministrativeNumberArrestee) is zero, with the mean number slightly higher at around 0.3.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{12_nibrs_administrative_files/figure-latex/nibrsAdministrativeNumberArrestee-1} 

}

\caption{Annual mean and median number of Arrestee Segments, 1991-2023.}(\#fig:nibrsAdministrativeNumberArrestee)
\end{figure}

In summary, the Administrative Segment provides a useful metadata for understanding what other segments are available for each incident. Although it is often necessary to combine this data with other segments to gain a full understanding of the incident, the information in the Administrative Segment - such as the timing of the crime and exceptional clearance details - offers useful insights into the broader patterns of criminal activity and law enforcement responses.

<!--chapter:end:12_nibrs_administrative.Rmd-->

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

<!--chapter:end:13_nibrs_offense.Rmd-->

# Offender Segment





As might be expected, the Offender Segment provides information about who the offender is for each incident, though this is limited to only four demographic variables: age, sex, race, and ethnicity. In incidents with multiple offenders it provides information about each offender. While important factors such as criminal history, socioeconomic status, and motive are missing in the Offender Segment, other segments provide some supplementary details. For example, the Victim Segment reveals the relationship between the offender and victim, and the Offense Segment tells us whether a weapon was used by the offender. These pieces of information allow for a more complete picture, although they remain fragmented across segments.

In cases where there is no information about the offender there will be a single row where all of the offender variables will be "unknown." In these cases having a single row for the offender is merely a placeholder and doesn’t necessarily mean that there was only one offender for that incident. However, there’s no indicator for when this is a placeholder and when there was actually one offender but whose demographic information is unknown.

The Offender Segment is the sparsest of the available segments, and provides only four new variables that are about the offender's demographics. 

## Demographics

There are four demographics variables included in this data: the offenders' age, sex, race, ethnicity. Please note that what we have here are not unique offenders as the same person can be involved in multiple incidents and therefore be counted multiple times. There's no offender ID variable that is consistent across incidents so we cannot tell when an offender is involved with different incidents. So be cautious when trying to compare this with some base rate such as percent of people of each age, sex, race, or ethnicity in a population.  

### Age 

The age variable is the suspected age of the offender. This is presented to us as how many years old the offender is, however, agencies can input an age range if they do not know the exact age (e.g. age 20-29) and the FBI will convert that to an exact number by averaging it for us. So if the police say the offender is aged 20-29 (since they do not know for sure), we only see that the offender is 24 years old since the FBI averages the range and then rounds down to make an integer. This value is top-coded to 99 years old with everyone 99 years or older being set as "over 98 years old." Figure \@ref(fig:offenderAge) shows the distribution of offender ages for all known offenders in the 2022 NIBRS data. About 14% of offenders have an unknown age and are excluded from the figure. 

This data supports the widely observed age-crime curve, which shows that criminal activity tends to peak in the late teenage years and gradually declines as individuals age. Interestingly, in the NIBRS data, the most common offender age is 25, indicating a slightly later peak. This shift could reflect changes in the types of offenses reported or evolving offender patterns over time. The age distribution can differ depending on what offenses the offender's committed. To examine that you will need to merge this segment with the Offense Segment and then subset the offender data by the offense you are interested in.


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{14_nibrs_offender_files/figure-latex/offenderAge-1} 

}

\caption{The age of all offenders reported in the 2022 NIBRS data. Approximately 44 percent of offenders have an unknown age are not shown in the figure.}(\#fig:offenderAge)
\end{figure}

The spike you see at the very end of the data is due to the data maxing out possible individual ages at 98, so anyone older is grouped together. Surely very young children aren’t committing crimes, so is this a data error? Mostly yes. These entries likely reflect either data entry mistakes or situations where officers mistakenly input the offender’s age as "1" rather than selecting "unknown." However, in rare cases, this could also include tragic incidents, such as accidental harm caused by a child handling a firearm, which are still recorded as criminal incidents despite no intent. However, the bulk of this, especially for age one, is likely just a data error or the police entering age as one instead of saying that the age is unknown (which they have the option of doing) or simply entering the data incorrectly by mistake.

Another indicator of guesses about age is that three of the five most common ages are 25, 30, and 20 years old. People tend to like multiples of five when making estimates, so these indicate that someone (the victim or the officer) probably did not know the exact age and so guessed the age or used an age range rather than the exact age. 

Since we have data since 1991 we can look at how age changed over time. In Figure \@ref(fig:nibrsOffenderAge) shows the annual mean and median age of offenders from 1991-2023. The first two years of data we see very old offenders^[At least in terms of expected age of offenders.] with mean age over 50 and median age over 34 each year. That then drops considerably in 1993 to about age 25 and then starts a very slow and consistent increase over time until the average offender is in the early thirties by the latest years of data. Figure \@ref(fig:nibrsOffenderAgeMissing) shows the percent of offenders that have an unknown age which also has some odd and large movements in 1991-1992 then settles to a steady and slow declining trend in 1993 before reversing itself and increasing in the late 2010s. 

So what do we make of these trends? The first thing to keep in mind is that we are doing something fairly dumb. Each year of data we have different agencies reporting meaning that differences over time may simply be due to different agencies providing data. Still, if we had to interpret it I would say that the values in 1991 and 1992 are due to data issues likely caused by growing pains from agencies just starting out using NIBRS. Luckily, since NIBRS data has information on every single offender - rather than being already aggregated like in SRS data - we can check this. Indeed, this appears to simply be a data issue where many agencies put the age of offenders as "over 98 years old" rather than identifying them as unknown. In 1991, for example, 36% of offenders who had a known age were reported to be older than 98 years. When we look at the average age in 1991 when excluding people 99+ years old we get 28 years old, perfectly within expectation when looking at averages after 1992. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{14_nibrs_offender_files/figure-latex/nibrsOffenderAge-1} 

}

\caption{The mean and median age of offenders, 1991-2023.}(\#fig:nibrsOffenderAge)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{14_nibrs_offender_files/figure-latex/nibrsOffenderAgeMissing-1} 

}

\caption{The percent of offender's age that is unknown, 1991-2023.}(\#fig:nibrsOffenderAgeMissing)
\end{figure}


### Sex

The second offender demographic variable available is the offender's sex with male and female being the only available sexes. There is no option for transgender or anything else. Other than arrestees, where police could (though we do not know if they do) use their identification (e.g. driver's license) to determine their sex, this is likely the perceived sex of the offender based on what evidence the officer can collect (e.g. witness statement, video recordings, driver's licenses of the offender if they are caught, etc.). Figure \@ref(fig:nibrsOffenderSex) shows the distribution of offenders by sex for each year of data. The most common sex is male, which is consistent with the literature on who commits crime. About 45% of all offenders were male. Female offenders make up fewer than 20% of offenders though the general trend is that the share of offenders is increasing. Over a third of offenders have an unknown sex with the share being unknown decreasing over time until increasing again in the last several years. Considering that when nothing is known about offenders (including even how many offenders there are) this data includes a single row with "unknown" for all demographic variables, this is actually an undercount of offenders who have unknown sex. Again we see odd results in 1991 and 1992, likely an issue with data entry at the birth of NIBRS.


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{14_nibrs_offender_files/figure-latex/nibrsOffenderSex-1} 

}

\caption{The share of offenders by sex, 1991-2023.}(\#fig:nibrsOffenderSex)
\end{figure}

### Race

The next variable is the race of the offender, categorized as White, Black, American Indian/Alaskan Native, Asian, and Native Hawaiian/Other Pacific Islander. It is important to note that this is often the officer’s perception of race, which can introduce bias or inaccuracies, particularly in cases where there was no arrest or detailed witness account.

Figure \@ref(fig:offenderRace) shows the breakdown in offender races for every offender in our data. The most common offender race in nearly every year is Unknown, with about 40% of offenders not having a known race. This is actually an undercount as in cases where the agency does not know anything about the offenders they will put down a single offender with "unknown" for every demographics variable. So there could potentially be multiple offenders represented when there is a row with an unknown offender race. This is also dependent on the type of crimes committed and when they are committed. For example, a daytime robbery would likely have a known offender race as the victim can clearly see (complexities about identifying people's race aside) the race of the robber. A daytime burglary where no one is home would likely have an unknown offender race and there would be no witnesses. Likewise, a robbery at night could have an unknown offender race because the darkness makes it harder to identify people.

The next most common offender race is White at a bit under 40% in most years, followed by Black at around 20%. The remaining races make up very few offender and are hard to see on the figure. We still see the weird values in 1991 and 1992, this time showing a massive spike in the number of Asian offenders which disappear to less than 1% in 1993. This corresponds to spike in White offenders in 1993, suggesting that some White offenders in 1991-1992 were incorrectly identified as Asian. 


\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{14_nibrs_offender_files/figure-latex/nibrsOffenderRace-1} 

}

\caption{The share of offenders by race, 1991-2023.}(\#fig:nibrsOffenderRace)
\end{figure}

### Ethnicity

Ethnicity data, collected sporadically starting in 2013, is rarely recorded, with the most common entry being "unknown." As we can see in Figure \@ref(fig:nibrsOffenderEthnicity) this variable is very rarely used and for most of the life of NIBRS it was not collected. Even when it was collected - which started in 2013, ended after 2016, and then returned in 2021 - the most common value is that the offender's ethnicity was unknown. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{14_nibrs_offender_files/figure-latex/nibrsOffenderEthnicity-1} 

}

\caption{The share of offenders by ethnicity, 1991-2023.}(\#fig:nibrsOffenderEthnicity)
\end{figure}

While the Offender Segment is limited to basic demographics, it remains a valuable resource for identifying broad patterns in offender behavior. By tracking trends over time, researchers can examine shifts in age, sex, and race among offenders, which may inform policy decisions on crime prevention and law enforcement strategies. However, gaps in the data - such as unknown offender details, new agencies reporting data each year, and the absence of critical variables like criminal history - highlight the need for cautious interpretation and cross-referencing with other data sources.

<!--chapter:end:14_nibrs_offender.Rmd-->

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

<!--chapter:end:15_nibrs_victim.Rmd-->

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

<!--chapter:end:16_nibrs_arrestee.Rmd-->

# Property Segment {#property}





The Property Segment provides a bit more information than would be expected from the name. For each item involved in the crime it tells you what category that items falls into, with 68 total categories (including "other") ranging from explosives and pets to money and alcohol. It also tells you the estimated value of that item. This data covers more than just items stolen during a crime. For each item it tells you what happened to that item such as if it was stolen, damaged, seized by police (such as illegal items like drugs), recovered (from being stolen) by police, or burned during an arson.

For drug offenses it includes the drugs seized by police. For these offenses, the data tells us the type of drug, with 16 different drug categories ranging from specific ones like marijuana or heroin to broader categories such as "other narcotics". There can be up to three different drugs included in this data - if the person has more than three types of drugs seized then the third drug category will simply indicate that there are more than three drugs, so we learn what the first two drugs are but not the third or greater drugs are in these cases. For each drug we also know exactly how much was seized with one variable saying the amount the police found and another saying the units we should we reading that amount as (e.g. pills, grams, plants). 


The Window Property Segment has the same variables as the normal Property Segment but also has 10 variables on each of the offenses committed (up to 10 offenses) during the incident. This is really to try to provide a bit of information that you’d otherwise get from the other segments but don’t since this is a window segment. For the rest of this chapter I’ll be using examples from the Property Segment and not the Window Property.

## Type of property loss {#propertyLoss}

This segment contains information on all property involved in the incident, other than the weapon used by the offender. Property can be involved in multiple ways - such as being stolen, destroyed, or that the stolen property is recovered by the police - so NIBRS breaks this information into seven different categories (eight when including "unknown" type). Figure \@ref(fig:propertyTypeLoss) shows each of these categories as how often they occur. The most common category, at 60.7% of the rows in this segment, is when the item is taken from the victim by the offender. This includes when the offender stole the item, took it by force in a robbery, tricked the victim (e.g. offender committed fraud), and any other way to illegal get the item (e.g. extortion, ransom, bribery). Though it includes all these types of ways to illegally take the item, it is often just called "stolen" property and I will refer to it as such in this chapter just for simplicity of writing.  

The next most common group, at 13.3%, is when the item was seized by the police. This excludes items that were stolen and that the police recovered. It includes all types of property that the offender illegally had but is primary for drug crimes where the drug or drug equipment was seized. This segment also includes property damaged, destroyed, or vandalized by the offender and this type makes up 11.2% of the data. Following this, about 9% of rows are for recovered property which is when one of the previously stolen items is recovered by the police.

Next is "none" which only means that no property was stolen or damaged but that it could have been. For example, if someone tries to grab a person's purse but fails, that would be considered "none" since the purse was not actually taken. The remaining types are when the item was a counterfeit/forgery, at 1.2%, was burned (such as during an arson) at 0.2%, or when the type of loss is unknown at 0.2% 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{17_nibrs_property_files/figure-latex/propertyTypeLoss-1} 

}

\caption{The type of loss or if the item is recovered, 2023.}(\#fig:propertyTypeLoss)
\end{figure}


## Description of property

There are 68 different categories of properties (including the catch-all "other" category for anything not explicitly in a different category) that NIBRS covers. This also includes "identity - intangible" which means that someone stole the victim's identity. Identity is not property since it is not a physical thing but is nonetheless included here (items related to one's identity such as social security cards are included in a different category called "identity documents"). Each of these categories can appear in any of the seven different types of property loss discussed above. For simplicity of writing, and because Table \@ref(tab:propertyStolenDescription) covers items stolen, I will be talking below about items lost by being stolen, though everything does apply to other types of loss too. 

The property included in NIBRS can move from very broad categories like "merchandise" to more specific items such as livestock, aircraft, and pets. The property categories are mutually exclusive so a single item cannon be counted in different categories. If, for example, laptop is stolen that could potentially go in "computer hardware/software" or "office-type equipment" but it would not be in both, it would only be recorded in one of the two. In cases where multiple items of the same type are stolen - such as someone stealing multiple laptops in a single crime - we do not actually know how many items were stolen. Just that at least one item of that category was stolen in the incident. We then know the total estimated value of the items stolen in that incident which we can use to estimate the number of items stolen (as long as the know the average value per item in that category) though this would be a very imprecise measure. The exception to this is for stolen vehicles where we know exactly how many were stolen and how many were recovered.

Table \@ref(tab:propertyStolenDescription) shows each of the 68 different types of property in NIBRS and shows the number of incidents where they were stolen for all incidents in the 2022 NIBRS data. Multiple different categories of property can be stolen in a single incident. The most common type of property stolen, at 14.3% of all property is "other" which is not really that helpful to us. We know it is not one of the other 67 categories but not exactly what was stolen. Next, are money at 11.8% and then purses/handbags/wallets at 5.6%. This makes a lot of sense. People steal things for financial gain and the easiest way to get that gain is stealing money directly (or wallets and purses which often have money inside). Stealing property that you then have to sell or trade to get what you want (money or other property) is a lot harder, which is likely why it is less common. 

There are about 4.8 million rows in the Property Segment where the item was stolen (the other 3.1 million rows are about property that was seized by police, recovered, damaged, or one of the other types of property loss detailed in Section \@ref(propertyLoss)). As such, even items stolen very rarely can occur thousands or tens of thousands of times. For example, pets were the property stolen about 0.14% of the time and that tiny percent still accounts of 6,821 incidents with a pet stolen. Given the huge number of rows in this data - and as more agencies report to NIBRS this will grow quickly - it can be possible to study specific types of property, such as pets stolen, that would not be possible with a more narrow dataset (both in terms of how specific the items they include are, and the size of the data). 


\begin{longtable}[t]{l|l|r|r|r}
\caption{(\#tab:propertyStolenDescription)The number and percent of property stolen (including forcibly taken such as during a robbery) and property seized by police (excludes recovering property that was stolen), and recovered by police, 2023. Each incident can have multiple items stolen.}\\
\hline
Property & First Year & \# (\%) of Property Stolen & \# (\%) of Property Seized & \# (\%) of Property Recovered\\
\hline
\endfirsthead
\caption[]{(\#tab:propertyStolenDescription)The number and percent of property stolen (including forcibly taken such as during a robbery) and property seized by police (excludes recovering property that was stolen), and recovered by police, 2023. Each incident can have multiple items stolen. \textit{(continued)}}\\
\hline
Property & First Year & \# (\%) of Property Stolen & \# (\%) of Property Seized & \# (\%) of Property Recovered\\
\hline
\endhead
Other & 1991 & 1,282,806 (15.79\textbackslash{}\%) & 38,456 (2.54\textbackslash{}\%) & 128,422 (10.64\textbackslash{}\%)\\
\hline
Money & 1991 & 897,846 (11.05\textbackslash{}\%) & 21,170 (1.40\textbackslash{}\%) & 20,041 (1.66\textbackslash{}\%)\\
\hline
Automobile & 1991 & 669,545 (8.24\textbackslash{}\%) & 3,708 (0.24\textbackslash{}\%) & 398,894 (33.06\textbackslash{}\%)\\
\hline
Clothes/Furs & 1991 & 413,932 (5.10\textbackslash{}\%) & 1,261 (0.08\textbackslash{}\%) & 74,705 (6.19\textbackslash{}\%)\\
\hline
Vehicle Parts/Accessories & 1991 & 406,893 (5.01\textbackslash{}\%) & 2,023 (0.13\textbackslash{}\%) & 36,507 (3.03\textbackslash{}\%)\\
\hline
Purses/Handbags/Wallets & 1991 & 394,348 (4.86\textbackslash{}\%) & 2,953 (0.19\textbackslash{}\%) & 26,582 (2.20\textbackslash{}\%)\\
\hline
Merchandise & 1991 & 348,664 (4.29\textbackslash{}\%) & 444 (0.03\textbackslash{}\%) & 105,031 (8.71\textbackslash{}\%)\\
\hline
Credit/Debit Cards & 1991 & 334,601 (4.12\textbackslash{}\%) & 1,881 (0.12\textbackslash{}\%) & 17,232 (1.43\textbackslash{}\%)\\
\hline
Consumable Goods & 1991 & 328,566 (4.05\textbackslash{}\%) & 1,898 (0.13\textbackslash{}\%) & 68,355 (5.67\textbackslash{}\%)\\
\hline
Tools - Power/Hand & 1991 & 303,989 (3.74\textbackslash{}\%) & 1,097 (0.07\textbackslash{}\%) & 25,449 (2.11\textbackslash{}\%)\\
\hline
Portible Electronic Communications & 2009 & 279,217 (3.44\textbackslash{}\%) & 8,278 (0.55\textbackslash{}\%) & 28,544 (2.37\textbackslash{}\%)\\
\hline
Identity Documents & 2009 & 271,321 (3.34\textbackslash{}\%) & 4,047 (0.27\textbackslash{}\%) & 13,283 (1.10\textbackslash{}\%)\\
\hline
Household Goods & 1991 & 227,841 (2.81\textbackslash{}\%) & 1,206 (0.08\textbackslash{}\%) & 30,413 (2.52\textbackslash{}\%)\\
\hline
Computer Hardware/Software & 1991 & 198,248 (2.44\textbackslash{}\%) & 1,456 (0.10\textbackslash{}\%) & 13,005 (1.08\textbackslash{}\%)\\
\hline
Identity - Intangible & 2009 & 170,718 (2.10\textbackslash{}\%) & 220 (0.01\textbackslash{}\%) & 2,130 (0.18\textbackslash{}\%)\\
\hline
Firearms & 1991 & 163,339 (2.01\textbackslash{}\%) & 16,915 (1.12\textbackslash{}\%) & 23,384 (1.94\textbackslash{}\%)\\
\hline
Jewelry/Precious Metals/Gems & 1991 & 148,039 (1.82\textbackslash{}\%) & 335 (0.02\textbackslash{}\%) & 11,568 (0.96\textbackslash{}\%)\\
\hline
Bicycles & 1991 & 132,699 (1.63\textbackslash{}\%) & 203 (0.01\textbackslash{}\%) & 14,306 (1.19\textbackslash{}\%)\\
\hline
Radios/Tv/Vcr/Dvd Players & 1991 & 129,190 (1.59\textbackslash{}\%) & 427 (0.03\textbackslash{}\%) & 9,027 (0.75\textbackslash{}\%)\\
\hline
Documents - Personal Or Business & 2009 & 102,307 (1.26\textbackslash{}\%) & 3,996 (0.26\textbackslash{}\%) & 6,576 (0.55\textbackslash{}\%)\\
\hline
Alcohol & 1991 & 95,581 (1.18\textbackslash{}\%) & 1,416 (0.09\textbackslash{}\%) & 13,489 (1.12\textbackslash{}\%)\\
\hline
Trucks & 1991 & 91,891 (1.13\textbackslash{}\%) & 262 (0.02\textbackslash{}\%) & 51,915 (4.30\textbackslash{}\%)\\
\hline
Other Motor Vehicles & 1991 & 62,001 (0.76\textbackslash{}\%) & 280 (0.02\textbackslash{}\%) & 22,072 (1.83\textbackslash{}\%)\\
\hline
Negotiable Instruments & 1991 & 52,111 (0.64\textbackslash{}\%) & 1,390 (0.09\textbackslash{}\%) & 2,516 (0.21\textbackslash{}\%)\\
\hline
Office-Type Equipment & 1991 & 51,959 (0.64\textbackslash{}\%) & 1,944 (0.13\textbackslash{}\%) & 5,129 (0.43\textbackslash{}\%)\\
\hline
Lawn/Yard/Garden Equipment & 2009 & 47,029 (0.58\textbackslash{}\%) & 17 (0.00\textbackslash{}\%) & 3,978 (0.33\textbackslash{}\%)\\
\hline
Trailers & 2009 & 42,657 (0.53\textbackslash{}\%) & 44 (0.00\textbackslash{}\%) & 9,277 (0.77\textbackslash{}\%)\\
\hline
Drugs/Narcotics & 1991 & 42,073 (0.52\textbackslash{}\%) & 973,582 (64.20\textbackslash{}\%) & 1,708 (0.14\textbackslash{}\%)\\
\hline
Recreational/Sports Equipment & 2009 & 41,355 (0.51\textbackslash{}\%) & 70 (0.00\textbackslash{}\%) & 4,269 (0.35\textbackslash{}\%)\\
\hline
Building Materials & 2009 & 40,958 (0.50\textbackslash{}\%) & 38 (0.00\textbackslash{}\%) & 2,819 (0.23\textbackslash{}\%)\\
\hline
Photographic/Optical Equipment & 2009 & 28,705 (0.35\textbackslash{}\%) & 211 (0.01\textbackslash{}\%) & 1,774 (0.15\textbackslash{}\%)\\
\hline
Camping/Hunting/Fishing Equipment/Supplies & 2009 & 27,738 (0.34\textbackslash{}\%) & 105 (0.01\textbackslash{}\%) & 3,247 (0.27\textbackslash{}\%)\\
\hline
Nonnegotiable Instruments & 1991 & 26,281 (0.32\textbackslash{}\%) & 1,057 (0.07\textbackslash{}\%) & 1,530 (0.13\textbackslash{}\%)\\
\hline
Heavy Construction/Industrial Equipment & 1991 & 25,738 (0.32\textbackslash{}\%) & 418 (0.03\textbackslash{}\%) & 2,783 (0.23\textbackslash{}\%)\\
\hline
Fuel & 2009 & 22,461 (0.28\textbackslash{}\%) & 24 (0.00\textbackslash{}\%) & 970 (0.08\textbackslash{}\%)\\
\hline
Collections/Collectibles & 2009 & 20,624 (0.25\textbackslash{}\%) & 55 (0.00\textbackslash{}\%) & 2,408 (0.20\textbackslash{}\%)\\
\hline
Pending Inventory (Of Property) & 1991 & 19,125 (0.24\textbackslash{}\%) & 132 (0.01\textbackslash{}\%) & 369 (0.03\textbackslash{}\%)\\
\hline
Recordings - Audio/Visual & 1991 & 18,181 (0.22\textbackslash{}\%) & 1,459 (0.10\textbackslash{}\%) & 1,566 (0.13\textbackslash{}\%)\\
\hline
Metals, Non-Precious & 2009 & 17,811 (0.22\textbackslash{}\%) & 59 (0.00\textbackslash{}\%) & 1,096 (0.09\textbackslash{}\%)\\
\hline
Firearm Accessories & 2009 & 17,482 (0.22\textbackslash{}\%) & 4,833 (0.32\textbackslash{}\%) & 2,050 (0.17\textbackslash{}\%)\\
\hline
Weapons - Other & 2009 & 17,472 (0.22\textbackslash{}\%) & 2,823 (0.19\textbackslash{}\%) & 2,073 (0.17\textbackslash{}\%)\\
\hline
Recreational Vehicles & 1991 & 14,960 (0.18\textbackslash{}\%) & 41 (0.00\textbackslash{}\%) & 4,963 (0.41\textbackslash{}\%)\\
\hline
Medical/Medical Lab Equipment & 2009 & 13,977 (0.17\textbackslash{}\%) & 382 (0.03\textbackslash{}\%) & 1,196 (0.10\textbackslash{}\%)\\
\hline
Musical Instruments & 2009 & 12,467 (0.15\textbackslash{}\%) & 14 (0.00\textbackslash{}\%) & 998 (0.08\textbackslash{}\%)\\
\hline
Pets & 2009 & 11,628 (0.14\textbackslash{}\%) & 13 (0.00\textbackslash{}\%) & 1,490 (0.12\textbackslash{}\%)\\
\hline
Farm Equipment & 1991 & 8,355 (0.10\textbackslash{}\%) & 78 (0.01\textbackslash{}\%) & 1,096 (0.09\textbackslash{}\%)\\
\hline
Artistic Supplies/Accessories & 2009 & 6,733 (0.08\textbackslash{}\%) & 46 (0.00\textbackslash{}\%) & 1,286 (0.11\textbackslash{}\%)\\
\hline
Chemicals & 2009 & 5,881 (0.07\textbackslash{}\%) & 146 (0.01\textbackslash{}\%) & 899 (0.07\textbackslash{}\%)\\
\hline
Gambling Equipment & 1991 & 4,598 (0.06\textbackslash{}\%) & 682 (0.04\textbackslash{}\%) & 351 (0.03\textbackslash{}\%)\\
\hline
Explosives & 2010 & 4,458 (0.05\textbackslash{}\%) & 1,370 (0.09\textbackslash{}\%) & 410 (0.03\textbackslash{}\%)\\
\hline
Drug/Narcotic Equipment & 1991 & 4,325 (0.05\textbackslash{}\%) & 411,222 (27.12\textbackslash{}\%) & 393 (0.03\textbackslash{}\%)\\
\hline
Watercraft & 1991 & 3,831 (0.05\textbackslash{}\%) & 7 (0.00\textbackslash{}\%) & 765 (0.06\textbackslash{}\%)\\
\hline
Watercraft Equipment/Parts/Accessories & 2009 & 2,933 (0.04\textbackslash{}\%) & 3 (0.00\textbackslash{}\%) & 248 (0.02\textbackslash{}\%)\\
\hline
Law Enforcement Equipment & 2009 & 2,816 (0.03\textbackslash{}\%) & 82 (0.01\textbackslash{}\%) & 361 (0.03\textbackslash{}\%)\\
\hline
Livestock & 1991 & 2,275 (0.03\textbackslash{}\%) & 10 (0.00\textbackslash{}\%) & 223 (0.02\textbackslash{}\%)\\
\hline
Logging Equipment & 2009 & 1,504 (0.02\textbackslash{}\%) & 1 (0.00\textbackslash{}\%) & 114 (0.01\textbackslash{}\%)\\
\hline
Structures - Other & 1991 & 1,351 (0.02\textbackslash{}\%) & 28 (0.00\textbackslash{}\%) & 107 (0.01\textbackslash{}\%)\\
\hline
Crops & 2010 & 1,255 (0.02\textbackslash{}\%) & 15 (0.00\textbackslash{}\%) & 134 (0.01\textbackslash{}\%)\\
\hline
Buses & 1991 & 1,197 (0.01\textbackslash{}\%) & 4 (0.00\textbackslash{}\%) & 672 (0.06\textbackslash{}\%)\\
\hline
Aircraft Parts/Accessories & 2009 & 943 (0.01\textbackslash{}\%) & 14 (0.00\textbackslash{}\%) & 89 (0.01\textbackslash{}\%)\\
\hline
Structures - Single Occupancy Dwellings & 1991 & 676 (0.01\textbackslash{}\%) & 10 (0.00\textbackslash{}\%) & 33 (0.00\textbackslash{}\%)\\
\hline
Structures - Storage & 1991 & 564 (0.01\textbackslash{}\%) & 16 (0.00\textbackslash{}\%) & 54 (0.00\textbackslash{}\%)\\
\hline
Aircraft & 1991 & 530 (0.01\textbackslash{}\%) & 25 (0.00\textbackslash{}\%) & 59 (0.00\textbackslash{}\%)\\
\hline
Structures - Other Commercial/Business & 1991 & 442 (0.01\textbackslash{}\%) & 6 (0.00\textbackslash{}\%) & 28 (0.00\textbackslash{}\%)\\
\hline
Structures - Other Dwellings & 1991 & 406 (0.00\textbackslash{}\%) & 3 (0.00\textbackslash{}\%) & 20 (0.00\textbackslash{}\%)\\
\hline
Special Category & 1991 & 232 (0.00\textbackslash{}\%) & 3 (0.00\textbackslash{}\%) & 15 (0.00\textbackslash{}\%)\\
\hline
Structures - Industrial Manufacturing & 1991 & 230 (0.00\textbackslash{}\%) & 1 (0.00\textbackslash{}\%) & 23 (0.00\textbackslash{}\%)\\
\hline
Structures - Public/Community & 1991 & 179 (0.00\textbackslash{}\%) & 3 (0.00\textbackslash{}\%) & 19 (0.00\textbackslash{}\%)\\
\hline
Total & - & 8,122,088 (100\textbackslash{}\%) & 1,516,418 (100\textbackslash{}\%) & 1,206,538 (100\textbackslash{}\%)\\
\hline
\end{longtable}



As seen in Table \@ref(tab:propertySeizedDescription), all of the 68 different types of properties available in NIBRS can and, in 2022, were seized by police during an incident at least once. This includes atypical property like building material, musical instruments, and pets (and leads me to think that at least some of this is incorrectly labeled as property seized by the police). The vast majority of property seized by police, however, is drugs. 63.2% of the property seized were drugs themselves while 27.3% were equipment related to the drugs. The remaining items were mostly "other" (i.e. anything not explicitly categorized here) at 2.6%, money at 2%, firearms at 0.9%, and then a bunch of very rarely seized items. 


## Value of stolen property

For all types of property loss other than the property being seized by the police (and when the type is "unknown") there is data on the estimated value of that property. This is estimates by the police but is supposed to be the current value of the item (e.g. a stolen car is what it currently sells for, not what the buyer bought it for) and is the cost it will take for the victim to replace the item. To be a bit more specific, this variable is the sum of items stolen in this category. For example, if someone burglarizes a house and steals three rings from the victim, this would not count as three thefts of a ring. It would be recorded as loss of jewelry and the value would be the total value of all three rings.

The police can take the victim's estimation into consideration but are not supposed to immediately accept it as victims may exaggerate values (especially for insurance purposes). When items are recovered, the police put in the value at the time of recovery which may be substantially different than at the time of the loss if the item is damaged or destroyed.

We can use this variable to look at the value of items lost by the victim. Figure \@ref(fig:propertyValuePropertyLevel) looks at the value per item stolen in a crime (if incidents have multiple items stolen, this counts them all separately). This includes items lost by theft, robbery, and burglary so is part of the "Stolen/Robbed/Etc." category of types of property loss. It excludes items damaged or destroyed or burned (there is information about the value of property in these incidents but these are not shown in the figure). To make this graph a bit simpler I have rounded all values to the nearest \$100 so items valued at \$0 mean that they are worth between \$1 and \$50. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{17_nibrs_property_files/figure-latex/propertyValuePropertyLevel-1} 

}

\caption{The distribution of the value of property stolen. Each value is rounded to the nearest 100. The x-axis is set on the log scale as this distribution is hugely skewed. Values over 1,0000,00 are set to 1,000,000.}(\#fig:propertyValuePropertyLevel)
\end{figure}


\begin{longtable}[t]{l|r|r|l|r|r|l}
\caption{(\#tab:nibrsPropertyStolenValue)Annual mean, median, and maximum values (in dollars) of property stolen and recovered, 1991-2023.}\\
\hline
Year & Mean Value Stolen & Median Value Stolen & Max Value Stolen & Mean Value Recovered & Median Value Recovered & Max Value Recovered\\
\hline
\endfirsthead
\caption[]{(\#tab:nibrsPropertyStolenValue)Annual mean, median, and maximum values (in dollars) of property stolen and recovered, 1991-2023. \textit{(continued)}}\\
\hline
Year & Mean Value Stolen & Median Value Stolen & Max Value Stolen & Mean Value Recovered & Median Value Recovered & Max Value Recovered\\
\hline
\endhead
1991 & 1,051 & 150 & 15,016,780 & 1,727 & 125 & 12,000,000\\
\hline
1992 & 3,242 & 148 & 580,000,682 & 1,414 & 100 & 1,790,000\\
\hline
1993 & 14,701 & 129 & 900,000,000 & 23,215 & 95 & 900,000,000\\
\hline
1994 & 41,258 & 129 & 999,999,999 & 64,414 & 85 & 999,999,999\\
\hline
1995 & 2,074 & 134 & 450,000,000 & 6,196 & 81 & 450,000,000\\
\hline
1996 & 2,560 & 147 & 800,000,085 & 1,750 & 85 & 3,500,000\\
\hline
1997 & 1,640 & 135 & 450,000,000 & 1,830 & 92 & 1,300,000\\
\hline
1998 & 1,898 & 146 & 480,000,000 & 1,978 & 100 & 1,000,000\\
\hline
1999 & 1,791 & 150 & 245,000,120 & 2,621 & 100 & 100,000,000\\
\hline
2000 & 1,252 & 150 & 100,001,280 & 2,379 & 124 & 838,466\\
\hline
2001 & 8,128 & 143 & 890,000,000 & 4,397 & 125 & 500,000,001\\
\hline
2002 & 1,742 & 150 & 300,000,000 & 3,438 & 125 & 300,000,000\\
\hline
2003 & 1,814 & 140 & 400,000,000 & 2,384 & 119 & 7,501,000\\
\hline
2004 & 1,833 & 130 & 939,000,000 & 4,918 & 120 & 939,000,000\\
\hline
2005 & 2,164 & 150 & 575,152,425 & 3,687 & 150 & 298,000,001\\
\hline
2006 & 1,315 & 150 & 100,003,300 & 2,656 & 174 & 5,726,400\\
\hline
2007 & 1,850 & 150 & 950,000,000 & 2,650 & 150 & 100,000,000\\
\hline
2008 & 3,031 & 150 & 999,999,999 & 4,434 & 120 & 999,999,999\\
\hline
2009 & 1,179 & 155 & 100,000,000 & 1,719 & 100 & 5,000,000\\
\hline
2010 & 1,150 & 170 & 10,000,000 & 1,606 & 100 & 2,199,999\\
\hline
2011 & 1,462 & 180 & 999,999,999 & 1,516 & 100 & 2,001,850\\
\hline
2012 & 1,222 & 175 & 100,000,000 & 1,554 & 103 & 18,805,960\\
\hline
2013 & 1,792 & 168 & 950,000,000 & 1,788 & 108 & 100,000,020\\
\hline
2014 & 1,271 & 150 & 100,000,350 & 1,667 & 109 & 1,800,000\\
\hline
2015 & 1,257 & 150 & 20,000,000 & 1,867 & 115 & 2,500,000\\
\hline
2016 & 2,063 & 150 & 999,999,999 & 2,199 & 150 & 4,000,000\\
\hline
2017 & 1,581 & 150 & 361,000,000 & 2,526 & 164 & 5,000,000\\
\hline
2018 & 2,298 & 150 & 999,999,999 & 2,936 & 178 & 24,000,000\\
\hline
2019 & 13,226 & 150 & 999,999,999 & 13,121 & 179 & 999,999,999\\
\hline
2020 & 243,308 & 174 & 999,999,999 & 149,418 & 249 & 999,999,999\\
\hline
2021 & 280,898 & 205 & 999,999,999 & 242,885 & 400 & 999,999,999\\
\hline
2022 & 23,306 & 250 & 999,999,999 & 46,453 & 489 & 999,999,998\\
\hline
2023 & 42,640 & 250 & 999,999,999 & 52,336 & 500 & 999,999,999\\
\hline
\end{longtable}



\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{17_nibrs_property_files/figure-latex/nibrsPropertyMaxValuePercent-1} 

}

\caption{Annual percent of the value of all property stolen that is made up of the value that is the maximum dollar amount reported in that year, 1991-2023.}(\#fig:nibrsPropertyMaxValuePercent)
\end{figure}

## Date property was recovered

This segment tells us both when the incident happened and, for stolen property, when the item was recovered. We can use this to look at how long it generally takes for property to be recovered (though most property stolen is never recovered). Figure \@ref(fig:propertyDaysUntilRecovered) shows the number of days it takes for property to be recovered. Though this data gives us the exact date, allowing for the precise number of days from property loss to recovery, this graph groups days greater than nine days to simplify the graph. The maximum number of days in the 2022 NIBRS data is 450 days so showing all days would be a rather unhelpful graph.   

The majority - 60.8% - of property lost is recovered on the same day, which is shown as zero days. We saw in Figure \@ref(fig:arrestsDaysUntilArrest) that the vast majority of arrests happen on the same day as the incident so it makes sense the most property would too.^[I would expect most property to be recovered on the arrestee's body.] A smaller and smaller share of property is recovered as the number of days from the incident increase, a trend also found in the time to arrest graph. The lesson here seems to be that if you are a victim of a crime and had something taken, unless it is recovered very quickly it is unlikely to be recovered at all. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{17_nibrs_property_files/figure-latex/propertyDaysUntilRecovered-1} 

}

\caption{The distribution of the number of days from the incident to the property recovered date. Zero days means that the arrest occurred on the same day as the incident.}(\#fig:propertyDaysUntilRecovered)
\end{figure}

## Drugs

This segment also provides information about drugs seized by the police. This also includes cases where the police would have seized the drugs if the offender did not destroy it somehow, such as flushing it down the toilet. For each drug seized there is information on what type of drug it was and how much of the drug was seized. There can be up to three drugs seized in an incident and data is available for each type of drug. The exception, however, is when there are more than three drugs seized in an incident. In that case, information on the third drug just says that there were more than three drugs involved. So you would have information on the first two drugs but none on the third through however many (and it does not say how many) drugs. For the below table and figure I only look at the first drug seized, so the numbers shown are undercounts. 

The ordering of drugs when there are multiple drugs is based on how much drugs were recovered and the seriousness of the drugs. For example, heroin is probably considered more serious than marijuana, but overall ranking of drugs is a subjective assessment depending on the department. Is heroin more serious than meth? That decision likely varies by the agency and their situation in regard to what drugs they often seize. 

### Suspected drug type

The drugs in NIBRS are the "suspected drug types" which means that they are what the police believe the drugs to be, even if there is not definitive proof (such as a crime lab testing for what type of drug it is) that the drug is what they say it is. There are 15 possible drug types in NIBRS (16 when including "unknown drug type") and each is shown in Table \@ref(tab:propertyDrugs) along with how often they occur in the data. Some of these drug types are specific enough to only include a single drug while others are groups of drug types, such as hallucinogens or stimulants (and they include all of these types other than specifically stated drugs).

+ Amphetamines/Methamphetamines
+ Barbiturates
+ Cocaine (All Forms Except Crack)
+ Crack Cocaine
+ Hashish
+ Heroin
+ LSD
+ Marijuana
+ Morphine
+ Opium
+ Other Depressants: Glutethimide Or Doriden, Methaqualone Or Quaalude, Pentazocine Or Talwin, Etc.
+ Other Drugs: Antidepressants (Elavil, Triavil, Tofranil, Etc.), Aromatic Hydrocarbons, Propoxyphene Or Darvon, Tranquilizers (Chlordiazepoxide Or Librium, Diazepam Or Valium, Etc.), Etc.
+ Other Hallucinogrens: BMDA (White Acid), DMT, MDA, MDMA, Mescaline Or Peyote, Psilocybin, STP, Etc.
+ Other Narcotics: Codeine, Demerol, Dihydromorphinone Or Dilaudid, Hydrocodone Or Percodan, Methadone, Etc.
+ Other Stimulants: Adipex, Fastine And Ionamin (Derivatives of Phentermine), Benzedrine, Didrex, Methylphenidate Or Ritalin, Phenmetrazine Or Preludin, Tenuate, Etc.
+ PCP
+ Unknown Type Drug

Not too surprising, marijuana is the most common drug seized at 47% - or 455k incidents with it seized - of the data. This is followed by amphetamines/methamphetamines (including what we'd normally just call meth) at 20.7% and then heroin at 8.5%. Interestingly, cocaine and crack cocaine (which are always separate categories) both occur in 5.09% of drugs seized. Given the large disparity in sentences for these types of drugs, and that "crack wars" were a major purported cause of violent crime in the 1980s and 1990s, I expected crack cocaine to be much more common than normal cocaine. The remaining drug types are all less than 5% of drugs seized each and has some groupings of drug types (e.g. stimulants) rather than specific drug types (though some of these categories, such as LSD, are specific drugs). 


\begin{longtable}[t]{l|r|r|l}
\caption{(\#tab:propertyDrugs)The number and percent of drugs seized by police by type of drug, for all drugs seized in 2022.}\\
\hline
Drug Type & First Year & \textbackslash{}\# of Drugs & \textbackslash{}\% of Drugs\\
\hline
\endfirsthead
\caption[]{(\#tab:propertyDrugs)The number and percent of drugs seized by police by type of drug, for all drugs seized in 2022. \textit{(continued)}}\\
\hline
Drug Type & First Year & \textbackslash{}\# of Drugs & \textbackslash{}\% of Drugs\\
\hline
\endhead
Marijuana & 1991 & 525,007 & 39.59\textbackslash{}\%\\
\hline
Amphetamines/Methamphetamines & 1991 & 328,267 & 24.76\textbackslash{}\%\\
\hline
Other Narcotics & 1991 & 106,271 & 8.01\textbackslash{}\%\\
\hline
Cocaine (All Forms Except Crack) & 1991 & 87,404 & 6.59\textbackslash{}\%\\
\hline
Crack Cocaine & 1991 & 76,357 & 5.76\textbackslash{}\%\\
\hline
Other Drugs & 1991 & 60,096 & 4.53\textbackslash{}\%\\
\hline
Heroin & 1991 & 52,198 & 3.94\textbackslash{}\%\\
\hline
Unknown Type Drug & 1991 & 37,221 & 2.81\textbackslash{}\%\\
\hline
Opium & 1992 & 15,450 & 1.17\textbackslash{}\%\\
\hline
Other Hallucinogens & 1991 & 11,965 & 0.90\textbackslash{}\%\\
\hline
Other Depressants & 1991 & 7,889 & 0.59\textbackslash{}\%\\
\hline
Hashish & 1991 & 7,112 & 0.54\textbackslash{}\%\\
\hline
Other Stimulants & 1991 & 4,923 & 0.37\textbackslash{}\%\\
\hline
PCP & 1993 & 1,671 & 0.13\textbackslash{}\%\\
\hline
Barbiturates & 1991 & 1,507 & 0.11\textbackslash{}\%\\
\hline
LSD & 1991 & 1,349 & 0.10\textbackslash{}\%\\
\hline
Morphine & 1992 & 1,278 & 0.10\textbackslash{}\%\\
\hline
Total & - & 1,325,965 & 100\textbackslash{}\%\\
\hline
\end{longtable}




\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{17_nibrs_property_files/figure-latex/nibrsPropertyDrugType-1} 

}

\caption{Annual percent of drug seizures by drug type, for the 1st drug reported, 1991-2023.}(\#fig:nibrsPropertyDrugType)
\end{figure}

### Amount of drugs

For each drug type we know exactly how much was seized (at least we do other than for the 6.7% where the amount is "not reported"). Since different drug types are measured in different ways, this data also tells us what units the amount seized is in. So you'll need to look at both the amount and the units to understand how much drugs were actually seized. The possible units are listed below:   

* Dosage Unit/Items (Pills, Etc.)
* Fluid Ounce
* Gallon                   
* Gram
* Kilogram       
* Liter                   
* Milliliter
* Number of Plants           
* Ounce
* Pound

Once you know the units you can look at the amount of drugs seized. The amount is specific up to the thousandths place though the integer and the numbers after the decimal point are actually in different columns in the data. For example, if police seized 1.257 grams of heroin, the 1 gram and the 0.257 grams would be in separate columns. As an example, we will look at Figure \@ref(fig:propertyMarijuanaGramMeasures) which shows the number of grams seized for marijuana. This is only looking at the column with the amount in integers, so parts of a gram are excluded (but are available in the data). This also excludes any case where the marijuana seized was measured in a unit other than gram, such as number of plants, ounces, or pounds. Even though the data shows the number of grams as actual integers, not grouped at all, I do group the larger values together to make the graph simpler. 

So with those caveats, we can see what amounts of marijuana, measured in grams, are most frequently seized. Generally, the amount of marijuana seized is in small amounts with 22.5% being 1-2 grams (since we do not include the parts of a gram we can only say that it is 1 to 1.999 grams) and 18.6% being less than one gram. As the amount of drugs increase, the percent of seizures that involve this number of drugs decreases. It's a bit curious that they include grams for values over 28 since 28.3495 grams is one ounce so it would make sense to just start reporting in units of ounces instead of just increasingly large number of grams.

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{17_nibrs_property_files/figure-latex/propertyMarijuanaGramMeasures-1} 

}

\caption{For drugs seized that are measured in grams, this figure shows the distribution in the number of grams seized. Values over 10 grams are grouped together for easier interpretation of lower values of drugs seized.}(\#fig:propertyMarijuanaGramMeasures)
\end{figure}


<!--chapter:end:17_nibrs_property.Rmd-->

\backmatter



<!--chapter:end:18_references.Rmd-->

