/*

Processed Ticket Rate By Type
https://platform.stratascratch.com/coding/9781-find-the-rate-of-processed-tickets-for-each-type?code_type=1
ID 9781

Difficulty: Medium

Find the processed rate of tickets for each type. 
The processed rate is defined as the number of processed tickets divided by the total number of tickets for that type.
Round this result to two decimal places.

Tables:

<facebook_complaints>
complaint_id:bigint
processed:boolean
type:bigint

*/

/*
Working logic:
We can get the processed_rate by dividng the count of processed = TRUE against total complaints, when grouped by type
COUNT(CASE WHEN .. THEN 1 END) will return an int, which will lead to integer division with the total count.
Since we are calculating a ratio, we can expect decimal values, therefore we multiply the COUNT(CASE WHEN) by 1.0 to force floating point division.
*/

-- Attempt:
SELECT 
    type, 
    ROUND(COUNT(CASE WHEN processed THEN 1 END) * 1.0 / COUNT(*), 2) AS processed_rate
FROM facebook_complaints
GROUP BY type;
-- Result: Passed