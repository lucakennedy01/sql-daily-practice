/*

Order Details
Difficulty: Easy
https://platform.stratascratch.com/coding/9913-order-details?code_type=1

Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.

Tables:
<customers>
address:text
city:text
first_name:text
id:bigint
last_name:text
phone_number:text

<orders>
cust_id:bigint
id:bigint
order_date:date
order_details:text
total_order_cost:bigint

*/

/*
Observations:
customers.id acts as a foreign key to orders.cust_id
Joining customers to orders on customers.id = orders.cust_id will pair order information with customer information

Working Logic:
Join customers to orders on id=cust_id
Return relevant information for WHERE c.first_name IN ('Jill','Eva')
Order by o.cust_id in ascending order
*/

--Attempt:
select o.order_date, o.order_details, o.total_order_cost, c.first_name 
from orders o
JOIN customers c ON o.cust_id = c.id
WHERE c.first_name IN ('Jill','Eva')
ORDER BY o.cust_id ASC;
--Result: Passed