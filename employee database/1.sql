use employeedatabase;
 SELECT *from assignedto;
 select *from dept;
 select *from employee;
 select *from incentives;
 select *from project;
 select Empno from employee where Empno not in (select Empno from incentives);
 select m.Ename, count(*) 
 from employee e,employee m
 where e.Mrgno=m.Empno
 group by m.Ename
 having count(*)=(select max(mycount)
 from(select count(*) mycount from employee group by Mrgno)a);
 select *from employee m
 where m.Empno in 
 (select Mrgno from employee)and m.sal>(select avg(e.sal) from
 employee e where e.Mrgno=m.Empno);
 select distinct m.Mrgno from employee e, employee m
 where e.Mrgno=m.mrgno and e.deptno=m.deptno and e.empno in (select distinct m.mrgno from employee e,
 employee m where e.mrgno=m.mrgno and e.deptno=m.deptno);
 