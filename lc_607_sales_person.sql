/**
 * @brief 销售员
 *
 * @details
 *
 * 编写解决方案，找出没有任何与名为 “RED” 的公司相关的订单的所有销售人员的姓名。
 * 以 任意顺序 返回结果表。
 *
 * @see [leetcode-607](https://leetcode.cn/problems/sales-person/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS SalesPerson;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Orders;

Create table If Not Exists SalesPerson (sales_id int, name varchar(255), salary int, commission_rate int, hire_date date);
Create table If Not Exists Company (com_id int, name varchar(255), city varchar(255));
Create table If Not Exists Orders (order_id int, order_date date, com_id int, sales_id int, amount int);
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('1', 'John', '100000', '6', '2006-04-01');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('2', 'Amy', '12000', '5', '2010-05-01');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('3', 'Mark', '65000', '12', '2008-12-25');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('4', 'Pam', '25000', '25', '2005-01-01');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('5', 'Alex', '5000', '10', '2007-02-03');
Truncate table Company;
insert into Company (com_id, name, city) values ('1', 'RED', 'Boston');
insert into Company (com_id, name, city) values ('2', 'ORANGE', 'New York');
insert into Company (com_id, name, city) values ('3', 'YELLOW', 'Boston');
insert into Company (com_id, name, city) values ('4', 'GREEN', 'Austin');
Truncate table Orders;
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('1', '2014-01-01', '3', '4', '10000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('2', '2014-02-01', '4', '5', '5000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('3', '2014-03-01', '1', '1', '50000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('4', '2014-04-01', '1', '4', '25000');


-- code

SELECT s.name FROM SalesPerson AS s WHERE s.sales_id NOT IN (
    SELECT o.sales_id FROM Orders AS o LEFT JOIN Company AS c ON o.com_id = c.com_id WHERE c.name = 'RED'
)