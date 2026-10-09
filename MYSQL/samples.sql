Create Database sample;
use sample;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(100),
    City VARCHAR(50),
    Account_Type VARCHAR(20) NOT NULL,
    Balance DECIMAL(10,2) DEFAULT 0,
    Status VARCHAR(20) DEFAULT 'Active'
);
Insert into Customer
(Customer_ID, Customer_name, Email, Phone, Address, City, Account_type, Balance, Status)
Values
(101, 'Rahul Sharma', 'rahul123@gmail.com', '234424567732', 'MG Road', 'Mumbai', 'Savings', 25000.00, 'Active');

select * from customer;


insert into customer value (102, 'pooja Sharma', 'pooja23@gmail.com', '233642836422', 'gb Road', 'Mumbai', 'Savings', 25000.00, 'active');

Insert into Customer
(Customer_ID, Customer_name, Email, Phone, Address, City, Account_type)
values
 (103, 'nikhil yadav', 'nikhil@gmail.com', '29835372822', 'gogo', 'pune', 'Savings');

insert into customer (Customer_ID, Customer_name, Email, Phone, Address, City, Account_type)
 values 
(104, "priya sharma", "priya@gmail.com", "98765432101", 'priya123', "mumbai", "Current"),
(105, 'rahul patil', 'rahul@gmail.com', '87654321098', 'rahul@12', 'nashik', 'Savings'),
(106, 'sneha kulkarni', 'sneha@gmail.com', '76543210987', 'sneha456', 'nagpur', 'Current')
;

insert into customer (Customer_ID, Customer_name, Email, Phone, Address, City, Account_type)
 values 
 (107, 'amit deshmukh', 'amit@gmail.com', '65432109876', 'amit@123', 'pune', 'Savings'),
(108, 'pooja jadhav', 'pooja@gmail.com', '94321678509', 'pooja789', 'mumbai', 'Savings'),
(109, 'rohan shinde', 'rohan@gmail.com', '83214567908', 'rohan@45', 'kolhapur', 'Current')
;

insert into customer (Customer_ID, Customer_name, Address, City, Account_type, Balance, Status)
 values 
 (110, 'neha pawar','mg road', 'mumbai', 'Savings', 23455, 'active');
 
 -- all records
 -- delete from customers;

-- delete cust_id=1
delete from customer where customer_id=101;

-- update
update customer SET city="thane",address="karva nagar"
where customer_id="102";

-- truncate : delete all records from the table
truncate table customer;

-- drop : will delete all records with structure from database
drop table customer;

use sample;

Create table Employee (
Employee_id int,
Employee_name varchar(50),
Email varchar(50),
Department varchar (20),
Salary Decimal (10,2),
City varchar(50)
);

select * from Employee;



-- add primary key
ALTER TABLE Employee
ADD constraint empid_pk primary key (Employee_id);

-- add unique key
ALTER TABLE Employee
ADD constraint Email_UN UNIQUE (Email);

-- add not null
alter table employee
modify column Employee_name varchar(50) not null;

-- add deafult
alter table employee
alter city set default "mumbai";

-- add check constraints
alter table employee
add constraint sal_chk check(salary>0);

desc Employee;

create table department (
dept_id int primary key,
dept_name varchar(20));

-- parent table department ( dept_id, dept_name)
-- child table employee (emp_id (pk), dept_id (fk))

alter table employee
drop column department;

alter table employee
add column department_id int; 

-- add foreign key

alter table employee
add constraint deptid_fk foreign key(department_id) references department(dept_id)
ON DELETE cascade
on update cascade;
 
 -- 5 records in department
 
 insert into department values(101,'IT');
 
 select*from department;
 
 select * from Employee;
 
 insert into department values(102,'IT'),(103,'ee'),(104,'sub');
 
  insert into employee values (1,'akash','akash12@gmail.com',23937,'mumbai',101),
(2,'riya','riya45@gmail.com',18452,'pune',102),
(3,'rohan','rohan23@gmail.com',29731,'nashik',103),
(4,'sneha','sneha78@gmail.com',31564,'nagpur',104);

delete from employee where employee_id=1; -- deletes employee data of that particular dept

delete from department where dept_id=102;   -- deletes whole dept

update department set dept_id=107 where dept_id=104;