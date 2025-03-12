/**
 * @brief 组合两个表
 *
 * @details
 *
 * 编写解决方案，报告 Person 表中每个人的姓、名、城市和州。如果 personId 的地址不在 Address 表中，则报告为 null 。
 * 以 任意顺序 返回结果表。
 *
 * @see [leetcode-175](https://leetcode.cn/problems/combine-two-tables/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Employee;

Create table If Not Exists Employee (id int, salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

-- code

SELECT MAX(p.salary) AS SecondHighestSalary FROM Employee as p WHERE salary < (SELECT MAX(salary) FROM Employee);


SELECT IFNULL(
      (SELECT DISTINCT p.salary FROM Employee AS p ORDER BY p.salary DESC LIMIT 1 OFFSET 1), NULL)
    AS SecondHighestSalary;
