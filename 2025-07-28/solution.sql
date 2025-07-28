/*

Customer Details
https://platform.stratascratch.com/coding/9891-customer-details?code_type=1
ID 9891

Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.

Sort records based on the customer's first name and the order details in ascending order.

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
Working logic:
Order details are contained within the orders table, which can be joined to customers
by relating orders cust_id to customers id.

The objective is to return all customers, regardless of orders.
We will use a RIGHT join to ensure all information from the RIGHT table (customers)
is preserved.
*/


select c.first_name, c.last_name, c.city, o.order_details 
from orders o
RIGHT JOIN customers c ON o.cust_id = c.id
ORDER BY c.first_name, o.order_details ASC;

--Alternatively
select c.first_name, c.last_name, c.city, o.order_details
from customers c
LEFT JOIN orders o ON c.id = o.cust_id
ORDER BY c.first_name, o.order_details ASC;

--Full join is applicable to both