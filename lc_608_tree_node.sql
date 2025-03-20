/**
 * @brief 树节点
 *
 * @details
 *
 * 树中的每个节点可以是以下三种类型之一：
 * "Leaf"：节点是叶子节点。
 * "Root"：节点是树的根节点。
 * "lnner"：节点既不是叶子节点也不是根节点。
 * 编写一个解决方案来报告树中每个节点的类型。
 *
 * @see [leetcode-608](https://leetcode.cn/problems/tree-node/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Tree;

Create table If Not Exists Tree (id int, p_id int);
Truncate table Tree;
insert into Tree (id, p_id) values ('1', NULL);
insert into Tree (id, p_id) values ('2', '1');
insert into Tree (id, p_id) values ('3', '1');
insert into Tree (id, p_id) values ('4', '2');
insert into Tree (id, p_id) values ('5', '2');

-- code

SELECT
    id AS `Id`,
    CASE
        WHEN Tree.id = (SELECT atree.id FROM Tree atree WHERE atree.p_id IS NULL)
          THEN 'Root'
        WHEN Tree.id IN (SELECT atree.p_id FROM Tree atree)
          THEN 'Inner'
        ELSE 'Leaf'
    END AS Type
FROM
    Tree
ORDER BY `Id`;