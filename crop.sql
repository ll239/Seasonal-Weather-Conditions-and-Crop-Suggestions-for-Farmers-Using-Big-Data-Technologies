SELECT label, AVG(temperature) as avg_temp, AVG(humidity) as avg_humi, AVG(rainfall) as avg_rain
FROM crop_recommendation
GROUP BY label
ORDER BY label;

SELECT label, MAX(temperature) as max_temp, MAX(humidity) as max_humi, MAX(rainfall) as max_rain
FROM crop_recommendation
GROUP BY label
ORDER BY label;

SELECT label, MIN(temperature) as min_temp, MIN(humidity) as min_humi, MIN(rainfall) as min_rain
FROM crop_recommendation
GROUP BY label
ORDER BY label;

SELECT
	label, MAX( CASE WHEN(temp_quartile=1) THEN temperature END) as temp_q1, MAX( CASE WHEN(temp_quartile=3) THEN temperature END) as temp_q3
FROM(
	SELECT
    	label,
		temperature,
		NTILE(4) OVER (partition by label ORDER BY temperature) AS temp_quartile
	FROM crop_recommendation) AS quartiles
GROUP BY label
ORDER BY label;

SELECT
	label, MAX( CASE WHEN(humi_quartile=1) THEN humidity END) as humi_q1, MAX( CASE WHEN(humi_quartile=3) THEN humidity END) as humi_q3
FROM(
	SELECT
    	label,
		humidity,
		NTILE(4) OVER (partition by label ORDER BY humidity) AS humi_quartile
	FROM crop_recommendation) AS quartiles
GROUP BY label
ORDER BY label;

SELECT
	label, MAX( CASE WHEN(rain_quartile=1) THEN rainfall END) as rain_q1, MAX( CASE WHEN(rain_quartile=3) THEN rainfall END) as rain_q3
FROM(
	SELECT
    	label,
		rainfall,
		NTILE(4) OVER (partition by label ORDER BY rainfall) AS rain_quartile
	FROM crop_recommendation) AS quartiles
GROUP BY label
ORDER BY label;

