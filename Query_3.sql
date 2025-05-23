--Declare two variables called @AvgCapacity and @AvgCost and use them to capture the results of your query.
--Write a new SELECT statement which uses the values of the variables to return a list of venues with a higher than average capacity and construction cost.

DECLARE @AvgCapacity FLOAT;
DECLARE @AvgCost FLOAT;

-- Calculate average capacity and construction cost
SELECT 
	@AvgCapacity = AVG(CAST(v.Capacity AS FLOAT)),
	@AvgCost = AVG(v.Construction_cost_$m)
FROM Venue v
WHERE v.Capacity IS NOT NULL 
  AND v.Construction_cost_$m IS NOT NULL;

-- Return venues with above-average capacity and cost
SELECT 
	v.Venue,
	v.Opening_date,
	v.Capacity,
	v.Construction_cost_$m
FROM Venue v
WHERE v.Capacity > @AvgCapacity 
  AND v.Construction_cost_$m > @AvgCost
ORDER BY 
	v.Capacity,
	v.Construction_cost_$m;
