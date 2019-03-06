-- DDL (데이터 정의어 )

-- 회원 (필수)  member
-- 이름                   name           varchar2(30)
-- 아이디                 id               varchar2(16)
-- 비밀번호              pass            varchar(16)
-- 나이                   age             number(3)
-- 이메일아이디        emailid         varchar2(30)
-- 이메일도메인        emaildomain  varchar2(30)
-- 가입일                joindate        date

-- 우편번호는 숫자앞에 0을 붙일 수 없어서 문자로

-- 회원 상세정보      member_detail
-- 아이디                id                varchar2(16)
-- 우편번호             zipcode         varchar(5)
-- 일반주소             address           varchar2(100)
-- 상세주소             address_detail   varchar2(100)
-- 전화번호 1           tel1              varchar2(3)
-- 전화번호 2           tel2              varchar2(4)
-- 전화번호 3           tel3              varchar2(4)

-- Drop table
-- 참조를 하는 테이블을 먼저 지운다.
-- table의 이름이나 column이름은 특수문자, 숫자로 시작 할 수 없다.

drop table member;
drop table member_detail;


create table member
(
    name varchar2(30) not null, 
    id varchar2(16),
    pass varchar2(16) not null,
    age number(3) check (age < 150),
    emailid varchar2(30),
    emaildomain varchar2(30),
    joindate date default sysdate,
    constraints member_id_pk primary key (id)
);

create table member_detail
(
    id varchar2(30),
    zipcode varchar2(6),
    address varchar2(100),
    address_detail varchar2(100),
    tel1 varchar2(3),
    tel2 varchar2(4),
    tel3 varchar(4),
    constraints member_detail_id_fk foreign key (id) references member (id)
);

create table emp_all
as 
select * from employees;

select *
from employees;

-- 테이블의 구조만 가지고 올때 
create table emp_blank
as 
select * from employees
where 1=0;

select *
from emp_blank

create table emp_50
as 
select e.employee_id eid, e.first_name ename, e.salary esal, d.department_name dname
from employees e, departments d
where e.department_id = 50;

select * 
from emp_50;


-- DML ( 데이터 조작어)
-- INSERT
-- insert into table명('','','','','','',.....) values();

insert into member values('김의연','kimiyeon','1234',31,'12.12kimiyeon','gmail.com', sysdate);

-- column을 정렬할 수 있다.

insert into member(age, id, pass, name, emailid, emaildomain, joindate)  
values('23','hong','253','김의연','12.12kimiyeon','gmail.com', sysdate);

insert into member(id, pass, name, joindate)  
values('hong2','vava','김의연', sysdate);

insert into member_detail (id, tel1, tel2, tel3, address, address_detail, zipcode) 
values ('kimiyeon','010', '2111', '6422', '서울시 금천구 가산동', '40-12', '08509');

select *
from member_detail md, member m
where md.id = m.id;

-- 하나의 insert를 가지고 여러개의 column을 삽입할 수 있다.

insert all
    into member(age, id, pass, name, emailid, emaildomain, joindate)  
    values('30','oracle','a12345678','오라클','oracle','oracle.com', sysdate)
    into member_detail (id, tel1, tel2, tel3, address, address_detail, zipcode) 
    values ('oracle','010', '2111', '6422', '오라클', '오라클연구소', '08509')
select * from dual;

insert into member(age, id, pass, name, emailid, emaildomain, joindate)  
values('30','oracle','a12345678','오라클','oracle','oracle.com', sysdate);

insert into member_detail (id, tel1, tel2, tel3, address, address_detail, zipcode) 
values ('oracle','010', '2111', '6422', '오라클', '오라클연구소', '08509');

commit;
