/**
 * @brief 判断三角形
 *
 * @details
 *
 * 对每三个线段报告它们是否可以形成一个三角形。
 * 以 任意顺序 返回结果表。
 *
 * @see [leetcode-610](https://leetcode.cn/problems/triangle-judgement/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Triangle;

Create table If Not Exists Triangle (x int, y int, z int);
Truncate table Triangle;
insert into Triangle (x, y, z) values ('13', '15', '30');
insert into Triangle (x, y, z) values ('10', '20', '15');


-- code


SELECT x, y, z,
    CASE
        WHEN p.x + p.y > p.z AND p.x + p.z > p.y AND p.y + p.z > p.x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle AS p;


SELECT x, y, z, IF(p.x + p.y > p.z AND p.x + p.z > p.y AND p.y + p.z > p.x, 'Yes', 'No') AS triangle FROM Triangle as p;