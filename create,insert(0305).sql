-- DDL (������ ���Ǿ� )

-- ȸ�� (�ʼ�)  member
-- �̸�                   name           varchar2(30)
-- ���̵�                 id               varchar2(16)
-- ��й�ȣ              pass            varchar(16)
-- ����                   age             number(3)
-- �̸��Ͼ��̵�        emailid         varchar2(30)
-- �̸��ϵ�����        emaildomain  varchar2(30)
-- ������                joindate        date

-- �����ȣ�� ���ھտ� 0�� ���� �� ��� ���ڷ�

-- ȸ�� ������      member_detail
-- ���̵�                id                varchar2(16)
-- �����ȣ             zipcode         varchar(5)
-- �Ϲ��ּ�             address           varchar2(100)
-- ���ּ�             address_detail   varchar2(100)
-- ��ȭ��ȣ 1           tel1              varchar2(3)
-- ��ȭ��ȣ 2           tel2              varchar2(4)
-- ��ȭ��ȣ 3           tel3              varchar2(4)

-- Drop table
-- ������ �ϴ� ���̺��� ���� �����.
-- table�� �̸��̳� column�̸��� Ư������, ���ڷ� ���� �� �� ����.

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

-- ���̺��� ������ ������ �ö� 
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


-- DML ( ������ ���۾�)
-- INSERT
-- insert into table��('','','','','','',.....) values();

insert into member values('���ǿ�','kimiyeon','1234',31,'12.12kimiyeon','gmail.com', sysdate);

-- column�� ������ �� �ִ�.

insert into member(age, id, pass, name, emailid, emaildomain, joindate)  
values('23','hong','253','���ǿ�','12.12kimiyeon','gmail.com', sysdate);

insert into member(id, pass, name, joindate)  
values('hong2','vava','���ǿ�', sysdate);

insert into member_detail (id, tel1, tel2, tel3, address, address_detail, zipcode) 
values ('kimiyeon','010', '2111', '6422', '����� ��õ�� ���굿', '40-12', '08509');

select *
from member_detail md, member m
where md.id = m.id;

-- �ϳ��� insert�� ������ �������� column�� ������ �� �ִ�.

insert all
    into member(age, id, pass, name, emailid, emaildomain, joindate)  
    values('30','oracle','a12345678','����Ŭ','oracle','oracle.com', sysdate)
    into member_detail (id, tel1, tel2, tel3, address, address_detail, zipcode) 
    values ('oracle','010', '2111', '6422', '����Ŭ', '����Ŭ������', '08509')
select * from dual;

insert into member(age, id, pass, name, emailid, emaildomain, joindate)  
values('30','oracle','a12345678','����Ŭ','oracle','oracle.com', sysdate);

insert into member_detail (id, tel1, tel2, tel3, address, address_detail, zipcode) 
values ('oracle','010', '2111', '6422', '����Ŭ', '����Ŭ������', '08509');

commit;
