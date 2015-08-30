# Write a SQL query to get the nth highest salary from the Employee table.
# 
# +----+--------+
# | Id | Salary |
# +----+--------+
# | 1  | 100    |
# | 2  | 200    |
# | 3  | 300    |
# +----+--------+
# For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select distinct(e1.Salary)
      from Employee e1
      where (N-1) = (select count(distinct(e2.Salary))
                     from Employee e2
                     where e2.Salary > e1.Salary)
  );
END

# Note:
# 1. this query is firstly counting the number of salaries in e2 higher than that of e1
# 2. If there is only 1 higher salary, then that is the 2nd highest salary
# 3. If there is (n-1) higher salary, tnen that is the nth highest salary

