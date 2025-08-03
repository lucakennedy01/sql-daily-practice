/*

Premium Account
https://platform.stratascratch.com/coding/2097-premium-acounts?code_type=1
ID 2097

You have a dataset that records daily active users for each premium account. 
A premium account appears in the data every day as long as it remains premium. However, some premium accounts may be temporarily discounted, meaning they are not actively paying—this is indicated by a final_price of 0.

For each of the first 7 available dates in the dataset, count the number of premium accounts that were actively paying on that day. 
Then, track how many of those same accounts are still premium and actively paying exactly 7 days later, based solely on their status on that 7th day (i.e., both dates must exist in the dataset). 
Accounts are only counted if they appear in the data on both dates.

Output three columns:

•   The date of initial calculation.

•   The number of premium accounts that were actively paying on that day.

•   The number of those accounts that remain premium and are still paying after 7 days.

Tables:

<premium_accounts_by_day>
account_id:text
entry_date:date
final_price:bigin
plan_size:bigint
users_visited_7d:bigint

*/

/*
Working logic:
Let's create a CTE that only holds accounts that are paying premiums, i.e. final_price > 0.
Now, we can query any date within the CTE and receive only premium account for that day, allowing use of COUNT
By grouping our main expression with GROUP BY entry_date, and using ORDER BY and LIMIT, we can view the premium counts
for the first 7 days of data.

By duplicating this table and joining to the original when the account id's match and the dates are offset +7 from the original,
we can use the presence of the joined account id as an indicator they logged in a week later.

Each of the distinct account_id per first 7 days in the original cte are an original login, and each distinct account_id in the 
date-offset joined column are subsequent logins 7 days later.
*/

-- Submission:
WITH active_premium AS (
    SELECT 
        entry_date,
        account_id
    FROM premium_accounts_by_day
    WHERE final_price > 0) --cte with just all active premium accounts
    
-- The active_premium cte only has accounts that have paid that day
-- We can perform a self INNER JOIN and duplicate the table, joining
-- the account_id to the original as an indicator that the conditions
-- of the INNER JOIN were met.
--
-- Since we are grouping by the entry_date entries of the original,
-- we can just count all the entries in the second account_id column
-- for each day. If the entry contains an entry, then that account
-- logged in on both the first day "entry_day" and returned 7 days later

select 
    -- Entry dates for the first login
    a.entry_date, 
    -- Active today (i.e. per entry_date value)
    COUNT(DISTINCT a.account_id) AS active_on_date,
    
    -- Still active a week later (i.e. when entry_date += 7)
    COUNT(DISTINCT b.account_id) AS active_next_week
from active_premium a 
INNER JOIN active_premium b 
    on a.account_id = b.account_id 
    AND (b.entry_date - a.entry_date) = 7
GROUP BY a.entry_date
ORDER BY a.entry_date
LIMIT 7;
-- Result: passed