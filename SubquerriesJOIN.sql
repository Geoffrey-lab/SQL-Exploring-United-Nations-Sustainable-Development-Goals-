/* Calculate total land area for ieach subregion once, 
then run a querry that retrieves total land area value from
 the result of the inner querry */

SELECT
	geoloc.Country_name,
    geoloc.Land_area,
    geoloc.sub_region,
    ROUND((geoloc.land_area / land_per_region.TotalLandArea) * 100) AS PctOfRegionLand
FROM
	united_nations.Geographic_location As geoloc
JOIN
	  (SELECT
		sub_region,
		SUM(Land_area) As TotalLandArea
		FROM
		united_nations.Geographic_location
		GROUP BY Sub_region) AS Land_per_region
ON 
geoloc.sub_Region = land_per_region.sub_Region;



