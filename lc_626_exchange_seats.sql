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

DROP TABLE IF EXISTS Seat;

Create table If Not Exists Seat (id int, student varchar(255));
Truncate table Seat;
insert into Seat (id, student) values ('1', 'Abbot');
insert into Seat (id, student) values ('2', 'Doris');
insert into Seat (id, student) values ('3', 'Emerson');
insert into Seat (id, student) values ('4', 'Green');
insert into Seat (id, student) values ('5', 'Jeames');


-- code

SELECT (CASE
            WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
            WHEN MOD(id, 2) != 0 AND counts = id THEN id
        ELSE id - 1
    END) AS id,
    student
FROM
    Seat,
    (SELECT COUNT(*) AS counts FROM Seat) AS seat_counts
ORDER BY id ASC;
