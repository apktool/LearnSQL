/**
 * @brief 2016年的投资
 *
 * @details
 *
 * 编写解决方案报告 2016 年 (tiv_2016) 所有满足下述条件的投保人的投保金额之和：
 * 他在 2015 年的投保额 (tiv_2015) 至少跟一个其他投保人在 2015 年的投保额相同。
 * 他所在的城市必须与其他投保人都不同（也就是说 (lat, lon) 不能跟其他任何一个投保人完全相同）。
 * 以 任意顺序 返回结果表。
 *
 * @see [leetcode-585](https://leetcode.cn/problems/investments-in-2016/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Insurance;

Create Table If Not Exists Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float);
Truncate table Insurance;
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40');

-- code

SELECT ROUND(SUM(p.tiv_2016),2) AS tiv_2016 FROM Insurance AS p WHERE
    p.tiv_2015 IN (SELECT tiv_2015 FROM Insurance GROUP BY tiv_2015 HAVING COUNT(1) > 1)
    AND
    CONCAT(lat, lon) IN (SELECT CONCAT(lat, lon) FROM Insurance GROUP BY lat, lon HAVING COUNT(1) = 1);