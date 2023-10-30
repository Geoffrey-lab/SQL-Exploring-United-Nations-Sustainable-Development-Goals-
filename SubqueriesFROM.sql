/* Average GDP and population for countries with uemployment rates above 5%*/

SELECT
	Country_name,
    AVG(Est_gdp_in_billions) AS Avg_GDP,
    AVG(Est_population_in_millions) AS Avg_Population,
    AVG(Est_population_in_millions) AS Avg_Population
FROM
	  (SELECT
		Country_name,
		Est_gdp_in_billions,
		Est_population_in_millions
		FROM
		united_nations.Economic_indicators
        WHERE
        Pct_unemployment > 5
        AND Time_period = 2020) AS FilteredCountries
	GROUP BY 
		Country_name




