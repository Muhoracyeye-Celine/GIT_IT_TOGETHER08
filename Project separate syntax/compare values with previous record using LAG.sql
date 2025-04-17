------Compare Values with Previous Record using LAG()-----

SELECT emp_id, emp_name, salary,
       LAG(salary) OVER (ORDER BY emp_id) AS prev_salary,
       CASE
           WHEN salary > LAG(salary) OVER (ORDER BY emp_id) THEN 'HIGHER'
           WHEN salary < LAG(salary) OVER (ORDER BY emp_id) THEN 'LOWER'
           ELSE 'EQUAL'
       END AS compare_with_prev
FROM employee;

