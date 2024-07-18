use weekend;

select * from athlete;

# Q1. Show how many medal counts present for entire data.
select count(medal) from athlete;

# Q2. Show count of unique Sports are present in olympics.
select count(distinct sport) from athlete; 

# Q3. Show how many different medals won by Team India in data.
select count(distinct medal) as many_different_medals_won from athlete where team = 'India';

# Q4. Show event wise medals won by india show from highest to lowest medals won in order.
select  event, sum(medal) as gold_medal, sum(medal) as silver_medal, sum(medal) as bronze_medal, sum(medal + medal + medal) as total_medals from athlete where team='india' group by event order by total_medals desc;

# Q5. Show event and yearwise medals won by india in order of year.
select event, year, sum(medal) as gold_medal, sum(medal) as silver_medal, sum(medal) as bronze_medal, sum(medal + medal + medal) as total_medals from athlete where team='india' group by event, year order by year;

# Q6. Show the country with maximum medals won gold, silver, bronze.
select team from athlete order by (medal) desc limit 3;

# Q7. Show the top 10 countries with respect to gold medals
select team, sum(medal) as total_gold_medals from athlete group by team order by total_gold_medals desc limit 10;

# Q8. Show in which year did United States won most medals.
select year, sum(medal) as total_medals from athlete where team = 'United States' group by year order by total_medals desc limit 1;

# Q9. In which sports United States has most medals
select sport, sum(medal) as total_medals from athlete where team = 'United States' group by sport order by total_medals desc limit 1;

# Q10. Find top 3 players who have won most medals along with their sports and country.
select name,sport,team, sum(medal) as total_medals from athlete group by  name,sport,team  order by total_medals desc limit 3;

# Q11. Find player with most gold medals in cycling along with his country.
select name, team, max(medal) as most_gold_medals from athlete where sport='cycling' and medal='gold' group by name,team 
order by most_gold_medals desc limit 1;

# Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.
select name, team, sum(medal) as most_medals from athlete where sport='Basketball' and medal in ('gold', 'silver', 'bronze')
group by name,team order by most_medals desc limit 1;

# Q13. Find out the count of different medals of the top basketball player.
select name, sum(case when medal = 'Gold' then 1 else 0 end) as gold_count,sum(case when medal = 'Silver' then 1 else 0 end) as silver_count, 
sum(case when medal = 'Bronze' then 1 else 0 end) as bronze_count from athlete where medal = (select max(medal) from athlete)
group by name;

# Q14. Find out medals won by male, female each year . Export this data and plot graph in excel.
select year, sum(case when sex = 'M' then 1 else 0 end) as male_medals, sum(case when sex = 'F' then 1 else 0 end) as female_medals
from athlete group by year order by year;















    






