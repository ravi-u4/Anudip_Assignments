mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| ecom               |
| hw                 |
| information_schema |
| mysql              |
| performance_schema |
| studentmanagement  |
| students           |
| sys                |
+--------------------+
8 rows in set (0.03 sec)

mysql> USE ecom;
Database changed

mysql> SHOW TABLES;
+----------------+
| Tables_in_ecom |
+----------------+
| bankaccount    |
| customer       |
| demo           |
| orders         |
| product        |
+----------------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM orders;
Empty set (0.02 sec)

mysql> DESC orders;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| order_id     | int         | NO   | PRI | NULL    | auto_increment |
| c_id         | varchar(5)  | NO   | MUL | NULL    |                |
| product_id   | varchar(30) | NO   | MUL | NULL    |                |
| quantity     | int         | NO   |     | NULL    |                |
| total_price  | double      | NO   |     | NULL    |                |
| payment_mode | varchar(30) | NO   |     | NULL    |                |
| order_date   | date        | NO   |     | NULL    |                |
| order_status | varchar(30) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.01 sec)

mysql> SELECT * FROM product;
Empty set (0.00 sec)

mysql> CREATE DATABASE aggregation;
Query OK, 1 row affected (0.01 sec)

mysql> USE aggregation;
Database changed

mysql> CREATE TABLE product(
    -> product_id VARCHAR(15) PRIMARY KEY,
    -> product_name VARCHAR(30) NOT NULL,
    -> category VARCHAR(30) NOT NULL,
    -> original_price DOUBLE NOT NULL,
    -> selling_price DOUBLE NOT NULL,
    -> stock INT NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> DESC product;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_id     | varchar(15) | NO   | PRI | NULL    |       |
| product_name   | varchar(30) | NO   |     | NULL    |       |
| category       | varchar(30) | NO   |     | NULL    |       |
| original_price | double      | NO   |     | NULL    |       |
| selling_price  | double      | NO   |     | NULL    |       |
| stock          | int         | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> INSERT INTO product VALUES
    -> ('P101','SMART PHONE','ELECTRONICS',15000,13000,35),
    -> ('P102','WASHING MACHINE','ELECTRONICS',10000,9000,50),
    -> ('P103','CHAIR','FURNITURE',650,450,27),
    -> ('P104','SOFA','FURNITURE',17000,13500,15),
    -> ('P105','SMART WATCH','ELECTRONICS',19000,12500,55);
Query OK, 5 rows affected (0.01 sec)

mysql> SELECT * FROM product;
+------------+-----------------+-------------+----------------+---------------+-------+
| product_id | product_name    | category    | original_price | selling_price | stock |
+------------+-----------------+-------------+----------------+---------------+-------+
| P101       | SMART PHONE     | ELECTRONICS |          15000 |         13000 |    35 |
| P102       | WASHING MACHINE | ELECTRONICS |          10000 |          9000 |    50 |
| P103       | CHAIR           | FURNITURE   |            650 |           450 |    27 |
| P104       | SOFA            | FURNITURE   |          17000 |         13500 |    15 |
| P105       | SMART WATCH     | ELECTRONICS |          19000 |         12500 |    55 |
+------------+-----------------+-------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> SELECT SUM(selling_price) FROM product;
+--------------------+
| SUM(selling_price) |
+--------------------+
|              48450 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(selling_price) FROM product;
+--------------------+
| AVG(selling_price) |
+--------------------+
|               9690 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM product;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT MAX(stock) FROM product;
+------------+
| MAX(stock) |
+------------+
|         55 |
+------------+
1 row in set (0.01 sec)

mysql> SELECT MIN(stock) FROM product;
+------------+
| MIN(stock) |
+------------+
|         15 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM product ORDER BY stock;
+------------+-----------------+-------------+----------------+---------------+-------+
| product_id | product_name    | category    | original_price | selling_price | stock |
+------------+-----------------+-------------+----------------+---------------+-------+
| P104       | SOFA            | FURNITURE   |          17000 |         13500 |    15 |
| P103       | CHAIR           | FURNITURE   |            650 |           450 |    27 |
| P101       | SMART PHONE     | ELECTRONICS |          15000 |         13000 |    35 |
| P102       | WASHING MACHINE | ELECTRONICS |          10000 |          9000 |    50 |
| P105       | SMART WATCH     | ELECTRONICS |          19000 |         12500 |    55 |
+------------+-----------------+-------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM product ORDER BY stock DESC;
+------------+-----------------+-------------+----------------+---------------+-------+
| product_id | product_name    | category    | original_price | selling_price | stock |
+------------+-----------------+-------------+----------------+---------------+-------+
| P105       | SMART WATCH     | ELECTRONICS |          19000 |         12500 |    55 |
| P102       | WASHING MACHINE | ELECTRONICS |          10000 |          9000 |    50 |
| P101       | SMART PHONE     | ELECTRONICS |          15000 |         13000 |    35 |
| P103       | CHAIR           | FURNITURE   |            650 |           450 |    27 |
| P104       | SOFA            | FURNITURE   |          17000 |         13500 |    15 |
+------------+-----------------+-------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM product ORDER BY stock DESC LIMIT 3;
+------------+-----------------+-------------+----------------+---------------+-------+
| product_id | product_name    | category    | original_price | selling_price | stock |
+------------+-----------------+-------------+----------------+---------------+-------+
| P105       | SMART WATCH     | ELECTRONICS |          19000 |         12500 |    55 |
| P102       | WASHING MACHINE | ELECTRONICS |          10000 |          9000 |    50 |
| P101       | SMART PHONE     | ELECTRONICS |          15000 |         13000 |    35 |
+------------+-----------------+-------------+----------------+---------------+-------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE employee(
    -> emp_id VARCHAR(15) PRIMARY KEY,
    -> emp_name VARCHAR(30) NOT NULL,
    -> department VARCHAR(30) NOT NULL,
    -> salary INT NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO employee VALUES
    -> ('101','RAVI','MANAGEMENT',50000),
    -> ('102','GAURAV','IT',51000),
    -> ('103','PANKAJ','HR',45000),
    -> ('104','DEVANK','IT',25000),
    -> ('105','VIRAT','SALES',15000);
Query OK, 5 rows affected (0.01 sec)

mysql> SELECT * FROM employee;
+--------+----------+------------+--------+
| emp_id | emp_name | department | salary |
+--------+----------+------------+--------+
| 101    | RAVI     | MANAGEMENT |  50000 |
| 102    | GAURAV   | IT         |  51000 |
| 103    | PANKAJ   | HR         |  45000 |
| 104    | DEVANK   | IT         |  25000 |
| 105    | VIRAT    | SALES      |  15000 |
+--------+----------+------------+--------+
5 rows in set (0.00 sec)

mysql> SELECT department, COUNT(*) AS total_emp
    -> FROM employee
    -> GROUP BY department;
+------------+-----------+
| department | total_emp |
+------------+-----------+
| MANAGEMENT |         1 |
| IT         |         2 |
| HR         |         1 |
| SALES      |         1 |
+------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT department, SUM(salary) AS total_sal
    -> FROM employee
    -> GROUP BY department;
+------------+-----------+
| department | total_sal |
+------------+-----------+
| MANAGEMENT |     50000 |
| IT         |     76000 |
| HR         |     45000 |
| SALES      |     15000 |
+------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT department, AVG(salary) AS avg_sal
    -> FROM employee
    -> GROUP BY department;
+------------+------------+
| department | avg_sal    |
+------------+------------+
| MANAGEMENT | 50000.0000 |
| IT         | 38000.0000 |
| HR         | 45000.0000 |
| SALES      | 15000.0000 |
+------------+------------+
4 rows in set (0.00 sec)

mysql> SELECT department, salary, COUNT(*)
    -> FROM employee
    -> GROUP BY department, salary;
+------------+--------+----------+
| department | salary | COUNT(*) |
+------------+--------+----------+
| MANAGEMENT |  50000 |        1 |
| IT         |  51000 |        1 |
| HR         |  45000 |        1 |
| IT         |  25000 |        1 |
| SALES      |  15000 |        1 |
+------------+--------+----------+
5 rows in set (0.00 sec)

mysql> SELECT department, COUNT(*) AS total_employee
    -> FROM employee
    -> GROUP BY department
    -> HAVING COUNT(*) > 1;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| IT         |              2 |
+------------+----------------+
1 row in set (0.01 sec)

mysql> SELECT department, SUM(salary) AS total_salary
    -> FROM employee
    -> GROUP BY department
    -> HAVING SUM(salary) > 25000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| MANAGEMENT |        50000 |
| IT         |        76000 |
| HR         |        45000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> SELECT department, AVG(salary) AS avg_salary
    -> FROM employee
    -> GROUP BY department
    -> HAVING AVG(salary) > 25000;
+------------+------------+
| department | avg_salary |
+------------+------------+
| MANAGEMENT | 50000.0000 |
| IT         | 38000.0000 |
| HR         | 45000.0000 |
+------------+------------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE employee RENAME TO emp;
Query OK, 0 rows affected (0.03 sec)