/**
 * @brief 第N高的薪水
 *
 * @details
 *
 * 查询 Employee 表中第 n 高的工资。如果没有第 n 个最高工资，查询结果应该为 null 。
 * 查询结果格式如下所示。
 *
 * @see [leetcode-177](https://leetcode.cn/problems/nth-highest-salary/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Employee;

Create table If Not Exists Employee (Id int, Salary int );
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

-- code

DROP FUNCTION getNthHighestSalary;

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE M INT;
    SET M = N - 1;
    RETURN (
        SELECT IFNULL(
           (SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET M),
           NULL
       )
    );
END;

SELECT getNthHighestSalary(2);

