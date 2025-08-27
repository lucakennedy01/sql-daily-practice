/*

Customer Revenue in March
https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?code_type=1
ID 9782

Difficulty: Medium

Calculate the total revenue from each customer in March 2019. 
Include only customers who were active in March 2019. 
An active user is a customer who made at least one transaction in March 2019.
Output the revenue along with the customer id and sort the results based on the revenue in descending order.

Tables:

<orders>
cust_id:bigint
id:bigint
order_date:date
order_details:text
total_order_cost:bigint
*/

/*
Working Logic:
Use WHERE order_date BETWEEN '2019-03-01' AND '2019-03-31' to limit returned data to our target month.
Sum total_order_cost and GROUP BY cust_id for results
Order by the summed revenue in DESC
*/

-- Attempt:
SELECT
    cust_id,
    SUM(total_order_cost) AS revenue
FROM orders
WHERE order_date BETWEEN '2019-03-01' AND '2019-03-31'
GROUP BY cust_id
ORDER BY revenue DESC;
-- Result: Passed