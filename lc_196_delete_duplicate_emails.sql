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

DROP TABLE IF EXISTS Person;

Create table If Not Exists Person (
    Id    int,
    Email varchar(255)
);
Truncate table Person;
insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');

--

use leetcode;

DELETE p FROM Person AS p INNER JOIN Person AS q WHERE p.Email = q.Email AND p.Id > q.Id;

-- SELECT * FROM Person AS p INNER JOIN Person AS q WHERE p.Email = q.Email AND p.Id > q.Id;

DELETE r FROM Person AS r WHERE r.Id NOT IN (
    SELECT id FROM (
        SELECT min(id) AS id FROM Person AS p GROUP BY p.Email
    ) AS q
);