/**
 * @brief 游戏玩法分析 I
 *
 * @details
 *
 * 查询每位玩家 第一次登录平台的日期
 *
 * @see [leetcode-511](https://leetcode.cn/problems/game-play-analysis-i/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Activity;

Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-05-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

-- code

SELECT p.player_id AS player_id, MIN(p.event_date) AS first_login FROM Activity AS p GROUP BY p.player_id;

SELECT DISTINCT p.player_id, FIRST_VALUE(p.event_date) OVER (
    PARTITION BY p.player_id ORDER BY p.event_date
    ) AS first_login
FROM Activity AS p;