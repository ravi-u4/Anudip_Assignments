mysql> create database if not exists joins;
Query OK, 1 row affected (0.09 sec)

mysql> use joins;
Database changed
mysql> create table depart(d_id int primary key not null, d_name varchar(30) not null );
Query OK, 0 rows affected (0.11 sec)

mysql> desc depart;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| d_id   | int         | NO   | PRI | NULL    |       |
| d_name | varchar(30) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.04 sec)

mysql> insert into depart values (101, 'HR'), (102, 'FINANCE'),(103, 'IT'), (104, 'MARKETING');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from depart;
+------+-----------+
| d_id | d_name    |
+------+-----------+
|  101 | HR        |
|  102 | FINANCE   |
|  103 | IT        |
|  104 | MARKETING |
+------+-----------+
4 rows in set (0.00 sec)

mysql> create table emp(e_id int primary key not null, e_name varchar(10) not null, d_id int, Foreign key (d_id) references depart (d_id));
Query OK, 0 rows affected (0.09 sec)

mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| e_id   | int         | NO   | PRI | NULL    |       |
| e_name | varchar(10) | NO   |     | NULL    |       |
| d_id   | int         | YES  | MUL | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into emp values (1, 'Pankaj', 101), (2, 'Ravi', 102), (3, 'Gaurav', 103), (4, 'Vikas', null), (5, 'Raj', 104);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+------+--------+------+
| e_id | e_name | d_id |
+------+--------+------+
|    1 | Pankaj |  101 |
|    2 | Ravi   |  102 |
|    3 | Gaurav |  103 |
|    4 | Vikas  | NULL |
|    5 | Raj    |  104 |
+------+--------+------+
5 rows in set (0.00 sec)


mysql> select e_name, d_name from emp inner join depart on emp.d_id = depart.d_id;
+--------+-----------+
| e_name | d_name    |
+--------+-----------+
| Pankaj | HR        |
| Ravi   | FINANCE   |
| Gaurav | IT        |
| Raj    | MARKETING |
+--------+-----------+
4 rows in set (0.00 sec)

mysql> select e_name, d_name from emp left join depart on emp.d_id = depart.d_id;
+--------+-----------+
| e_name | d_name    |
+--------+-----------+
| Pankaj | HR        |
| Ravi   | FINANCE   |
| Gaurav | IT        |
| Vikas  | NULL      |
| Raj    | MARKETING |
+--------+-----------+
5 rows in set (0.00 sec)

mysql> select e_name, d_name from emp right join depart on emp.d_id = depart.d_id;
+--------+-----------+
| e_name | d_name    |
+--------+-----------+
| Pankaj | HR        |
| Ravi   | FINANCE   |
| Gaurav | IT        |
| Raj    | MARKETING |
+--------+-----------+
4 rows in set (0.00 sec)


mysql> select e_name, d_name from emp full join depart;
+--------+-----------+
| e_name | d_name    |
+--------+-----------+
| Pankaj | MARKETING |
| Pankaj | IT        |
| Pankaj | FINANCE   |
| Pankaj | HR        |
| Ravi   | MARKETING |
| Ravi   | IT        |
| Ravi   | FINANCE   |
| Ravi   | HR        |
| Gaurav | MARKETING |
| Gaurav | IT        |
| Gaurav | FINANCE   |
| Gaurav | HR        |
| Vikas  | MARKETING |
| Vikas  | IT        |
| Vikas  | FINANCE   |
| Vikas  | HR        |
| Raj    | MARKETING |
| Raj    | IT        |
| Raj    | FINANCE   |
| Raj    | HR        |
+--------+-----------+
20 rows in set, 1 warning (0.01 sec)

mysql> select e_name, d_name from emp cross join depart;
+--------+-----------+
| e_name | d_name    |
+--------+-----------+
| Pankaj | MARKETING |
| Pankaj | IT        |
| Pankaj | FINANCE   |
| Pankaj | HR        |
| Ravi   | MARKETING |
| Ravi   | IT        |
| Ravi   | FINANCE   |
| Ravi   | HR        |
| Gaurav | MARKETING |
| Gaurav | IT        |
| Gaurav | FINANCE   |
| Gaurav | HR        |
| Vikas  | MARKETING |
| Vikas  | IT        |
| Vikas  | FINANCE   |
| Vikas  | HR        |
| Raj    | MARKETING |
| Raj    | IT        |
| Raj    | FINANCE   |
| Raj    | HR        |
+--------+-----------+
20 rows in set (0.00 sec)

mysql> create database if not exists store_pro;
Query OK, 1 row affected (0.02 sec)

mysql> use store_pro;
Database changed
mysql> create table emp(id int primary key not null, name varchar(10) not null, depart varchar(10) not null, salary int);
Query OK, 0 rows affected (0.06 sec)

mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| name   | varchar(10) | NO   |     | NULL    |       |
| depart | varchar(10) | NO   |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into emp values (1, 'Pankaj', 'IT', 7500);
Query OK, 1 row affected (0.01 sec)

mysql> select * from emp;
+----+--------+--------+--------+
| id | name   | depart | salary |
+----+--------+--------+--------+
|  1 | Pankaj | IT     |   7500 |
+----+--------+--------+--------+
1 row in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmp()
    -> BEGIN
    ->     SELECT * FROM Emp;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> call getemp;
+----+--------+--------+--------+
| id | name   | depart | salary |
+----+--------+--------+--------+
|  1 | Pankaj | IT     |   7500 |
+----+--------+--------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call getemp();
+----+--------+--------+--------+
| id | name   | depart | salary |
+----+--------+--------+--------+
|  1 | Pankaj | IT     |   7500 |
+----+--------+--------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmpD(IN d_name VARCHAR(10))
    -> BEGIN
    ->     SELECT *
    ->     FROM Emp
    ->     WHERE depart = d_name;
    -> END //
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> DELIMITER ;
mysql> call getempd();
ERROR 1318 (42000): Incorrect number of arguments for PROCEDURE store_pro.getempd; expected 1, got 0
mysql> call getempd('IT');
+----+--------+--------+--------+
| id | name   | depart | salary |
+----+--------+--------+--------+
|  1 | Pankaj | IT     |   7500 |
+----+--------+--------+--------+
1 row in set (0.05 sec)

Query OK, 0 rows affected (0.06 sec)


mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | NO   | PRI | NULL    |       |
| name   | varchar(10) | NO   |     | NULL    |       |
| depart | varchar(10) | NO   |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE AddEmp(
    ->     IN  id INT,
    ->     IN name VARCHAR(10),
    ->     IN depart VARCHAR(10),
    ->     IN salary INT
    -> )
    -> BEGIN
    ->     INSERT INTO Emp(id, name, depart, salary)
    ->     VALUES(id, name, depart, salary);
    -> END //
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> DELIMITER ;

mysql> call addemp(2,ravi,HR,5000);
ERROR 1054 (42S22): Unknown column 'ravi' in 'field list'
mysql> call addemp(2,'ravi','HR',5000);
Query OK, 1 row affected (0.06 sec)


mysql> SELECT COUNT(*) FROM Emp;
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.06 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmpCount()
    -> BEGIN
    ->     SELECT COUNT(*) FROM Emp;
    -> END //
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> DELIMITER ;
mysql> call getempcount;
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmpCount1()
    -> BEGIN
    ->     SELECT COUNT(*) as total FROM Emp;
    -> END //
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> DELIMITER ;
mysql> call getempcount1;
+-------+
| total |
+-------+
|     2 |
+-------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> SELECT sum(salary) as total FROM Emp;
+-------+
| total |
+-------+
| 12500 |
+-------+
1 row in set (0.05 sec)


mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmpCount2()
    -> BEGIN
    ->     SELECT COUNT(*) as total FROM Emp;
    ->     SELECT sum(salary) as total_sal FROM Emp;
    -> END //
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> DELIMITER ;
mysql> call getempcount2;
+-------+
| total |
+-------+
|     2 |
+-------+
1 row in set (0.05 sec)

+-----------+
| total_sal |
+-----------+
|     12500 |
+-----------+
1 row in set (0.05 sec)

Query OK, 0 rows affected (0.05 sec)

mysql> SELECT sum(salary), count(*) as total_sal FROM Emp;
+-------------+-----------+
| sum(salary) | total_sal |
+-------------+-----------+
|       12500 |         2 |
+-------------+-----------+
1 row in set (0.02 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmpCount3()
    -> BEGIN
    ->     SELECT * FROM Emp;
    ->     SELECT sum(salary), count(*) as total_sal FROM Emp;
    -> END //
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> DELIMITER ;
mysql> call getempcount3;
+----+--------+--------+--------+
| id | name   | depart | salary |
+----+--------+--------+--------+
|  1 | Pankaj | IT     |   7500 |
|  2 | ravi   | HR     |   5000 |
+----+--------+--------+--------+
2 rows in set (0.00 sec)

+-------------+-----------+
| sum(salary) | total_sal |
+-------------+-----------+
|       12500 |         2 |
+-------------+-----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql>