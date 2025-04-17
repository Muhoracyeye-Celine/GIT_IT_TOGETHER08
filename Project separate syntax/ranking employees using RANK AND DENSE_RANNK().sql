---Ranking Employees using RANK() and DENSE_RANK()----

SELECT emp_id, emp_name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_r,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_r
FROM employee;

