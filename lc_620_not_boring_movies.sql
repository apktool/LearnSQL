/**
 * @brief 有趣的电影
 *
 * @details
 *
 * 编写解决方案，找出所有影片描述为 非 boring (不无聊) 的并且 id 为奇数 的影片。
 *
 * @see [leetcode-620](https://leetcode.cn/problems/not-boring-movies/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS cinema;

Create table If Not Exists cinema (id int, movie varchar(255), description varchar(255), rating float(2, 1));
Truncate table cinema;
insert into cinema (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9');
insert into cinema (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5');
insert into cinema (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2');
insert into cinema (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1');

-- code

SELECT * FROM cinema AS p WHERE p.description != 'boring' AND id % 2 != 0 ORDER BY p.rating DESC;

SELECT * FROM cinema AS p WHERE p.description != 'boring' AND mod(id, 2) = 1 ORDER BY p.rating DESC;
