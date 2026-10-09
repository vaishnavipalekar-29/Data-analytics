CREATE DATABASE BankingDB;
USE bankingdb;

-- Customer
CREATE TABLE Customers (
Customer_id INT PRIMARY KEY,
Firstname Varchar(50) NOT NULL,
Lastname Varchar(50) NOT NULL,
Email Varchar(100) unique,
Phone Varchar(15) UNIQUE
);

alter TABLE CUSTOMERS ADD COLUMN Accountcreationdate date;

-- ADD dob column to customers
ALTER TABLE Customers
ADD DOB date;

-- modify data type of phone to bigint
alter table customers
modify Phone BIGINT;

--  ACCOUNT TABLE 
CREATE TABLE Accounts (
AccountID INT,
Accounttype varchar(50),
Balance decimal(10,2)
);

-- add primary key
ALTER TABLE Accounts
ADD constraint pk_accounts primary key (AccountID);

-- add check constraints
ALTER TABLE Accounts
ADD constraint chk_balance check (balance>=0);

-- add customer id as foreign key
-- (note: first we alter and add column and then we apply foreign key in which first after fk will be created column and 2nd after reference will be existing one)
ALTER table Accounts
ADD customerID INT;

ALTER TABLE Accounts
ADD constraint custid_fk foreign key (customerID) references Customers (customer_id);

-- transaction table
CREATE TABLE Transactions (
TransactionID INT,
TransactionDate Date,
Amount Decimal (10,2),
TransactionType varchar(20)
);

-- add primary key to transactionID
ALTER table Transactions
ADD constraint pk_transactions primary key (TransactionID);

-- add check constraint on amount

ALTER TABLE Transactions
add constraint chl_transaction_amount check (amount>0);

-- add account id as foreign key in transaction
ALTER table Transactions
Add AccountID INT;

ALter table Transactions
ADD constraint fk_accid foreign key (AccountID) references Accounts (AccountID);

-- table branches

CREATE TABLE Branches (
BranchID int,
Branchname varchar(50),
Branchaddress varchar (100),
BranchPhone varchar(15)
);

-- add branch id as pk
ALTER TABLE Branches
ADD constraint pk_branchid primary key (BranchID);

CREATE TABLE AccountBranches (
AccountID INT,
BranchID int,
AssignementDate date );

-- add composite pk (two pk for one table)
ALTER table AccountBranches
ADD constraint pk_accountbranches primary key (AccountID, BranchID);

-- add accountid as foreign key
ALTER TABLE AccountBranches
add constraint fk_ab foreign key (AccountID) references Accounts (AccountID);

-- add branchID foreign key
Alter table AccountBranches
ADD constraint fk_ab_branch foreign key (BranchID) references Branches (BranchID);

-- table loans

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    LoanAmount DECIMAL(10,2) CHECK (LoanAmount > 0),
    InterestRate DECIMAL(4,2),
    StartDate DATE,
    EndDate DATE
);

ALTER TABLE LOANS
modify LoanAmount decimal (12,2);




DESC customers;
Desc accounts;
desc transactions;
desc branches;
desc AccountBranches;
desc Loans;

SELECT CURRENT_DATE;




