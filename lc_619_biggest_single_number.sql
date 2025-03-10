/**
 * @brief 只出现一次的最大数字
 *
 * @details
 *
 * 单一数字 是在 MyNumbers 表中只出现一次的数字。
 * 找出最大的 单一数字 。如果不存在 单一数字 ，则返回 null 。
 *
 * @see [leetcode-619](https://leetcode.cn/problems/biggest-single-number/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS MyNumbers;

Create table If Not Exists MyNumbers (num int);
Truncate table MyNumbers;
insert into MyNumbers (num) values ('8');
insert into MyNumbers (num) values ('8');
insert into MyNumbers (num) values ('3');
insert into MyNumbers (num) values ('3');
insert into MyNumbers (num) values ('1');
insert into MyNumbers (num) values ('4');
insert into MyNumbers (num) values ('5');
insert into MyNumbers (num) values ('6');

-- code

SELECT max(num) AS num FROM (
    SELECT num FROM MyNumbers AS p GROUP BY num HAVING COUNT(num) < 2
) AS q;