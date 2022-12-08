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

-- 2. Which companies layoff percentage were higher than average?
-- Average number of layoff percentage for this dataset is 0.2786838374291115 
SELECT *
FROM layoffs
WHERE percentage_laid_off > 0.2786838374291115
ORDER BY percentage_laid_off DESC

SELECT COUNT(*)
FROM layoffs
WHERE percentage_laid_off > 0.2786838374291115

--342 companies had a higher layoff percentage than average (21.6%).

-- 3. Which companies raised higher than average funds?
-- Average number of funds raised for this dataset is 899.8921644159356
SELECT *
FROM layoffs
WHERE funds_raised > 899.8921644159356
ORDER BY funds_raised DESC

SELECT COUNT(*)
FROM layoffs
WHERE funds_raised > 899.8921644159356

-- 168 companies raised higher than average funds (10.6%).

-- 4. Which country has the most compnaies?
SELECT country, COUNT(company) AS num_companies
FROM layoffs
GROUP BY country
ORDER BY num_companies DESC
-- United States has the most companies

--5. How many unique companies are there?
SELECT COUNT(DISTINCT company) 
FROM layoffs
-- 1334 companies are unique (84.1%)
-- 252 companies are not unique (15.9%)

--6. Which industry had the largest number of layoffs?
SELECT industry, COUNT(industry) AS companies_in_industry
FROM layoffs
GROUP BY industry
ORDER BY companies_in_industry DESC
-- Finance had the most companies
