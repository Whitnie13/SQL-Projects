select * from raw_sales;

-- the date with the highest number of sales
select datesold as date, count(price) as sales
from raw_sales
group by date 
order by sales desc
limit 1;

-- the postcode with the highest average price
select postcode, avg(price) as average_price
from raw_sales
group by postcode
order by average_price desc
limit 1;

-- year with the lowest number of sales
select extract(year from datesold) as year, count(*) as sales -- we are trying converting the timestamp to get the exact year
from raw_sales
group by year 
order by sales asc
limit 1;

-- year with the lowest number of sales
select date_part('year',datesold) as year, count(*) as sales -- another way to get the exact year
from raw_sales
group by year 
order by sales asc
limit 1;

-- 
with sale2 as (
	select extract(year from datesold) as year, 
	postcode, 
	price, row_number() over (partition by extract(year from datesold), postcode order by price desc) as rnk
	from raw_sales 
)

select year, postcode, price
from sale2 
where rnk < 2 
order by year, price desc
limit 6;


