# County-Level Data





SRS data is only available at the agency-level.^[Even for county-level agencies such as Sheriff's Offices, the data is only for crimes in that agency's jurisdiction. So the county sheriff reports crimes that they responded to but not crimes within the county that other agencies, such as a city police force, responded to.] This has caused a lot of problems for researchers because many variables from other datasets (e.g. CDC data, economic data) is primarily available at the county-level. Their solution to this problem is to aggregate the data to the county-level by summing all the agencies in a particular county.^[Because the county-level data imputes missing months, this dataset is only available at the annual-level, not at the monthly level.]

More specifically, nearly all researchers who use this county-level data use the National Archive for Criminal Justice Data (NACJD)'s [datasets](https://www.icpsr.umich.edu/web/NACJD/series/57) which have done the aggregation themselves^[Full disclosure, I used to have my own version of this data available on openICPSR and followed NACJD's method. My reasoning was that people were using it anyways and I wanted to make sure that they knew the problem of the data, so I included the issues with this data in the documentation when downloading it. However, I decided that the data was more flawed than I originally thought so I took down the data.]. These are not official FBI datasets but "UCR staff were consulted in developing the new adjustment procedures".^[This chapter isn't a critique of NACJD, merely of a single dataset collection that they released using imputation methods from decades ago.] The "new" procedures is because NACJD changed their missing data imputation procedure starting with 1994 SRS data, and for this chapter I'll only focus on this "new" procedure. 

It makes sense to aggregate SRS data to the county-level. That level is often times more useful to analyze than the agency-level. But there are two problems with county-level SRS data: 1) agencies in multiple counties, 2) and agencies with missing data.^[These problems are in addition to all the other quirks and issues with SRS data that have been discussed throughout this book.]

The first issue is in distributing crimes across counties when an agency is in multiple counties. If, for example, New York City had 100 murders in a given year, how do you create county-level data from this? SRS data only tells you how many crimes happened in a particular agency, not where in the jurisdiction it happened. So we have no idea how many of these 100 murders happened in Kings County, how many happened in Bronx County, and so on. 

SRS data does, however, tell you how many counties the agency is in and the population of each. They only do this for up to three counties so in cases like New York City you don't actually have every county the agency is part of.^[For New York City specifically NACJD does distribute to all five counties, and does so by county population.] NACJD's method is to distribute crimes *according to the population of the agency in each county*. In the New York City example, Kings County is home to about 31% of the people in NYC while Bronx County is home to about 17%. So Kings County would get 31 murders while Bronx County gets 17 murders. The problem with this is the crime is not evenly distributed by population. Indeed, crime is generally extremely concentrated in a small number of areas in a city. Even if 100% of the murders in NYC actually happened in Bronx County, only 17% would get assigned there. So for agencies in multiple counties could have their crimes distributed among their different counties incorrectly. This is not that big of a deal, however, as most agencies are only in a single county. It is likely incorrect given how crime is concentrated, but affects relatively little in our data so is not worth much worry. 

The second problem is the one we need to be concerned about. This issue is that not all agencies report data, and even those that do may report only partially (e.g. report fewer than 12 months of the year). So by necessity the missing data has to be filled in somehow. All methods of estimating missing data are wrong, some are useful. How useful are the methods used for SRS data? I'll argue that they're not useful enough to be used in most crime research. This is by no means the first argument against using that data. Most famously is [Maltz and Targonski's (2002)](https://link.springer.com/article/10.1023/A:1016060020848) paper in the Journal of Quantitative Criminology about the issues with this data. They concluded that "Until improved methods of imputing county-level crime data are developed, tested, and implemented, they should not be used, especially in policy studies" which is a conclusion I also hold. 

County-level data aggregates both crimes from the Offenses Known and Clearances by Arrests dataset and arrests from the Arrests by Age, Sex, and Race dataset, which has lower reporting (and thus more missingness) than the crime data. For simplicity, in this chapter we'll use the crime data as an example. We'll do so in a number of different ways to try to really understand how much data is missing and how it changed over time. Estimation is largely the same for arrests and county-level arrests is far less commonly used

Since these methods are for dealing with missing data, if there is no missing data then it doesn't matter how good or bad the estimation process is. Counties where all agencies report full data are perfectly fine to use without concerning yourself with anything from this chapter. In this chapter we'll also look at where counties have missing data and how that changed over time. 

## Current usage

Even with the well-known flaws of this data, it remains a popular dataset. A search on Google Scholar for ["county-level UCR"](https://scholar.google.com/scholar?q=county-level+ucr&hl=en&as_sdt=0,20) returns 5,580 results as of this writing in summer 2024. About half of these results are from 2015 or later. In addition to use by researchers, the county-level UCR data is used by organizations such as the FBI in their annual [Crimes in the United States](https://ucr.fbi.gov/crime-in-the-u.s) report (which is essentially the report that informs the media and the public about crime, even though it's actually only a subset of their published UCR data) and [Social Explorer](https://www.socialexplorer.com/explore-maps), a website that makes it extremely convenient to examine US Census data. 

## How much data is missing

Since estimating missing data only matters when the data is missing, let's look at how many agencies report less than a full year of data.

For each of the below graphs and tables we use the Offenses Known and Clearances by Arrest data for 1960-2022 and exclude any agency that are "special jurisdictions". Special jurisdiction agencies are, as it seems, special agencies that tend to have an extremely specific jurisdiction and goals. These include agencies such as port authorities, alcohol beverage control, university police, and airport police. These agencies tend to cover a tiny geographic area and have both very low crime and very low reporting rates.[^ucr_county-7] So to prevent missingness being overcounted due to these weird agencies I'm excluding them from the below examples. I'm also excluding federal agencies as these operate much the same as special jurisdiction agencies. Since some estimation is based on state-level data and I present maps that exclude territories, I am also going to subset the data to only agencies in a state or in Washington DC. 

[^ucr_county-7]: Even though these are unusual agencies, in real analyses using UCR data at the county-level you'd like want to include them. Or justify why you're not including them.

We'll first look at how many months are reported in the 2017. Table \@ref(tab:countyMonthsReportedDefinitions) shows the number of months reported using two ways to measure how many months an agency has reported data, the "last month reported" and the "number of months missing" measure that we considered in Section \@ref(offensesKnownReporting). The data changed how some of the variables were used starting in 2018, making post-2017 data unreliable for the "number of months missing variable. 

The table shows what percent of agencies that reported data had data for each possible number of months: 0 through 12 months. Column 2 shows the percent for the "last month reported" method while column 3 shows the percent for my "number of months missing" method. And the final column shows the percent change^[Not the percentage point difference.] from moving from the 1st to 2nd measure. 

Ultimately the measures are quite similar though systematically overcount reporting using the 1st method. Both show that about 27% of agencies reported zero months. The 1st method has about 69% of agencies reporting 12 months while the 2nd method has 66%, a difference of about 5% which is potentially a sizable difference depending on exactly which agencies are missing. The remaining nearly 4% of agencies all have far more people in the 2nd method than in the first, which is because in the 1st method those agencies are recorded as having 12 months since they reported in December but not actually all 12 months of the year. There are huge percent increases in moving from the 1st to 2nd method for 1-11 months reported though this is due to having very few agencies report this many months. Most months have only about 50 agencies in the 1st method and about 70 in the 2nd, so the actual difference is not that large. 

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyMonthsReportedDefinitions)The number of months reported to the 2017 Offenses Known and Clearances by Arrest data using two definitions of months reported. The 'Last Month' definition is the preferred measure of months reported by both the FBI and researchers, though this overcounts months.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Months Reported </th>
   <th style="text-align:right;"> Last Month Definition </th>
   <th style="text-align:right;"> Months Not Missing Definition </th>
   <th style="text-align:right;"> Percent Difference </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 0 </td>
   <td style="text-align:right;"> 1,626 (8.35%) </td>
   <td style="text-align:right;"> 1,626 (8.35%) </td>
   <td style="text-align:right;"> +0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 60 (0.31%) </td>
   <td style="text-align:right;"> 113 (0.58%) </td>
   <td style="text-align:right;"> +88.33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 40 (0.21%) </td>
   <td style="text-align:right;"> 75 (0.39%) </td>
   <td style="text-align:right;"> +87.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 44 (0.23%) </td>
   <td style="text-align:right;"> 159 (0.82%) </td>
   <td style="text-align:right;"> +261.36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 46 (0.24%) </td>
   <td style="text-align:right;"> 71 (0.36%) </td>
   <td style="text-align:right;"> +54.35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 45 (0.23%) </td>
   <td style="text-align:right;"> 85 (0.44%) </td>
   <td style="text-align:right;"> +88.89 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 45 (0.23%) </td>
   <td style="text-align:right;"> 76 (0.39%) </td>
   <td style="text-align:right;"> +68.89 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:right;"> 61 (0.31%) </td>
   <td style="text-align:right;"> 90 (0.46%) </td>
   <td style="text-align:right;"> +47.54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:right;"> 60 (0.31%) </td>
   <td style="text-align:right;"> 94 (0.48%) </td>
   <td style="text-align:right;"> +56.67 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 </td>
   <td style="text-align:right;"> 67 (0.34%) </td>
   <td style="text-align:right;"> 114 (0.59%) </td>
   <td style="text-align:right;"> +70.15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10 </td>
   <td style="text-align:right;"> 173 (0.89%) </td>
   <td style="text-align:right;"> 273 (1.4%) </td>
   <td style="text-align:right;"> +57.80 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 11 </td>
   <td style="text-align:right;"> 232 (1.19%) </td>
   <td style="text-align:right;"> 474 (2.43%) </td>
   <td style="text-align:right;"> +104.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 12 </td>
   <td style="text-align:right;"> 16,968 (87.16%) </td>
   <td style="text-align:right;"> 16,217 (83.31%) </td>
   <td style="text-align:right;"> -4.43 </td>
  </tr>
</tbody>
</table>



We can look at how these trends change over time in Figure \@ref(fig:countyAnyMonthReported) that shows the annual number of agencies that reported at least one month of data in that year. Both measures have the exact same trend with the last month reported measure always being a bit higher than the number of months missing method, at least until the data change in 2018 that renders my method unreliable. 

<div class="figure" style="text-align: center">
<img src="10_ucr_county_files/figure-html/countyAnyMonthReported-1.png" alt="The annual number of agencies that reported at least 12 months of data in that year." width="90%" />
<p class="caption">(\#fig:countyAnyMonthReported)The annual number of agencies that reported at least 12 months of data in that year.</p>
</div>

For the remainder of this chapter we'll treat the last month reported variable as our measure of how many months an agency reports data. I believe that pre-2018 this is not as good a measure at the number of months missing, but it has the benefit of consistency post-2017. So keep in mind that the true number of agencies reporting fewer than 12 months of data is a bit larger than what it seems when using this measure. 

<div class="figure" style="text-align: center">
<img src="10_ucr_county_files/figure-html/stateMap2022-1.png" alt="The share of the population in each state covered by an agency reporting 12 months of data based on their last month reported being December, 2022." width="90%" />
<p class="caption">(\#fig:stateMap2022)The share of the population in each state covered by an agency reporting 12 months of data based on their last month reported being December, 2022.</p>
</div>


<div class="figure" style="text-align: center">
<img src="10_ucr_county_files/figure-html/countyMap2022-1.png" alt="The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2022." width="90%" />
<p class="caption">(\#fig:countyMap2022)The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2022.</p>
</div>


<div class="figure" style="text-align: center">
<img src="10_ucr_county_files/figure-html/countyMap2010-1.png" alt="The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2010." width="90%" />
<p class="caption">(\#fig:countyMap2010)The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2010.</p>
</div>

<div class="figure" style="text-align: center">
<img src="10_ucr_county_files/figure-html/countyMap2000-1.png" alt="The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2000." width="90%" />
<p class="caption">(\#fig:countyMap2000)The share of the population in each county covered by an agency reporting 12 months of data based on their last month reported being December, 2000.</p>
</div>

## Current imputation practices

There are three paths that the county-level UCR data takes when dealing with the agency-level data before aggregating it to the county-level. The path each agency is on is dependent on how many months of data they report. Figure \@ref(fig:countyImputation) shows each of these three paths. We'll look in detail at these paths in the below sections, but for now we'll briefly summarize each path. 

First, if an agency reports only two or fewer months, the entire agency's data (that is, any month that they do report) is deleted and their annual data is replaced with the average of agencies that are: 1) in the same state, 2) in the same population group (i.e. very roughly the same size), 3) and that reported all 12 months of the year (i.e. reported in December but potentially not any other month). 

When an agency reports 3-11 months, those months of data are multiplied by 12/numbers-of-months-reported so it just upweights the available data to account for the missing months, assuming that missing months are like the present months. 

Finally, for agencies that reported all 12 months there's nothing missing so it just uses the data as it is.

<div class="figure" style="text-align: center">
<img src="images/segments_flowchart.PNG" alt="The imputation procedure for missing data based on the number of months missing." width="90%" />
<p class="caption">(\#fig:countyImputation)The imputation procedure for missing data based on the number of months missing.</p>
</div>

### 1-9 months missing

When there are 1-9 months reported the missing months are imputed by multiplying the reported months of data by 12/numbers-of-months-reported, essentially just scaling up the reported months. For example, if 6 months are reported then it multiplies each crime values by 12/6=2, doubling each reported crime value. This method makes the assumption that missing values are similar to present ones, at on average. Given that there are seasonal differences in crime - which tends to increase in the summer and decrease in the winter - how accurate this replacement is depends on how consistent crime is over the year and which months are missing. Miss the summer months and you'll undercount crime. Miss the winter months and you'll overcount crime. Miss random months and you'll be wrong randomly (and maybe it'll balance out but maybe it won't).

We'll look at a number of examples and simulations about how accurate this method is. For each example we'll use agencies that reported in 2018 so we have a real comparison when using their method of replacing "missing" months.

Starting with Table \@ref(tab:CountyPhillyMurders), we will see the change in the actual annual count of murders in Philadelphia when replacing data from each month. Each row shows what happens when you assume that month - and only that month - is missing and interpolate using the current 12/numbers-of-months-reported method. Column 1 shows the month that we are "replacing" while column 2 shows the actual number of murders in that month and the percent of annual murders in parentheses. Column 3 shows the actual annual murders which is 351 in 2018; column 4 shows the annual murder count when imputing the "missing" month" and column 5 shows the percent change between columns 3 and 4.

If each month had the same number of crimes we'd expect each month to account for 8.33% of the year's total. That's not what we're seeing in Philadelphia for murders as the percentages range from 5.13% in both January and April to 12.25% in December. This means that replacing these months will not give us an accurate count of crimes as crime is not distributed evenly across months. Indeed, as seen in column 5, on average, the annual sum of murders when imputing a single month is 1.85% off from the real value. When imputing the worst (as far as its effect on results) months you can report murder as either 4.27% lower than it is or 3.5% higher than it is.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:CountyPhillyMurders)The imputed number of murders in Philadelphia in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Month </th>
   <th style="text-align:right;"> Murders That Month </th>
   <th style="text-align:right;"> Actual Annual Murders </th>
   <th style="text-align:right;"> Imputed Annual Murders </th>
   <th style="text-align:right;"> Percent Change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> January </td>
   <td style="text-align:right;"> 46 (8.95%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 511 </td>
   <td style="text-align:right;"> -0.58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> February </td>
   <td style="text-align:right;"> 38 (7.39%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 519 </td>
   <td style="text-align:right;"> +0.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> March </td>
   <td style="text-align:right;"> 40 (7.78%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 517 </td>
   <td style="text-align:right;"> +0.58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> April </td>
   <td style="text-align:right;"> 34 (6.61%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 524 </td>
   <td style="text-align:right;"> +1.95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> May </td>
   <td style="text-align:right;"> 56 (10.89%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:right;"> -2.72 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> June </td>
   <td style="text-align:right;"> 52 (10.12%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 504 </td>
   <td style="text-align:right;"> -1.95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> July </td>
   <td style="text-align:right;"> 55 (10.70%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 501 </td>
   <td style="text-align:right;"> -2.53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> August </td>
   <td style="text-align:right;"> 46 (8.95%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 511 </td>
   <td style="text-align:right;"> -0.58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> September </td>
   <td style="text-align:right;"> 40 (7.78%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 517 </td>
   <td style="text-align:right;"> +0.58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> October </td>
   <td style="text-align:right;"> 42 (8.17%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 515 </td>
   <td style="text-align:right;"> +0.19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> November </td>
   <td style="text-align:right;"> 25 (4.86%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 533 </td>
   <td style="text-align:right;"> +3.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> December </td>
   <td style="text-align:right;"> 40 (7.78%) </td>
   <td style="text-align:right;"> 514 </td>
   <td style="text-align:right;"> 517 </td>
   <td style="text-align:right;"> +0.58 </td>
  </tr>
</tbody>
</table>



Part of the reason for the percent difference for murders when replacing a month found above is that there was high variation in the number of murders per month with some months having more than double the number as other months. We'll look at what happens when crimes are far more evenly distributed across months in Table \@ref(tab:countyPhillyThefts). This table replicates Table \@ref(tab:CountyPhillyMurders) but uses thefts in Philadelphia in 2022 instead of murders. Here the monthly share of thefts ranged only from 6.85% to 9.16% so month-to-month variation is not very large. Now the percent change never increases above an absolute value of 1.62 and changes by an average of 0.77%. In cases like this, the imputation method is less of a problem.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyPhillyThefts)The imputed number of thefts in Philadelphia in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Month </th>
   <th style="text-align:right;"> Thefts That Month </th>
   <th style="text-align:right;"> Actual Annual Thefts </th>
   <th style="text-align:right;"> Imputed Annual Thefts </th>
   <th style="text-align:right;"> Percent Change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> January </td>
   <td style="text-align:right;"> 3,080 (6.41%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 49,077 </td>
   <td style="text-align:right;"> +2.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> February </td>
   <td style="text-align:right;"> 2,929 (6.09%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 49,241 </td>
   <td style="text-align:right;"> +2.44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> March </td>
   <td style="text-align:right;"> 3,546 (7.38%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 48,568 </td>
   <td style="text-align:right;"> +1.04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> April </td>
   <td style="text-align:right;"> 3,619 (7.53%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 48,489 </td>
   <td style="text-align:right;"> +0.88 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> May </td>
   <td style="text-align:right;"> 4,063 (8.45%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 48,004 </td>
   <td style="text-align:right;"> -0.13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> June </td>
   <td style="text-align:right;"> 4,425 (9.21%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 47,609 </td>
   <td style="text-align:right;"> -0.95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> July </td>
   <td style="text-align:right;"> 4,566 (9.50%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 47,456 </td>
   <td style="text-align:right;"> -1.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> August </td>
   <td style="text-align:right;"> 4,798 (9.98%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 47,203 </td>
   <td style="text-align:right;"> -1.80 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> September </td>
   <td style="text-align:right;"> 4,477 (9.31%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 47,553 </td>
   <td style="text-align:right;"> -1.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> October </td>
   <td style="text-align:right;"> 4,618 (9.61%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 47,399 </td>
   <td style="text-align:right;"> -1.39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> November </td>
   <td style="text-align:right;"> 4,022 (8.37%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 48,049 </td>
   <td style="text-align:right;"> -0.04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> December </td>
   <td style="text-align:right;"> 3,924 (8.16%) </td>
   <td style="text-align:right;"> 48,067 </td>
   <td style="text-align:right;"> 48,156 </td>
   <td style="text-align:right;"> +0.19 </td>
  </tr>
</tbody>
</table>



Given that the imputation method is largely dependent on consistency across months, what happens when crime is very rare? Table \@ref(tab:countyDanvilleVehicle) shows what happens when replacing a single month for motor vehicle thefts in Danville, California, a small town which had 22 of these thefts in 2022. While possible to still have an even distribution of crimes over months, this is less likely when it comes to rare events. Here, having so few motor vehicle thefts means that small changes in monthly crimes can have an outsize effect. The average absolute value percent change now is 7.3% and this ranges from a -15.68% difference to a +9.1% difference from the real annual count. This means that having even a single month missing can vastly overcount or undercount the real values.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyDanvilleVehicle)The imputed number of motor vehicle thefts in Danville, California, in 2022 when missing a single month. This shows how different the imputed value is to the real value for each month missing.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Month </th>
   <th style="text-align:right;"> Vehicle Thefts That Month </th>
   <th style="text-align:right;"> Actual Annual Vehicle Thefts </th>
   <th style="text-align:right;"> Imputed Annual Vehicle Thefts </th>
   <th style="text-align:right;"> Percent Change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> January </td>
   <td style="text-align:right;"> 2 (7.41%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> +0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> February </td>
   <td style="text-align:right;"> 2 (7.41%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> +0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> March </td>
   <td style="text-align:right;"> 1 (3.70%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> +3.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> April </td>
   <td style="text-align:right;"> 4 (14.81%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> -7.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> May </td>
   <td style="text-align:right;"> 6 (22.22%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> -14.81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> June </td>
   <td style="text-align:right;"> 0 (0.00%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 29 </td>
   <td style="text-align:right;"> +7.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> July </td>
   <td style="text-align:right;"> 2 (7.41%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> +0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> August </td>
   <td style="text-align:right;"> 1 (3.70%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> +3.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> September </td>
   <td style="text-align:right;"> 1 (3.70%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> +3.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> October </td>
   <td style="text-align:right;"> 3 (11.11%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> -3.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> November </td>
   <td style="text-align:right;"> 3 (11.11%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> -3.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> December </td>
   <td style="text-align:right;"> 2 (7.41%) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> +0.00 </td>
  </tr>
</tbody>
</table>



In the above three tables we looked at what happens if a single month is missing. Below we'll look at the results of simulating when between 1 and 9 months are missing for an agency. Table \@ref(tab:countyPhillyMurderMonthsMissing) looks at murder in Philadelphia again but now randomizes removing between 1 and 9 months of the year and interpolating the annual murder count using the current method. For each number of months removed I run 10,000 simulations.[^ucr_county-8] Given that I am literally randomly choosing which months to say are missing, I am assuming that missing data is missing completely at random. This is a very bold assumption and one that is the best-case scenario since it means that missing data is not related to crimes, police funding/staffing, or anything else relevant. So you should read the below tables as the most optimistic (and thus likely wrong) outcomes.

[^ucr_county-8]: This is actually more than I need to run to get the same results..

For each number of months reported the table shows the actual annual murder (which never changes) and the imputed mean, median, modal, minimum, and maximum annual murder count. As a function of the randomization, the imputed mean is always nearly identical to the real value. The most important columns, I believe, are the minimum and maximum imputed value since these show the worst-case scenario - that is, what happens when the month(s) least like the average month is replaced. Since as researchers we should try to minimize the harm caused from our work if it is wrong, I think it is safest to assume that if data is missing it is missing in the worst possible way. While this is a conservative approach, doing so otherwise leads to the greatest risk of using incorrect data, and incorrect results - and criminology is a field important enough to necessitate this caution.

As might be expected, as the number of months missing increases the quality of the imputation decreases. The minimum is further and further below the actual value while the maximum is further and further above the actual value.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyPhillyMurderMonthsMissing)A simulation showing how the imputed values of murders in Philadelphia in 2022 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run removing and imputing those months of data.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> # of Months Missing </th>
   <th style="text-align:right;"> Mean Imputed Value </th>
   <th style="text-align:right;"> Median Imputed Value </th>
   <th style="text-align:right;"> Minimum Imputed Value </th>
   <th style="text-align:right;"> Maximum Imputed Value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Full data </td>
   <td style="text-align:right;"> 514.00 </td>
   <td style="text-align:right;"> 514.00 </td>
   <td style="text-align:right;"> 514.00 </td>
   <td style="text-align:right;"> 514.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 month </td>
   <td style="text-align:right;"> 514.08 </td>
   <td style="text-align:right;"> 517.09 </td>
   <td style="text-align:right;"> 499.64 </td>
   <td style="text-align:right;"> 533.45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 514.12 </td>
   <td style="text-align:right;"> 513.60 </td>
   <td style="text-align:right;"> 483.60 </td>
   <td style="text-align:right;"> 546.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 513.81 </td>
   <td style="text-align:right;"> 513.33 </td>
   <td style="text-align:right;"> 468.00 </td>
   <td style="text-align:right;"> 556.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 514.15 </td>
   <td style="text-align:right;"> 513.00 </td>
   <td style="text-align:right;"> 457.50 </td>
   <td style="text-align:right;"> 565.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 513.95 </td>
   <td style="text-align:right;"> 514.29 </td>
   <td style="text-align:right;"> 444.00 </td>
   <td style="text-align:right;"> 577.71 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 514.05 </td>
   <td style="text-align:right;"> 514.00 </td>
   <td style="text-align:right;"> 434.00 </td>
   <td style="text-align:right;"> 594.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:right;"> 514.45 </td>
   <td style="text-align:right;"> 513.60 </td>
   <td style="text-align:right;"> 424.80 </td>
   <td style="text-align:right;"> 612.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:right;"> 513.85 </td>
   <td style="text-align:right;"> 516.00 </td>
   <td style="text-align:right;"> 411.00 </td>
   <td style="text-align:right;"> 627.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 </td>
   <td style="text-align:right;"> 513.02 </td>
   <td style="text-align:right;"> 512.00 </td>
   <td style="text-align:right;"> 388.00 </td>
   <td style="text-align:right;"> 652.00 </td>
  </tr>
</tbody>
</table>



This problem is even more pronounced when looking at agencies with fewer crimes and less evenly distributed crimes. Table \@ref(tab:countyDanvilleBurglaryMonthsMissing) repeats the above table but now looks at motor vehicle thefts in Danville, California. By the time 5 months are missing, the minimum value is nearly half of the actual value while the maximum value is a little under 50% larger than the actual value. By 9 months missing, possible imputed values range from 0% of the actual value to over twice as large as the actual value.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyDanvilleBurglaryMonthsMissing)A simulation showing how the imputed values of motor vehicle thefts in Danville, California, in 2022 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run for removing and imputing those months of data.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> # of Months Missing </th>
   <th style="text-align:right;"> Mean Imputed Value </th>
   <th style="text-align:right;"> Median Imputed Value </th>
   <th style="text-align:right;"> Minimum Imputed Value </th>
   <th style="text-align:right;"> Maximum Imputed Value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Full data </td>
   <td style="text-align:right;"> 27.00 </td>
   <td style="text-align:right;"> 27.00 </td>
   <td style="text-align:right;"> 27.00 </td>
   <td style="text-align:right;"> 27.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 month </td>
   <td style="text-align:right;"> 26.99 </td>
   <td style="text-align:right;"> 27.27 </td>
   <td style="text-align:right;"> 22.91 </td>
   <td style="text-align:right;"> 29.45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 27.01 </td>
   <td style="text-align:right;"> 27.60 </td>
   <td style="text-align:right;"> 20.40 </td>
   <td style="text-align:right;"> 31.20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 26.98 </td>
   <td style="text-align:right;"> 28.00 </td>
   <td style="text-align:right;"> 18.67 </td>
   <td style="text-align:right;"> 33.33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 26.96 </td>
   <td style="text-align:right;"> 27.00 </td>
   <td style="text-align:right;"> 16.50 </td>
   <td style="text-align:right;"> 36.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 26.89 </td>
   <td style="text-align:right;"> 27.43 </td>
   <td style="text-align:right;"> 15.43 </td>
   <td style="text-align:right;"> 37.71 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 26.94 </td>
   <td style="text-align:right;"> 26.00 </td>
   <td style="text-align:right;"> 14.00 </td>
   <td style="text-align:right;"> 40.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:right;"> 26.96 </td>
   <td style="text-align:right;"> 26.40 </td>
   <td style="text-align:right;"> 12.00 </td>
   <td style="text-align:right;"> 43.20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:right;"> 27.01 </td>
   <td style="text-align:right;"> 27.00 </td>
   <td style="text-align:right;"> 9.00 </td>
   <td style="text-align:right;"> 48.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 </td>
   <td style="text-align:right;"> 26.93 </td>
   <td style="text-align:right;"> 24.00 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 52.00 </td>
  </tr>
</tbody>
</table>



<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyMurderMonthsMissing)A simulation showing how the imputed values of murder in Danville, California, in 2019 changes as the number of months to impute changes. For each number of months missing (and thus, imputed) 10,000 simulations are run for removing and imputing those months of data.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> # of Months Missing </th>
   <th style="text-align:right;"> Mean Imputed Value </th>
   <th style="text-align:right;"> Median Imputed Value </th>
   <th style="text-align:right;"> Minimum Imputed Value </th>
   <th style="text-align:right;"> Maximum Imputed Value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Full data </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 month </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.09 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1.09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.20 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1.20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 1.01 </td>
   <td style="text-align:right;"> 1.33 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1.33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 1.01 </td>
   <td style="text-align:right;"> 1.50 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 1.01 </td>
   <td style="text-align:right;"> 1.71 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1.71 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 1.01 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2.40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:right;"> 1.01 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 </td>
   <td style="text-align:right;"> 1.01 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4.00 </td>
  </tr>
</tbody>
</table>



### 10-12 months missing

In cases where there are more than 9 months of data missing, the current imputation method replaces the entire year of data for that agency with the average of the crime for agencies who reported 12 months of data, are in the same state and in the same population group as the given agency. Considering that when an agency reports data it tends to report every month of the year - and about a quarter of agencies still do not report any months of data - this is a far bigger issue than when agencies are missing 1-9 months of data. The imputation process is also far worse here.

Whereas with 1-9 months missing the results were at least based on the own agency's data, and were actually not terribly wrong (depending on the specific agency and crime patterns) when only a small number of months were missing, the imputation for 10+ months missing is nonsensical. It assumes that these agencies are much like similarly sized agencies in the same state.

There are two major problems here. First, similarly sized agencies are based on the population group which is quite literally just a category indicating how big the agency is when grouped into rather arbitrary categories. These categories can range quite far - with agencies having millions more people than other agencies in the same category in some cases - so in most cases "similarly sized" agencies are not that similarly sized. The second issue is simply the assumption that population is all that important to crime rates. Population is certainly important to crime counts; New York City is going to have many more crimes than small towns purely due to its huge population, even though NYC has a low crime rate. But there is still huge variation in crimes among cities of the same or similar size as crime tends to concentrate in certain areas. So replacing an agency's annual crime counts with that or other agencies (even the average of other agencies) will give you a very wrong count.

For this method of replacing missing data to be accurate agencies in the same population group in each state would need to have very similar crime counts. Otherwise it is assuming that missing agencies are just average (literally) in terms of crime. This again assumes that missing data is missing at random, which is unlikely to be true.

In each of the below examples we use data from 2022 Offenses Known and Clearances by Arrest and use only agencies whose final month reported was December. This makes it the actual agencies in each population group that would replace agencies that are missing 10 or more months of data in 2022. As agencies can - and do - report different numbers of months each year, these numbers would be a little different if using any year other than 2022.

For each population group we'll look at the mean, median, and maximum number of murders plus aggravated assaults with a gun.[^ucr_county-9] This is essentially a measure of the most serious violent crimes as the difference between gun assaults and murders is, to some degree, a matter of luck (e.g. where the person is shot can make the difference between an assault and a murder).[^ucr_county-10] This is actually not available in NACJD's county-level UCR data as they don't separate gun assaults from other aggravated assaults, though that data is available in the agency-level UCR data. If we see a wide range in the number of murders+gun-assaults in the below table, that'll indicate that this method of imputing missing data is highly flawed.

[^ucr_county-9]: Aggravated assaults with a gun include but are not limited to shootings. The gun does not need to be fired to be considered an aggregated assault.

[^ucr_county-10]: Attempted murders are considered aggravated assaults in the UCR.

Table \@ref(tab:countyPopulationGroupStatsNational) shows these values for all agencies in the United States who reported 12 months of data (based on the "December last month reported" definition) in 2022. The actual imputation process only looks at agencies in the same state, but this is still information at seeing broad trends - and we'll look at two specific states below. Column 1 shows each of the population groups in the data while the remaining columns show the mean, median, minimum, and maximum number of murders+gun-assaults in 2022, respectively.[^ucr_county-11] For each population group there is a large range of values, as seen from the minimum and maximum values. There are also large differences in the mean and median values for larger (25,000+ population) agencies, particularly when compared to the top and bottom of the range of values. Using this imputation method will, in most cases (but soon we'll see an instance where there's an exception) provide substantially different values than the real (but unknown) values.

[^ucr_county-11]: The agency-level UCR data actually has more population groups than this list, but NACJD has grouped some together. Given that some states may have few (or no) agencies in a population group, combining more groups together does alleviate the problem of having no comparison cities but at the tradeoff of making the comparison less similar to the given agency.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyPopulationGroupStatsNational)The mean, median, minimum, and maximum agency-level murder count nationwide for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Population Group </th>
   <th style="text-align:right;"> Mean Murder </th>
   <th style="text-align:right;"> Median Murder </th>
   <th style="text-align:right;"> 90th Percentile Murder </th>
   <th style="text-align:right;"> Minimum Murder </th>
   <th style="text-align:left;"> Max Murder </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> City Under 2,500 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 2,500-9,999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 10,000-24,999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 25,000-49,999 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 50,000-99,999 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 100,000-249,999 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 142 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 250,000+ </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 237 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 604 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSA Counties and MSA State Police </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 141 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Non-MSA Counties and Non-MSA State Police </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 29 </td>
  </tr>
</tbody>
</table>



<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyPopulationGroupStats)The mean, median, minimum, 90th percentile, and maximum agency-level murder count nationwide for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Population Group </th>
   <th style="text-align:right;"> Mean Murder </th>
   <th style="text-align:right;"> Median Murder </th>
   <th style="text-align:right;"> 90th Percentile Murder </th>
   <th style="text-align:right;"> Minimum Murder </th>
   <th style="text-align:left;"> Max Murder </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> City Under 2,500 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 2,500-9,999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 10,000-24,999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 25,000-49,999 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 50,000-99,999 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 100,000-249,999 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 142 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 250,000+ </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 237 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 604 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSA Counties and MSA State Police </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 141 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Non-MSA Counties and Non-MSA State Police </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 29 </td>
  </tr>
</tbody>
</table>



Since the actual imputation process looks only at agencies in the same state, we'll look at two example states - Texas and Maine - and see how trends differ from nationally. These states are chosen as Texas is a very large (both in population and in number of jurisdictions) state with some areas of high crime while Maine is a small, more rural state with very low crime. Table \@ref(tab:countyPopulationGroupStatsTexas) shows results in Texas. Here, the findings are very similar to that of Table \@ref(tab:countyPopulationGroupStatsNational). While the numbers are different, and the maximum value is substantially smaller than using all agencies in the country, the basic findings of a wide range of values - especially at larger population groups - is the same.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyPopulationGroupStatsTexas)The mean, median, minimum, 90th percentile, and maximum agency-level murder count in Texas for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Population Group </th>
   <th style="text-align:right;"> Mean Murder </th>
   <th style="text-align:right;"> Median Murder </th>
   <th style="text-align:right;"> 90th Percentile Murder </th>
   <th style="text-align:right;"> Minimum Murder </th>
   <th style="text-align:left;"> Max Murder </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> City Under 2,500 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 2,500-9,999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 10,000-24,999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 25,000-49,999 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 50,000-99,999 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 100,000-249,999 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 250,000+ </td>
   <td style="text-align:right;"> 93 </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:right;"> 222 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 433 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSA Counties and MSA State Police </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 141 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Non-MSA Counties and Non-MSA State Police </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> 7 </td>
  </tr>
</tbody>
</table>



Now we'll look at data from Maine, as shown in Table \@ref(tab:countyPopulationGroupStatsMaine). Here, results are much better: there is a narrow range in values meaning that the imputation would be very similar to the real values. This is driven mainly by Maine being a tiny state, with only one city larger than 50,000 people (Portland) and Maine being an extremely safe state so most places have zero murders+gun-assaults. In cases like this, where both crime and population size are consistent across the state (which is generally caused by everywhere having low crime), this imputation process can work well.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:countyPopulationGroupStatsMaine)The mean, median, minimum, 90th percentile, and maximum agency-level murder count in Maine for all population groups in the 2022 Offenses Known and Clearances by Arrests data, based on agencies reporting their last month of data was in December.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Population Group </th>
   <th style="text-align:right;"> Mean Murder </th>
   <th style="text-align:right;"> Median Murder </th>
   <th style="text-align:right;"> 90th Percentile Murder </th>
   <th style="text-align:right;"> Minimum Murder </th>
   <th style="text-align:right;"> Max Murder </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> City Under 2,500 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 2,500-9,999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 10,000-24,999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 25,000-49,999 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 50,000-99,999 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 100,000-249,999 </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> City 250,000+ </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> - </td>
   <td style="text-align:right;"> - </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSA Counties and MSA State Police </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Non-MSA Counties and Non-MSA State Police </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 13 </td>
  </tr>
</tbody>
</table>


