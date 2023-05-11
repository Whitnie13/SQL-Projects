SELECT * FROM pp.p9consolegames;
SELECT * FROM pp.p9consoledates;

select distinct year 
from pp.p9consolegames 
order by year asc;

-- checking for blanks 
select name, platform
from pp.p9consolegames
where platform like '';

-- % of global sales in north america
select sum(NA_Sales) as totalNa_sales,
   sum(NA_Sales + EU_Sales + JP_Sales + Other_Sales) as totalglobal_sales,
  (sum(NA_Sales) / sum(NA_Sales + EU_Sales + JP_Sales + Other_Sales) ) * 100 as NAsalespercentage
FROM pp.p9consolegames;

-- creating a view 
create view consolegames  as 
select name, platform, year
from pp.p9consolegames
order by 2 asc, 3 desc;
-- the view 
select * from consolegames;

-- the first four letters in the publisher's name
select name, left(publisher, 4) as firstfournames
from pp.p9consolegames;

-- trying to extract the month and day using the consoledates table
select FirstRetailAvailability, day(firstretailavailability) >= 10 as daysafter10
from pp.p9consoledates;
select FirstRetailAvailability, month(firstretailavailability) >= 10 as monthsafteroctober
from pp.p9consoledates;
select platform, firstretailavailability
from pp.p9consoledates
where month(firstretailavailability) >= 10 and day(firstretailavailability)>= 10
order by 2;

-- released before black friday or christmas 
/*black friday is on the 31th of november and christmas is on the 25th of december */
SELECT platform, firstretailavailability
FROM pp.p9consoledates 
WHERE month(firstretailavailability) = 11 and day(firstretailavailability) <= 30 
OR month(firstretailavailability) = 12 and day(firstretailavailability) <= 24 
ORDER BY 2 desc;

-- less than the 31st and 25th
SELECT platform, firstretailavailability
FROM pp.p9consoledates 
WHERE month(firstretailavailability) = 11 and day(firstretailavailability) < 31
OR month(firstretailavailability) = 12 and day(firstretailavailability) < 25 
ORDER BY 2 desc;

-- datediff when discontinued and firstretailavailability
select platform, firstretailavailability, Discontinued, 
datediff(discontinued, firstretailavailability) as longevity
from pp.p9consoledates
order by longevity;

-- convert the year datatype from text to int
alter table pp.p9consolegames 
modify year INT;



