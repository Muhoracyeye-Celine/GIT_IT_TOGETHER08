-----Identify Top 3 Employees per Department----

SELECT * FROM (
    SELECT emp_id, emp_name, department, salary,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS sal_rank
    FROM employee
) WHERE sal_rank <= 3;


