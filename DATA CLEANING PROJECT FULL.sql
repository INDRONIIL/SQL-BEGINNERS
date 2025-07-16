SET SQL_SAFE_UPDATES = 0;

-- DATA CLEANING--

-- Steps :=>
-- 1.Remove Duplicates
-- 2.Standardize the data
-- 3.Null values or blank spaces 
-- 4.Remove any columns

select *
from layoffs;

create table layoffs_staging
like layoffs;

insert layoffs_staging
select *
from layoffs;


select *,
row_number() over(partition by company,industry,total_laid_off,percentage_laid_off,`date`) as row_num
from layoffs_staging;

with duplicate_cte as(
	select *,
	row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`,
    stage, country, funds_raised_millions) as row_num
	from layoffs_staging
)
select *
from duplicate_cte
where row_num>1;

select *
from layoffs_staging
where company='Oda';

with duplicate_cte as(
	select *,
	row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`,
    stage, country, funds_raised_millions) as row_num
	from layoffs_staging
)
DELETE
from duplicate_cte
where row_num>1;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

insert into layoffs_staging2
	select *,
	row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`,
    stage, country, funds_raised_millions) as row_num
	from layoffs_staging;

DELETE 
from layoffs_staging2
where row_num>1;

select *
from layoffs_staging2;

-- Standardizing data

select company,(trim(company))
from layoffs_staging2;

update layoffs_staging2
set company=trim(company);

select *
from layoffs_staging2
where industry like "Crypto%";

update layoffs_staging2
set industry="Crypto"
where industry like "Crypto%";

select distinct country
from layoffs_staging2;

select *
from layoffs_staging2
where country like 'United States%';

select distinct country,trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country=trim(trailing '.' from country)
where country like 'United States%';

select `date`
from layoffs_staging2;

update layoffs_staging2
set `date`=str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_staging2
modify column `date` Date;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

update layoffs_staging2
set industry = null
where industry = '';

select *
from layoffs_staging2
where industry is null
or industry = '';

select *
from layoffs_staging2
where company='Airbnb';

SELECT t1.company, t1.industry AS original_industry, t2.industry AS proposed_new_industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
    ON t1.company = t2.company
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL
  AND t2.industry != '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
    ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL
  AND t2.industry != ''; 
  
select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;

DELETE
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;