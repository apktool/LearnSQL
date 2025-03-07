/**
 * @brief 超过 5 名学生的课
 *
 * @details
 *
 * 查询 至少有 5 个学生 的所有班级。
 *
 * @see [leetcode-596](https://leetcode.cn/problems/classes-more-than-5-students/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Courses;

Create table If Not Exists Courses (student varchar(255), class varchar(255));
Truncate table Courses;
insert into Courses (student, class) values ('A', 'Math');
insert into Courses (student, class) values ('B', 'English');
insert into Courses (student, class) values ('C', 'Math');
insert into Courses (student, class) values ('D', 'Biology');
insert into Courses (student, class) values ('E', 'Math');
insert into Courses (student, class) values ('F', 'Computer');
insert into Courses (student, class) values ('G', 'Math');
insert into Courses (student, class) values ('H', 'Math');
insert into Courses (student, class) values ('I', 'Math');


-- code

SELECT class FROM (
    SELECT class,  COUNT(1) AS c FROM Courses AS p GROUP BY p.class ORDER BY c DESC
) AS q WHERE q.c >= 5;


SELECT class FROM Courses AS p GROUP BY p.class HAVING COUNT(1) >= 5;