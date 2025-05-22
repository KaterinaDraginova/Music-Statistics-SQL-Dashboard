--#Using a combination of subqueries,
--#show a list of albums released in the same year as the album with the most US sales,
--#sorted in descending order of sales

SELECT 
	ar.Artist,
	al.Title,
	al.Release_date,
	al.[US_sales_(m)]
FROM Album al
JOIN Artist ar 
	ON ar.Artist_ID = al.Artist_ID
WHERE YEAR(al.Release_date) = (
	SELECT YEAR(Release_date)
	FROM Album
	WHERE [US_sales_(m)] = (
		SELECT MAX([US_sales_(m)])
		FROM Album
	)
)
ORDER BY 
	al.[US_sales_(m)] DESC;