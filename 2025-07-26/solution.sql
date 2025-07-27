/*

Average Salaries
https://platform.stratascratch.com/coding/9917-average-salaries?code_type=1
ID 9917

Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

Tables:
<employee>
address:text
age:bigint
bonus:bigint
city:text
department:text
email:text
employee_title:text
first_name:text
id:bigint
last_name:text
manager_id:bigint
salary:bigint
sex:text
target:bigint

*/

/*
Working logic:
We can calculate the average salary for each department using AVG()
alongside the PARTITION BY method
*/

--Attempt:
select department, first_name, salary, AVG(salary) OVER (PARTITION BY department) as average_salary
from employee;
--Result: Passed
