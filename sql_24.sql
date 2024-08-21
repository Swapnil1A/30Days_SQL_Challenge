select * from customers

--Retrieve the duplicate email address from the Table
select email,count(email) as duplicate_emails from customers
group by 1
having count(email)>1