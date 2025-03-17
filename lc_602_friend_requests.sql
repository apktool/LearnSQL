/**
 * @brief 好友申请 II ：谁有最多的好友
 *
 * @details
 *
 * 编写解决方案，找出拥有最多的好友的人和他拥有的好友数目。
 * 生成的测试用例保证拥有最多好友数目的只有 1 个人。
 *
 * @see [leetcode-602](https://leetcode.cn/problems/friend-requests-ii-who-has-the-most-friends/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS RequestAccepted;

Create table If Not Exists RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null);
Truncate table RequestAccepted;
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09');

-- code

SELECT ids as id, cnt AS num FROM (
    SELECT ids, COUNT(1) AS cnt FROM (
        SELECT requester_id AS ids FROM RequestAccepted AS p UNION ALL SELECT accepter_id FROM RequestAccepted
    ) AS tbl1 GROUP BY ids
) AS tbl2 ORDER BY cnt DESC LIMIT 1;