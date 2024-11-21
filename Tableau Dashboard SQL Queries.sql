/*

Covid Data Exploration

Queries used for Tableau dashboard

*/

--1. Global cases, death, death percentage
Select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

--2. Highest total deathcount by continential region
-- some location values excluded as they are not included in the above queries
-- European Union is part of Europe numbers so it is also excluded
Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
where continent is null
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount DESC

--3. Location with Highest Infection Rate vs Population
Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentagePopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, population
order by PercentagePopulationInfected DESC


--4. Countries with Highest Infection Rate by date
Select Location, population, date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentagePopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, population, date
order by PercentagePopulationInfected DESC

