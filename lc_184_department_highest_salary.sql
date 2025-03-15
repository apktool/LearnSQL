/**
 * @brief 删除重复的电子邮箱
 *
 * @details
 *
 * 编写解决方案 删除 所有重复的电子邮件，只保留一个具有最小 id 的唯一电子邮件。
 *（对于 SQL 用户，请注意你应该编写一个 DELETE 语句而不是 SELECT 语句。）
 *（对于 Pandas 用户，请注意你应该直接修改 Person 表。）
 * 运行脚本后，显示的答案是 Person 表。驱动程序将首先编译并运行您的代码片段，然后再显示 Person 表。Person 表的最终顺序 无关紧要 。
 *
 * @see [leetcode-196](https://leetcode.cn/problems/delete-duplicate-emails/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department (id int, name varchar(255));
Truncate table Employee;
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1');
Truncate table Department;
insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

-- code


SELECT d.name AS Department, e.name AS Employee, e.salary AS salary FROM Employee AS e INNER JOIN Department AS d ON e.departmentId = d.id
    WHERE (e.departmentId, e.salary) IN
   (SELECT p.departmentId, MAX(p.salary) FROM Employee AS p GROUP BY p.departmentId
);
