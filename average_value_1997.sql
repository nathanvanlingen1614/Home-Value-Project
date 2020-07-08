SELECT state, ROUND(AVG(value)), substr(date, 1, 4) 
FROM home_value_data
WHERE 
	substr(date, 1, 4) = '1997'
GROUP BY 1
ORDER BY 2 DESC;