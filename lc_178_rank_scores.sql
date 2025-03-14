/**
 * @brief 分数排名
 *
 * @details
 *
 * 编写一个解决方案来查询分数的排名。排名按以下规则计算:
 * 分数应按从高到低排列。
 * 如果两个分数相等，那么两个分数的排名应该相同。
 * 在排名相同的分数后，排名数应该是下一个连续的整数。换句话说，排名之间不应该有空缺的数字。
 * 按 score 降序返回结果表。
 *
 * @see [leetcode-178](https://leetcode.cn/problems/rank-scores/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Scores;

Create table If Not Exists Scores (id int, score DECIMAL(3,2));
Truncate table Scores;
insert into Scores (id, score) values ('1', '3.5');
insert into Scores (id, score) values ('2', '3.65');
insert into Scores (id, score) values ('3', '4.0');
insert into Scores (id, score) values ('4', '3.85');
insert into Scores (id, score) values ('5', '4.0');
insert into Scores (id, score) values ('6', '3.65');

--

SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank' FROM Scores ORDER BY score DESC;