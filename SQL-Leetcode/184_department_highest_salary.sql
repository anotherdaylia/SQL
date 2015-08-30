# The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.
# 
# +----+-------+--------+--------------+
# | Id | Name  | Salary | DepartmentId |
# +----+-------+--------+--------------+
# | 1  | Joe   | 70000  | 1            |
# | 2  | Henry | 80000  | 2            |
# | 3  | Sam   | 60000  | 2            |
# | 4  | Max   | 90000  | 1            |
# +----+-------+--------+--------------+
# The Department table holds all departments of the company.
# 
# +----+----------+
# | Id | Name     |
# +----+----------+
# | 1  | IT       |
# | 2  | Sales    |
# +----+----------+
# Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, Max has the highest salary in the IT department and Henry has the highest salary in the Sales department.
# 
# +------------+----------+--------+
# | Department | Employee | Salary |
# +------------+----------+--------+
# | IT         | Max      | 90000  |
# | Sales      | Henry    | 80000  |
# +------------+----------+--------+

# Write your MySQL query statement below
select d.name as Departmentid, e1.name as Employee, e1.salary as Salary
from Employee e1 join (select departmentid, max(salary) as salary
		       from Employee
		       group by departmentid) t
using(departmentid, salary)
join Department d
on (e1.departmentid = d.id)


# Note:
# -  There might be more than one salaries that equals to the highest salary
# 1. Count the max salary of each department, and mark the temperary table as t
# 2. Join table t with Employee table using !departmentid! and salary
# 3. Join department table using departmentid to include department name into the output 

