/**
 * @brief 寻找用户推荐人
 *
 * @details
 *
 * 找出那些 没有被 id = 2 的客户 推荐 的客户的姓名。
 * 以 任意顺序 返回结果表。
 *
 * @see [leetcode-584](https://leetcode.cn/problems/find-customer-referee/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Customer;

Create table If Not Exists Customer (id int, name varchar(25), referee_id int);
Truncate table Customer;
insert into Customer (id, name, referee_id) values ('1', 'Will', NULL);
insert into Customer (id, name, referee_id) values ('2', 'Jane', NULL);
insert into Customer (id, name, referee_id) values ('3', 'Alex', '2');
insert into Customer (id, name, referee_id) values ('4', 'Bill', NULL);
insert into Customer (id, name, referee_id) values ('5', 'Zack', '1');
insert into Customer (id, name, referee_id) values ('6', 'Mark', '2');

-- code

SELECT p.name FROM Customer AS p WHERE p.referee_id != 2 OR p.referee_id IS NULL;
