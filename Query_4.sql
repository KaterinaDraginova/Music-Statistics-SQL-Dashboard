SELECT 
	t.Tour_name,
	t.Start_date,
	t.End_date,
	t.Tour_gross_$,
	DATEDIFF(DAY, t.Start_date, t.End_date) AS Tour_days,
	t.Tour_gross_$ / DATEDIFF(DAY, t.Start_date, t.End_date) AS Revenue_per_day
FROM dbo.Tour t
WHERE DATEDIFF(DAY, t.Start_date, t.End_date) >= 1000
ORDER BY Revenue_per_day DESC;