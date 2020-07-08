SELECT state, COUNT(DISTINCT zip_code)
FROM home_value_data
GROUP BY state
ORDER BY COUNT(DISTINCT zip_code) DESC;


