# Project Name: [Detection of Deadpool Startups](./)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Project Overview

Welcome to the "Detection of Deadpool Startups" project. This project focuses on identifying and analyzing startups that may be in the "deadpool," meaning they are inactive or no longer operational. We employ various data sources and methods to achieve this goal, as detailed below.

## Table of Contents

- [Project Overview](#overview)
- [Data](#data)
- [Methods](#methods)
- [Results](#results)
- [Conclusion](#conclusion)

## Data

 The original dataset comprises a list of 35,000 private companies with their risk score  which is proprietary and confidential and a few other features from Pitchbook to help the analysis such as Last Funding Date, Last Funding Amount, Founded Year, etc.

## Methods

### 1. Existing Features:

I used the Last Funding Date, Last Funding Amount, Number of Funding Rounds to calculate the burn rate and filter down a smaller set of companies.

### 2. External Features:

The **get_features** folder contains a set of notebooks and scripts used to obtain external features crucial for identifying deadpool startups:

   - **active.ipynb**: This notebook retrieves new domain information when a browser opens the websites of the 35,000 companies.

   - **crunchbase.ipynb**: This notebook manually inputs a list of companies into the Crunchbase search engine and employs a web scraper extension (Web Scraper Google Chrome extension) to collect data on Acquisition Status, Operating Status, and SEMrush Website Monthly Visits. Due to limitations, multiple CSV files were used, which were later concatenated into a comprehensive `crunchbase.csv` file containing details for all 5,963 companies.

   - **keyword.ipynb**: This notebook uses the `pytrends` library to gather data on the number of weekly Google searches for keywords associated with the companies over the past year (52 weeks). The list of 35,000 companies is split into smaller sets for analysis.

   - **Tax.ipynb**: This notebook accesses the API of the corporate registration website for the states of California and Idaho, gathering details about tax filings or tax status for companies founded in these states.

The **external_features** folder contains data obtained from various external sources:

   - **corporate registration**: This subfolder lists all U.S. states and their respective corporate registration websites, providing information on name searches and tax statuses for registered companies.

   - **crunchbase**: This subfolder houses data scraped from the Crunchbase website using a pro account. It includes raw CSV files, formatted CSV files, news appearances, and more.

   - **interest_df**: This subfolder contains Google Trends search results for the 35,000 companies using the `pytrends` library. Multiple files include data for different sets of companies.

   - **linkedIn**: This subfolder contains files from LinkedIn data received, although it did not match many founders in the final set of zombie companies.

   - **tax**: This subfolder contains data scraped from tax websites in California and Idaho, focusing on companies founded in these states.

## Results

The [**zombie companies**](./zombie_companies.pdf) presentation provides an overview of our approach and the detailed filtering process used to identify potential deadpool startups.

<iframe src="./zombie_companies.pdf" width="100%" height="600px"></iframe>

The [**analysis burn rate.ipynb**](./analysis%20burn%20rate.ipynb) notebook serves as the centerpiece of our analysis. It encompasses all the steps, including the utilization of both existing and external features, to identify potential deadpool startups. The analysis begins by filtering the raw data using existing features and subsequently merges the data frame with external features for in-depth analysis.


## Conclusion

These are the key takeaways of the project:

- **Data-Driven Insights**: Our analysis commenced with a dataset containing 35,000 private companies, enriched with proprietary features such as risk scores and publicly available information like Last Funding Date, Last Funding Amount, and Founded Year. Through the fusion of these features, we initiated the process of identifying potential deadpool startups.

- **Burn Rate Analysis**: The application of financial metrics, such as Last Funding Date, Last Funding Amount, and Number of Funding Rounds, allowed us to calculate the burn rate—a critical indicator of a startup's financial health. This step was instrumental in narrowing down our focus to a subset of companies with unique characteristics warranting further investigation.

While our project has provided valuable insights into the world of startups, there remain exciting opportunities for further exploration:

- Machine Learning Models: Future work could involve the development of machine learning models to automate the identification of deadpool startups. These models could leverage a combination of existing and external features to enhance accuracy.

- Real-Time Monitoring: Implementing a real-time monitoring system to continually track the health of startups could offer immediate insights into their operational status.