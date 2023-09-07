# Data Portfolio by Ashley Nguyen
All data-related projects 

- **Email**: [htn2006@nyu.edu](htn2006@nyu.edu)
- **LinkedIn**: [linkedin.com/ashley](https://www.linkedin.com/in/ashley-nguyen-26a5291b7/)

## Projects

<img align="left" width="250" height="150" src="https://github.com/ashleyng1/portfolio/blob/main/buffett.jpeg"> **[Computational Social Science: Meta Analysis of letters to Warren/ Doris Buffett - Python](https://github.com/ashleyng1/portfolio/tree/main/202307%20buffett%20letters%20project)**

During my internship with [Incite@Columbia University](https://incite.columbia.edu/), an interdisciplinary research institute, I was part of the Buffett Letters project with Professor Peter Bearman as the Principal Investigator. This project aims to analyze a unique digitized archive of about 10,000 letters written to Warren Buffett and his sister, Doris, between 2006 and 2016 from those around the United States, mostly asking for financial assistance. The letters provide an acute window into both extreme poverty and relative hardship.

I completed 2 main tasks:
1. Used the United States Census Bureau API to tabulate all the relevant variables down to ZIP code (ZTCA5) level from 2000-2016
2. Created various data visualizations showing geographic and temporal variation in letters’ stories through a combination of close reading and computational text analyses.

#

<img align="left" width="250" height="150" src="https://github.com/ashleyng1/portfolio/blob/main/images/fintech.jpeg"> **[Detection of Deadpool Start-up Companies as an additional feature to increase the accuracy of the Base ML risk assessment model - Python](https://github.com/ashleyng1/portfolio/tree/main/202305%20deadpool%20startups)**

I led and excuted a project that detected deadpool startups (firms continue to appear to be active in databases although they have stopped trading) from a confidential dataset of 16000 private companies at [Liquidity Capital](https://www.liquiditygroup.com/). Using some EDA techniques and my financial knowledge, I came up with a few features such as Google Search interest, tax filing status, burn rate, and some features on Crunchbase to filter down to a set of 1000 companies. This works as an additional feature for their proprietary base ML model (which assesses risk level of startups as a criteria for investment decision) to reduce errors. 

#

<img align="left" width="250" height="150" src="https://github.com/ashleyng1/portfolio/blob/main/images/newspapers.jpeg"> **[Effect of Liberal Arts Education through the analysis of 98 university student newspapers in the US and the UK 2000-2023 - Python](https://github.com/ashleyng1/portfolio/tree/main/202303%20university%20student%20newspapers)**
 
This is a final project for the Textual Analysis class by Professor Minsu Park at NYUAD. I used multiprocessing, requests, and BeautifulSoup libraries to scrape 98 university student newspapers websites. The dataframe contains the text, title, author, and published date from 2000-2023 (around 13GB for both the UK and the US) which is stored on Kaggle and I am happy to share access. Using various NLP techniques such as sentiment analysis, topic modelling, abstractness, psychoanalysis with LIWC, the corpus written by US students score higher in Analytical Score and lower in Emotional Score, even when controlling for topics. The detailed final presentation can be found in the folder.

#

<img align="left" width="250" height="150" src="https://github.com/ashleyng1/portfolio/blob/main/images/crash.jpeg"> **[Effect of driver's gender on the crash rate of vehicles in Chicago - Python](https://github.com/ashleyng1/portfolio/tree/main/202302%20driver%20gender%20on%20car%20crash)**

In this project, I have used several ML classification and regression algorithms such as Linear SVM, Decision Tree, Random Forest, Logistic Regression to evaluate which model is the best to fit the crash data in Chicago. Moreover, I customized a table reporting different regression models with additional control variables and used complementary geographical data to map the crashes by driver's gender.

This is a group project with Indira Aitkulova, Antonio Azevedo, Alex Chae for the Applied Data Science class at NYUAD by Professor Bedoor AlShebli. 

#

<img align="left" width="250" height="150" src="https://github.com/ashleyng1/portfolio/blob/main/images/esg.jpeg"> **[ESG ratings on equity performance in the 3 financial markets (US, Europe, Japan) - R and R markdown](https://github.com/ashleyng1/portfolio/tree/main/202211%20esg%20on%20firm%20performances)**

I explored the importance of Environmental, Social, and Corporate Governance (ESG) criteria in individual equity returns across different geographical regions. The project aims to address the growing popularity of ESG investing and its impact on stock returns. It uses noise-correction procedures for ESG ratings to substantiate the positive effects of ESG on stock returns and compares these effects in three regions: America, Europe, and China.

The model employed in the project involves noise correction and regression analysis. It uses RobecoSAM ESG ratings as the main variable and includes control variables such as sector, market capitalization, and P/E ratio. The results indicate a positive impact of ESG ratings on monthly returns, with the strongest impact observed in China, followed by Europe, and the weakest impact in America. The project acknowledges several econometric issues, such as sample selection bias, instrument validity, and the simplicity of the linear regression models.

#

<img align="left" width="250" height="150" src="https://github.com/ashleyng1/portfolio/blob/main/images/marriage.png"> **[Regression Techniques and Analysis to find the impact on marriage duration in Mexico - Stata](https://github.com/ashleyng1/portfolio/tree/main/202103%20marriage%20duration)**

The data science project titled "Factors That Impact Marriage Duration" conducted by Sungju Kim, Barry Lin, and Ashley Nguyen aims to investigate the factors that influence the duration of marriages among divorced couples in Mexico. The project uses a dataset obtained from Kaggle, which contains information on divorces that occurred in Xalapa, Veracruz, Mexico, from January 1, 2000, to March 31, 2015.

The key research question revolves around understanding the correlation between the marriage duration (measured in years) as the dependent variable and various demographic factors as independent variables. The project begins with addressing missing values and scaling and truncating income variables to improve data quality and continues with multiple regression analyses to identify the factors that significantly impact marriage duration.

#
<br />
 
## Core Competencies

- **Methodologies**: Multiple Regression Analysis, Machine Learning, Time Series Analysis, Natural Language Processing, Statistics.
- **Languages**: Python (Pandas, Numpy, Scikit-Learn, Scipy, Matplotlib, Seaborn), R (Dplyr, Tidyr, Caret, Ggplot2), C++, Stata
