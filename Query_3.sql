--Declare two variables called @AvgCapacity and @AvgCost and use them to capture the results of your query.
--Write a new SELECT statement which uses the values of the variables to return a list of venues with a higher than average capacity and construction cost.

use Music_01
go


declare @AvgCapacity float
declare @AvgCost float


select
	@AvgCapacity = avg (cast(v.Capacity as float))
	,@AvgCost = avg(v.Construction_cost_$m)
from
	dbo.Venue as v
where
	v.Capacity is not null
	and v.Construction_cost_$m is not null


select
	v.Venue
	,v.Opening_date
	,v.Capacity
	,v.Construction_cost_$m
from
	dbo.Venue as v
where
	v.Capacity > @AvgCapacity
	and v.Construction_cost_$m > @AvgCost
order by
	v.Capacity
	,v.Construction_cost_$m
