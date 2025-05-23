--Build a SQL stored procedure that analyzes concert tour performance based on ticket sales and revenue.
--Show total tickets sold and total revenue
--Alter the procedure so that it also returns the average of TIckets_sold and Revenue_$ 
--Sort the final output in descending order based on average revenue






CREATE OR ALTER PROC dbo.usp_Tour_Totals
AS
BEGIN
	SELECT 
		a.Artist,
		t.Tour_name,
		SUM(s.Tickets_sold) AS Total_tickets_sold,
		SUM(s.Revenue_$) AS Total_revenue,
		AVG(s.Tickets_sold) AS Avg_tickets_sold,
		AVG(s.Revenue_$) AS Avg_revenue
	FROM dbo.Artist a
	JOIN dbo.Tour t 
		ON a.Artist_ID = t.Artist_ID
	JOIN dbo.Show s 
		ON t.Tour_ID = s.Tour_ID
	GROUP BY 
		a.Artist,
		t.Tour_name
	ORDER BY 
		Avg_revenue DESC;
END;
