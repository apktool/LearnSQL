/**
 * @brief 游戏玩法分析 IV
 *
 * @details
 *
 * 编写解决方案，报告在首次登录的第二天再次登录的玩家的 比率，四舍五入到小数点后两位。换句话说，你需要计算从首次登录日期开始至少连续两天登录的玩家的数量，然后除以玩家总数。
 *
 * @see [leetcode-550](https://leetcode.cn/problems/game-play-analysis-iv/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Activity;

Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

-- code

SELECT IFNULL(ROUND(COUNT(DISTINCT(Result.player_id)) / COUNT(DISTINCT(Activity.player_id)), 2), 0) AS fraction
FROM (
  SELECT Activity.player_id AS player_id FROM (
    SELECT player_id, DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS second_date FROM Activity GROUP BY player_id
  ) AS Expected, Activity
  WHERE Activity.event_date = Expected.second_date AND Activity.player_id = Expected.player_id
) AS Result, Activity;