/**
 * @brief 找出所有从不点任何东西的顾客。
 *
 * @details
 *
 * 找出所有从不点任何东西的顾客。
 * 以 任意顺序 返回结果表。
 * 结果格式如下所示。
 *
 * @see [leetcode-183](https://leetcode.cn/problems/customers-who-never-order/)
 */

 -- schema

use leetcode;

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;

Create table If Not Exists Customers (id int, name varchar(255));
Create table If Not Exists Orders (id int, customerId int);
Truncate table Customers;
insert into Customers (id, name) values ('1', 'Joe');
insert into Customers (id, name) values ('2', 'Henry');
insert into Customers (id, name) values ('3', 'Sam');
insert into Customers (id, name) values ('4', 'Max');
Truncate table Orders;
insert into Orders (id, customerId) values ('1', '3');
insert into Orders (id, customerId) values ('2', '1');

-- code

SELECT p.name AS Customers FROM Customers AS p LEFT JOIN Orders AS q ON p.id= q.customerId WHERE q.customerId IS NULL;


SELECT p.name AS Customers FROM Customers AS p WHERE p.id NOT IN (SELECT customerId FROM Orders);