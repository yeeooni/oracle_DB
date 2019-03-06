select *
from tab;

purge recyclebin; -- ������ ����.


-- subquery�� �̿��� insert
insert into emp_blank
select *
from employees
where department_id = 80;


-- 100�� ����� ���, �̸�, ��å, �μ���ȣ
-- emp_blank insert(����)

insert into emp_blank (employee_id, first_name, last_name, job_id, department_id, hire_date, email)
select employee_id, first_name, last_name, job_id, department_id, hire_date, email
from employees
where employee_id = 100;

select *
from emp_blank;

commit;

rollback;

-- update
-- ������ �ο��Ͽ� Ư�� column��  �κ� ���� ����
update member
set pass = 1
where id = 'java';


-- 'java'�� ��й�ȣ�� 1234 ���̸� 25 ����
update member
set pass = 1234, age = 25
where id ='java';

--'oracle'�� ��й�ȣ�� 1234�� ����

update member
set pass = 1234
where id = 'oracle';

-- 'java'�� ��й�ȣ�� 5678 ���̴� ���̵� oracle�� ����� ���� ����
-- subquery ��밡�� 
update member
set pass = 5678, age = (select age
                              from member
                              where id = 'oracle')
where id ='java';

select *
from member;

commit;

-- delete
-- �θ����̺�, �ڽ����̺� ���� ���� ������ �ִ�.
-- delete all, update all�� ����.

delete member_detail
where id = 'java';

delete member
where id = 'java';

select *
from member;

-- merge
drop table product;

create table product
(
    pid number,
    pname varchar2(10),
    cnt number,
    price number,
    constraints produck_id_pk primary key (pid)
);

insert into product (pid, pname, cnt, price)
values (100, '�����', 100, 1500);

insert into product (pid, pname, cnt, price)
values (200, '����Ĩ', 80, 2700);

insert into product (pid, pname, cnt, price)
values (300, '������', 120, 1000);

select *
from product;


-- ��ǰ�ڵ尡 400�� �ڰ�ġ 150�� ������ 1200�� ¥�� �԰� 
merge into product
using dual
on (pid = 400)
when matched then 
update set cnt = cnt + 150
when not matched then 
insert (pid, pname, cnt, price)
values (400, '�ڰ�ġ', 150, 1200);

-- ��ǰ�ڵ尡 100�� ����� 50�� ������ 1500�� ¥�� �԰� 
merge into product
using dual
on (pid = 100)
when matched then 
update set cnt = cnt + 50
when not matched then 
insert (pid, pname, cnt, price)
values (100, '�����', 50, 1500);

commit;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DML (update, delete, insert) ������ ROLLBACK, COMMIT�� �����ϰ� 
-- update,delete ��  ����� �� commit, rollback �� �� �ϳ� ��� �ʼ� 
-- Ʈ����� : �۾��� ���� '�۾��� ������.'
select *
from product;

update product
set cnt = 800
where pid = 100;

commit;
rollback;

insert into product
values (101, '1��', 20, 1500);

insert into product
values (102, '2��', 30, 1500);

insert into product
values (103, '3��', 60, 1500);

savepoint a;

insert into product
values (104, '���ı�', 70, 1500);

insert into product
values (105, '��ġ��', 80, 1500);

savepoint b;

insert into product
values (106, '������', 90, 1500);

insert into product
values (107, '������', 10, 1500);

select *
from product;

rollback to a;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- sequence (�ܰ�, ��������)
-- sequence tablename_columnname_seq
-- �ڵ����� commit�� �Ǳ� ������ sequence�� �ǵ��� �� ����. 

create sequence product_pid_seq
start with 1 increment by 1;

delete product;

commit;

insert into product (pid, pname, cnt, price)
values (product_pid_seq.nextval, '�̸�', 10, 1000);

select *
from product;
 
select product_pid_seq.nextval
from dual;

rollback;