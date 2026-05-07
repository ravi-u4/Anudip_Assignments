```

mysql> use ecommerce;
Database changed

mysql> create table customer(
    -> Customer_id varchar(10) not null primary key,
    -> Customer_name varchar(10) not null,
    -> city varchar(10),
    -> email varchar(20),
    -> address varchar(100),
    -> phone_number varchar(10) not null,
    -> pincode int not null,
    -> bill_no int not null,
    -> state varchar(10) not null,
    -> country varchar(10) not null
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> desc customer;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Customer_id   | varchar(10)  | NO   | PRI | NULL    |       |
| Customer_name | varchar(10)  | NO   |     | NULL    |       |
| city          | varchar(10)  | YES  |     | NULL    |       |
| email         | varchar(20)  | YES  |     | NULL    |       |
| address       | varchar(100) | YES  |     | NULL    |       |
| phone_number  | varchar(10)  | NO   |     | NULL    |       |
| pincode       | int          | NO   |     | NULL    |       |
| bill_no       | int          | NO   |     | NULL    |       |
| state         | varchar(10)  | NO   |     | NULL    |       |
| country       | varchar(10)  | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
10 rows in set (0.01 sec)

mysql> insert into customer
    -> (Customer_id, Customer_name, city, email, address, phone_number, pincode, bill_no, state, country)
    -> values
    -> ('C101', 'Rahul', 'Delhi', 'rahul123@gmail.com', 'Green Park', '9876543210', 110016, 501, 'Delhi', 'India'),
    -> ('C102', 'Arjun', 'Mumbai', 'arjun77@gmail.com', 'Andheri West', '9988776655', 400053, 502, 'Maharashtra', 'India'),
    -> ('C103', 'Aman', 'Bangalore', 'aman.dev@gmail.com', 'MG Road', '9123456780', 560001, 503, 'Karnataka', 'India'),
    -> ('C104', 'Vikram', 'Chennai', 'vikram22@gmail.com', 'T Nagar', '9012345678', 600017, 504, 'TamilNadu', 'India');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+-------------+---------------+-----------+----------------------+--------------+--------------+----------+---------+-------------+---------+
| Customer_id | Customer_name | city      | email                | address      | phone_number | pincode | bill_no | state       | country |
+-------------+---------------+-----------+----------------------+--------------+--------------+----------+---------+-------------+---------+
| C101        | Rahul         | Delhi     | rahul123@gmail.com   | Green Park   | 9876543210   | 110016  | 501     | Delhi       | India   |
| C102        | Arjun         | Mumbai    | arjun77@gmail.com    | Andheri West | 9988776655   | 400053  | 502     | Maharashtra | India   |
| C103        | Aman          | Bangalore | aman.dev@gmail.com   | MG Road      | 9123456780   | 560001  | 503     | Karnataka   | India   |
| C104        | Vikram        | Chennai   | vikram22@gmail.com   | T Nagar      | 9012345678   | 600017  | 504     | TamilNadu   | India   |
+-------------+---------------+-----------+----------------------+--------------+--------------+----------+---------+-------------+---------+
4 rows in set (0.00 sec)

mysql> select Customer_id, Customer_name from customer;
+-------------+---------------+
| Customer_id | Customer_name |
+-------------+---------------+
| C101        | Rahul         |
| C102        | Arjun         |
| C103        | Aman          |
| C104        | Vikram        |
+-------------+---------------+
4 rows in set (0.00 sec)

mysql> alter table customer modify Customer_id varchar(15) not null;
Query OK, 0 rows affected (0.02 sec)

mysql> alter table customer add gst_no varchar(15);
Query OK, 0 rows affected (0.02 sec)

mysql> desc customer;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Customer_id   | varchar(15)  | NO   | PRI | NULL    |       |
| Customer_name | varchar(10)  | NO   |     | NULL    |       |
| city          | varchar(10)  | YES  |     | NULL    |       |
| email         | varchar(20)  | YES  |     | NULL    |       |
| address       | varchar(100) | YES  |     | NULL    |       |
| phone_number  | varchar(10)  | NO   |     | NULL    |       |
| pincode       | int          | NO   |     | NULL    |       |
| bill_no       | int          | NO   |     | NULL    |       |
| state         | varchar(10)  | NO   |     | NULL    |       |
| country       | varchar(10)  | NO   |     | NULL    |       |
| gst_no        | varchar(15)  | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
11 rows in set (0.00 sec)

mysql> alter table customer change column Customer_name name varchar(20);
Query OK, 0 rows affected (0.02 sec)

mysql> desc customer;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| Customer_id  | varchar(15)  | NO   | PRI | NULL    |       |
| name         | varchar(20)  | YES  |     | NULL    |       |
| city         | varchar(10)  | YES  |     | NULL    |       |
| email        | varchar(20)  | YES  |     | NULL    |       |
| address      | varchar(100) | YES  |     | NULL    |       |
| phone_number | varchar(10)  | NO   |     | NULL    |       |
| pincode      | int          | NO   |     | NULL    |       |
| bill_no      | int          | NO   |     | NULL    |       |
| state        | varchar(10)  | NO   |     | NULL    |       |
| country      | varchar(10)  | NO   |     | NULL    |       |
| gst_no       | varchar(15)  | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
11 rows in set (0.00 sec)

mysql> delete from customer where Customer_id = 'C103';
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+-------------+--------+---------+--------------------+--------------+--------------+----------+---------+-------------+---------+--------+
| Customer_id | name   | city    | email              | address      | phone_number | pincode | bill_no | state       | country | gst_no |
+-------------+--------+---------+--------------------+--------------+--------------+----------+---------+-------------+---------+--------+
| C101        | Rahul  | Delhi   | rahul123@gmail.com | Green Park   | 9876543210   | 110016  | 501     | Delhi       | India   | NULL   |
| C102        | Arjun  | Mumbai  | arjun77@gmail.com  | Andheri West | 9988776655   | 400053  | 502     | Maharashtra | India   | NULL   |
| C104        | Vikram | Chennai | vikram22@gmail.com | T Nagar      | 9012345678   | 600017  | 504     | TamilNadu   | India   | NULL   |
+-------------+--------+---------+--------------------+--------------+--------------+----------+---------+-------------+---------+--------+
3 rows in set (0.00 sec)

mysql> create table demo(
    -> id varchar(5) not null primary key,
    -> name varchar(20) not null
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(5)  | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table demo drop primary key;
Query OK, 0 rows affected (0.02 sec)

mysql> alter table demo add primary key(id);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into demo values('101', 'Ansari');
Query OK, 1 row affected (0.00 sec)

mysql> select * from demo;
+-----+--------+
| id  | name   |
+-----+--------+
| 101 | Ansari |
+-----+--------+
1 row in set (0.00 sec)

mysql> truncate table demo;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from demo;
Empty set (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> show tables;
+----------------------+
| Tables_in_ecommerce  |
+----------------------+
| customer             |
| demo                 |
+----------------------+
2 rows in set (0.00 sec)

mysql> create table orders(
    -> order_id int not null auto_increment primary key,
    -> Customer_id varchar(10) not null,
    -> product_id varchar(5) not null,
    -> quantity int not null,
    -> total_price double not null,
    -> payment_mode varchar(20) not null,
    -> order_date date not null,
    -> order_status varchar(20) not null
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| order_id     | int         | NO   | PRI | NULL    | auto_increment |
| Customer_id  | varchar(10) | NO   |     | NULL    |                |
| product_id   | varchar(5)  | NO   |     | NULL    |                |
| quantity     | int         | NO   |     | NULL    |                |
| total_price  | double      | NO   |     | NULL    |                |
| payment_mode | varchar(20) | NO   |     | NULL    |                |
| order_date   | date        | NO   |     | NULL    |                |
| order_status | varchar(20) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> truncate table orders;
Query OK, 0 rows affected (0.01 sec)

mysql> drop table orders;
Query OK, 0 rows affected (0.01 sec)
```
