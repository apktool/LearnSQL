/**
 * @brief 变更性别
 *
 * @details
 *
 * 请你编写一个解决方案来交换所有的 'f' 和 'm' （即，将所有 'f' 变为 'm' ，反之亦然），仅使用 单个 update 语句 ，且不产生中间临时表。
 * 注意，你必须仅使用一条 update 语句，且 不能 使用 select 语句。
 *
 * @see [leetcode-627](https://leetcode.cn/problems/swap-salary/)
 */

-- schema

create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Salary;

Create table If Not Exists Salary (id int, name varchar(100), sex char(1), salary int);
Truncate table Salary;
insert into Salary (id, name, sex, salary) values ('1', 'A', 'm', '2500');
insert into Salary (id, name, sex, salary) values ('2', 'B', 'f', '1500');
insert into Salary (id, name, sex, salary) values ('3', 'C', 'm', '5500');
insert into Salary (id, name, sex, salary) values ('4', 'D', 'f', '500');

-- code

UPDATE Salary SET sex =
    CASE sex
        WHEN 'm' THEN 'f'
        ELSE 'm'
    END;

UPDATE Salary SET sex = IF(sex = 'f', 'm', 'f');