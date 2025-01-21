create database Data1;
use Data1;
select * from sales;
alter table sales drop column orderid, drop column country, drop column postalcode, drop column productid, drop column customerid, drop column discount;

-- Q1) List products which have segment of Home Office and group by it by segment.
select productname,segment as counts from sales group by segment,productname having segment= "Home Office" ;

-- Q2) Sum the sales of categoriy and city group by order it by sales asc
select category,region,sum(sales) as count_sales from sales group by category,region order by count_sales asc;

-- Q3) Sum of profit from the region west name the customer and ship date between 01-01-2014 to 01-01-2016
select sum(profit),shipdate,region from sales group by region,shipdate having region = "West" and shipdate between 2014-01-01 and 2016-01-01;

-- Q4) Count orderid of category furniture and Technology order id should br <25
select count(customername),category from sales where category ="Furniture" or category="Technology" group by category having count(customername) <=25;

-- Q5) min sales and max sales of category furniture from region west
select min(sales) as "min_sales",max(sales) as "max_Sales" from sales where category="Furniture" and region ="West";

-- Q6) All customer names whose order is max Qty.
select customername,quantity from sales where quantity=(select max(quantity) from sales );

-- Q7) All customer and his product name whos sales max but less than 1000
select customername,productname,sales from sales where sales= (select max(sales) from sales where sales<1000);

-- Q8) All cutomer from segment Home Office whose sales is >50 put "Avg", <50 "Poor", >150 "Targeted"
select customername ,sales,
case
when sales<50 then "Poor"
when sales>50 and sales<150 then "Avg"
when sales >150 then "Targeted"
else "Other"
end as "Comments"
from sales where segment= "Home Office";

