use Employee;
select * from emp;
insert into emp(empId, emp_name, address, salary,department, age) values(10, 'manoj', 'modinagar', 2000,'IOS', 23);
insert into emp(empId, emp_name, address, salary,department, age) values(11, 'manoj', 'modinagar', 8000,'IOS', 23);
insert into emp(empId, emp_name, address, salary,department, age) values(12, 'amit', 'modinagar', 5000,'WEB', 23);
insert into emp(empId, emp_name, address, salary,department, age) values(13, 'vinod', 'modinagar', 6000,'Native', 23);
insert into emp(empId, emp_name, address, salary,department, age) values(14, 'suman', 'modinagar', 2000,'Kubernet', 23);
insert into emp(empId, emp_name, address, salary,department, age) values(15, 'rahul', 'modinagar', 2000,'Swift', 23);
insert into emp(empId, emp_name, address, salary,department, age) values(16, 'amit', 'modinagar', 5000,'Java', 23);
insert into emp(empId, emp_name, address, salary,department, age) values(17, 'vinod', 'modinagar', 6000,'Java', 23);
insert into emp(empId, emp_name, address, salary,department, age) values(18, 'vinod?K', 'modinagar', 8000,'IOS', 23);

alter table emp add column department varchar(50);
update emp set department="android" limit 3;
SET SQL_SAFE_UPDATES = 0;
update emp set department="IOS" where empId in (select EmpId from (select empId from emp limit 2 offset 3) as tempTable);
update emp set department="WEb" where department is null;


SELECT * FROM emp LIMIT 2;

SELECT * FROM emp LIMIT 2 OFFSET 3;
SELECT * FROM emp;

select salary , emp_name from emp e1;
select distinct(salary) , emp_name from emp e1;
#nth highest salary
select distinct(salary),emp_name from emp e1 where (select count(distinct salary) from emp e2 where e1.salary<e2.salary)=(n-1);

select distinct(salary), emp_name from emp e1 where (select count(distinct salary) from emp e2 where e1.salary<e2.salary)=1;

select distinct(salary) from emp where oder;

##nth number salary

## working
#select distinct salary from emp order by salary desc limit n-1,1;
select distinct salary from emp order by  salary desc limit 0, 1;
select distinct salary from emp order by  salary desc limit 1, 1;
select distinct salary from emp order by  salary desc limit 2, 1;
select distinct salary from emp group by salary order by  salary desc;
select distinct salary from emp order by  salary;


## working
##SELECT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET N-1;
select * from emp order by salary desc limit 1 offset 0;
select * from emp order by salary desc limit 1 offset 1;
select * from emp order by salary desc limit 1 offset 2;

select distinct salary from emp order by salary desc limit 3 offset 0;

select * from emp e1;
##not working
##SELECT salary FROM employees e1 WHERE N - 1 = (SELECT COUNT(DISTINCT salary) FROM employees e2 WHERE e2.salary > e1.salary);
select * from emp e1 where 2 =(select count(distinct salary) from emp e2 where e2.salary >e1.salary);

SELECT MAX(salary) FROM emp WHERE salary < (SELECT MAX(salary) FROM emp);

SELECT MAX(salary) FROM emp;

##nth number salary
select max(salary) from emp where department='ios';
select max(salary) from emp where department='android';
select max(salary) from emp where department='android' and salary<(select max(salary) from emp where department='android');

select * from emp where department='android' order by salary desc limit 1 offset 2;




select count(distinct salary) from emp e2;

Explain ANALYZE  select * from emp;

##Duplicate records
select emp_Name, COUNT(*) from emp group by emp_Name  HAVING COUNT(*) > 1;

select  min(emp_Name) from emp group by emp_Name;
select min(empId) from emp group by emp_Name;
select min(empId),emp_Name, count(*) as count from emp group by emp_Name;
select * from emp;
select min(empId) from emp group by empId;

SET SQL_SAFE_UPDATES = 0;

select empId, min(emp_Name) as empName from emp group by emp_Name;

##deleten Dublicate recoords

##working fine
select emp_Name, min(empId) as empId,  count(*) as count from emp group by emp_Name;
##working fine
select * from emp where empId Not In(select min(empId) as empId from emp group by emp_Name);
##not working 
delete from emp where empId Not In(select min(empId) as empId from emp  group by emp_Name);
select min(empId) as empId from emp group by emp_Name;

select * from emp;

##working
DELETE FROM emp
WHERE empId NOT IN (
    SELECT empId
    FROM (SELECT min(empId) AS empId FROM emp GROUP BY emp_Name) AS temp_table
);

DELETE e1 FROM emp e1
LEFT JOIN (
    SELECT MIN(empId) AS empId FROM emp GROUP BY emp_Name
) e2 ON e1.empId = e2.empId
WHERE e2.empId IS NULL;

select * FROM emp e1
LEFT JOIN (
    SELECT MIN(empId) AS empId FROM emp GROUP BY emp_Name
) e2 ON e1.empId = e2.empId;






Delete e1 from emp e1 
left join (select min(empId) as EmpDi from emp  order by  emp_Name) e2 on e1.empId=e2.empId 
where e2.EmpDi is null;


SELECT empId FROM (SELECT min(empId) AS empId FROM emp GROUP BY emp_Name) AS temp_table;

DELETE FROM emp
WHERE empId NOT IN (1,2);

SELECT  distinct salary FROM emp order by  salary desc LIMIT 1 offset 2;

DELIMITER //
CREATE PROCEDURE GetUsers()
BEGIN
  SELECT * FROM users;
END //
DELIMITER ;

##find Date 
SELECT NOW();

SELECT DISTINCT salary FROM emp;

SELECT 
    Salary
FROM
    emp
GROUP BY salary;


## ALTER TABLE users CHANGE name full_name VARCHAR(50);
set sql_safe_updates= 0;
alter table emp change   empName emp_name varchar(200);
##or
alter table emp change column emp_name empName  varchar(200);
alter table emp change empName emp_name varchar(200);
alter table emp add mangaer_name varchar(20);
alter table emp drop column mangaer_name;
alter table emp add age int;
alter table emp modify column age text;
##or
alter table emp modify  age int;
#version >=8.0.13
alter table emp add column join_date Date default(CURRENT_DATE);
 # or 
ALTER TABLE emp ADD COLUMN join_date DATE DEFAULT (curDate());

alter table emp drop column join_date;

select now();



select * from emp;
select 1 from emp where EmpId=2;
SELECT * FROM emp e WHERE EXISTS ( select 1 from emp where EmpId=2);

describe emp;

select version();

select now();


select current_date();

select * from emp where join_date >= current_date()-interval 60 day;

select * from emp limit 3 offset 2;

create index empid_index on emp(empId);

# 2️⃣ Get Department-wise Highest Salary using JOIN
select department,  max(distinct salary)as max_salary from emp group by department;

select e.EmpId,e.emp_name, e.department,  e.salary from emp e inner join(select department, max(distinct salary)as max_salary from emp group by department) m on 
e.department=m.department and e.salary= m.max_salary;


SELECT MAX(salary) AS "highest_salary" FROM emp;

select e1.emp_name as emp1, e2.emp_name as emp2, e1.salary as salary from emp e1   join emp e2 on e1.salary = e2.salary and e1.empId < e2.empId;


SELECT emp_name, salary
FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);

#not working
SELECT emp_name, salary
FROM emp
WHERE salary >  AVG(salary);


#db.users.aggregate([
 # { $group: { _id: null, avgSalary: { $avg: "$salary" } } },
 # {$project: {_id:0,avgSalary11:"$avgSalary"}},
   #{$project: {_id:0,avgSalary:1}}
  
#])

















