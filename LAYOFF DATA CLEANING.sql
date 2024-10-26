SELECT *
FROM layoffs;

--1) Stage my Raw data by creating a duplicate and name it Layoffs_staging.
--2) Remove any duplicate data
--3) Standardize data i.e check for errors and other things to make for a uniform data 
--4) Check for NULLS and blank spaces
--5) Remove any unnecessary columns or rows
	
	--1) Stage my Raw data by creating a duplicate and name it Layoffs_staging.


CREATE TABLE [dbo].[layoffs_staging](
	[company] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[industry] [nvarchar](255) NULL,
	[total_laid_off] [float] NULL,
	[percentage_laid_off] [float] NULL,
	[date] [datetime] NULL,
	[stage] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[funds_raised_millions] [float] NULL
);

INSERT  layoffs_staging
SELECT *
FROM layoffs;

	--2) Remove any duplicate data
WITH cte_duplicate AS 
(SELECT *, ROW_NUMBER() 
OVER( PARTITION BY company, 'location', industry, total_laid_off, 
percentage_laid_off, 'date', stage,country, funds_raised_millions ORDER BY company) AS row_num
FROM layoffs_staging)

SELECT * 
FROM cte_duplicate
WHERE row_num>1;

SELECT *, ROW_NUMBER() 
OVER( PARTITION BY company, 'location', industry, total_laid_off, 
percentage_laid_off, 'date', stage,country, funds_raised_millions ORDER BY company) AS row_num
FROM layoffs_staging;

--3) Standardize data i.e check for errors and other things to make for a uniform data 

SELECT 
    company, TRIM(company)
FROM
    layoffs_staging;

UPDATE layoffs_staging 
SET 
    company = TRIM(company);

SELECT 
    *
FROM
    layoffs_staging
WHERE
    industry IN ('%Crypto%');

UPDATE layoffs_staging 
SET 
    industry = 'Crypto'
WHERE
    industry = 'Cryptocurrency';

SELECT DISTINCT
    country
FROM
    layoffs_staging
ORDER BY 1
;
UPDATE layoffs_staging 
SET 
    country = 'United States'
WHERE
    country = 'United States.';

--4) Check for NULLS and blank spaces

ALTER TABLE layoffs_staging 
ALTER COLUMN "date" DATE NULL;

SELECT 
    *
FROM
    layoffs_staging
WHERE
    total_laid_off IS NULL
        AND percentage_laid_off IS NULL;
	
		--5) Remove any unnecessary columns or rows

DELETE
layoffs_staging
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;


SELECT 
    *
FROM
    layoffs_staging
WHERE
    company LIKE 'Airbnb';


WITH t3 AS
(SELECT t1.industry as industry1,t2.industry as industry2
FROM layoffs_staging t1
JOIN layoffs_staging t2
ON t1.company = t2.company AND
t1.location= t2.location
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL)

 UPDATE t3 
 SET industry1 =industry2 
WHERE industry1 IS NULL AND industry2 IS NOT NULL;


SELECT 
    *
FROM
    layoffs_staging t1
        JOIN
    layoffs_staging t2 ON t1.company = t2.company
        AND t1.location = t2.location
WHERE
    t2.company LIKE 'JUUl';

SELECT 
    *
FROM
    layoffs_staging










