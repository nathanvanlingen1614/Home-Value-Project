CREATE TEMP TABLE IF NOT EXISTS homes_1997 AS
	SELECT state, ROUND(AVG(value)) AS "value_1997"
 	FROM home_value_data
	WHERE 
		substr(date, 1, 4) = '1997'
	GROUP BY 1
;
CREATE TEMP TABLE IF NOT EXISTS homes_2007 AS
	SELECT state, ROUND(AVG(value)) AS "value_2007"
	FROM home_value_data
	WHERE 
		substr(date, 1, 4) = '2007'
	GROUP BY 1
;
CREATE TEMP TABLE IF NOT EXISTS homes_2017 AS
	SELECT state, ROUND(AVG(value)) AS "value_2017"
	FROM home_value_data
	WHERE 
		substr(date, 1, 4) = '2017'
	GROUP BY 1
;
-- 1997 to 2007
-- SELECT homes_1997.state, homes_1997.value_1997, homes_2007.value_2007, ROUND(((homes_2007.value_2007 - homes_1997.value_1997) / homes_1997.value_1997) * 100) AS "percent change"
-- FROM homes_1997 INNER JOIN homes_2007 ON homes_1997.state = homes_2007.state

-- 2007 to 2017
-- SELECT homes_2007.state, homes_2007.value_2007, homes_2017.value_2017, ROUND(((homes_2017.value_2017 - homes_2007.value_2007) / homes_2007.value_2007) * 100) AS "percent change"
-- FROM homes_2007 INNER JOIN homes_2017 ON homes_2007.state = homes_2017.state

-- 1997 to 2017
-- SELECT homes_1997.state, homes_1997.value_1997, homes_2017.value_2017, ROUND(((homes_2017.value_2017 - homes_1997.value_1997) / homes_1997.value_1997) * 100) AS "percent change"
-- FROM homes_1997 INNER JOIN homes_2017 ON homes_1997.state = homes_2017.state

SELECT 
	homes_1997.state, 
	homes_1997.value_1997, 
	homes_2007.value_2007, 
	ROUND(((homes_2007.value_2007 - homes_1997.value_1997) / homes_1997.value_1997) * 100) AS percent_change_1,
	homes_2007.value_2007, 
	homes_2017.value_2017, 
	ROUND(((homes_2017.value_2017 - homes_2007.value_2007) / homes_2007.value_2007) * 100) AS percent_change_2,
	ROUND(((homes_2017.value_2017 - homes_1997.value_1997) / homes_1997.value_1997) * 100) AS total_percent_change
FROM homes_1997 INNER JOIN homes_2007 ON homes_1997.state = homes_2007.state INNER JOIN HOMES_2017 ON homes_1997.state = homes_2017.state
ORDER BY total_percent_change DESC

-- We can see from 1997 to 2007, housing across the US increased greatly, 44 states had at least a 50% increase, and over 100% in 25 states.
-- From 2007 to 2017, we can see the housing  hardly increasead or possibly even decreased in many states. The highest change in home value was South Dakota, with a 29% increase in home values.
-- While the lowest was Delaware with a a 18% decrease in home value.  This decrease in housing cost may have been caused by the Great Recession around 2007 to 2009.
-- Based on data from 1997-2017, the best states to invest in would be California, South Dakota, Hawaii, New York, and Massachusetts.
-- Overall, some of the top  states for investing these based on the housing values from 2007 to 2017 would be South Dakota, Colorado, Texas, Oklahoma, and Indiana.


