/*

Queries used for Tableau Project

*/



-- 1. 

SELECT SUM(new_cases) AS total_cases, 
	SUM(CAST(new_deaths AS UNSIGNED)) as total_deaths, 
	(SUM(CAST(new_deaths as UNSIGNED))/(SUM(New_Cases))*100) as DeathPercentage
From COVID_Portfolio.covid_deaths
-- Where location like '%states%'
where continent is not null 
-- Group By date
order by 1,2;

-- Double check based off the data provided
-- Numbers are extremely close so we will keep them 
-- The Second includes "International"  Location


-- Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as UNSIGNED)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
-- From PortfolioProject..CovidDeaths
-- -- Where location like '%states%'
-- where location = 'World'
-- -- Group By date
-- order by 1,2


-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as UNSIGNED)) as TotalDeathCount
From COVID_Portfolio.covid_deaths
-- Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc;


-- 3.

SELECT Location, Population, MAX(total_cases) as HighestInfectionCount, 
	Max((total_cases/population))*100 as PercentPopulationInfected
From COVID_Portfolio.covid_deaths
-- Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc;


-- 4.


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From COVID_Portfolio.covid_deaths
-- Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc;














