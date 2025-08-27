/*

Find all posts which were reacted to with a heart
https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?python=

Difficulty: Medium

Find all posts which were reacted to with a heart.

Tables:
<facebook_reactions>
poster                  int
friend                  int
reaction                varchar
date_day                int
post_id                 int

<facebook_posts>
post_id                 int
poster                  int
post_text               varchar
post_keywords           varchar
post_date               datetime

*/

/*
Assumptions and observations:
A post can have various reactions, not just a heart
One post can have multiple hearts from various users
post_id is unique in posts table, but not unique in reactions table

Working logic:
Select all post_id in <facebook_reactions> where reaction = heart
Filter <facebook_posts> where post_id = the above list of post_id
Return all rows that match

*/

-- Attempt:
SELECT * 
FROM facebook_posts
WHERE post_id IN 
    (SELECT post_id
    FROM facebook_reactions
    WHERE reaction = 'heart');
-- Result: Passed