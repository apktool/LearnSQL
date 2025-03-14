/**
 * @brief 连续出现的数字
 *
 * @details
 *
 * 找出所有至少连续出现三次的数字。
 * 返回的结果表中的数据可以按 任意顺序 排列。
 * 结果格式如下面的例子所示：
 *
 * @see [leetcode-180](https://leetcode.cn/problems/consecutive-numbers/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Logs;

Create table If Not Exists Logs (id  int, num int);
Truncate table Logs;
insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');

--

SELECT DISTINCT p1.num AS ConsecutiveNums
FROM Logs AS p1
         INNER JOIN Logs AS p2
         INNER JOIN Logs AS p3
WHERE p1.id = p2.id -1 AND p2.id = p3.id -1 AND p1.num = p2.num AND p2.num = p3.num;