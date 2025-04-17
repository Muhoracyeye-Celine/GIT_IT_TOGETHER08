--- Aggregation with Window Functions-----


SELECT emp_id, emp_name, department, salary,
       MAX(salary) OVER (PARTITION BY department) AS max_in_dept,
       MAX(salary) OVER () AS overall_max_salary
FROM employee;
