/**
 * @brief 编写解决方案，找出收入比经理高的员工。
 *
 * @details
 *
 * 编写解决方案来报告所有重复的电子邮件。 请注意，可以保证电子邮件字段不为 NULL。
 * 以 任意顺序 返回结果表。
 *
 * @see [leetcode-182](https://leetcode.cn/problems/duplicate-emails/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE Person;

Create table If Not Exists Person
(
    id    int,
    email varchar(255)
);
Truncate table Person;
insert into Person (id, email)
values ('1', 'a@b.com');
insert into Person (id, email)
values ('2', 'c@d.com');
insert into Person (id, email)
values ('3', 'a@b.com');

-- code

SET @d=NOW();
SELECT email AS Email
FROM (SELECT p.email, count(1) as cnt FROM Person as p GROUP BY p.email) AS statistic
WHERE cnt > 1;
SELECT TIMESTAMPDIFF(second, @d, NOW());

--

SET PROFILING = 1;

SELECT DISTINCT p.email AS Email
FROM Person AS p
         INNER JOIN Person AS q
ON p.email = q.email
  AND p.id != q.id;

SHOW PROFILES;
SHOW PROFILE ALL FOR QUERY 202;