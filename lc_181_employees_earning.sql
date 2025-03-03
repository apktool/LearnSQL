/**
 * @brief 编写解决方案，找出收入比经理高的员工。
 *
 * @details
 *
 * 编写解决方案，找出收入比经理高的员工。
 * 以 任意顺序 返回结果表。
 *
 * @see [leetcode-181](https://leetcode.cn/problems/employees-earning-more-than-their-managers/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Employee;

Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int);
Truncate table Employee;
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL);
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL);

-- code
SELECT p.name AS Employee FROM Employee p INNER JOIN Employee q ON p.managerId = q.id AND p.salary > q.salary;