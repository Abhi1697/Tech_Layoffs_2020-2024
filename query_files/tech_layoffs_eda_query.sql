-- EXPLORATORY DATA ANALYSIS

SELECT * FROM tech_layoffsv1;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- date range for the dataset 
SELECT 
    MAX(date_layoffs), MIN(date_layoffs)
FROM
    tech_layoffsv1
;
-- MARCH 2020 - JUNE 2024 (4 years)

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Total laid off Yearwise
SELECT 
    YEAR(date_layoffs), SUM(Laid_Off)
FROM
    tech_layoffsv1
GROUP BY YEAR(date_layoffs)
ORDER BY 2 DESC;

-- 2023 had most laid offs. The minimum being 2021

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Layoffs Trend Over Time  - Chart 1

SELECT 
    Company, Country, Industry, SUBSTR(Date_Layoffs, 1, 7) as `Date`, SUM(Laid_Off) as Total_Laid_off
FROM
    tech_layoffsv1
GROUP BY Company , Country , Industry, `Date`
;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Layoffs countr-ywise Chart 2

WITH cteCoun AS (SELECT 
    Country,
    YEAR(Date_Layoffs) AS Years,
    SUM(Laid_Off) AS Total_Laid_off
FROM
    tech_layoffsv1
GROUP BY Country, Years
ORDER BY 3 DESC
),
-- Adding one more CTE in case anytime we just need to fetch filtered data and not all the company names
cteCoun10  AS (SELECT
	*,
    DENSE_RANK() OVER (PARTITION BY Years ORDER BY Total_Laid_off DESC) as Ranking
FROM cteCoun
)
SELECT
	*
FROM cteCoun10
;

-- USA had the highest layoffs, followed by India, Germany, Sweden etc.

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

--  Top 10 Affected Industries by Year

WITH cteTop AS (SELECT	
	Industry,
    YEAR(Date_layoffs) as Years,
    SUM(Laid_off) as Total_Laid_off
FROM tech_layoffsv1
GROUP BY Industry, Years
ORDER BY 3 DESC
),
cteTop10  AS (SELECT
	*,
    DENSE_RANK() OVER (PARTITION BY Years ORDER BY Total_Laid_off DESC) as Ranking
FROM cteTop `ct`
)
SELECT
	*
FROM cteTop10 
Where Ranking <= 10
;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Companies with the Most Layoffs (Top 5 Yearly)

WITH cte1 as (SELECT 
		Company,
		SUM(Laid_off) as Total_Laid_Off,
		YEAR(Date_layoffs) AS Years,
		Stage
	FROM
		tech_layoffsv1
	GROUP BY Company, Years, Stage
	ORDER BY total_Laid_off DESC
),
cte2 as (SELECT
	*,
	DENSE_RANK() OVER(PARTITION BY Years ORDER BY Total_Laid_Off DESC)  AS Ranking
FROM cte1
),
-- To avoid having two values with same rank again ranks are partitoned using row_number()
cte3 as (SELECT
	*,
    ROW_NUMBER() OVER(PARTITION BY Years, Ranking) as row_num
FROM cte2
WHERE Ranking <= 10
)
SELECT
	cte3.Company, cte3. Total_Laid_Off, cte3.Years, cte3.Stage, cte3.Ranking
FROM cte3
WHERE cte3.row_num < 2
;


