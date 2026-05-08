mysql> CREATE TABLE BankAccount (account_id VARCHAR(10) PRIMARY KEY NOT NULL,account_holder_name VARCHAR(30) NOT NULL, account_balance INT NOT NULL);
Query OK, 0 rows affected (0.05 sec)

mysql> DESC BANKACCOUNT;
+---------------------+-------------+------+-----+---------+-------+
| Field               | Type        | Null | Key | Default | Extra |
+---------------------+-------------+------+-----+---------+-------+
| account_id          | varchar(10) | NO   | PRI | NULL    |       |
| account_holder_name | varchar(30) | NO   |     | NULL    |       |
| account_balance     | int         | NO   |     | NULL    |       |
+---------------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> INSERT INTO BankAccount (account_id, account_holder_name, account_balance) VALUES (101, 'Rahul', 45000), (102, 'Rohit', 28000), (103, 'Arun', 52000), (104, 'Singh', 31000), (105, 'Vicky', 15000);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM BANKACCOUNT;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | Rahul               |           45000 |
| 102        | Rohit               |           28000 |
| 103        | Arun                |           52000 |
| 104        | Singh               |           31000 |
| 105        | Vicky               |           15000 |
+------------+---------------------+-----------------+
5 rows in set (0.00 sec)

mysql> SELECT account_holder_name, account_balance
    -> FROM BankAccount;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Rahul               |           45000 |
| Rohit               |           28000 |
| Arun                |           52000 |
| Singh               |           31000 |
| Vicky               |           15000 |
+---------------------+-----------------+
5 rows in set (0.00 sec)

mysql> SELECT account_holder_name, account_balance FROM BankAccount WHERE account_balance > 30000;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Rahul               |           45000 |
| Arun                |           52000 |
| Singh               |           31000 |
+---------------------+-----------------+
3 rows in set (0.00 sec)

mysql> UPDATE BankAccount SET account_balance = 50000 WHERE account_id = 101;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM BANKACCOUNT;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | Rahul               |           50000 |
| 102        | Rohit               |           28000 |
| 103        | Arun                |           52000 |
| 104        | Singh               |           31000 |
| 105        | Vicky               |           15000 |
+------------+---------------------+-----------------+
5 rows in set (0.00 sec)