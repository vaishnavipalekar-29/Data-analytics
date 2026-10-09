use bankingdb;
select * from accounts;

-- partition by
select accountid,accounttype,sum(balance)
OVER(partition by accounttype) as total_balance
from accounts;

-- order by
select accountid,accounttype,sum(Balance)
OVER(order by balance desc) 
from accounts;

-- row_number()
select accountid,balance,row_number()
OVER()
from accounts;

select accountid,balance,accounttype,row_number()
OVER(partition by AccountType)
from accounts;


select accountid,balance,accounttype,row_number()
OVER(order by AccountType)
from accounts;

-- rank()
select accountid,balance,rank()
OVER()
from accounts;

select accountid,accounttype,balance,rank()
OVER(order by AccountType)
from accounts;

select accountid,accounttype,balance,rank()
OVER(order by Balance)
from accounts;

select accountid,accounttype,balance,rank()
OVER(partition by accounttype order by Balance)
from accounts;

Update accounts set balance=2200
where accountid=104;

select * from accounts;

select accountid,accounttype,balance,dense_rank()
OVER(order by balance)
from accounts;

-- lag() and lead()
select accountid,accounttype,balance,
lag(balance)
OVER(order by balance)
from accounts;

select accountid,accounttype,balance,
lag(balance)
OVER(partition by accounttype order by balance)
from accounts;

-- lead()
select accountid,accounttype,balance,
lead(balance)
OVER(order by balance)
from accounts;

select accountid,accounttype,balance,
lead(balance)
OVER(partition by accounttype order by balance)
from accounts;

-- nth value
-- highest
select accountid,balance,
nth_value(accountid,2)
over(order by balance DESC)
from accounts;

-- lowest
select accountid,balance,
nth_value(accountid,2)
over(order by balance)
from accounts;

-- accounttype wise 3rd highest
select accountid,balance,AccountType,
nth_value(accountid,3)
over(partition by AccountType order by balance DESC)
from accounts;
