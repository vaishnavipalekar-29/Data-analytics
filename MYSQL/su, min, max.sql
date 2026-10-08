USE bankingdb;

Show tables;

-- Aggregate function
-- sum, min,max,count,average
-- group by

select * from accounts;

-- accounttype wise total balance

select Accounttype, sum(balance) as "total_balance" from accounts group by Accounttype;

-- distinct (unique) mtlb repetive nahi dikhata 

select Accounttype from accounts;

select distinct Accounttype from accounts;

-- how many account type you have

select count(distinct Accounttype) as "number_of_accounts" from accounts;

-- count total accounts in account table
-- if pk is there
select count(accountid) as "total_no_accounts" from accounts;

-- if pk is not there
select count(*) as "total_no_accounts"  from accounts;

-- count total accounts for each account_type
select Accounttype, count(accountid) from accounts group by Accounttype;

-- average balance in each accpunt_type
select Accounttype, avg(balance) from accounts group by Accounttype;

-- highest balance in each accpunt_type
select Accounttype, max(balance) from accounts group by Accounttype;

-- lowest balance in each accpunt_type
select Accounttype, min(balance) from accounts group by Accounttype;

-- min, max, sum, count, avg of balance in one go
select min(balance) as min_bal, max(balance) as max_bal, sum(balance) as total_bal, avg(balance) as avg_bal,count(accountid) as total_account from accounts;

-- find avg balance of savings accounts by customer

select Accounttype, avg(balance) from accounts where Accounttype="savings" group by CustomerID;

select CustomerID, avg(balance) from accounts where Accounttype="savings" group by CustomerID;

-- find account type whose total balance is greater than 100000

select Accounttype, sum(balance) from accounts group by Accounttype having sum(balance)>100000;



















