/*CREATE TABLE united_nations.economic_indicators (
	Country_name VARCHAR(37),
    Time_period INTEGER,
    Est_gdp_in_millions NUMERIC(6,2),
    Est_population_in_millions NUMERIC(11,6),
    Pct_unemployment NUMERIC(5,2),
    PRIMARY KEY (Country_name, Time_period),
    FOREIGN KEY (Country_name) REFERENCES Geographic_Location(Country_name)
    );
SELECT
	*
FROM
	united_nations.geographic_location as geo
LEFT JOIN
	united_nations.economic_indicators as econ
	ON geo.Country_name = econ.Country_name
LEFT JOIN
	united_nations.basic_services as svc 
    ON geo.Country_name = svc.Country_name
    AND econ.Time_period = svc.Time_period;
*/
SELECT
	loc.Country_name,
    econ.Time_period,
    IFNULL(econ.Pct_unemployment, 19.59) AS Pct_unemployment_imputed
FROM united_nations.geographic_location as loc
LEFT JOIN
	united_nations.Economic_indicators AS econ
	ON econ.Country_name = loc.Country_name
WHERE REGION LIKE '%Central and Southern Asia%';
    

    