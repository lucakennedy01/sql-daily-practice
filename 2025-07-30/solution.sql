/*

Top Cool Votes
https://platform.stratascratch.com/coding/10060-top-cool-votes?code_type=1
ID 10060

Find the review_text that received the highest number of  cool votes.
Output the business name along with the review text with the highest number of cool votes.

Tables:
<yelp_reviews>
business_name:text
cool:bigint
funny:bigint
review_date:date
review_id:text
review_text:text
stars:text
useful:bigint
user_id:text

*/

/*
Working logic:
Use a SELECT subquery to get the highest value of cool from the table.
Using a WHERE clause, return the required fields where cool matches the value returned in the subquery
*/

--Attempt:
select business_name, review_text
from yelp_reviews
WHERE cool = (SELECT MAX(COOL) FROM yelp_reviews);
--Result: Passed