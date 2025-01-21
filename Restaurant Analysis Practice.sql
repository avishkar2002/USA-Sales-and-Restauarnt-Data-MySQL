create database Restaurant;
use Restaurant;
alter table restaurantanalysis rename to food_data;
select * from food_data;
select ï»¿Name from Food_data;
alter table Food_data rename column ï»¿Name to Name;
select * from food_data;


-- CASE Function
select Name,Approx_Cost,
(case
when Approx_Cost >1500 then 'Rich Restaurant'
when Approx_Cost <=1500 then 'Avg Restaurant'
end) as avv
from Food_Data order by Name asc ;

select Name,Rate,
(case 
when Rate>3 then 'Above Avg Restaurant'
when Rate<3 then 'Below Avg Restaurant'
when Rate>4 then 'Best in Seg Restaurant'
when Rate<2 then 'Bad Restaurant'
else 'Not Recomended'
end)as Rating_in_text
from Food_Data order by Rate asc;

-- Over Clause
select City,Name, count(Name) over(partition by Name)as 'no of Restaurant' from Food_Data;
select City,sum(Approx_Cost) over(partition by Name) as 'High_Cost' from Food_Data ;


select * from Food_Data;
select Name,Votes,count(Votes)over(partition by Votes) as 'Popular_Bits' from Food_Data;

select name,Rate,City,
(case
when City='Ahmadabad' then 'Gujjus'
when City='Dhule' then 'aple aple'
when City='Mumbai' then 'Amachi mumbai'
when City ='Thane' then 'Amhi pan mumbait ahot'
when City='Delhi' then 'Amir'
when City='Pune' then 'Porche kadhu ka...!'
else 'Jaude bho'
end)as 'My Thoughts'
from Food_Data order by Name asc;

-- Q1)In city Ahmadnagar find Restaurant type Cafe which has Rating between 3-5 who also accept order online in acending order of votes.
select * from Food_Data where City="Ahmadnagar" and Online_order = "Yes" and Type ="CafÃ©" and rate between 3 and 5 order by votes asc;

-- Q2)Find restaurants who has rating between 4-5 and cost between 1000-1500.
select Name from Food_Data where rate between 4 and 5 and Approx_Cost between 1000 and 1500;

-- Q3)Calculate sum of cost of restaurant type Cafe from city Ahmadabad.
select sum(Approx_Cost) from Food_Data where City = "Ahmadabad" and Type = "CafÃ©" ;

-- Q4)List the restaurant from city Pune who accepts order Online.
select Name from Food_Data where City = "Pune" and  Type = "Dining";

-- Q5)Calculate the Average rating of restaurants from city Delhi.
select avg(Rate) from food_data where Type = "restaurant" and City = "Delhi";

-- Q6)What is the rating of restaurant  name "Akkys Burgers" ranting?
select Rate from food_data where Name = "Akkys Burgers";

-- Q7)Count the restaurants type Restaurant from city Banglore of Averarge rating.
select avg(Rate) as "Avg Rate", count(Name) from food_data where City = "Banglore" and Type = "Restaurant";