# SQL JOINs Tutorial: Understanding All Join Methods

SQL JOINs are used to combine rows from two or more tables based on a related column between them. They are essential for working with relational databases.

---

## 1. INNER JOIN

**What it does:**  
Returns rows where there is a match in **both** tables.

**When to use:**  
When you want only the records that have matching keys in both tables.

**Syntax:**

```sql
SELECT columns
FROM table1
INNER JOIN table2 ON table1.common_field = table2.common_field;
```

**Example:** Get employees with their departments:

```sql
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;
```

---

## 2. LEFT JOIN (or LEFT OUTER JOIN)

**What it does:**  
Returns all rows from the **left** table, and matched rows from the right table.  
If no match, right side columns are NULL.

**When to use:**  
When you want all records from the left table regardless of matches.

**Syntax:**

```sql
SELECT columns
FROM table1
LEFT JOIN table2 ON table1.common_field = table2.common_field;
```

**Example:** List all employees, with department info if available:

```sql
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;
```

---

## 3. RIGHT JOIN (or RIGHT OUTER JOIN)

**What it does:**  
Returns all rows from the **right** table, and matched rows from the left table.  
If no match, left side columns are NULL.

**When to use:**  
When you want all records from the right table regardless of matches.

**Syntax:**

```sql
SELECT columns
FROM table1
RIGHT JOIN table2 ON table1.common_field = table2.common_field;
```

**Example:** List all departments, with employees if any:

```sql
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;
```

---

## 4. FULL OUTER JOIN

**What it does:**  
Returns rows when there is a match in **either** table.  
Rows without a match get NULLs on the other side.

**When to use:**  
When you want all records from both tables, matching when possible.

**Syntax:**

```sql
SELECT columns
FROM table1
FULL OUTER JOIN table2 ON table1.common_field = table2.common_field;
```

**Example:** List all employees and departments, matched when possible:

```sql
SELECT e.name, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.id;
```

---

## 5. CROSS JOIN

**What it does:**  
Returns the **Cartesian product** of both tables — every row of the first table combined with every row of the second.

**When to use:**  
Rarely used, but useful for generating combinations.

**Syntax:**

```sql
SELECT columns
FROM table1
CROSS JOIN table2;
```

**Example:** Combine every employee with every project:

```sql
SELECT e.name, p.project_name
FROM employees e
CROSS JOIN projects p;
```

---

## 6. SELF JOIN

**What it does:**  
A table joined with itself. Useful to compare rows within the same table.

**When to use:**  
When you want to find relationships between rows in the same table.

**Syntax:**

```sql
SELECT a.column, b.column
FROM table a
JOIN table b ON a.related_field = b.related_field;
```

**Example:** Find pairs of employees who share the same manager:

```sql
SELECT e1.name AS employee1, e2.name AS employee2, e1.manager_id
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.manager_id
WHERE e1.id != e2.id;
```

---

## Tips on Using JOINs

- Use explicit `JOIN ... ON` syntax — it’s clearer and less error-prone than old-style comma joins.
- Always specify join conditions to avoid Cartesian products unless intentionally using `CROSS JOIN`.
- Understand the data and relationships before choosing join type.
- Use aliases (`e`, `d`, etc.) to keep queries concise.

---
