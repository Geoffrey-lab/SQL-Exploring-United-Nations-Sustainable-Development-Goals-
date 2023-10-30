/* Percentage of land a specific country, in a subregion occupies,
 as a percentage of the total land area in that region */

SELECT
	country_name,
	ROUND (Land_area/ (SELECT
							SUM(Land_area)
						FROM
							united_nations.Geographic_location
						WHERE
							Sub_region = 'Middle Africa')*100) as pct_regional_land
FROM
	united_nations.Geographic_location as g
