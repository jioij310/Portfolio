SELECT studno, name, weight FROM student
WHERE weight BETWEEN 50 AND 70;

SELECT name, grade, deptno FROM student
WHERE deptno=102 OR deptno=201;

SELECT name, grade, deptno FROM student
WHERE name LIKE '김%';

SELECT name, position, comm FROM professor
WHERE comm IS not NULL;

SELECT name, grade, deptno FROM student
WHERE deptno=102 AND (grade=4 OR grade=1);

SELECT name, sal from professor where sal between 300 and 400;

SELECT profno, name, position, deptno from professor where position in ('조교수', '전임강사');

SELECT deptno, dname, loc From department where dname like '%공학%';

# 자연어 분석 es-elastic search 자연어 검색엔진 구축 환경 문자열 검색 \

select studno, name, grade, profno from student where profno is not null;

select name, grade, deptno from student where deptno=102 and grade=4 or grade=1;

select name, grade, tel from student order by grade;

select studno, name, grade, deptno, userid from student order by deptno, grade desc;

select rownum as rnum, tbl.*From(select deptno, dname from department order by deptno asc) tbl

select * from(
    select rownum as rnum, tbl.* from(
      select name, position, sal from professor order by sal desc
      ) tbl where rownum <= 3
) where rnum > 0;

select * from(
    select rownum as rnum, tbl.* from(
      select name, position, sal from professor order by sal desc
      ) tbl where rnum <= 3
) where rnum > 0;



select * from student;




select name, grade, idnum from student order by grade desc;

select name, grade, deptno from student where deptno in 101 order by birthdate desc;

select name, studno, grade from student order by grade, name;

select * from department;

select * from(
      select rownum as rnum, tbl.*from(
         select name, position, sal from professor order by sal desc)
         tbl where rownum <=5
         ) where rnum>4;
         
select name, replace(name, '이', 'lee') from student;

select name, length(name) from student;
select name,substr(name, length(name)) from student;
select name, substr(name, 2, 1)from student;
select concat(name, grade) from student;
select name||grade from student;
select concat(concat(concat(name,''),grade),'학년') from student;
select trim(name), ltrim(name), rtrim(name) from student;
select instr(name, '이'), name from student;
select upper(userid), lower(userid) from student;
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;
select to_char(sysdate+100, 'YYYY-MM-DD'), to_char(sysdate-7,'YYYY-MM-DD')
from dual;
select name, replace(name,substr(name,2,1),'*') from student;

select name, replace(idnum,substr(idnum,7,13),'*') from student;

select name, substr(idnum,1,6) || '*******' from student;

select * from student;
select name, substr(idnum,1,6) from student;

select name, substr(birthdate,1,8) from student where substr(idnum,1,2)>=80;

select comm from professor where deptno=101;
select count(comm) from professor where deptno=101;
select count(*) from professor where deptno=101;
select max(sal) from professor;
select sum(sal) from professor;

# ======그룹조회============

select deptno, name from professor order by deptno;
select deptno, count(name) from professor group by deptno;
select deptno, count(*), count(comm) from professor 
group by deptno;

select deptno, grade ,count(*), avg(weight)
from student 
group by deptno, grade;

select grade, count(*), avg(height) avg_height, AVG(weight) avg_weight
from student
group by grade
having count(*) >4
order by avg_height desc;

select deptno, grade, count(*), max(height), max(weight)
from student
group by deptno, grade
having count(*)>=3
order by deptno;

#ex1)

select max(height), min(height) from student where deptno=101;

select deptno, avg(sal), min(sal), max(sal) from professor group by deptno;
########
select deptno, avg(weight) as avg_weight , count(*) 
from student 
group by deptno 
order by avg_weight desc;
############
select avg(weight), count(*) from student group by deptno 
having count(*)
order by avg(weight) desc;

select deptno, count(*) 
from professor
group by deptno
having count(*)<=2;

==============================
#join
=====================================
select name, department.deptno, dname from professor, department;

select name, department.deptno, dname from professor, department
where professor.deptno=department.deptno;

select p.name, d.deptno, d.dname
from professor p
inner join department d
on p.deptno=d.deptno
where p.deptno=101;



###############################
select name, position from professor
where position=(select position from professor where name='전은지');
###################################


select name, deptno, grade, height from student
where grade=1 and height >(
  select avg(height) from student
  );
=========================================
select name, dname from student s
inner join department d on s.deptno=d.deptno
where s.deptno=(select deptno from student where name='이광훈');
===============================================
select * from professor;

select studno, grade, name from student where profno in(select profno from 
professor where sal>300);

=============================================================
#  연습문제
## 1 
select s.studno, s.name, d.deptno, d.dname, d.loc from student s, department d
where s.deptno=d.deptno;

##2
select s.studno, s.name, d.deptno, d.dname, d.loc from student s, department d
where s.deptno=d.deptno and d.deptno=102;

##3
select s.name, s.grade, p.name, p.position from student s, professor p
where s.profno=p.profno;

##4
select s.name, s.grade, p.name, p.position from student s
inner join professor p
on s.profno=p.profno;

##5
select name, grade from student 
    where grade=(select grade from student where userid='jun123');

##6    
#############################
select name, deptno, weight from student
    where weight< (select avg(weight) from deptno=101;
        ##############################
select name, deptno, weight from student s
    where weight<(select avg(weight) from student where deptno=101);       
       
        
##7        
select s.name, s.weight, d.dname, p.name from student s 
    inner join department d on s.deptno=d.deptno
    inner join professor p on s.profno=p.profno
    where s.weight < (
      select avg(weight) from student where deptno=(
      select deptno from student where name='이광훈'
        )
   );
   
##8
서브쿼리 병렬 연결, and

select name, grade, height from student
    where grade=(select grade from student where studno=20101) 
    and height>(select height from student where studno=20101); 
    
select * from student;    
    


select name, grade, height from student where height>(
    select height from student where studno = 20101
    ) and grade = (
        select grade from student where deptno=20101
        )
select studno, dname, grade, name from student s
   inner join department d on s.deptno=d.deptno
    where s.deptno in(select deptno from department where dname like '%공학%');
    
=========================================================
입력,수정,삭제
===========================================================
desc department;

insert into student (
   studno, name, userid, grade, idnum, birthdate, 
   tel, height, weight, deptno, profno
   )  
    values(102110,'둘리', 'ddooly', 1, '8501011140098',
TO_DATE('2013-01-01 11-42-30', 'YYYY-MM-DD HH24:MI:SS'),
'055)-777-7777', 170, 70, 101,9903);

insert into department(deptno,dname,loc) values(212,'영문학',null);

select * from department;

insert into professor(
    profno, name, userid, position, sal, hiredate, deptno
    ) values(
    9920, '고길동', 'gilldong', '교수', 450, to_date('2014-01-01', 'YYYY-MM-DD'), 102);
    
select * from professor;

creat sequence seq_grade start with 1 increment by 1;

creat table grade(
    id      number not null,
    studno number not null,
    subject varchar2(100) not null,
    point number not null,
    reg_date date not null,
    primary key(id),
    foreign key(studno) references student(studno)
);

select studno, dname, grade, name from student s
   inner join department d on s.deptno=d.deptno
    where s.deptno in(select deptno from department where dname like '%공학%');

insert into professor(profno, name, userid, position, sal, comm, deptno, hiredate)
    values(9921, '뚬땜이', 'ttum', '교수', 550, null, 201, sysdate);
    
insert into professor(profno, name)
    values(9901,'홍길동');

insert into department(deptno, dname, loc)
values(seq_department.NEXTVAL, '국문학과', '5호관');

select * from department;

select name, to_char(birthdate, 'YYYY-MM-DD')
from student where studno=20101;


===연습문제======


#자동증가값??
insert into department
    values (seq_department.NEXTVAL,'인터넷정보과','공학관');
    
update department set loc='5호관' where loc='공학관';


delete from department where deptno>=300;

select * from department;

select * from student;


===================
데이터베이스 관리
===================

create sequence seq_mytable start with 1 increment by 1;

create table mytable(
    id number not null
    memo varchar2(255) not null,
    reg_date date not null,
    primary key(id));

create table mytable(
    id number not null,
    memo varchar2(255) not null,
    reg_date date not null,
    primary key(id));

alter table mytable rename to mytest;

desc mytest;

alter table mytest rename column memo to content;

alter table mytest modify (content varchar2(512) not null);

alter table mytest modify (content varchar2(512) not null);

alter table mytest drop primary key;

alter table mytest add constraint pk_mytest_id primary key(id);

desc mytest;


creat sequence seq_grade start with 1 increment by 1;

creat table grade(
    id      number not null,
    studno number not null,
    subject varchar2(100) not null,
    point number not null,
    reg_date date not null,
    primary key(id),
    foreign key(studno) references student(studno)
);


CREATE SEQUENCE seq_grade
  START WITH 1
  INCREMENT BY 1;

-- Create the table
CREATE TABLE grade (
  id       NUMBER NOT NULL,
  studno   NUMBER NOT NULL,
  subject  VARCHAR2(100) NOT NULL,
  point    NUMBER NOT NULL,
  reg_date DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (studno) REFERENCES student(studno) -- Assuming there is a 'student' table
);

insert into grade(id,studno, subject, point, reg_date)
values (seq_grade.nextval,1234,'데이터베이스',98,sysdate);

insert into grade(id,studno, subject, point, reg_date)
values (seq_grade.nextval,10101,'데이터베이스',98,sysdate);

delete from student where studno=10101;

delete from grade where studno=10101;
delete from student where studno
=10101;
commit;

create or replace procedure sp_department_select
(
o_result    out     number,
o_recordset out     sys_refcursor
)

is

begin

  open o_recordset for
    select deptno, dname, loc from department order by deptno asc;
o_result := 0;

exception 
  when others then
    raise_application_error(-20001, sqlerrm);
    o_result := 9;
end sp_department_select;
/

var v_result number;
var v_rs refcursor;

execute sp_department_select(:v_result, :v_rs);

print v_result;
print v_rs;

