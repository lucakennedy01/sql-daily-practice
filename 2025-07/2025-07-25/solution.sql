/*

Popularity of Hack
https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=1
ID 10061
Meta/Facebook has developed a new programing language called Hack.
To measure the popularity of Hack they ran a survey with their employees. 
The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack. 
Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. 
Luckily the user IDs of employees completing the surveys were stored.
Based on the above, find the average popularity of the Hack per office location.
Output the location along with the average popularity.

Tables:
<facebook_employees>
age:bigint
gender:text
id:bigint
is_senior:boolean
location:text

<facebook_hack_survey>
age:bigint
employee_id:bigint
gender:text
popularity:bigint

*/

/*
Observations:
<facebook_employees> id is a foreign key to <facebook_hack_survey> employee_id
By joining on id, we get a location for each entry in <facebook_hack_survey>
We can then find average <popularity> grouped by location
*/

-- Attempt:
select e.location, AVG(s.popularity) as avg_popularity
from facebook_hack_survey s
JOIN facebook_employees e ON s.employee_id = e.id
GROUP BY e.location;
-- Result: Passed