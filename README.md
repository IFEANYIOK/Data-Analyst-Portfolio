# SQL Data Cleaning, Exploration and Analysis Covid-19 Layoffs

## Project Objective
Examine the impact of Covid-19 on global job losses especially as it affected various industries, companies and countries between 2020 and 2023.

## Dataset Used
- <a href="https://github.com/IFEANYIOK/SQL-Data-Cleaning-Covid-19-Layoffs-/blob/main/CLEAN%20LAYOFFS%20DATA%20OUTPUT.xls">Dataset</a>

## Questions (KPIs)
-Which companies went down due to 100% layoff of it's workforce?
-List of Top 3 companies that laid of the highest number of workers.
-Which indusry was most hit and least hit?
-Which Country experirnced the highest number of Layoffs?
-Which year saw the highest number of layoffs?
-In what phase of developement where the companies that laid off the most?
-At what period of times where the world most hit and least hit by the pandemic?
-List the top 5 companies in terms of layoff per year over the entire period under consideration.

## Process
Cleaning:
1) Stage my Raw data by creating a duplicate and name it Layoffs_staging.
2) Remove any duplicate data
3) Standardize data i.e check for errors and other things to make for a uniform data 
4) Check for NULLS and blank spaces
5) Remove any unnecessary columns or rows

Exploration & Analysis:
1) Determine the number of companies that had 100% layoffs ranked by Amount of funds raised'
2) Get the sum of layoffs per grouped by company in a descending order.
3) Get the sum of layoffs per grouped by industry in a descending order.
4) Get the sum of layoffs per grouped by country in a descending order.
5) Extract the year from date and find out the sum of layoffs grouped by year in a descending order
6) Get the sum of layoffs grouped by stage in a descending order.
7) Used Common table expression and window function(rolling totals) to determine trends of the pandemic impact over time
8) Used common table expression and window function(Dense_Rank) to detemine top 5 companies in termas of layoffs per year overt the period of time.

## Code Queries
- <a href="https://github.com/IFEANYIOK/SQL-Data-Cleaning-Covid-19-Layoffs-/blob/main/LAYOFF%20DATA%20CLEANING.sql">Data Cleaning</a>
- <a href="https://github.com/IFEANYIOK/SQL-Data-Cleaning-Covid-19-Layoffs-/blob/main/EXPLORATION%20%26%20ANALYSIS.sql">Data Exploration& Analysis</a>

## Insights
- 116 companies laid off 100% of workforce, which means 116 companies most likely went down.
- Amazon, Google and Meta laid off the highest number of workers.
- Consumer and Retail industry was hit the most while Manufacturing took the lowest hit.
- United States was the country with the highest layoffs.
- For 2023 the layoff numbers will likely be high because this data was as at the 3rd month and its already 125,677.
- The large companies in the post-ipo phase laid off the most
- The world was most hit during between october 2022 and January 2023. The year 2021 was the least hit.
- A lot of the tech companies took some big hits.
  
## Conclusion
In conclusion, the data reveals significant workforce reductions across industries, with the consumer and retail sectors most impacted and the United States leading in layoffs. Large, post-IPO tech companies, particularly Amazon, Google, and Meta, executed major layoffs, with October 2022 to January 2023 showing peak impact. Given that 2023’s layoff numbers were already high by March, further cuts are likely. This analysis underscores the need for resilience strategies in vulnerable industries, especially for tech companies navigating post-IPO challenges, and suggests a potentially volatile employment landscape in the near term.






