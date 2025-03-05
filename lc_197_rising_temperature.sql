/**
 * @brief 上升的温度
 *
 * @details
 *
 * 编写解决方案，找出与之前（昨天的）日期相比温度更高的所有日期的 id 。
 * 返回结果 无顺序要求 。
 *
 * @see [leetcode-197](https://leetcode.cn/problems/rising-temperature/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Weather;

Create table If Not Exists Weather (id int, recordDate date, temperature int);
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30');

-- code

SELECT p.id AS ID FROM Weather AS p INNER JOIN Weather AS q ON DATEDIFF(p.recordDate, q.recordDate) = 1 WHERE p.temperature > q.temperature;