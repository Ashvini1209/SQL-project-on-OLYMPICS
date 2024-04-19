show VARIABLES LIKE "secure_file_priv";

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.3/Uploads/Athletes_Cleaned.csv' 
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

create database projectSQL;
use  projectSQL;
create table olympics
(
ID int,
Name varchar(300),
Sex char(5),
Age int,
Height int,
Weight int,
Team varchar(500),
NOC	varchar(500),
Games varchar(500),
Year int,
Season varchar(500),
City varchar(500),
Sport varchar(500),
Event varchar(500),
Medal varchar(300)
);



select * from olympics
limit 5;

-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select medal, count(*) as totalmedal
from olympics
group by medal
order by totalmedal;
-- 2. Show count of unique sports present in Olympics
select count(distinct(sport)) from olympics;
-- 3. Show how many different medals won by team India
select team,medal, count(medal) as medalindia
from olympics
where team="india" and medal<>"nomedal"
group by team,medal
order by medalindia desc;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select team,event ,count(medal) as totalmedal
from olympics
where team="india"
group by event
order by  totalmedal desc ;

-- 5. Show event wise medals won by India in order of year
select year,event,medal,count(medal) as medalwon_years
from olympics
where team="india"
group by event,year,medal
order by year desc;


-- 6. show country who won maximum medals.
select team, max(medal) as maxmedal
from olympics
group by team
order by maxmedal
limit 1;


-- 7.show top 10 countries whowon gold
select team ,count(medal) as total_count_gold
from olympics
where medal="gold"
group by team
order by total_count_gold desc
limit 10;


--  8. show in which year did United states won most gold medal
select team, year,max(medal)  as maxmedal
from olympics
where  (team="united states") and (medal="gold")
group by team,year
order by maxmedal desc
limit 1;



-- 9. In which sports United States has most medals.

select sport,max(medal) as maxmedal
from olympics
where team="united states"
group by sport
order by maxmedal;




-- 10. Find top three players who won most medals along with their sports and country
select * from olympics
limit 10;
select  name,sport,team,count(medal) as max_medal
from olympics
where medal="gold"
group by name,sport,team
order by max_medal desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.
select name,team,sport, count(medal) as max_medal_cycling
from olympics
where medal="gold" and sport="cycling"
group by name,team,medal,sport
order by max_medal_cycling desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name,sport,team, count(medal) as totalmedal
from olympics
where medal<>"nomedal" and sport="basketball"
group by name,sport,team
order by totalmedal desc
limit 1;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select name,sport,count(medal) as medalsof_edwards
from olympics
where sport="basketball" and name=" Teresa Edwards"
group by sport,name
order by medalsof_edwards;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel


