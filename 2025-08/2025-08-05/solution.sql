/*

Find Students At Median Writing
https://platform.stratascratch.com/coding/9610-find-students-with-a-median-writing-score?code_type=1
ID 9610

Difficulty: Medium

Identify the IDs of students who scored exactly at the median for the SAT writing section.

Tables:
<sat_scores>
average_sat:double precision
hrs_studied:double precision
id:bigint
ove:double precision
sat_math:double precision
sat_verbal:double precision
sat_writing:double precision
school:text
student_id:double precision
teacher:text

*/

/*
Working logic:
Median is the middle-ranked value of an ordered list
Start by defining a cte with scores and their order, as well as the total number of entries
We then select the id's where score = the average of either the two middle values (for an even total count) or just the middle value if odd
We do this with WHERE row_id BETWEEN count/2.0 and count/2.0 + 1, as between is inclusive of bounds bounds.
For an odd number i.e. 99, we get between 44.5 and 45.5, we just get 45.
We an even number i.e. 100, we get 50 and 51, so we get the average of both of these
*/

-- Attempt:
WITH ordered_scores AS (
    SELECT
        sat_writing,
        ROW_NUMBER() OVER (ORDER BY sat_writing) as row_id,
        (SELECT COUNT(1) FROM sat_scores) as ct
    FROM sat_scores)
    
SELECT id
FROM sat_scores
WHERE sat_writing =
(SELECT AVG(sat_writing) AS median
FROM ordered_scores
WHERE row_id between ct/2.0 and ct/2.0 + 1);
-- Result: passed