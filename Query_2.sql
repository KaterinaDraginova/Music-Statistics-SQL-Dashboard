--#Write a query to show the Venue and Capacity columns from the Venue table and 
--#add a calculated column called Venue_size which describes the venues according to the table below:
--Value of Capacity | Description
--NULL              | Unknown
--Less than 1000    | Intimate
--Less than 10000   | Small
--Less than 50000   | Medium
--Less than 100000  |Large
--Everything else   |Enormous




SELECT 
	v.Venue,
	v.Capacity,
	CASE
		WHEN v.Capacity IS NULL THEN 'Unknown'
		WHEN v.Capacity < 1000 THEN 'Intimate'
		WHEN v.Capacity < 10000 THEN 'Small'
		WHEN v.Capacity < 50000 THEN 'Medium'
		WHEN v.Capacity < 100000 THEN 'Large'
		ELSE 'Enormous'
	END AS Venue_size
FROM Venue v;

--#Write another query to show the Venue and Opening_date columns from the Venue table.
--#Add a calculated column called Venue_era which describes venues according to the table below:


SELECT 
	v.Venue,
	v.Opening_date,
	CASE
		WHEN v.Opening_date IS NULL THEN 'Unknown'
		WHEN v.Opening_date < '1801-01-01' THEN 'Ancient'
		WHEN v.Opening_date < '1901-01-01' THEN '19th Century'
		WHEN v.Opening_date < '2001-01-01' THEN '20th Century'
		ELSE '21st Century'
	END AS Venue_era
FROM dbo.Venue v;


