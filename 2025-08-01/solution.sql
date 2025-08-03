/*

Share of Active Users
https://platform.stratascratch.com/coding/2005-share-of-active-users?code_type=1
ID 2005

Calculate the percentage of users who are both from the US and have an 'open' status, as indicated in the fb_active_users table.

Tables:

<fb_active_users>
country:text
name:text
status:text
user_id:bigint

*/

/*
Working logic:
Use a COUNT(CASE WHEN) clause to return the integer amount of US, open users.
COUNT() returns an integer. 

In SQL, integer division truncates the decimal portion.

Therefore we must multiply this clause by 1.0 to ensure a floating-point operation happens.
We will also multiply this by 100 as it acts as numerator in the upcoming percentage calculation.

To get the denominator, our complete population of users, COUNT(*) is used. 
As the numerator has been converted to a floating point number, we can divide the two to get our percentage, we'll call this us_active_share.

*/

--Attempt
SELECT
    COUNT(CASE 
        WHEN LOWER(COUNTRY) = 'usa' AND LOWER(STATUS) = 'open'
        THEN 1
    END) * 100.0 / COUNT(*) AS us_active_share 
from fb_active_users;
--Result: passed