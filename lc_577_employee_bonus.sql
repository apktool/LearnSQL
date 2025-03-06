/**
 * @brief 员工奖金
 *
 * @details
 *
 * 编写解决方案，报告每个奖金 少于 1000 的员工的姓名和奖金数额。
 *
 * @see [leetcode-577](https://leetcode.cn/problems/employee-bonus/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Bonus;

Create table If Not Exists Employee (empId int, name varchar(255), supervisor int, salary int);
Create table If Not Exists Bonus (empId int, bonus int);
Truncate table Employee;
insert into Employee (empId, name, supervisor, salary) values ('3', 'Brad', NULL, '4000');
insert into Employee (empId, name, supervisor, salary) values ('1', 'John', '3', '1000');
insert into Employee (empId, name, supervisor, salary) values ('2', 'Dan', '3', '2000');
insert into Employee (empId, name, supervisor, salary) values ('4', 'Thomas', '3', '4000');
Truncate table Bonus;
insert into Bonus (empId, bonus) values ('2', '500');
insert into Bonus (empId, bonus) values ('4', '2000');

-- code

SELECT p.name, q.bonus FROM Employee AS p LEFT JOIN Bonus AS q ON p.empId = q.empId WHERE q.bonus < 1000 OR q.bonus IS NULL;