--- Find First 2 Employees to Join per Department----

SELECT * FROM (
    SELECT emp_id, emp_name, department, join_date,
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date) AS row_num
    FROM employee
) WHERE row_num <= 2;

