/**
 * @brief 产品销售分析 I
 *
 * @details
 *
 * 编写解决方案，以获取 Sales 表中所有 sale_id 对应的 product_name 以及该产品的所有 year 和 price 。
 *
 * @see [leetcode-1068](https://leetcode.cn/problems/product-sales-analysis-i/)
 */

 -- schema

create database if not exists leetcode;
use leetcode;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Product;

Create table If Not Exists Sales (sale_id int, product_id int, year int, quantity int, price int);
Create table If Not Exists Product (product_id int, product_name varchar(10));
Truncate table Sales;
insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');
Truncate table Product;
insert into Product (product_id, product_name) values ('100', 'Nokia');
insert into Product (product_id, product_name) values ('200', 'Apple');
insert into Product (product_id, product_name) values ('300', 'Samsung');


-- code

SELECT p.product_name, s.year, s.price FROM Sales AS s LEFT JOIN Product AS p ON s.product_id = p.product_id;