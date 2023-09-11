SELECT E.first_name, E.last_name, E.salary, E.salary*1.1 as increased_salary
FROM Employee E
INNER JOIN branch B ON E.branch_id = B.branch_id
WHERE B.branch_name = 'Corporate';

SELECT first_name, last_name, salary
from Employee
WHERE salary BETWEEN 60000 and 80000 
AND sex='M';

SELECT first_name, last_name, branch_id, salary
from Employee
ORDER BY branch_id DESC, salary ASC;

SELECT E.first_name, E.last_name, W.total_sales
FROM Employee E
INNER JOIN WORKS_WITH W ON E.emp_id = W.emp_id
INNER JOIN CLIENT C ON W.client_id = C.client_id
WHERE E.salary >= 60000 and C.client_name="FedEx";

SELECT sum(salary) as total_salary, max(salary) as max_salary,
        min(salary) as min_salary, avg(salary) as avg_salary
from Employee;

SELECT COUNT(*) as total_employees From Employee;

SELECT B.branch_name, COUNT(*) AS employees_in_branch
FROM Employee E
INNER JOIN Branch B ON E.branch_id = B.branch_id
GROUP BY B.branch_name;

