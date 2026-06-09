use Employee;
SET SQL_SAFE_UPDATES = 0;
create table departments(
 dep_id Int primary key,
 dept_name varchar(20)
);
insert into departments(dep_id, dept_name) values(1, "android");
insert into departments(dep_id, dept_name) values(2, "ios");
insert into departments(dep_id, dept_name) values(3, "Sale");
insert into departments(dep_id, dept_name) values(4, "Web");
insert into departments(dep_id, dept_name) values(5, "Native");
insert into departments(dep_id, dept_name) values(6, "kubernet");
insert into departments(dep_id, dept_name) values(7, "Dev-OOP");
 

select * from departments;


ALTER TABLE emp
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (dep_id)
REFERENCES departments(dep_id);
 

 select * from emp;
 DELETE FROM EMP;
 TRUNCATE TABLE EMP;
 
 #ALTER TABLE EMP CHANGE COLUMN  DEPARTMENT DEP_ID INT;
 
SELECT * FROM emp ;


 
insert into emp(empId, emp_name, address, salary,dep_id, age) values(10, 'manoj', 'modinagar', 2000,1, 23);
insert into emp(empId, emp_name, address, salary,dep_id, age, manager_id) values(11, 'manoj', 'modinagar', 8000, 2, 23, 10);
insert into emp(empId, emp_name, address, salary,dep_id, age) values(12, 'amit', 'modinagar', 5000,1, 23);
insert into emp(empId, emp_name, address, salary,dep_id, age, manager_id) values(13, 'vinod', 'modinagar', 6000,3, 23, 12);
insert into emp(empId, emp_name, address, salary,dep_id, age) values(14, 'suman', 'modinagar', 2000,2, 23);
insert into emp(empId, emp_name, address, salary,dep_id, age,manager_id) values(15, 'rahul', 'modinagar', 2000,4, 23, 14);
insert into emp(empId, emp_name, address, salary,dep_id, age) values(16, 'amit', 'modinagar', 5000,5, 23);

insert into emp(empId, emp_name, address, salary,dep_id, age) values(18, 'vinod?K', 'modinagar', 8000,4, 23);
insert into emp(empId, emp_name, address, salary, age) values(19, 'dyachand', 'ghaziable', 8000, 30);

insert into emp(empId, emp_name, address, salary,dep_id, age) values(21, 'amit6', 'modinagar', 9000,6, 24);
insert into emp(empId, emp_name, address, salary,dep_id, age, manager_id) values(22, 'vinod6', 'modinagar', 11000,6, 23, 21);
insert into emp(empId, emp_name, address, salary,dep_id, age, manager_id) values(23, 'Harshit6', 'DDDD', 12000,6, 15, 21);

 
alter table emp add column manager_id int; 


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

select distinct(salary), emp_name from emp e1 where (select count(distinct salary) from emp e2  where e1.salary< e2.salary)=2;

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

SELECT MIN(empId) AS empId FROM emp GROUP BY emp_Name;

select e1.empId, e2.empId FROM emp e1
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

select e.EmpId,e.emp_name, e.department, e.salary from emp e inner join(select department, max(distinct salary)as max_salary from emp group by department) m on 
e.department=m.department and e.salary= m.max_salary;


SELECT MAX(salary) AS "highest_salary" FROM emp;

select e1.emp_name as emp1, e2.emp_name as emp2, e1.salary as salary from emp e1   join emp e2 on e1.salary = e2.salary and e1.empId < e2.empId;

select d.dpart, count(e.emp) as employee from emp e join  d.deprt on e.dept_id=d.deprt_id where e.salary>60000 group by d.deprt  having count(e.emp)>1;


SELECT emp_name, salary
FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);

#not working
SELECT emp_name, salary
FROM emp
WHERE salary >  AVG(salary);

select * from emp WHERE EXISTS (
  SELECT 1 FROM  emp where empId=3
  
);


9


#db.users.aggregate([
 # { $group: { _id: null, avgSalary: { $avg: "$salary" } } },
 # {$project: {_id:0,avgSalary11:"$avgSalary"}},
   #{$project: {_id:0,avgSalary:1}}
  
#])




CALL get_total_employees(@count);
SELECT @countget_total_employeesde;


 
SELECT * FROM EMP;

select e.empId,e.emp_name, e.address, e.age , d.dept_name from emp e join departments d on e.dep_id=d.dep_id;
select e.emp_name, d.dept_name from emp e left join departments d on e.dep_id=d.dep_id;
select e.emp_name, d.dept_name from emp e right join departments d on e.dep_id=d.dep_id;

SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM emp e
JOIN emp m
ON e.manager_id = m.empid;

SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM emp e
left JOIN emp m
ON e.manager_id = m.empid;

select e.emp_name as Employee ,e.salary as salary, m.emp_name as Manager , m.salary as Salary from emp e join emp m on m.empid=e.manager_id where e.salary>m.salary;

select d.dept_name, count(e.empid) from emp e right join departments d on e.dep_id=d.dep_id group by d.dept_name;

select d.dept_name, count(e.empid), avg(e.salary) from emp e right join departments d on e.dep_id=d.dep_id group by d.dept_name;



select d.dept_name, avg(e.salary) from emp e join departments d on e.dep_id=d.dep_id  group by d.dept_name having avg(e.salary)>=6000;

select e.emp_name, d.dept_name from emp e left join departments d on e.dep_id=d.dep_id union select e.emp_name, d.dept_name from emp e right join departments d on e.dep_id=d.dep_id;

select avg(salary) from emp where dep_id=2;

select e.emp_name, e.salary, d.dept_name from emp e join departments d on e.dep_id=d.dep_id where e.salary> (select avg(salary) from emp where e.dep_id=dep_id);

select d.dept_name, count(e.empid) from emp e join  departments d on  e.dep_id = d.dep_id group by d.dept_name having count(e.empid)>1;

select e.emp_name as employe,  m.emp_name as Manger from emp e join emp m on e.manager_id = m.empId where e.dep_id = m.dep_id;



SELECT emp_name, salary,
RANK() OVER (ORDER BY salary DESC) rnk
FROM emp;

SELECT emp_name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) drnk
FROM emp;

SELECT *
FROM (
  SELECT emp_name, dep_id, salary,
  row_number() OVER (PARTITION BY dep_id ORDER BY salary DESC) rnk
  FROM emp
) t
WHERE rnk = 2;

SELECT *
FROM (
  SELECT emp_name, dep_id, salary,
  DENSE_RANK() OVER (PARTITION BY dep_id ORDER BY salary DESC) rnk
  FROM emp
) t
WHERE rnk = 2;

SELECT emp_name, salary,
SUM(salary) OVER (ORDER BY salary) running_total
FROM emp;


SELECT emp_name, salary,
LAG(salary) OVER (ORDER BY salary) prev_salary
FROM emp;


SELECT A.emp_Name, B.emp_Name
FROM emp A join emp B on A.manager_id = B.empid;
#or;

SELECT A.emp_Name, B.emp_Name
FROM emp A,  emp B
WHERE A.manager_id = B.empid;

SHOW INDEX FROM emp WHERE Non_unique = 0;

SELECT 
    constraint_name
FROM 
    information_schema.table_constraints
WHERE 
    table_name = 'cart_item'
    AND constraint_type = 'FOREIGN KEY';
    
 
SELECT * FROM emp WHERE dep_id NOT IN (SELECT dep_id FROM departments);

SELECT * FROM emp e WHERE NOT exists (SELECT 1 FROM departments d where e.dep_id=d.dep_id);

select * from emp e1 where  not exists (select manager_id from emp e2 where e1.manager_id=e2.manager_id);

SELECT * FROM emp
WHERE salary BETWEEN 5000 AND 8000;

SELECT salary, COUNT(empid) AS count
FROM emp GROUP BY salary
HAVING COUNT(empid) > 1;


SELECT emp_name, dep_id, salary,
AVG(salary) OVER (PARTITION BY dep_id) avg_salary
FROM emp;


SELECT manager_id, SUM(salary) AS total_salary
FROM employees
WHERE manager_id = 5
GROUP BY manager_id;

#Or

SELECT manager_id, SUM(salary) AS total_salary
FROM emp
GROUP BY manager_id
having manager_id=10;

SELECT *
FROM emp
WHERE dep_id = (
    SELECT dep_id FROM emp WHERE emp_name = 'manoj'
);


SELECT *
FROM (
    SELECT e.*, 
           dense_rank() OVER (PARTITION BY dep_id ORDER BY salary) rn
    FROM emp e
) t
WHERE rn = 1;


SELECT e.*
FROM emp e
JOIN (
    SELECT dep_id, AVG(salary) avg_sal
    FROM emp
    GROUP BY dep_id
) t
ON e.dep_id = t.dep_id
WHERE e.salary >t.avg_sal;
#or
SELECT e.*
FROM emp e
JOIN (
    SELECT dep_id, AVG(salary) avg_sal
    FROM emp
    GROUP BY dep_id
) t
ON e.dep_id = t.dep_id and e.salary < t.avg_sal;


SELECT *
FROM (
    SELECT e.*, 
           AVG(salary) OVER (PARTITION BY dep_id) avg_sal
    FROM emp e
) 
WHERE salary < avg_sal;

select e.* from emp e join (select dep_id, avg(salary)  as avageSalary from emp group by dep_id) d on e.dep_id=d.dep_id and e.salary = d.avageSalary;

select * from emp e where e.salary =(select avg(salary) from emp group by dep_id having e.dep_id=dep_id);

select * from emp where join_date in (select join_date from emp group by join_date having count(*)>1);

show variables like '%ssl%';

SHOW PROCESSLIST;
select avg(salary) from emp group by DEP_ID;

select dep_id, count(e.empId) from emp e group by DEP_ID;


SELECT empId, emp_name, salary
FROM emp
WHERE salary IN (
    SELECT salary
    FROM emp
    GROUP BY salary
    HAVING COUNT(*) > 1
);

#or

SELECT empId, emp_name, salary
FROM emp e
WHERE EXISTS (
    SELECT 1
    FROM emp x
    WHERE x.salary = e.salary
    AND x.empid <> e.empid
);

select e1.* from  emp e1 join emp e2 on e1.emp_name=e2.emp_name and  e1.empId>e2.empId;

select e.* from emp e join (select dep_id ,min(salary) as  min_salary from emp group by dep_id) d on d.dep_id=e.dep_id where e.salary>d.min_salary;

#or 
select e.* from emp e where e.salary>(select min(salary) from  emp where e.dep_id = dep_id group by dep_id);

select * from emp;


select m.emp_name,sum(e.salary) from emp m join emp e on e.manager_id=m.empid group by e.manager_id;

select * from emp order by salary desc;


SELECT e.emp_name, e.salary, d.dept_name
FROM emp e
JOIN departments d ON e.dep_id = d.dep_id
WHERE e.salary >
(
  SELECT AVG(salary)
  FROM emp
  WHERE dep_id = e.dep_id
);




#or

select e.emp_name, e.salary, e.dep_id from emp e join ( select dep_id, avg(salary) as avg_salary from emp e group by dep_id) d on e.dep_id=d.dep_id where e.salary > d.avg_salary;




##not working because we need to only select one row
select e.emp_name, d.dept_name from emp e join departments d on e.dep_id=d.dep_id where e.salary > (select max(salary) from emp where d.dep_id=dep_id);

select max(salary) from emp group by dep_id;

select e.emp_name, d.dept_name , e.salary from emp e join departments d on e.dep_id=d.dep_id where (e.salary, d.dep_id) in (select max(salary), dep_id from emp group by dep_id);

select d.dept_name, max(e.salary) from departments d left join emp e on e.dep_id=d.dep_id group by d.dep_id;

SHOW PROCESSLIST;


select m.emp_name, m.empId, count(*) from emp m  join emp e on e.manager_id = m.empid group by e.manager_id ;

select d.dep_id, d.dept_name , avg(e.salary) from departments d join emp e on d.dep_id=e.dep_id group by e.dep_id;
 #or
select dep_id , avg(salary)  from emp group by dep_id;



























