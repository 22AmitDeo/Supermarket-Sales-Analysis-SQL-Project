select * from wal;
-- Feature Engineering
select * from wal;
select time,
	(case when time between '00:00:00' and '12:00:00' then 'Morning'
		  when time between '12:00:01' and  '16:00:00' then 'Afternoon'
          else 'Night'
          end) as time_of_day
	from wal; 
alter table wal add column time_of_day varchar(20);
update wal 
	set time_of_day=(case when time between '00:00:00' and '12:00:00' then 'Morning'
		  when time between '12:00:01' and  '16:00:00' then 'Afternoon'
          else 'Night'
          end);
select * from wal;

select dayname(Date) as day_name from wal;

alter table wal add column day_name varchar(20);

update wal		
	set day_name=(
		dayname(Date)
    );
select * from wal;

alter table wal add column month_name  varchar(20);

update wal		
	set month_name=(
		monthname(Date)
    );
select * from wal;


-- Generic Question
-- How many unique cities does the data have?
select distinct (City) from wal;

-- In which city is each branch?
select * from wal;
select distinct Branch, City from wal;

-- Product 
-- How many unique product lines does the data have?
select * from wal;
select distinct `Product line` from wal;
-- What is the most common payment method?
select Payment,count(Payment) from wal
	group by Payment order by count(Payment) desc limit 1;

-- What is the most selling product line?
select * from wal;
select `Product line`,count(Quantity) as `units sold` from wal
	group by `Product line` order by `units sold` desc limit 1;

-- What is the total revenue by month?
select * from wal;
select month_name, sum(Total) from wal
	group by month_name;
    
-- What month had the largest COGS?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM wal
GROUP BY month_name 
ORDER BY cogs desc limit 1;

-- What product line had the largest revenue?
SELECT
	`Product line`,
	SUM(total) as total_revenue
FROM wal
GROUP BY `Product line`
ORDER BY total_revenue DESC limit 1;


-- What is the city with the largest revenue?
select City, sum(Total) as revenue from wal
	group by City
    order by revenue desc limit 1;
    
-- What product line had the largest VAT?
select * from wal;
SELECT `Product line` ,sum(0.5 * cogs) AS VAT
FROM wal
group by `Product line`
order by VAT desc limit 1;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT 
	AVG(quantity) AS avg_qnty
FROM wal;

SELECT
	`Product line` as p,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM wal
GROUP BY p;

-- Which branch sold more products than average product sold?
select * from wal;
select Branch, sum(Quantity) from wal
group by Branch having sum(quantity)>(select avg(quantity) from wal);

-- What is the most common product line by gender?
SELECT
	gender,
    `Product line` as p,
    COUNT(gender) AS total_cnt
FROM wal
GROUP BY gender, p
ORDER BY total_cnt DESC;

-- What is the average rating of each product line?
select * from wal;
select `Product line` as p,avg(Rating) from wal
group by p;




-- Sales
-- Number of sales made in each time of the day per weekday
select * from wal;
SELECT
	time_of_day,
	COUNT(*) AS total_sales
FROM wal
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;

-- Which of the customer types brings the most revenue?
select * from wal;
select `Customer type` as ct, sum(Total) as s from wal
group by ct order by s desc limit 1;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
select * from wal;
select City,sum(`Tax 5%`) as t from wal
group by City order by t desc limit 1;

-- Which customer type pays the most in VAT?
select * from wal;
select `Customer type` as ct,sum(`Tax 5%`) as t from wal
group by ct order by t desc limit 1;

-- Customer
-- How many unique customer types does the data have?
select * from wal;
select distinct `Customer type` as ct from wal;

-- How many unique payment methods does the data have?
select distinct Payment from wal;

-- What is the most common customer type?
select * from wal;
select `Customer type` as ct, count(`Invoice ID`) as id from wal
group by ct order by id desc limit 1;

-- Which customer type buys the most?
select * from wal;
select `Customer type` as ct, count(Quantity) as q from wal
group by ct order by q desc limit 1;

-- What is the gender of most of the customers?
select * from wal;
select Gender, count(Quantity) as q from wal 
group by Gender order by q desc limit 1;

-- What is the gender distribution per branch?
select * from wal;
select Branch, Gender,count(Gender) as distribution from wal
group by Branch,Gender;

-- Which time of the day do customers give most ratings?
select * from wal;
select time_of_day as d,count(Rating) as r from wal
group by d order by r desc limit 1;

-- Which time of the day do customers give most ratings per branch?
select * from wal;
select Branch,time_of_day as d,count(Rating) as r from wal
group by d,Branch order by r desc limit 3;

-- Which day fo the week has the best avg ratings?
select * from wal;
select day_name, avg(Rating) as r from wal 
group by day_name order by r desc limit 1;

-- Which day of the week has the best average ratings per branch?
select Branch,day_name, avg(Rating) as r from wal 
group by day_name,Branch order by r desc limit 3;