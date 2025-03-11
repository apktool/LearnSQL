/**
 * @brief 合作过至少三次的演员和导演
 *
 * @details
 *
 * 编写解决方案找出合作过至少三次的演员和导演的 id 对 (actor_id, director_id)
 *
 * @see [leetcode-1050](https://leetcode.cn/problems/actors-and-directors-who-cooperated-at-least-three-times/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS ActorDirector;

Create table If Not Exists ActorDirector (actor_id int, director_id int, timestamp int);
Truncate table ActorDirector;
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '0');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '1');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '2');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '3');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '4');
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '5');
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '6');

-- code

SELECT actor_id, director_id FROM ActorDirector GROUP BY actor_id, director_id HAVING COUNT(1) >=3;