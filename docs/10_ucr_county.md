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

For each of the below graphs and tables we use the Offenses Known and Clearances by Arrest data for 1960-2022 and exclude any agency that are "special jurisdictions". Special jurisdiction agencies are, as it seems, special agencies that tend to have an extremely specific jurisdiction and goals. These include agencies such as port authorities, alcohol beverage control, university police, and airport police. These agencies tend to cover a tiny geographic area and have both very low crime and very low reporting rates.[^ucr_county-7] So to prevent missingness being overcounted due to these weird agencies I am excluding them from the below examples. I am also excluding federal agencies as these operate much the same as special jurisdiction agencies. Since some estimation is based on state-level data and I present maps that exclude territories, I am also going to subset the data to only agencies in a state or in Washington DC. 

[^ucr_county-7]: Even though these are unusual agencies, in real analyses using UCR data at the county-level you would like want to include them. Or justify why you are not including them.

We will first look at how many months are reported in the 2017. Table \@ref(tab:countyMonthsReportedDefinitions) shows the number of months reported using two ways to measure how many months an agency has reported data, the "last month reported" and the "number of months missing" measure that we considered in Section \@ref(offensesKnownReporting). The data changed how some of the variables were used starting in 2018, making post-2017 data unreliable for the "number of months missing variable. 

The table shows what percent of agencies that reported data had data for each possible number of months: 0 through 12 months. Column 2 shows the percent for the "last month reported" method while column 3 shows the percent for my "number of months missing" method. And the final column shows the percent change^[Not the percentage point difference.] from moving from the 1st to 2nd measure. 

Ultimately the measures are quite similar though systematically overcount reporting using the 1st method. Both show that about 27% of agencies reported zero months. The 1st method has about 69% of agencies reporting 12 months while the 2nd method has 66%, a difference of about 5% which is potentially a sizable difference depending on exactly which agencies are missing. The remaining nearly 4% of agencies all have far more people in the 2nd method than in the first, which is because in the 1st method those agencies are recorded as having 12 months since they reported in December but not actually all 12 months of the year. There are huge percent increases in moving from the 1st to 2nd method for 1-11 months reported though this is due to having very few agencies report this many months. Most months have only about 50 agencies in the 1st method and about 70 in the 2nd, so the actual difference is not that large. 


\begin{longtable}[t]{l|r|r|r}
\caption{(\#tab:countyMonthsReportedDefinitions)The number of months reported to the 2017 Offenses Known and Clearances by Arrest data using two definitions of months reported. The 'Last Month' definition is the preferred measure of months reported by both the FBI and researchers, though this overcounts months.}\\
\hline
Months Reported & Last Month Definition & Months Not Missing Definition & Percent Difference\\
\hline
\endfirsthead
\caption[]{(\#tab:countyMonthsReportedDefinitions)The number of months reported to the 2017 Offenses Known and Clearances by Arrest data using two definitions of months reported. The 'Last Month' definition is the preferred measure of months reported by both the FBI and researchers, though this overcounts months. \textit{(continued)}}\\
\hline
Months Reported & Last Month Definition & Months Not Missing Definition & Percent Difference\\
\hline
\endhead
0 & 1,626 (8.35\%) & 1,626 (8.35\%) & +0.00\\
\hline
1 & 60 (0.31\%) & 113 (0.58\%) & +88.33\\
\hline
2 & 40 (0.21\%) & 75 (0.39\%) & +87.50\\
\hline
3 & 44 (0.23\%) & 159 (0.82\%) & +261.36\\
\hline
4 & 46 (0.24\%) & 71 (0.36\%) & +54.35\\
\hline
5 & 45 (0.23\%) & 85 (0.44\%) & +88.89\\
\hline
6 & 45 (0.23\%) & 76 (0.39\%) & +68.89\\
\hline
7 & 61 (0.31\%) & 90 (0.46\%) & +47.54\\
\hline
8 & 60 (0.31\%) & 94 (0.48\%) & +56.67\\
\hline
9 & 67 (0.34\%) & 114 (0.59\%) & +70.15\\
\hline
10 & 173 (0.89\%) & 273 (1.4\%) & +57.80\\
\hline
11 & 232 (1.19\%) & 474 (2.43\%) & +104.31\\
\hline
12 & 16,968 (87.16\%) & 16,217 (83.31\%) & -4.43\\
\hline
\end{longtable}



We can look at how these trends change over time in Figure \@ref(fig:countyAnyMonthReported) that shows the annual number of agencies that reported at least one month of data in that year. Both measures have the exact same trend with the last month reported measure always being a bit higher than the number of months missing method, at least until the data change in 2018 that renders my method unreliable. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{10_ucr_county_files/figure-latex/countyAnyMonthReported-1} 

}

\caption{The annual number of agencies that reported at least 12 months of data in that year.}(\#fig:countyAnyMonthReported)
\end{figure}

For the remainder of this chapter we will treat the last month reported variable as our measure of how many months an agency reports data. I believe that pre-2018 this is not as good a measure at the number of months missing, but it has the benefit of consistency post-2017. So keep in mind that the true number of agencies reporting fewer than 12 months of data is a bit larger than what it seems when using this measure. 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{10_ucr_county_files/figure-latex/stateMap2022-1} 

}

\caption{The share of the population in each state covered by an agency reporting 12 months of data based on their last month reported being December, 2022.}(\#fig:stateMap2022)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{10_ucr_county_files/figure-latex/countyMap2022-1} 

}

\caption{The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2022.}(\#fig:countyMap2022)
\end{figure}


\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{10_ucr_county_files/figure-latex/countyMap2010-1} 

}

\caption{The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2010.}(\#fig:countyMap2010)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{10_ucr_county_files/figure-latex/countyMap2000-1} 

}

\caption{The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2000.}(\#fig:countyMap2000)
\end{figure}

## Current imputation practices

There are three paths that the county-level UCR data takes when dealing with the agency-level data before aggregating it to the county-level. The path each agency is on is dependent on how many months of data they report. Figure \@ref(fig:countyImputation) shows each of these three paths. We will look in detail at these paths in the below sections, but for now we will briefly summarize each path. 

First, if an agency reports only two or fewer months, the entire agency's data (that is, any month that they do report) is deleted and their annual data is replaced with the average of agencies that are: 1) in the same state, 2) in the same population group (i.e. very roughly the same size), 3) and that reported all 12 months of the year (i.e. reported in December but potentially not any other month). 

When an agency reports 3-11 months, those months of data are multiplied by 12/numbers-of-months-reported so it just upweights the available data to account for the missing months, assuming that missing months are like the present months. 

Finally, for agencies that reported all 12 months there is nothing missing so it just uses the data as it is.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{images/segments_flowchart} 

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
Full data & 514.00 & 514.00 & 514.00 & 514.00\\
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
Full data & 27.00 & 27.00 & 27.00 & 27.00\\
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
Full data & 1.00 & 1.00 & 1 & 1.00\\
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
City Under 2,500 & 0 & 0 & 0 & 0 & 26\\
\hline
City 2,500-9,999 & 0 & 0 & 1 & 0 & 10\\
\hline
City 10,000-24,999 & 0 & 0 & 2 & 0 & 58\\
\hline
City 25,000-49,999 & 1 & 0 & 4 & 0 & 21\\
\hline
City 50,000-99,999 & 3 & 2 & 8 & 0 & 47\\
\hline
City 100,000-249,999 & 10 & 5 & 22 & 0 & 142\\
\hline
City 250,000+ & 94 & 45 & 237 & 0 & 604\\
\hline
MSA Counties and MSA State Police & 2 & 0 & 4 & 0 & 141\\
\hline
Non-MSA Counties and Non-MSA State Police & 0 & 0 & 1 & 0 & 29\\
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
City Under 2,500 & 0 & 0 & 0 & 0 & 26\\
\hline
City 2,500-9,999 & 0 & 0 & 1 & 0 & 10\\
\hline
City 10,000-24,999 & 0 & 0 & 2 & 0 & 58\\
\hline
City 25,000-49,999 & 1 & 0 & 4 & 0 & 21\\
\hline
City 50,000-99,999 & 3 & 2 & 8 & 0 & 47\\
\hline
City 100,000-249,999 & 10 & 5 & 22 & 0 & 142\\
\hline
City 250,000+ & 94 & 45 & 237 & 0 & 604\\
\hline
MSA Counties and MSA State Police & 2 & 0 & 4 & 0 & 141\\
\hline
Non-MSA Counties and Non-MSA State Police & 0 & 0 & 1 & 0 & 29\\
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
City Under 2,500 & 0 & 0 & 0 & 0 & 2\\
\hline
City 2,500-9,999 & 0 & 0 & 1 & 0 & 3\\
\hline
City 10,000-24,999 & 0 & 0 & 2 & 0 & 22\\
\hline
City 25,000-49,999 & 1 & 1 & 3 & 0 & 8\\
\hline
City 50,000-99,999 & 2 & 2 & 7 & 0 & 13\\
\hline
City 100,000-249,999 & 6 & 5 & 14 & 0 & 23\\
\hline
City 250,000+ & 93 & 33 & 222 & 1 & 433\\
\hline
MSA Counties and MSA State Police & 4 & 1 & 10 & 0 & 141\\
\hline
Non-MSA Counties and Non-MSA State Police & 0 & 0 & 1 & 0 & 7\\
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
City 2,500-9,999 & 0 & 0 & 0 & 0 & 1\\
\hline
City 10,000-24,999 & 0 & 0 & 1 & 0 & 2\\
\hline
City 25,000-49,999 & 1 & 0 & 2 & 0 & 3\\
\hline
City 50,000-99,999 & 5 & 5 & 5 & 5 & 5\\
\hline
City 100,000-249,999 & - & - & - & - & -\\
\hline
City 250,000+ & - & - & - & - & -\\
\hline
MSA Counties and MSA State Police & 0 & 0 & 0 & 0 & 0\\
\hline
Non-MSA Counties and Non-MSA State Police & 0 & 0 & 0 & 0 & 13\\
\hline
\end{longtable}


