-- SQLite
SELECT * FROM player;
select * from team;
select * from country;
-- select * from league;
select * from match ;

select distinct country_id, season from match;

select * from sqlite_master where type = 'table';


-- select count(player_api_id) from player;

-- select * from Match;

-- with t1 as (
-- select country_id, league_id, row_number() over (partition by league_id, country_id order by country_id) rk
-- from match) 
-- select * from t1 
-- where 1=1
-- -- and rk > 1
-- and league_id = 1729
-- ;
-- select distinct league_id, country_id, home_team_api_id, away_team_api_id from match;
-- select distinct home_team_api_id from match;

-- count # of goals per match by season and country
select season Season, c.name Country, l.name League
,round((sum(home_team_goal) + sum(away_team_goal))*1.0/count(match_api_id),3) "Goals per match"
,round(sum(home_team_goal)*1.0/count(match_api_id),3) "Home team goals per match"
,round(sum(away_team_goal)*1.0/count(match_api_id),3) "Away team goals per match"
,sum(home_team_goal) + sum(away_team_goal) "Total goals"
,count(match_api_id) "Total matches"
from match m
join Country c
    on m.country_id = c.id
join League l
    on m.league_id = l.id
group by season, c.name, l.name
order by season asc, "Goals per match" desc
;


select 7*1.0/3 from match;




select distinct stage from match order by stage;
select min(date), max(date) from match;


select season, min(date), max(date), count(distinct country_id) from match
where 1=1
group by season;


select distinct from Team_Attributes;

select * from Player_Attributes;

with t1 as (
select season, country_id, league_id, count(match_api_id) count_match
,rank () over (partition by season order by count(match_api_id) desc) max_match 
,rank () over (partition by season order by count(match_api_id)) min_match
,sum(count(match_api_id)) over (partition by season) total_match
from match
group by season, country_id, league_id)
select season Season, t2.name Country, t3.name League, 
case when max_match = 1 then count_match else null end
"max no. matches by season and country",
case when min_match = 1 then count_match else null end
"min no. matches by season and country"
, total_match "total match by season" from t1 
join Country t2
    on t1.country_id = t2.id
join League t3
     on t1.league_id = t3.id
where 1=1
-- and season = '2011/2012'
and max_match = 1
or min_match = 1
;

select season, country_id, league_id, count(match_api_id) count_match 
,sum(count

from match 
group by season, country_id, league_id 


















