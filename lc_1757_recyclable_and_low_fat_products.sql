/**
 * @brief 可回收且低脂的产品
 *
 * @details
 *
 * 编写解决方案找出既是低脂又是可回收的产品编号。
 * 返回结果 无顺序要求 。
 *
 * @see [leetcode-1757](https://leetcode.cn/problems/recyclable-and-low-fat-products/)
 */

-- schema
create database if not exists leetcode;
use leetcode;

Create table If Not Exists Products (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'));
Truncate table Products;
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N');
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N');

-- code

select product_id from Products where low_fats='Y' and recyclable = 'Y';