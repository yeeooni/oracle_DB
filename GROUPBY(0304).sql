-- �μ���ȣ�� 50�̰ų� 60�� ����� �޿��� 5000�̻��� �����
-- ���, �̸�, �޿�, �μ���ȣ

-- �� ���� ������� ������ �ߺ��� ����
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90

union

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


-- �� ���� ������� ������ �ߺ��� ����
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90

union all

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


-- �� ���� ������� ����Ǵ� ��
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90

intersect

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


-- ù ��° ���� ������� �� ��° ���� ����� �ִ� ���� ������ ��
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90

minus

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000

minus

select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90;


-- Group by 
-- �μ��� ����, ��ձ޿�, �����, �ִ�޿�, �ּұ޿�
-- select ������ group by ���� �ִ� column�� �� �� �ִ�.

select department_id, sum(salary), round(avg(salary), 0), count(employee_id), max(salary), min(salary)
from employees
group by department_id;

-- �μ��� ����, ��ձ޿�, �����, �ִ�޿�, �ּұ޿�
-- ��ձ޿��� 5000������ �μ�
-- group by ���� ������ having ���� ����Ѵ�.
-- �Ϲ������� where���� ����Ѵ�.

select department_id, sum(salary), round(avg(salary), 0), count(employee_id), max(salary), min(salary)
from employees
group by department_id
having avg(salary) <= 5000;

-- �� �μ��� ��� �޿����� ���� �޴� ����� 
-- ���, �̸�, �޿�
-- Sub query �̿� 

select employee_id, first_name, salary
from employees
where salary > all (select avg(salary)
                        from employees
                        group by department_id);
                        
                        
-- �μ��� �ְ�޿��� �޴� �����
-- �μ��̸�, ���, �̸�, �޿�

select e.employee_id, e.first_name, e.salary, d.department_name, e.department_id
from (select department_id, max(salary) maxsal
       from employees
       group by department_id) m , employees e, departments d
where e.department_id = m.department_id and e.salary = m.maxsal and e.department_id = d.department_id;


-- ���ȣ 
-- ũ�� �񱳰� �Ұ����ϴ�.

select rownum, employee_id, salary
from employees;

select rownum, employee_id, salary
from employees
where rownum <= 10 and rownum > 5;

-- TOP N query
-- ���, �̸�, �޿�, �Ի���, �μ��̸�,
-- �޿��� ���� 
-- �� �������� 5�� ���
-- 2page ��� & ��� 
-- 1980���, 1990���, 2000��� 

select b.m, b.employee_id, b.first_name, b.salary,
        case when to_char(hire_date, 'yyyy') < '1990' then '1980���'
        when to_char(hire_date, 'yyyy') < '2000' then '1990���'
        else '2000���'
        end �Ի���, d.department_name

from(
        select rownum m, a.*
        from( 
                select employee_id, first_name, salary, hire_date, department_id
                from employees
                order by salary desc
              ) a 
        where rownum <= &page * 5) b, departments d

where b.department_id = d.department_id(+) and b.m > &page * 5 - 5;
