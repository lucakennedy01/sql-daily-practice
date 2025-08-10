/*

User With Most Approved Flags
https://platform.stratascratch.com/coding/2104-user-with-most-approved-flags?code_type=1
ID 2104

Difficulty: Medium

Which user flagged the most distinct videos that ended up approved by YouTube? 
Output, in one column, their full name or names in case of a tie. 
In the user's full name, include a space between the first and the last name.

Tables:

<user_flags>
flag_id:text
user_firstname:tex
tuser_lastname:text
video_id:text

<flag_review>
flag_id:text
reviewed_by_yt:boolean
reviewed_date:date
reviewed_outcome:text

*/

/*
Working Logic:
Create first CTE to group by fullname, using CONCAT()
Join flag_review onto user_flags on flag_id and where outcome = 'approved'
Count unique video ids per fullname

Create second CTE
Rank by approved number of vids from first CTE
Use DENSE_RANK() as we want to account for same number of outcomes across multiple users
We now have a CTE with all unique fullnames and a ranking of unique videos that were approved in descending order

Finally, select just the fullname(s) from 2nd CTE where rank = 1
*/

-- Attempt:
WITH approved_vids AS (
    SELECT
        CONCAT(u.user_firstname,' ', u.user_lastname) AS fullname,
        COUNT(DISTINCT u.video_id) AS approved_count --count distinct videos after filtering by APPROVED
    FROM user_flags u
    JOIN flag_review f ON u.flag_id = f.flag_id AND reviewed_outcome = 'APPROVED'
    GROUP BY fullname),
    
    ranked_vids AS (
    SELECT
        fullname,
        DENSE_RANK() OVER (ORDER BY approved_count DESC) AS rank
    FROM approved_vids)

SELECT
    fullname
FROM ranked_vids
WHERE rank = 1;
-- Result: passed