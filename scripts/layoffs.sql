/*SELECT *
FROM layoffs*/

/*SELECT COUNT(*)
FROM layoffs
1586 total rows*/

-- 1. Which companies total number of layoffs were higher than average?
-- Average number of layoffs for this dataset is 199.8
SELECT *
FROM layoffs
WHERE total_laid_off > 199.8
ORDER BY total_laid_off DESC



SELECT COUNT(*)
FROM layoffs
WHERE total_laid_off > 199.8

--239 companies had a higher than average number of layoffs during this time period (15%).



-- 2. What was the lowest number of layoffs for a company?
SELECT MIN(total_laid_off) AS least_layoffs
FROM layoffs;
-- 3



-- 3. What was the highest number of layoffs for a company?
SELECT MAX(total_laid_off) AS least_layoffs
FROM layoffs;
-- 11000



-- 4. Which companies layoff percentage were higher than average?
-- Average number of layoff percentage for this dataset is 0.2786838374291115 
SELECT *
FROM layoffs
WHERE percentage_laid_off > 0.2786838374291115
ORDER BY percentage_laid_off DESC



SELECT COUNT(*)
FROM layoffs
WHERE percentage_laid_off > 0.2786838374291115

--342 companies had a higher layoff percentage than average (21.6%).



-- 5. What is the lowest layoff percentage for a company?
SELECT MIN(percentage_laid_off) AS lowest_pct
FROM layoffs;
-- 0.0



-- 6. What is the highest layoff percentage for a company?
SELECT MAX(percentage_laid_off) AS hihest_pct
FROM layoffs;
-- 1.0



-- 7. Which companies raised higher than average funds?
-- Average number of funds raised for this dataset is 899.8921644159356
SELECT *
FROM layoffs
WHERE funds_raised > 899.8921644159356
ORDER BY funds_raised DESC



SELECT COUNT(*)
FROM layoffs
WHERE funds_raised > 899.8921644159356

-- 168 companies raised higher than average funds (10.6%).



-- 8. What was the lowest amount of funds raised?
SELECT MIN(funds_raised) AS lowest_funds
FROM layoffs;
-- 0.0



-- 9. What was the highest amount of funds raised?
SELECT MAX(funds_raised) AS highest_funds
FROM layoffs;
-- 121900



-- 10. Which country has the most compnaies?
SELECT country, COUNT(company) AS num_companies
FROM layoffs
GROUP BY country
ORDER BY num_companies DESC
-- United States has the most companies



--11. How many unique companies are there?
SELECT COUNT(DISTINCT company) 
FROM layoffs
-- 1334 companies are unique (84.1%)
-- 252 companies are not unique (15.9%)



--12. Which industry had the largest number of layoffs?
SELECT industry, COUNT(industry) AS companies_in_industry
FROM layoffs
GROUP BY industry
ORDER BY companies_in_industry DESC
-- Finance had the most companies



-- 13. What location had the most layoffs?
SELECT location, COUNT(location) AS companies_in_location
FROM layoffs
GROUP BY location
ORDER BY companies_in_location DESC
-- SF Bay Area had the most layoffs



-- 14. What stage of the comapany had the most layoffs?
SELECT stage, COUNT(stage) AS num_of_companies
FROM layoffs
GROUP BY stage
ORDER BY num_of_companies DESC
-- If we don't include Unkown which had 263 companies, the highest stage is Series B at 230.



-- 15. Which years had the least and most layoffs?
SELECT EXTRACT(YEAR FROM date) AS year,
COUNT(EXTRACT(YEAR FROM date)) AS num_of_layoffs
FROM layoffs
GROUP BY year
ORDER BY num_of_layoffs DESC
--2022 had the most layoffs, 2021 had the least layoffs.



-- 16. What are the top 10 companies with the highest number of layoffs in the United States?
SELECT company, total_laid_off, percentage_laid_off, country
FROM layoffs
WHERE country = 'United States'
AND total_laid_off IS NOT NULL
ORDER BY total_laid_off DESC
LIMIT 10



-- 17. How many layoffs were there each year in the United States?
SELECT EXTRACT(YEAR FROM date) AS year,
COUNT(EXTRACT(YEAR FROM date)) AS num_of_layoffs
FROM layoffs
WHERE country = 'United States'
GROUP BY year
ORDER BY num_of_layoffs DESC



-- 18. What were the top 5 companies with the most and least amount of layoffs in the United States?
SELECT company, total_laid_off
FROM layoffs
WHERE country = 'United States'
AND total_laid_off IS NOT NULL
ORDER BY total_laid_off DESC
LIMIT 5



SELECT company, total_laid_off
FROM layoffs
WHERE country = 'United States'
AND total_laid_off IS NOT NULL
ORDER BY total_laid_off ASC
LIMIT 5



-- 19. What were the top 5 companies with the highest and lowest layoff percentages in the United States?
SELECT company, percentage_laid_off
FROM layoffs
WHERE country = 'United States'
AND percentage_laid_off IS NOT NULL
ORDER BY percentage_laid_off DESC
LIMIT 5



SELECT company, percentage_laid_off
FROM layoffs
WHERE country = 'United States'
AND percentage_laid_off IS NOT NULL
ORDER BY percentage_laid_off ASC
LIMIT 5

-- 20. What were the top industries in the United States with the most and least amount of layoffs?
SELECT industry, COUNT(industry) AS companies_in_industry
FROM layoffs
WHERE country = 'United States'
AND industry IS NOT NULL
GROUP BY industry
ORDER BY companies_in_industry DESC
LIMIT 5



SELECT industry, COUNT(industry) AS companies_in_industry
FROM layoffs
WHERE country = 'United States'
AND industry IS NOT NULL
GROUP BY industry
ORDER BY companies_in_industry ASC
LIMIT 5
