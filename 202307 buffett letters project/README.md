# Meta Analysis of letters to Warren/ Doris Buffett

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Overview

This project aims to analyze a unique digitized archive of about 10,000 letters written to Warren Buffett and his sister, Doris, between 2006 and 2016 from those around the United States, mostly asking for financial assistance. The letters provide an acute window into both extreme poverty and relative hardship in America.

There are 2 goals:
1. Used the United States Census Bureau API to tabulate all the relevant variables down to ZIP code (ZTCA5) level from 2000-2016. This provided background context for the reasons why people wrote their letters asking for assistance (natural diaster, low income area, etc)
2. Created various data visualizations showing geographic and temporal variation in letters’ stories through a combination of close reading and computational text analyses. This showed the temporal trend relating financial shocks (ie. The Great Depression) or Buffett media events to the rise in letters of certain topics.

## Table of Contents

- [Project Overview](#overview)
- [Data](#data)
- [Methods](#methods)
- [Results](#results)
- [Conclusion](#conclusion)

## Data

A digitized archive of about 10,000 letters written to Warren Buffett and his sister, Doris, between 2006 and 2016 asking for financial assistance. The typed letters were converted to txt file using OCR and the handwritten letters were outsourced to a transcription company.

## Methods

### 1. US Census Bureau API

The additional variables are divided into 3 sets: medical, economic, and population.

Set        | Variable
|----------|----------|
Medical    |Medicaid Eligibility 
Medical    |SAHIE                
Medical    |Opioid deat          
Economic   |Unemployment         
Economic   |Foreclosure
Economic   |Bankruptcy filings
Economic   |Median household income
Economic   |SAIPE (poverty estimates)
Economic   |Rent/owned
Population |Natural disaster occurrence
Population |Racial demographics
Population |Density
Population |Spousal abuse
Population |Political leaning

This [pdf](./us%20census%20bureau%20api%20data/README.pdf) contains the source of each variable, their frequency, time range, and coverage.

This [folder](./us%20census%20bureau%20api%20data/) contains all the tabulated data in csv format and jupyter notebooks collating and streaming the data.

### 2. Summary Graphs

I used regex filtering to categorize the letters into 8 topics (abuse, scholarship, multiple sclerosis, vehicle, jail, housing, repairs). The chosen topics are picked from a close reading of 3000 letters.

<img src="./summary graphs/buffett press/visualizations/summary.png" width="500"/> 

This heatmap shows the number of letters by state and California is the state with the highest number of letters.

<img src="./summary graphs/buffett press/visualizations/letters by location heatmap.png" width="500"/> 

### 3. Buffett Media Events

One of the key component in the project is to show that people wrote about their problems truthfully and did not alter their letter content based on what the Buffetts said in the media or the Buffett's values. Therefore, we want to show that even though the number of letters of certain topics increased after Doris Buffett's media presence, but the proportion of topic (for example, abuse) stays constant over time. 

For this I made 2 bar graphs, one showing the number of letters about abuse labelled with any media events where Doris Buffett mentioned abuse and the other one showing the proportion of letters about abuse. I did the same for the other 7 topics and the visualizations can be found [here](./summary%20graphs/buffett%20press/visualizations/). The Jupyter Notebook used to created the graph can be found [here](./summary%20graphs/buffett%20press.ipynb)

<img src="./summary graphs/buffett press/visualizations/abuse vs total letters.png" width="500"/> 

<img src="./summary graphs/buffett press/visualizations/abuse proportion.png" width="500"/> 

## Results

A heatmap of letters by state revealed California as the state with the highest number of letters, suggesting a potential geographic trend in letter-writing. The distribution of topics provided insight into the diversity of challenges faced by letter writers, with some topics standing out more prominently than others.

An increase in the number of letters related to specific topics after Doris Buffett's media presence. However, the proportions of these topics within the overall pool of letters remained relatively constant, suggesting that the content of letters remained authentic and reflective of genuine concerns.

## Conclusion

This project offers a comprehensive analysis of the unique digitized archive of letters written to Warren and Doris Buffett. We have achieved the following key takeaways:

- The letters provide valuable insights into the challenges faced by individuals across the United States, particularly those related to economic hardship, natural disasters, and medical issues.
- The correlation between letter content and socioeconomic variables highlights the contextual factors that drive individuals to seek financial assistance.
- Geographic patterns in letter-writing suggest that specific regions may require targeted support or intervention.
- The consistency in topic proportions over time underscores the authenticity of the letters, demonstrating that media events did not significantly alter the content.