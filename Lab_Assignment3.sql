/*
QUESTION:

Create database Studentmanagementsystem contain  "Student" table with the following a columns:StudentId,FirstName,lastName
and "Course" table with the following a columns: CourseId,CourseName 
and Enrollment table with the following a columns:EnrollmentID,StudentID(Foreign key),CourseID(Foreign Key).
You want to use inner join to generate a list of all possible student-course combinations.

*/

--ANSWER:


mysql> CREATE DATABASE StudentManagementSystem;
Query OK, 1 row affected (0.02 sec)

mysql> USE StudentManagementSystem;
Database changed
mysql> CREATE TABLE Student (StudentID INT PRIMARY KEY, FirstName VARCHAR(50), LastName VARCHAR(50));
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE Course (CourseID INT PRIMARY KEY, CourseName VARCHAR(100));
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Enrollment (EnrollmentID INT PRIMARY KEY, StudentID INT, CourseID INT, FOREIGN KEY (StudentID) REFERENCES Student(StudentID), FOREIGN KEY (CourseID) REFERENCES Course(CourseID));
Query OK, 0 rows affected (0.06 sec)

mysql> DESC student;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| StudentID | int         | NO   | PRI | NULL    |       |
| FirstName | varchar(50) | YES  |     | NULL    |       |
| LastName  | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> DESC course;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| CourseID   | int          | NO   | PRI | NULL    |       |
| CourseName | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> DESC enrollment;
+--------------+------+------+-----+---------+-------+
| Field        | Type | Null | Key | Default | Extra |
+--------------+------+------+-----+---------+-------+
| EnrollmentID | int  | NO   | PRI | NULL    |       |
| StudentID    | int  | YES  | MUL | NULL    |       |
| CourseID     | int  | YES  | MUL | NULL    |       |
+--------------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> INSERT INTO Student VALUES (1,'MS','Dhoni'),(2,'Rohit','Sharma'),(3,'Virat','Kohli');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Student;
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | MS        | Dhoni    |
|         2 | Rohit     | Sharma   |
|         3 | Virat     | Kohli    |
+-----------+-----------+----------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Course VALUES (101,'Mathematics'),(102,'Computer Science'),(103,'Physics');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM course;
+----------+------------------+
| CourseID | CourseName       |
+----------+------------------+
|      101 | Mathematics      |
|      102 | Computer Science |
|      103 | Physics          |
+----------+------------------+
3 rows in set (0.01 sec)

mysql> INSERT INTO Enrollment VALUES (1,1,101),(2,1,102),(3,2,103),(4,3,101);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Enrollment;
+--------------+-----------+----------+
| EnrollmentID | StudentID | CourseID |
+--------------+-----------+----------+
|            1 |         1 |      101 |
|            2 |         1 |      102 |
|            3 |         2 |      103 |
|            4 |         3 |      101 |
+--------------+-----------+----------+
4 rows in set (0.00 sec)

mysql> SELECT s.FirstName, c.CourseName
    -> FROM Enrollment e
    -> INNER JOIN Student s
    -> ON e.StudentID = s.StudentID
    -> INNER JOIN Course c
    -> ON e.CourseID = c.CourseID;
+-----------+------------------+
| FirstName | CourseName       |
+-----------+------------------+
| MS        | Mathematics      |
| MS        | Computer Science |
| Rohit     | Physics          |
| Virat     | Mathematics      |
+-----------+------------------+
4 rows in set (0.00 sec)