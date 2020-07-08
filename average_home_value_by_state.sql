SELECT state, ROUND(AVG(value))
FROM recent_month
GROUP BY 1
ORDER BY 2 DESC;