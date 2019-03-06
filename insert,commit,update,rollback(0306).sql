select *
from tab;

purge recyclebin; -- 휴지통 비우기.


-- subquery를 이용한 insert
insert into emp_blank
select *
from employees
where department_id = 80;


-- 100번 사원의 사번, 이름, 직책, 부서번호
-- emp_blank insert(삽입)

insert into emp_blank (employee_id, first_name, last_name, job_id, department_id, hire_date, email)
select employee_id, first_name, last_name, job_id, department_id, hire_date, email
from employees
where employee_id = 100;

select *
from emp_blank;

commit;

rollback;

-- update
-- 조건을 부여하여 특정 column의  부분 수정 가능
update member
set pass = 1
where id = 'java';


-- 'java'의 비밀번호를 1234 나이를 25 변경
update member
set pass = 1234, age = 25
where id ='java';

--'oracle'의 비밀번호를 1234로 변경

update member
set pass = 1234
where id = 'oracle';

-- 'java'의 비밀번호를 5678 나이는 아이디가 oracle인 사람과 같게 변경
-- subquery 사용가능 
update member
set pass = 5678, age = (select age
                              from member
                              where id = 'oracle')
where id ='java';

select *
from member;

commit;

-- delete
-- 부모테이블, 자식테이블 간의 삭제 순서가 있다.
-- delete all, update all은 없다.

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
values (100, '새우깡', 100, 1500);

insert into product (pid, pname, cnt, price)
values (200, '꼬북칩', 80, 2700);

insert into product (pid, pname, cnt, price)
values (300, '빼빼로', 120, 1000);

select *
from product;


-- 상품코드가 400인 자갈치 150개 가격은 1200원 짜리 입고 
merge into product
using dual
on (pid = 400)
when matched then 
update set cnt = cnt + 150
when not matched then 
insert (pid, pname, cnt, price)
values (400, '자갈치', 150, 1200);

-- 상품코드가 100인 새우깡 50개 가격은 1500원 짜리 입고 
merge into product
using dual
on (pid = 100)
when matched then 
update set cnt = cnt + 50
when not matched then 
insert (pid, pname, cnt, price)
values (100, '새우깡', 50, 1500);

commit;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DML (update, delete, insert) 에서만 ROLLBACK, COMMIT이 가능하고 
-- update,delete 를  사용할 시 commit, rollback 둘 중 하나 사용 필수 
-- 트랜잭션 : 작업의 단위 '작업이 끝났다.'
select *
from product;

update product
set cnt = 800
where pid = 100;

commit;
rollback;

insert into product
values (101, '1깡', 20, 1500);

insert into product
values (102, '2깡', 30, 1500);

insert into product
values (103, '3깡', 60, 1500);

savepoint a;

insert into product
values (104, '양파깡', 70, 1500);

insert into product
values (105, '멸치깡', 80, 1500);

savepoint b;

insert into product
values (106, '돼지깡', 90, 1500);

insert into product
values (107, '고구마깡', 10, 1500);

select *
from product;

rollback to a;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- sequence (단계, 연속적인)
-- sequence tablename_columnname_seq
-- 자동으로 commit이 되기 때문에 sequence는 되돌릴 수 없다. 

create sequence product_pid_seq
start with 1 increment by 1;

delete product;

commit;

insert into product (pid, pname, cnt, price)
values (product_pid_seq.nextval, '이름', 10, 1000);

select *
from product;
 
select product_pid_seq.nextval
from dual;

rollback;