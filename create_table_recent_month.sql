CREATE TABLE IF NOT EXISTS recent_month AS
	SELECT *
	FROM home_value_data
	WHERE date = '2018-11'
	ORDER BY value DESC;



