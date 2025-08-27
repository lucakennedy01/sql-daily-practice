/*

Flags per Video
https://platform.stratascratch.com/coding/2102-flags-per-video?code_type=1
ID 2102

Difficulty: Medium

For each video, find how many unique users flagged it. 
A unique user can be identified using the combination of their first name and last name. 
Do not consider rows in which there is no flag ID.

Tables:
<user_flags>
flag_id:text
user_firstname:text
user_lastname:text
video_id:text

*/

/*
Working logic:
We can find unique user identifiers by using CONCAT() with first and last names.
By storing these in a CTE, we can easily group them by video_id, and count the unique occurences
*/

-- Attempt:
-- create cte with user_id for each video_id
WITH unique_user AS (
    SELECT
        video_id,
        CONCAT(user_firstname, user_lastname) AS user_id
    FROM user_flags
    WHERE flag_id IS NOT NULL)

SELECT 
    video_id,
    COUNT(DISTINCT user_id)
FROM unique_user
GROUP BY video_id;
-- Result: Passed
