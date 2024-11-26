use employeedatabase;
select * from employee e, incentives i 
where e.Empno =i.Empno and 2=(select count(*) from incentives j 
where i.IncentiveAmount <= j.IncentiveAmount);
select *from employee e where e.Deptno = (select e1.Deptno from employee e1 where e1.Empno=e.Mrgno);
select distinct e.ename from employee e, incentives i where (select 
max(sal+IncentiveAmount) from employee,incentives)>= any (select sal from employee e1 where e.Deptno=e1.Deptno);
