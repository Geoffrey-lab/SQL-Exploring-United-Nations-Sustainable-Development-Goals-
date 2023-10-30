/* Creating a query for the year 2020 for countries that havea GDP above the global average
but, still have less than 90% of their population with access to managed drinking
services*/

SELECT
	econ.Country_name,
    econ.Time_period,
    econ.Est_gdp_in_billions,
    service.Pct_managed_drinking_water_services
FROM
	Economic_indicators AS econ
    
INNER JOIN
	Basic_Services AS services
ON
	econ.Country_name = services.Country_name
    AND econ.Time_period = service.Time_period
WHERE
	econ.time_period = 2020
    AND services.Pct_managed_drinking_water_services < 90
    AND econ.Est_grip_in_billions > (SELECT
											AVG(Est_grip_in_billion)
                                      FROM
											Economic_Indicators
									  WHERE
											Time_period =2020
                                            );

	  