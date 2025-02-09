-- Data Cleaning

-- Essential Steps:

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or Blank Values
-- 4. Remove any Columns Or Rows


-- 1. Remove duplicates: To check for duplicates I'll use windows "partion by" clause

WITH cte AS 
	(SELECT
	*,
	 ROW_NUMBER() OVER w  as row_num
	FROM tech_layoffs
	WINDOW w as (Partition by Company, Location_HQ, Region, State, Country, Continent,Laid_Off, Date_layoffs, Percentage, Company_Size_before_Layoffs, Company_Size_after_layoffs, Industry, Stage, Money_Raised_in__mil, `Year`, latitude, longitude)
)

SELECT *
FROM 
	cte
WHERE cte.row_num > 1
;

-- No Duplicate Values Found (1502 Unique Records)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. Standardize the data. Duplicate of main table made to avoid data loss. Also checking data for any errors etc.

CREATE TABLE tech_layoffsv1 LIKE tech_layoffs;

INSERT INTO tech_layoffsv1
SELECT * FROM tech_layoffs;


SELECT * FROM tech_layoffsv1;

-- checking company names/location/Region/State etc text columns columns to find any inapporopiate data.

SELECT 
    Company, TRIM(Company), Location_HQ, TRIM(Location_HQ), Region, TRIM(Region), State, TRIM(State), Country, TRIM(Country), Continent, TRIM(Continent), Industry, TRIM(Industry), Stage, TRIM(Stage)
FROM
    tech_layoffsv1
ORDER BY company asc;

UPDATE tech_layoffsv1 
SET 
    Company = TRIM(Company),
    Location_HQ = TRIM(Location_HQ),
    Region = TRIM(Region),
    State = TRIM(State),
    Country = TRIM(Country),
    Continent = TRIM(Continent),
    Industry = TRIM(Industry),
    Stage = TRIM(Stage)
;

-- convert the date from text to actual date format

SELECT 
    date_layoffs, str_to_date(date_layoffs, '%d-%m-%Y')
FROM
    tech_layoffsv1
;

UPDATE tech_layoffsv1 
SET 
    date_layoffs = STR_TO_DATE(date_layoffs, '%d-%m-%Y')
;

SELECT 
    date_layoffs
FROM
    tech_layoffsv1
;

-- change the date type from text to date_time

ALTER TABLE tech_layoffsv1
MODIFY COLUMN Date_layoffs DATE;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. NULL VALUES/ BLANK VALUES

-- Region
SELECT 
    t1.Location_HQ, t1.Region, t1.State, t2.Region, t2.State
FROM
    tech_layoffsv1 t1
JOIN
	tech_layoffsv1 t2 on t1.Location_HQ = t2.Location_HQ
WHERE t1.Region = '' AND t2.Region NOT LIKE '';

UPDATE tech_layoffsv1 t1
JOIN
	tech_layoffsv1 t2 on t1.Location_HQ = t2.Location_HQ
SET t1.State = t2.State
WHERE t1.Region = '' AND t2.Region NOT LIKE '';

-- State

SELECT 
    t1.Location_HQ, t1.Region, t1.State, t2.Region, t2.State
FROM
    tech_layoffsv1 t1
JOIN
	tech_layoffsv1 t2 on t1.Location_HQ = t2.Location_HQ
WHERE t1.State = '' AND t2.State NOT LIKE '';

UPDATE tech_layoffsv1 t1
JOIN
	tech_layoffsv1 t2 on t1.Location_HQ = t2.Location_HQ
SET t1.State = t2.State
WHERE t1.State = '' AND t2.State NOT LIKE '';

-- Setting the Blank values as 'Unknown'
SELECT * FROM tech_layoffsv1;

SELECT
	Region, State
FROM tech_layoffsv1
WHERE Region LIKE '' AND State LIKE ''
;

UPDATE tech_layoffsv1
SET State = 'Unknown'
WHERE State LIKE ''
;

SELECT
	Laid_Off, Percentage
FROM tech_layoffsv1
WHERE Laid_Off IS NULL OR Percentage IS NULL
;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. Remove any rows or columns not required for the EDA

SELECT * FROM tech_layoffsv1;

-- Year column is seperately not required

ALTER table tech_layoffsv1
DROP COLUMN `Year`
;

