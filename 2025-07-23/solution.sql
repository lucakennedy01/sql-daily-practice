/*

Finding Updated Records
Difficulty: Easy

We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
Find the current salary of each employee assuming that salaries increase each year. 
Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.

Tables:
<ms_employee_salary>
department_id:bigint
first_name:text
id:big
intlast_name:text
salary:bigint

*/

/*
Observations:
Entries are not dated, so the most up-to-date salary will be the largest

Working Logic:
If we group by unique employee information in combination with the MAX function,
the max salary per employee can be returned

*/

-- Attempt:
SELECT id, first_name, last_name, department_id, MAX(salary)
FROM ms_employee_salary
GROUP BY id, first_name, last_name, department_id
ORDER BY id;
-- Result: Passed

-- Alternative solution
SELECT id, first_name, last_name, department_id, salary
FROM(
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC) AS rn -- Create a descending ranking of salaries per ID
    FROM ms_employee_salary
) AS ranked -- alias required for a subquery
WHERE rn = 1
ORDER BY id;
