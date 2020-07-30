-- �ݿø�

-- 0�� �Ҽ��� �������� ���� ù��°�ڸ�
-- ����� �Ҽ��� �������� ������
-- ������ �Ҽ��� �������� ����


select 1234.5438, round (1234.5438, 0), round (1234.5438,1), round (1234.5438, -1),
        round (1234.6438, 3),  round(1234.5438, -3)
from dual;


-- ����

select 1234.5438, trunc (1234.5438, 0), trunc (1234.5438,1), trunc (1234.5438, -1),
        trunc (1234.6438, 3),  trunc (1234.5438, -3), trunc (123.456, 2)
from dual;

-- �Ҽ��� ���� ����

select floor (1234.5438)
from dual;

-- ������ ����

select mod(5, 3)
from dual;

-- ���밪

select abs(-5)
from dual;

-- ����� ���, �̸�, �޿�, Ŀ�̼����Ա޿�
-- Ŀ�̼� ���� �޿��� 100�� �ڸ����� ǥ��(�ݿø�)

select employee_id, first_name, salary, commission_pct * salary+salary, round(commission_pct * salary + salary, -2)
from employees
where commission_pct is not null;

-- �����Լ�
-- initcap : �̴ϼ��� ù���ڸ� �빮�ڷ� 
-- length : ���ڿ��� ����

select 'KITRi', lower('kiTRI'), upper('kiTRI'), initcap('kiTRI'), length('kiTRI')
from dual;

-- full name
-- concat ���ڿ��� ��ġ�� �Լ�

select first_name ||' '|| last_name full_name, employee_id, concat(to_char(sysdate, 'yy.mm.dd.hh24:mi:ss'), concat(' ', concat (first_name, concat(' ', last_name))))
from employees;


-- ���ڰ��� 1���� �����Ѵ�.
-- 2 ~ 6 
-- instr ('����', ���ĺ�) : ������ ���ĺ��� �ڸ��� 

select 'hello oracle !!!', substr('hello orale!!!', 2,6), substr('hello orcle!!', 2), instr('hello oracle !!!', 'e',3), instr('hello oracle !!!o', 'e')
from dual;

-- '123-456' zipcode, 123 zip1, 456 zip2

select  '123-456' zipcode, 123 zip1, 456 zip2, substr('123-456', 1, instr('123-456','-') -1 ) zip1, substr('123-456', instr('123-456','-') +1 ) zip2
from dual;

-- ��¥�Լ�

select sysdate, to_char(sysdate + 3 / 24 / 60 /60, 'yy.mm.dd.hh24:mi:ss') 
from dual;

-- ���� ����

select sysdate, months_between(sysdate, sysdate +70)
from dual;

-- ���� �������� ���� �Ͽ����� ������?
-- ���� �������� ���� ȭ������ ������?

select sysdate, next_day(sysdate,1), next_day(sysdate, 3)
from dual;

-- ���� �� �߰� 

select sysdate, add_months(sysdate, 2)
from dual;

-- �̹��޿� ������ ��

select last_day(sysdate)
from dual;

-- to_char ���ڿ��� return
-- w �̹����� ���° ��
-- ww 1���߿� ���° ��
-- d ����
-- dd �Ѵ��߿� ���° �� (��)
-- ddd 1���� ���° ��
-- dy ������ ������
-- day ������ Ǯ����
-- am, pm ���� ����
-- hh 12�ð� ����
-- hh24: 24�ð� ����
-- mi ��
-- ss ��

select   sysdate, to_char(sysdate, 'w ww d dd ddd dy day '),
                to_char(sysdate, 'am pm hh hh24: mi ss')
from dual;

select to_char(sysdate, 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'yy'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'mm'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'dd'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'hh'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'mi'), 'yyyy.mm.dd.hh24:mi:ss')
from dual

union

select to_char(sysdate, 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate, 'yy'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate, 'mm'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate, 'dd'), 'yyyy.mm.dd.hh24:mi:ss'), 
            to_char(trunc(sysdate, 'hh'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate, 'mi'), 'yyyy.mm.dd.hh24:mi:ss')
from dual;

-- ��ȯ�Լ�
-- ���ڴ� ������ ����
-- ���ڴ� ���� ����
-- ����Ŭ�� +�� �������ۿ� �ȵȴ�.

select 'a', 3, '3', 3 + 5, '3' + 5 -- �ڵ�����ȯ
from dual;

-- ,
-- .
-- o
-- 9
-- L
-- $

select length(1123456.789), 
            length(to_char(1123456.789, '000,000,000.00')),
            length(to_char(1123456.789, '999,999,999.99'))
from dual;

select 1123456.789, to_char(1123456.789, 'L000,000,000.00'),
                    to_char(1123456.789, '$999,999,999.')
from dual;

select to_number('123,345.98', '000000.00')
from dual;

select to_char(13213216.7213, 'L99999990.0000')
from dual;

select to_number('21315153,321312.2313', '00000000000000.0000')
from dual;

select sysdate, to_char(sysdate, 'yy.mm.dd'),
            to_char(sysdate, 'am hh:mi:ss'),
            to_char(sysdate, 'hh24:mi:ss')
from dual;

-- 20190225142154 >> ��¥ >> 3����

select to_char (to_date (to_char (20190225142154, '00000000000000'),'yyyy.mm.dd.hh24:mi:ss') + 2,'yyyy.mm.dd.hh24:mi:ss')
from dual;

-- �Ϲ� �Լ�

select commission_pct, nvl(commission_pct, 0), nvl2(commission_pct, 1, 0)
from employees;

-- ���� ���
-- �޿��� 4000 �̸��� ����� �ں�
-- �޿��� 10000 �̸�  ��տ���
-- �޿��� 10000 �̻��� ����
-- ���, �̸�, �޿�, �������

select employee_id, concat(first_name, concat(' ',last_name)), salary, 
    
        case 
        when salary < 4000  then '�ں�'
        when salary < 10000 then '��տ���'
        else '����'
        end �������
        
from employees
order by salary desc;

-- �������
-- 1980�⵵ �Ի� �ӿ�
-- 90�⵵ ����
-- 2000 ���Ի��
-- ���, �̸�, �Ի���, �������

select employee_id, first_name, hire_date,
        
        case when to_number(to_char(hire_date, 'yyyy'), '0000') between 1980 and 1989 then '�ӿ�'
        when to_number(to_char(hire_date, 'yyyy'), '0000') between 1990 and 1999 then '����'
        else '���Ի��'
        end �������

from employees
order by 3;

select employee_id, first_name, hire_date,

        case when substr(to_char(trunc(hire_date, 'yyyy'), 'yyyy'), 1, 3 ) = '198' then '�ӿ�'
        when substr(to_char(trunc(hire_date, 'yyyy'), 'yyyy'), 1, 3) = '199' then '����'
        else '���Ի��'
        end �������

from employees;



-- �� �ܿ�� 

select ascii('0'), ascii('A'), ASCII('a')
from dual;

select case when 'abc' < 'acd' then '�۴�'
end 
from dual;

Select Instr('TEST SAMPLE CODE','E',1, 1) 
From Dual;

-- 'TEST SMAPLE CODE' ��� ���п��� 'E'�� ã�µ� 1���� ������ �ؼ� 1��° ã�ư��� 'E'�� ��ġ�� ����ΰ�?

select instr('TEST SMAPLE CODE', 'E', 3, 1)
from dual;

-- 'TEST SMAPLE CODE' ��� ���п��� 'E'�� ã�µ� 3���� ������ �ؼ� 1��° ã�ư��� 'E'�� ��ġ�� ����ΰ�?

SELECT INSTR('TEST SMAPLE CODE', 'E', 3, 2)
FROM DUAL;

-- 'TEST SMAPLE CODE' ��� ���п��� 'E'�� ã�µ� 3���� ������ �ؼ� 2��° ã�ư��� 'E'�� ��ġ�� ����ΰ�?


-- �μ����� ������ ���ڸ� �����ϰ� ����϶�.
-- ���� �μ���, ������ ���ڸ� ������ �μ������� ����

select department_name, substr(department_name, 1, length(department_name) - 1)
from departments
order by 2;

-- emp���̺��� sal�� 3000�̸� �̸� c���, 3000���� 3900���� B���
-- 4000 �̻��̸� A������� ����� ��Ÿ�����
-- ���, �̸�(Ǯ����), �޿�, ��޺��� ����


select employee_id, concat(first_name, concat(' ',last_name)), salary,
    case when salary < 3000 then 'C���'
    when salary between 3000 and 3900 then 'B���'
    else 'A���'
    end ���

from employees
order by 4;

--���,�̸�, job_id, �ٹ���Ȳ(��Ī)
--�̱����� ���ϴ� �μ��� ��� "����ٹ�"
--ĳ���ٿ��� ���ϴ� �μ��� ��� "�İ߱ٹ�"
--�������� ���ϴ� �μ��� ��� "�ؿ�����"
--����, �İ�, �ؿ� ������ ����


select employee_id, first_name, job_id,

case when country_id = 'US' then '����ٹ�'
when country_id = 'CA' then '�İ߱ٹ�'
else '�ؿ�����'
end �ٹ���Ȳ
from employees ee, departments d, locations l
where l.location_id = d.location_id and d.department_id = nvl(ee.department_id, 80)
order by 4;



--�Ʒ��� ���� ��µǰ� �ڵ带 �ۼ��Ͻÿ�.
--'Ǯ����'�� �μ���ȣ�� �μ��ڵ�� '90''AD'�̴�. 
--�μ��� ����Ҷ��� job_id�� �� �α���(ex)sST,IT,AD)�� ���. ��Ī �μ���ȣ�� �ڵ�

select concat(first_name, concat(' ',last_name)) ||'�� �μ���ȣ�� �μ��ڵ�� '||concat( substr(department_id, 1), concat(' ', substr(job_id, 1, 2))) ||' �̴�.' 
from employees;

--  Q1. �� ����� �̸�, �μ���ȣ, �޿�, �޿��� ������ ����ϱ�
-- ��, ������ ������ ������ Job_Grades ���̺��� �����Ѵ�.
-- ��, ������ �������� �������� �����Ѵ�.
-- ��, ������ ��Ī�� �ش�(�޿��� ����).

select first_name, department_id, salary,
case when salary between 1000 and 2999 then 'A���'
when salary  between 3000 and 5999 then'B���'
when salary  between 6000 and 9999 then'C���'
when salary between 10000 and 14999 then'D���'
else 'F���'
end  "�޿��� ����"
from employees
order by 4 asc;

-- Q2. ���� A�� 2019��02��20�Ϻ��� 2019��07��16�ϱ��� ����� ��, �� �Ⱓ�� ��ĥ���� ���Ͻÿ�
-- ��, ��¥�� 20190220, 20190716 ������ ���ڷκ��� �����Ѵ�.
-- ��, �ָ��� �����Ѵ�
-- ��, ��Ī�� �����Ⱓ

select  to_date( to_char (20190220, '00000000'), 'yyyy.mm.dd') 
, to_date( to_char (20190716, '00000000'), 'yyyy.mm.dd'), (to_date( to_char (20190716, '00000000'), 'yyyy.mm.dd')) - to_date( to_char (20190220, '00000000'), 'yyyy.mm.dd') as �����Ⱓ
from dual;


--��å�̸�, �ִ�޿�, ������ �ҵ�з��� ����Ͻÿ�.-
--�̶� �ִ�޿��� 10000������ ������ ���ҵ�, 10000�� �ʰ�������20000������ ������ �߰��ҵ�, 20000�� �ʰ��ϴ� ������ ��ҵ����� ���Ͽ� ��å�з��� �����, 
--��å�̸��� �������� �����Ͻÿ�. �̶�, ��å�̸��� ��� �빮�ڷ� ǥ���Ͻÿ�.

select upper(job_title) , max_salary,
case when max_salary < = 10000 then '���ҵ�'
when max_salary > 10000 and max_salary < = 20000 then '�߰��ҵ�'
else '��ҵ�'
end ��å�з�
from jobs
order by job_title; 


--���ó�¥�� yymmdd�������� ���ڷ� �ٲ��� ���ڷ� �ٽùٲ� 123456�� ���Ѱ��� ����϶�.

select to_number(to_char (sysdate, 'yymmdd'), '000000') +123456
from dual;

-- �ý��۽ð����� 144���ĸ� yyyy mm dd day ���·� ��Ÿ���ּ���. ��Ī�� "������"

select to_char (sysdate +144, 'yyyy.mm.dd.day') as ������
from dual;

-- 2019/07/21 �� 2019�⵵�κ��� �� ��° ���ϱ�?

select to_char ( sysdate, 'ddd')
from dual;

-- �Ŵ��� ��ȣ�� 130�̸��� �ʺ�  130�̻� 150���ϴ� �߱� �׿ܴ� ����̴�. ��� �̸� �Ŵ�����ȣ�� ������������ �����϶�.

select employee_id, first_name, nvl(manager_id, 0),
case when nvl(manager_id, 0) < 130 then '�ʺ�'
when manager_id between 130 and 150 then '�߱�'
else '���'
end �Ŵ�����ȣ
from employees;

-- 48,456,231.20451 + 30000�� ��ȯ�Լ��� �̿��Ͽ� Ǫ�ÿ�

select 48,456,231.20451, to_number('48,456,231.20451', '00,000,000.00000')  + 30000
from dual;

-- ��������
-- �ý��� ���糯¥ ���� �ټӳ� 30�̻� ������, �׿� ����
-- ���, �̸�, ��ȭ��ȣ, �μ�
-- �������� ���� ����

select employee_id, first_name, phone_number, department_id,
case when to_char( sysdate , 'yyyy') - to_char ( hire_date, 'yyyy') > = 30 then '������'
else '����'
end ��������
from employees
order by 5;

-- 10. ��� ��ȭ ��ȣ�� .�� -���� �ٲ� ǥ���Ͻÿ�.
-- ���� 

select phone_number,
case when instr(phone_number, '.' ,5) = 7
        then substr(phone_number,1,3 ) ||'-'|| substr(phone_number,5,2) ||'-'|| substr(phone_number,8,4)||'-' ||substr(phone_number,13)
        when  instr(phone_number, '.' ,5) = 8
        then substr(phone_number,1,3) ||'-'|| substr(phone_number,5,3) ||'-'|| substr(phone_number,9)
        end "������ ǥ��"
from employees;

-- �ӱ��� 3�ڸ�(1000���ڸ�) ���� �ݿø��Ͽ� ǥ���Ͻÿ�

select round( salary, -4)
from employees;


-- ���, �̸�, �μ���ȣ
-- �μ���ȣ 60 ������
-- 90 �ӿ���
-- ������ �񰳹���

select employee_id, concat(first_name, concat(' ', last_name)), nvl(department_id,0),

    case when department_id = 60 then '������'
    when department_id = 90 then '�ӿ���'
    else '�񰳹���'
    end ��������

from  employees
order by 4;

-- decode �Լ��� ��񱳴� �Ұ��ϴ�.

select employee_id, first_name, department_id,  
decode(department_id, 60, '������', 90, '�ӿ���', '�񰳹���') ��������
from employees;

-- �׷��Լ�
-- ȸ���� �ѻ����, �޿�����, �޿����, �ְ�޿�, �����޿�
-- ������ �Լ� count(employee_id) : �� �����
-- sum(salary) : �޿��� ����
-- avg(salary) : �޿��� ���
-- max(salary) : �޿��� �ְ�
-- min(salary) : �޿��� ����


Select Count(Employee_Id), Sum(Salary), Avg(Salary), Max(Salary), Min(Salary)
From Employees;

-- ��ձ޿����� ���� �޴� ����� ���, �̸�, �޿�

Select Employee_Id, First_Name, Salary
From Employees
Where Salary > (Select Avg(Salary) From Employees);

