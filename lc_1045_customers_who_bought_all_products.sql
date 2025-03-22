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

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;

Create table If Not Exists Customer (customer_id int, product_key int);
Create table Product (product_key int);
Truncate table Customer;
insert into Customer (customer_id, product_key) values ('1', '5');
insert into Customer (customer_id, product_key) values ('2', '6');
insert into Customer (customer_id, product_key) values ('3', '5');
insert into Customer (customer_id, product_key) values ('3', '6');
insert into Customer (customer_id, product_key) values ('1', '6');
Truncate table Product;
insert into Product (product_key) values ('5');
insert into Product (product_key) values ('6');

-- code

SELECT p.customer_id FROM Customer AS p GROUP BY customer_id HAVING COUNT(DISTINCT(product_key)) = (SELECT COUNT(1) FROM Product);