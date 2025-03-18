/**
 * @brief 至少有5名直接下属的经理
 *
 * @details
 *
 * 编写一个解决方案，找出至少有五个直接下属的经理。
 *
 * @see [leetcode-570](https://leetcode.cn/problems/managers-with-at-least-5-direct-reports/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Employee;

Create table If Not Exists Employee (id int, name varchar(255), department varchar(255), managerId int);
Truncate table Employee;
insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', NULL);
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101');
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');

-- code

SELECT p.name FROM Employee AS p
WHERE p.id IN (
    SELECT q.managerId FROM Employee AS q GROUP BY q.managerId HAVING COUNT(1) >= 5
);