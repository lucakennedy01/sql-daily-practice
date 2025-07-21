/*

Calculate the absolute difference between the highest salaries in the marketing and engineering departments.
Output only the absolute difference
https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=1

Tables:
<db_employee>
department_id:bigint
first_name:text
id:bigint
last_name:text
salary:bigint

<db_dept>
department:text
id:bigint
*/

/*
Assumptions and observations:
db_employee holds department as a foreign key to de_dept, which holds the relevant department names
The MAX function can be used to obtain the single highest value in salary when the rows are filtered by department as a scalar, avoiding multiple queries interfering

Working logic:
Perform two select MAX(Salary) statements on db_employee, where the department_id matches the department_id in db_dept where the written name is stored
Wrap the two results inside a SELECT statement, named salary_difference, where a subtraction operation is performed within an ABS wrapper

*/

-- Submission:
SELECT ABS(
    (select MAX(SALARY) 
    from db_employee
    WHERE department_id = (SELECT id FROM db_dept WHERE department = 'engineering'))
    -
    (select MAX(SALARY) 
    from db_employee
    WHERE department_id = (SELECT id FROM db_dept WHERE department = 'marketing')))
as salary_difference;
-- Result: Passed