--Write a query to return the following fields from the Tour table Tour_name,Start_date,End_date,Tour_gross_$
--Calculate length of each tour in days.
--Add another column to calculate the daily revenue of a tour
--Sort the results in descending order of this column.


SELECT 
	Tour_name,
	Start_date,
	End_date,
	Tour_gross_$,
	DATEDIFF(DAY, t.Start_date, t.End_date) AS Tour_days,
	Tour_gross_$ / DATEDIFF(DAY, t.Start_date, t.End_date) AS Revenue_per_day
FROM dbo.Tour t
WHERE DATEDIFF(DAY, t.Start_date, t.End_date) >= 1000
ORDER BY Revenue_per_day DESC;
