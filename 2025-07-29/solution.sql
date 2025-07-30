/*

Bikes Last Used
https://platform.stratascratch.com/coding/10176-bikes-last-used?code_type=1
Find the last time each bike was in use. 
Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned). 
Order the results by bikes that were most recently used.

Tables:
<dc_bikeshare_q1_2012>
bike_number:text
duration:text
duration_seconds:bigint
end_station:text
end_terminal:bigint
end_time:timestamp without time zone
id:bigint
rider_type:text
start_station:text
start_terminal:bigint
start_time:timestamp without time zone

*/

/*
Working logic:
end_time:timestamp without time zone is just a 64-bit representing microseconds since epoch (1970-01-01 00:00:00 UTC.)
Therefore max value per bike_number represents its last use
*/

--Atempt:
select bike_number, MAX(end_time) as last_used
from dc_bikeshare_q1_2012
group by bike_number
order by last_used desc;
--Result: passed